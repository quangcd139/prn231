
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project_Cinema_PRN231.domain.libraryfilm;
using Project_Cinema_PRN231.model;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Xml.Linq;


namespace Library.Pages.Admin
{
    public class FilmManagementModel : PageModel
    {


        public IList<Category> Categories { get; set; }
        public IList<LibraryFilmDTO> LibraryFilms { get; set; }
        //public IList<Author> Authors { get; set; }


        [BindProperty]
        public  LibraryFilm Film { get; set; }

        [Required]
        public IFormFile Image { get; set; }
        public void OnGet()
        {
            HttpClient _httpClient = new HttpClient();
            HttpResponseMessage response = _httpClient.GetAsync("http://localhost:5000/api/Category/GetCategory").Result;
            var list = response.Content.ReadFromJsonAsync<List<Category>>().Result;
            Categories = (IList<Category>)list.ToList();

            response = _httpClient.GetAsync("http://localhost:5000/api/LibraryFilm/GetAll").Result;
            var list1 = response.Content.ReadFromJsonAsync<List<LibraryFilmDTO>>().Result;
            LibraryFilms = (IList<LibraryFilmDTO>)list1.ToList();


            //Authors = _unitOfWork.AuthorRepository.GetAll();
        }

        public async Task<IActionResult> OnPostEditFilm()
        {
            var idFilm = Request.Form["id"];
            HttpClient client = new HttpClient();
            HttpResponseMessage response = client.GetAsync("http://localhost:5000/api/LibraryFilm/GetAll?$filter=id%20eq%20" + idFilm).Result;
            var list1 = response.Content.ReadFromJsonAsync<List<LibraryFilm>>().Result;
            LibraryFilm lb = list1[0];
           

            lb.CategoryId = int.Parse(Request.Form["category"]);
            lb.Name = Request.Form["name"];
            lb.TrailerUrl = Request.Form["trailerUrl"];
            lb.ReleaseYear = DateTime.Parse(Request.Form["releaseYear"]);
            lb.Director = Request.Form["director"];
            lb.Description = Request.Form["description"];


            var file = Request.Form.Files["newimage"];

            if (file != null && file.Length > 0)
            {
                var fileName = file.FileName;
                var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "assets", "images","film", fileName);
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }

                lb.Image = "/assets/images/film/" + fileName;
            }

            //call api update
            var request = new HttpRequestMessage(HttpMethod.Post, "http://localhost:5000/api/LibraryFilm/Update");
            request.Headers.Add("Accept", "*/*");
            var jsonString = Newtonsoft.Json.JsonConvert.SerializeObject(lb);
            var content = new StringContent(jsonString, Encoding.UTF8, "application/json");
            request.Content = content;
            // Await the asynchronous call to send the request
            var response1 = await client.SendAsync(request);

            return RedirectToPage();

        }

        public async Task<IActionResult> OnPostAddFilm()
        {
            var fileName = Image.FileName;
            var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "assets","images", "film", fileName);
            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                Image.CopyTo(stream);
            }
            Film.Image = "/assets/images/film/" + fileName;

            HttpClient client = new HttpClient();
            var request = new HttpRequestMessage(HttpMethod.Post, "http://localhost:5000/api/LibraryFilm/Add");
            request.Headers.Add("Accept", "*/*");
            var jsonString = JsonSerializer.Serialize(Film);
            var content = new StringContent(jsonString, Encoding.UTF8, "application/json");
            request.Content = content;
            // Await the asynchronous call to send the request
            var response1 = await client.SendAsync(request);

            return RedirectToPage();
        }

        public IActionResult OnGetExportFile()
        {
            HttpClient client = new HttpClient();
            var response = client.GetAsync("http://localhost:5000/api/LibraryFilm/GetAll").Result;
            var list1 = response.Content.ReadFromJsonAsync<List<LibraryFilmDTO>>().Result;
            var data = (IList<LibraryFilmDTO>)list1.ToList();
            MemoryStream memoryStream = new MemoryStream();
            StreamWriter streamWriter = new StreamWriter(memoryStream);
            streamWriter.WriteLine("id," + "code," + "movie name," + "Category Name," + "trailerUrl," + "description,"
                + "releaseYear,"+ "director,"+ "createdAt");
            foreach (var item in data)
            {
                streamWriter.WriteLine(item.Id + "," + item.Code + "," + item.Name + "," + item.CategoryName +
                    "," + item.TrailerUrl + "," + item.Description + ","+ item.ReleaseYear + "," + item.Director+","+item.CreatedAt);
            }
            streamWriter.Flush();
            memoryStream.Seek(0, SeekOrigin.Begin);

            return File(memoryStream, "text/csv", "Films.csv");
        }
    }
}
