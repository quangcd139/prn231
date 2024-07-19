using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project_Cinema_PRN231.model;

namespace Project_Cinema_PRN231.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FilmCalenderController : ControllerBase
    {
        private Project_Cinema_PRN231Context _context = new Project_Cinema_PRN231Context();
        [HttpGet("GetAll")]
        public IActionResult GetAll()
        {
            var listData = _context.FilmCalenders.Where(s => s.IsDeleted == false).Include(s => s.Film).Include(s => s.Room).Where(s => s.Film.IsDeleted == false && s.Room.IsDeleted == false)
                .Select(s => new
                {
                    Id = s.Id,
                    FilmName = s.Film.Name,
                    RoomName = s.Room.Name,
                    Date = s.Date,
                    StartTime = s.StartTime,
                    EndTime = s.EndTime,
                    Price = s.Price,
                    RoomId = s.RoomId
                }).ToList();
            return Ok(listData);
        }

    }
}
