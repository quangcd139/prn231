using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Microsoft.EntityFrameworkCore;
using Project_Cinema_PRN231.domain.filmcalender;
using Project_Cinema_PRN231.domain.libraryfilm;
using Project_Cinema_PRN231.model;

namespace Project_Cinema_PRN231.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FilmCalenderController : ControllerBase
    {
        private Project_Cinema_PRN231Context _context = new Project_Cinema_PRN231Context();
        
        [HttpGet("GetAll")]
        [EnableQuery]
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
                    RoomId = s.RoomId,
                    FilmId= s.FilmId,
                    CreatedAt= s.CreatedAt,
                }).ToList();
            return Ok(listData);
        }

        [HttpPost("Update")]
        public IActionResult Update(UpdatedFilmCalenderRequest updatedLibrary)
        {

            FilmCalender lb = new FilmCalender
            {
                Id = updatedLibrary.Id,
                RoomId = updatedLibrary.RoomId,
                Date = updatedLibrary.Date,
                StartTime = updatedLibrary.StartTime,
                EndTime = updatedLibrary.EndTime,
                Price = updatedLibrary.Price,
                FilmId = updatedLibrary.FilmId,
                CreatedAt = updatedLibrary.CreatedAt.Value,
                UpdatedAt = DateTime.Now,
                UpdatedBy = "admin",
                IsDeleted = false
            };
            _context.FilmCalenders.Update(lb);
            _context.SaveChanges();
            return Ok(1);
        }

        [HttpPost("Add")]
        public IActionResult Add(UpdatedFilmCalenderRequest updatedLibrary)
        {

            FilmCalender lb = new FilmCalender
            {
                RoomId = updatedLibrary.RoomId,
                Date = updatedLibrary.Date,
                StartTime = updatedLibrary.StartTime,
                EndTime = updatedLibrary.EndTime,
                Price = updatedLibrary.Price,
                FilmId = updatedLibrary.FilmId,
                CreatedAt = updatedLibrary.CreatedAt.Value,
                UpdatedAt = DateTime.Now,
                UpdatedBy = "admin",
                IsDeleted = false
            };
            _context.FilmCalenders.Add(lb);
            _context.SaveChanges();
            return Ok(1);
        }

    }
}
