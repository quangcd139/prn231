using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project_Cinema_PRN231.domain.building;

namespace PRN231_Web_Razor.Pages
{
    public class TicketBookingModel : PageModel
    {
        public string userId { get; set; }

        public void OnGet(int filmId)
        {
            userId = HttpContext.Session.GetString("userId");
            HttpClient _httpClient = new HttpClient();
            HttpResponseMessage response = _httpClient.GetAsync("http://localhost:5000/api/Building/getAll").Result;
            var buildings = response.Content.ReadFromJsonAsync<List<BuildingDto>>().Result;
            ViewData["buildings"] = buildings.ToList();
            ViewData["filmid"] = filmId;
        }
    }
}
