using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project_Cinema_PRN231.domain.category;
namespace PRN231_Web_Razor.Pages
{
    public class MovieModel : PageModel
    {
        public void OnGet()
        {
            
            HttpClient _httpClient = new HttpClient();
			HttpResponseMessage response = _httpClient.GetAsync("http://localhost:5000/api/Category/GetAll").Result;
			var categories = response.Content.ReadFromJsonAsync<List<CategoryDto>>().Result;
			ViewData["categories"] = categories.ToList();

		}
    }
}
