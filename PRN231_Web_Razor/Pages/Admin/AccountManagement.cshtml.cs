
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project_Cinema_PRN231.domain.room;
using Project_Cinema_PRN231.model;

namespace Library.Pages.Admin
{
    public class AccountManagementModel : PageModel
    {


        //public AccountManagementModel(IUnitOfWork unitOfWork)
        //{
        //    _unitOfWork = unitOfWork;
        //}
        [BindProperty]
        public SysUser User { get; set; }
        public IList<SysUser> Users { get; set; }

          public void OnGet()
          {
            HttpClient _httpClient = new HttpClient();
            HttpResponseMessage response = _httpClient.GetAsync("http://localhost:5000/api/SysUser/getAll").Result;
            var SysUsers = response.Content.ReadFromJsonAsync<List<SysUser>>().Result;
            ViewData["SysUser"] = SysUsers.ToList();

        }

        //public IActionResult OnPostEditUser()
        //{
        //    int userId = int.Parse(Request.Form["id"]);
        //    string role = Request.Form["role"];
        //    string status = Request.Form["status"];
        //    User u = _unitOfWork.UserRepository.Find(userId);
        //    u.UserRole = role;
        //    u.Status = bool.Parse(status);
        //    _unitOfWork.UserRepository.Update(u);
        //    _unitOfWork.SaveChange();
        //    return RedirectToPage();
        //}
        //public IActionResult OnPostAddUser()
        //{
        //    _unitOfWork.UserRepository.Add(User);
        //    _unitOfWork.SaveChange();
        //    return RedirectToPage();
        //}
    }
}
