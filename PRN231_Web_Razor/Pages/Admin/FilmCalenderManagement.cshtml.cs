using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project_Cinema_PRN231.domain.filmcalender;
using Project_Cinema_PRN231.domain.room;
using Project_Cinema_PRN231.model;

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
    }
}
