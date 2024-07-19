using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project_Cinema_PRN231.domain.orderdetail;

namespace PRN231_Web_Razor.Pages
{
    public class UserOrderModel : PageModel
    {
        public void OnGet()
        {
            var userId = HttpContext.Session.GetString("userId");
            HttpClient _httpClient = new HttpClient();
            HttpResponseMessage response = _httpClient.GetAsync("http://localhost:5000/api/OrderDetail/GetOrderByUser/"+ userId).Result;
            var orders = response.Content.ReadFromJsonAsync<List<OrderDetailDto>>().Result;
            ViewData["orders"] = orders.ToList();
        }
    }
}
