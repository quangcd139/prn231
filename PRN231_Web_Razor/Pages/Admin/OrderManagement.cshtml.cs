
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project_Cinema_PRN231.domain.orderdetail;
using Project_Cinema_PRN231.model;

namespace Library.Pages.Admin
{
    public class OrderManagementModel : PageModel
    {
        //private readonly IUnitOfWork _unitOfWork;

        //public OrderManagementModel(IUnitOfWork unitOfWork)
        //{
        //    _unitOfWork = unitOfWork;
        //}
        //public IList<Order> Orders { get; set; }

        public void OnGet()
        {
            HttpClient _httpClient = new HttpClient();
            HttpResponseMessage response = _httpClient.GetAsync("http://localhost:5000/api/OrderDetail/getAllOrder").Result;
            var OrderDetailDto = response.Content.ReadFromJsonAsync<List<OrderDetailDto>>().Result;
            ViewData["OrderDetailDto"] = OrderDetailDto.ToList();

        }

        //public IActionResult OnGetOrderDetails(int orderId)
        //{
        //    var order = _unitOfWork.OrderRepository.GetAllOrdersNav()
        //        .FirstOrDefault(o => o.OrderId == orderId);

        //    if (order == null)
        //    {
        //        return NotFound();
        //    }
        //    return Partial("_OrderDetailsPartial", order.OrderDetails);
        //}

        //public IActionResult OnPostEditOrder()
        //{
        //    int orderId = int.Parse(Request.Form["id"]);
        //    string address = Request.Form["address"];
        //    string status = Request.Form["status"];
        //    Order o = _unitOfWork.OrderRepository.Find(orderId);
        //    o.Address = address;
        //    o.Status = status;
        //    _unitOfWork.OrderRepository.Update(o);
        //    _unitOfWork.SaveChange();
        //    return RedirectToPage();

        //}
        //public IActionResult OnGetExportFile()
        //{
        //    var data = _unitOfWork.OrderRepository.GetAll().ToList(); // Lấy dữ liệu từ Backend
        //    MemoryStream memoryStream = new MemoryStream();
        //    StreamWriter streamWriter = new StreamWriter(memoryStream);
        //    streamWriter.WriteLine("OrderId," + "UserId," + "OrderDate," + "Status," + "Address," + "Total");
        //    // Ghi dữ liệu vào tập tin
        //    foreach (var item in data)
        //    {
        //        streamWriter.WriteLine(item.OrderId + "," + item.UserId+","+item.OrderDate+","+item.Status+","+item.Address+","+item.Total);
        //    }
        //    streamWriter.Flush();
        //    memoryStream.Seek(0, SeekOrigin.Begin);

        //    // Trả về tập tin đã tạo
        //    return File(memoryStream, "text/csv", "Orders.csv");
        //}
    }
}
