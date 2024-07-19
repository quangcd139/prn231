using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Project_Cinema_PRN231.domain.sysuser;
using Project_Cinema_PRN231.model;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;


namespace Project_Cinema_PRN231.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SysUserController : ControllerBase
    {
        private readonly Project_Cinema_PRN231Context _context = new Project_Cinema_PRN231Context();
        private readonly IConfiguration _configuration;

        

        [HttpPost("login/{username}/{password}")]
        public IActionResult GetUsername(string username, string password)
        {
            var check = _context.SysUsers.FirstOrDefault(u => u.UserName == username && u.PassWord == password);
            var token = "";
            if (check == null)
            {
                return NotFound();
            }

            return Ok(new SysUserDto
            {
                Id = check.Id,
                Username = check.UserName,
                Fullname = check.FullName,
                IsAdmin = check.IsAdmin
            });
        }

        [HttpPost("register")]
        public IActionResult GetUsername(CreatedSysUserRequest user)
        {
            SysUser sysUser = new SysUser
            {
                UserName = user.Name,
				FullName = user.FullName,
                PassWord = user.Password,
                IsAdmin = false,
				IsDeleted=false,
				CreatedAt = DateTime.Now,
                CreatedBy= user.Name

			};
            _context.SysUsers.Add(sysUser);
            _context.SaveChanges();

            return Ok();

        }

    }
}
