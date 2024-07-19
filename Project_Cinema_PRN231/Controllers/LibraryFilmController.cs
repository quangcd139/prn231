using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Microsoft.EntityFrameworkCore;
using Project_Cinema_PRN231.domain.filmcalender;
using Project_Cinema_PRN231.domain.libraryfilm;
using Project_Cinema_PRN231.model;
using System.IO;
using System.Xml.Linq;
using static System.Net.Mime.MediaTypeNames;

namespace Project_Cinema_PRN231.Controllers
{
    [Route("api/[controller]")]
    [ApiController]


    public class LibraryFilmController : ControllerBase
    {
        private readonly Project_Cinema_PRN231Context _context = new Project_Cinema_PRN231Context();

        [HttpGet("GetAll")]
        [EnableQuery]
        public IActionResult GetAll()
        {
            var list = _context.LibraryFilms
                .Select(lb => new LibraryFilmDTO
                {
                    Id = lb.Id,
                    Name = lb.Name,
                    Code = lb.Code,
                    Description = lb.Description,
                    CategoryId = lb.CategoryId,
                    CategoryName = lb.Category.Name,
                    Image = lb.Image,
                    TrailerUrl = lb.TrailerUrl,
                    ReleaseYear = lb.ReleaseYear.Value.ToString("yyyy-MM-dd"),
                    CreatedAt = lb.CreatedAt,
                    Director = lb.Director
                })
                .ToList();

            return Ok(list);
        }

        [HttpPost("Update")]
        public IActionResult Update(UpdatedLibraryFilmRequest updatedLibrary)
        {

            LibraryFilm lb = new LibraryFilm
            {
                Id = updatedLibrary.Id,
                CategoryId = updatedLibrary.CategoryId,
                Code = updatedLibrary.Code,
                Name = updatedLibrary.Name,
                Description = updatedLibrary.Description,
                Image = updatedLibrary.Image,
                TrailerUrl = updatedLibrary.TrailerUrl,
                ReleaseYear = updatedLibrary.ReleaseYear,
                Director = updatedLibrary.Director,
                CreatedAt = updatedLibrary.CreatedAt.Value,
                UpdatedAt = DateTime.Now,
                UpdatedBy = "admin",
                IsDeleted = false
            };
            _context.LibraryFilms.Update(lb);
            _context.SaveChanges();
            return Ok(1);
        }

        [HttpPost("Add")]
        public IActionResult Add(CreatedLibraryFilmRequest AddLibrary)
        {

            LibraryFilm lb = new LibraryFilm
            {
                CategoryId = AddLibrary.CategoryId,
                Code = AddLibrary.Code,
                Name = AddLibrary.Name,
                Description = AddLibrary.Description,
                Image = AddLibrary.Image,
                TrailerUrl = AddLibrary.TrailerUrl,
                ReleaseYear = AddLibrary.ReleaseYear,
                Director = AddLibrary.Director,
                CreatedAt = DateTime.Now,
                CreatedBy = "admin",
                IsDeleted = false
            };
            _context.LibraryFilms.Add(lb);
            _context.SaveChanges();
            return Ok(1);
        }
    }
}
