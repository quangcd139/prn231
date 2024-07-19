using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project_Cinema_PRN231.domain.filmcalender;
using Project_Cinema_PRN231.domain.libraryfilm;
using Project_Cinema_PRN231.domain.room;
using Project_Cinema_PRN231.model;
using System.Text;

namespace PRN231_Web_Razor.Pages.Admin
{
    public class FilmCalenderManagementModel : PageModel
    {
        public void OnGet()
        {
            HttpClient _httpClient = new HttpClient();

            HttpResponseMessage response = _httpClient.GetAsync("http://localhost:5000/api/Room/getAll").Result;
            var RoomDtos = response.Content.ReadFromJsonAsync<List<RoomDto>>().Result;
            ViewData["RoomDto"] = RoomDtos.ToList();

            response = _httpClient.GetAsync("http://localhost:5000/api/FilmCalender/GetAll").Result;
            var filmCalenders = response.Content.ReadFromJsonAsync<List<FilmCalenderDto>>().Result;

            ViewData["FilmCalenderDto"] = filmCalenders.ToList();
        }

        public async Task<IActionResult> OnPostEditFilm()
        {
            var idFilm = Request.Form["id"];
            HttpClient client = new HttpClient();
            HttpResponseMessage response = client.GetAsync("http://localhost:5000/api/FilmCalender/GetAll?$filter=id%20eq%20" + idFilm).Result;
            var list1 = response.Content.ReadFromJsonAsync<List<FilmCalender>>().Result;
            FilmCalender lb = list1[0];

            lb.RoomId = int.Parse(Request.Form["roomId"]);
            lb.Date = DateTime.Parse(Request.Form["date"]);
            lb.StartTime = TimeSpan.Parse(Request.Form["startTime"]);
            lb.EndTime = TimeSpan.Parse(Request.Form["endTime"]);
            lb.Price = decimal.Parse(Request.Form["price"]);
            lb.UpdatedAt = DateTime.Now;

            //call api update
            var request = new HttpRequestMessage(HttpMethod.Post, "http://localhost:5000/api/FilmCalender/Update");
            request.Headers.Add("Accept", "*/*");
            var jsonString = Newtonsoft.Json.JsonConvert.SerializeObject(lb);
            var content = new StringContent(jsonString, Encoding.UTF8, "application/json");
            request.Content = content;
            // Await the asynchronous call to send the request
            var response1 = await client.SendAsync(request);

            return RedirectToPage();

        }
        public async Task<IActionResult> OnPostImportFile(IFormFile csvFile)
        {
            if (csvFile == null || csvFile.Length == 0)
            {
                return RedirectToPage();
            }

            using (var reader = new StreamReader(csvFile.OpenReadStream(), Encoding.UTF8))
            {
                //
                var csvData = await reader.ReadToEndAsync();


                //List<> all = _unitOfWork.CategoryRepository.GetAll().ToList();
                HttpClient _httpClient = new HttpClient();
                HttpResponseMessage response = _httpClient.GetAsync("http://localhost:5000/api/FilmCalender/getAll").Result;
                var all = response.Content.ReadFromJsonAsync<List<FilmCalender>>().Result;

                var lines = csvData.Split("\n");
                for (int i = 1; i < lines.Length; i++)
                {
                    FilmCalender c;
                    var line = lines[i].Trim();
                    if (line == "")
                    {
                        break;
                    }
                    var value = line.Split(',');

                    int roomId = int.Parse(value[3]);
                    int filmId = int.Parse(value[4]);
                    DateTime newDate = DateTime.Parse(value[0]);
                    TimeSpan newStartTime = TimeSpan.Parse(value[1]);
                    TimeSpan newEndTime = TimeSpan.Parse(value[2]);

                    var overlappingFilms = all.Where(x => x.RoomId == roomId &&
                                                          x.Date == newDate &&
                                                          ((newStartTime >= x.StartTime && newStartTime < x.EndTime) ||
                                                           (newEndTime > x.StartTime && newEndTime <= x.EndTime) ||
                                                           (newStartTime <= x.StartTime && newEndTime >= x.EndTime)));

                    if (!overlappingFilms.Any())
                    {
                        FilmCalender c1 = new FilmCalender
                        {
                            Date = newDate,
                            StartTime = newStartTime,
                            EndTime = newEndTime,
                            RoomId = roomId,
                            FilmId = filmId,
                            Price = decimal.Parse(value[5]),
                            IsDeleted = false,
                            CreatedAt = DateTime.Now,
                        };

                        //call api add

                        var request = new HttpRequestMessage(HttpMethod.Post, "http://localhost:5000/api/FilmCalender/Add");
                        request.Headers.Add("Accept", "*/*");
                        var jsonString = Newtonsoft.Json.JsonConvert.SerializeObject(c1);
                        var content = new StringContent(jsonString, Encoding.UTF8, "application/json");
                        request.Content = content;
                        // Await the asynchronous call to send the request
                        var response1 = await _httpClient.SendAsync(request);
                    }
                }
            }

            return RedirectToPage();
        }

        public IActionResult OnGetExportFile()
        {
            HttpClient client = new HttpClient();
            var response = client.GetAsync("http://localhost:5000/api/FilmCalender/GetAll").Result;
            var list1 = response.Content.ReadFromJsonAsync<List<FilmCalenderDto>>().Result;
            var data = (IList<FilmCalenderDto>)list1.ToList();
            MemoryStream memoryStream = new MemoryStream();
            StreamWriter streamWriter = new StreamWriter(memoryStream);
            streamWriter.WriteLine("id," + "FilmName," + "RoomName," + "Date," + "StartTime," + "EndTime," + "Price");
            foreach (var item in data)
            {
                streamWriter.WriteLine(item.Id + "," + item.FilmName + "," + item.RoomName + "," + item.Date +
                    "," + item.StartTime + "," + item.EndTime + "," + item.Price );
            }
            streamWriter.Flush();
            memoryStream.Seek(0, SeekOrigin.Begin);

            return File(memoryStream, "text/csv", "filmCalender.csv");
        }

    }
}
