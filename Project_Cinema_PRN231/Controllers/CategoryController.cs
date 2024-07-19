using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Microsoft.EntityFrameworkCore;
using Project_Cinema_PRN231.domain.category;
using Project_Cinema_PRN231.domain.libraryfilm;
using Project_Cinema_PRN231.model;
using System.Xml.Linq;
using static System.Net.Mime.MediaTypeNames;

namespace Project_Cinema_PRN231.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly Project_Cinema_PRN231Context _context = new Project_Cinema_PRN231Context();

        
        [HttpGet("GetCategory")]
        [EnableQuery]
        public IActionResult GetCategory()
        {
            var list = _context.Categories.ToList();
            return Ok(list);
        }

        [HttpPost("Update")]
        public IActionResult GetAllCategories(UpdatedCategoryRequest categoryRequest)
        {
            Category c = _context.Categories.Find(categoryRequest.Id);

            c.Name = categoryRequest.Name;
            c.Image = categoryRequest.Image;
            c.UpdatedBy = "admin";
            c.UpdatedAt = DateTime.Now;

            _context.Categories.Update(c);
            _context.SaveChanges();
            return Ok(1);
        }

        [HttpGet("GetAll")]
        public IActionResult getAll()
        {
            var list = _context.Categories.Where(c => c.IsDeleted == false).Include(l => l.LibraryFilms).Select(c => new CategoryDto
            {
                Id = c.Id,
                Name = c.Name,
                Code = c.Code,
                Image = c.Image.ToString(),
                LibraryFilms = c.LibraryFilms.Where(lb => lb.CategoryId == c.Id).Select(f => new LibraryFilmDTO
                {
                    Id = f.Id,
                    Name = f.Name,
                    Code = f.Code,
                    Description = f.Description,
                    CategoryId = f.CategoryId,
                    CategoryName = f.Category.Name.ToString(),
                    Image = f.Image,

                    ReleaseYear = f.ReleaseYear.Value.ToString("dd/MM/yyyy"),
                    Director = f.Director,
                    TrailerUrl = f.TrailerUrl,

                    TimeDuration = f.FilmCalenders.FirstOrDefault(c => c.FilmId == f.Id) != null ?
                f.FilmCalenders.FirstOrDefault(c => c.FilmId == f.Id).EndTime
                - f.FilmCalenders.FirstOrDefault(c => c.FilmId == f.Id).StartTime
                : TimeSpan.Zero,
                }).Take(4).ToList()

            });
            return Ok(list);
        }
    }
}
