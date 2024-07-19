
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project_Cinema_PRN231.domain.libraryfilm;
using Project_Cinema_PRN231.domain.orderdetail;
using Project_Cinema_PRN231.domain.room;
using Project_Cinema_PRN231.model;

namespace Library.Pages.Admin
{
    public class DashboardModel : PageModel
    {
        //private readonly IUnitOfWork _unitOfWork;

        //public DashboardModel(IUnitOfWork unitOfWork)
        //{
        //    _unitOfWork = unitOfWork;
        //}
     /*   public int CountUser { get; set; }
        public int CountBook { get; set; }
        public int CountOrder { get; set; }
        public int[] OrdersByMonth { get; set; }*/
        public void OnGet()
        { 
            //All User
            HttpClient _httpClient = new HttpClient();
            HttpResponseMessage response = _httpClient.GetAsync("http://localhost:5000/api/SysUser/getAll").Result;
            var SysUsers = response.Content.ReadFromJsonAsync<List<SysUser>>().Result;
            ViewData["SysUser"] = SysUsers.ToList();

            response = _httpClient.GetAsync("http://localhost:5000/api/LibraryFilm/GetAll").Result;
            var list1 = response.Content.ReadFromJsonAsync<List<LibraryFilmDTO>>().Result;
            ViewData["LibraryFilmDTO"] = list1.ToList();

            response = _httpClient.GetAsync("http://localhost:5000/api/Room/getAll").Result;
            var RoomDtos = response.Content.ReadFromJsonAsync<List<RoomDto>>().Result;
            ViewData["RoomDto"] = RoomDtos.ToList();

            response = _httpClient.GetAsync("http://localhost:5000/api/OrderDetail/getAllOrder").Result;
            var OrderDetailDtoList = response.Content.ReadFromJsonAsync<List<OrderDetailDto>>().Result;
            ViewData["OrderDetailDto"] = OrderDetailDtoList.ToList();
        }
    }
}
