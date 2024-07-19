using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project_Cinema_PRN231.domain.room;
using Project_Cinema_PRN231.model;
using System.Text;


namespace PRN231_Web_Razor.Pages.Admin
{
    public class RoomManagementModel : PageModel
    {
        public IList<Room> RoomList { get; set; }
        [BindProperty]
        public Room Rooms { get; set; }
        public void OnGet()
        {
            HttpClient _httpClient = new HttpClient();
            HttpResponseMessage response = _httpClient.GetAsync("http://localhost:5000/api/Room/getAll").Result;
            var RoomDtos = response.Content.ReadFromJsonAsync<List<RoomDto>>().Result;
            ViewData["RoomDto"] = RoomDtos.ToList();

        }

        public async Task<IActionResult> OnPostEditRoom()
        {
            var idUpdate = int.Parse(Request.Form["id"]);
            var nameUpdate = Request.Form["name"];

            HttpClient client = new HttpClient();
            HttpResponseMessage responseById = client.GetAsync("http://localhost:5000/api/Room/getAll/?$filter=id%20eq%20" + idUpdate).Result;
            var room = responseById.Content.ReadFromJsonAsync<List<Room>>().Result;
            Room c = room[0];
            c.Name = nameUpdate;

            var request = new HttpRequestMessage(HttpMethod.Post, "http://localhost:5000/api/Room/update");
            request.Headers.Add("Accept", "*/*");
            var jsonString = Newtonsoft.Json.JsonConvert.SerializeObject(c);
            var content = new StringContent(jsonString, Encoding.UTF8, "application/json");
            request.Content = content;
            // Await the asynchronous call to send the request
            var response = await client.SendAsync(request);

            return RedirectToPage();
        }

        public async Task<IActionResult> OnPostAddRoom()
        {
            var createRoomCode = Request.Form["createRoomCode"];
            var createRoomName = Request.Form["createRoomName"];
            Room c = new Room();
            c.Name = createRoomName;
            c.Code = createRoomCode;
            c.BuildingId = 1;
            HttpClient client = new HttpClient();
            var request = new HttpRequestMessage(HttpMethod.Post, "http://localhost:5000/api/Room/add");
            request.Headers.Add("Accept", "*/*");
            var jsonString = Newtonsoft.Json.JsonConvert.SerializeObject(c);
            var content = new StringContent(jsonString, Encoding.UTF8, "application/json");
            request.Content = content;
            // Await the asynchronous call to send the request
            var response = await client.SendAsync(request);

            return RedirectToPage();
        }
        }
}
