using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Microsoft.EntityFrameworkCore;
using Project_Cinema_PRN231.domain.building;
using Project_Cinema_PRN231.@interface;
using Project_Cinema_PRN231.model;
using System.Net;

namespace Project_Cinema_PRN231.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BuildingController : ControllerBase
    {

        private readonly Project_Cinema_PRN231Context _context = new Project_Cinema_PRN231Context();

        [HttpGet("getAll")]
        [EnableQuery]
        public IActionResult getAll()
        {
            List<BuildingDto> listBuilding = _context.Buildings.Where(x => x.IsDeleted == false).Select(
               s => new BuildingDto
               {
                   Id = s.Id,
                   Code = s.Code,
                   Name = s.Name,
                   Address = s.Address,
               }
               ).ToList();
            return Ok(listBuilding);
        }

        [HttpPost("create")]
        public IActionResult createBuilding(CreatedBuildingRequest request)
        {
            if (request.Code == null || request.Code.Trim() == "")
            {
                return BadRequest("Code must be not null!!");
            }
            if (request.Name == null || request.Name.Trim() == "")
            {
                return BadRequest("Name must be not null!!");
            }

            Building b = _context.Buildings.FirstOrDefault(x => x.Code == request.Code);
            if (b != null)
            {
                return BadRequest("Building Code existed");
            }
            //Save in db
            _context.Buildings.Add(new Building
            {
                Name = request.Name,
                Code = request.Code,
                Address = request.Address,
                IsDeleted = false,
                CreatedAt = new DateTime(),
                CreatedBy = request.CreatedBy
            });
            _context.SaveChanges();

            return Ok("Created successfull");
        }


        [HttpPost("update")]
        public IActionResult updateBuilding(UpdatedBuildingRequest request)
        {
            Building b = _context.Buildings.FirstOrDefault(y => y.Id == request.id);
            if(b == null)
            {
                return BadRequest("Not found");
            }
            else
            {
                if (!request.Code.Equals(b.Code))
                {
                    Building b1 = _context.Buildings.FirstOrDefault(x => x.Code == request.Code);
                    if(b1 != null)
                    {
                        return BadRequest("Building Code existed");
                    }
                }

                _context.Buildings.Update(new Building
                {
                    Name = request.Name,
                    Code = request.Code,
                    Address = request.Address,
                    IsDeleted = false,
                    UpdatedAt = new DateTime(),
                    UpdatedBy = request.UpdatedBy
                });
                _context.SaveChanges();
            }
            return Ok("updated successfull");
        }

        [HttpPost("delete/{id}")]
        public IActionResult deleteBuilding(int id)
        {
            Building b = _context.Buildings.FirstOrDefault(y => y.Id == id);
            if (b == null)
            {
                return BadRequest("Not found");
            }
            else
            {
                
                _context.Buildings.Update(new Building
                {
                    IsDeleted = true,
                    UpdatedAt = new DateTime(),
                });
                _context.SaveChanges();
            }
            return Ok("deleted successfull");
        }
    }

    
}
