
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
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

        //public void OnGet()
        //{
        //    Users = _unitOfWork.UserRepository.GetAll();

        //}

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
