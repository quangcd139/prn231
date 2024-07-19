using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Project_Cinema_PRN231.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class SecureController : ControllerBase
    {
        [HttpGet("data")]
        public IActionResult GetSecureData()
        {
            return Ok(new { Message = "This is a secure endpoint, accessible only with a valid JWT token." });
        }
    }
}
