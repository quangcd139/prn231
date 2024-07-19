using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Project_Cinema_PRN231.domain.lot;
using Project_Cinema_PRN231.model;

namespace Project_Cinema_PRN231.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LotController : ControllerBase
    {
        private readonly Project_Cinema_PRN231Context _context = new Project_Cinema_PRN231Context();

        [HttpGet("getAll/{roomId}")]
        [EnableQuery]
        public IActionResult getAllLot(int roomId)
        {
            List<LotDto> listLot = _context.Lots.Where(x => x.IsDeleted == false && x.RoomId == roomId).Select(
               s => new LotDto
               {
                   Id = s.Id,
                   Code = s.Code,
                   Name = s.Name,
                   RoomId = roomId,
               }
               ).ToList();
            return Ok(listLot);
        }


        [HttpPost("{roomId}/create")]
        public IActionResult createLot(int roomId, CreatedLotRequest request)
        {
            if (request.Code == null || request.Code.Trim() == "")
            {
                return BadRequest("Code must be not null!!");
            }
            if (request.Name == null || request.Name.Trim() == "")
            {
                return BadRequest("Name must be not null!!");
            }

            Lot r = _context.Lots.FirstOrDefault(r => r.Code == request.Code && r.RoomId == roomId && r.IsDeleted == false);
            if (r != null)
            {
                return BadRequest("Lot Code exsited");
            }
            _context.Lots.Add(new Lot
            {
                Code = request.Code,
                Name = request.Name,
                RoomId = roomId,
                IsDeleted = false,
                CreatedAt = new DateTime(),
                CreatedBy = request.CreatedBy
            });
            return Ok("Created successfull");
        }

        [HttpPost("update/{lotId}")]
        public IActionResult updateLot(UpdatedLotRequest request, int lotId)
        {
            Lot r = _context.Lots.FirstOrDefault(r => r.Id == lotId && r.RoomId == request.RoomId && r.IsDeleted == false);

            if (r == null)
            {
                return NotFound();
            }
            else
            {
                if (!request.Code.Equals(r.Code))
                {
                    Lot r1 = _context.Lots.FirstOrDefault(x => x.Code == request.Code && r.RoomId == request.RoomId && x.IsDeleted == false);
                    if (r1 != null)
                    {
                        return BadRequest("Lot Code already exsits!");
                    }
                }
            }
            _context.Lots.Update(new Lot
            {
                Code = request.Code,
                Name = request.Name,
                RoomId = request.RoomId,
                BuildingId = request.BuildingId,
                UpdatedAt = new DateTime(),
            });
            _context.SaveChanges();

            return Ok("Update successfull");
        }

        [HttpPost("delete/{lotId}")]
        public IActionResult deleteLot(int lotId)
        {
            Lot lot = _context.Lots.FirstOrDefault(l => l.Id == lotId && l.IsDeleted == false);
            if (lot == null)
            {
                return NotFound();
            }
            _context.Lots.Update(new Lot
            {
                IsDeleted = true
            });
            _context.SaveChanges();
            return Ok();
        }
    }
}
