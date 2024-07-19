using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Microsoft.EntityFrameworkCore;
using Project_Cinema_PRN231.domain.room;
using Project_Cinema_PRN231.model;

namespace Project_Cinema_PRN231.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomController : ControllerBase
    {
        private readonly Project_Cinema_PRN231Context _context = new Project_Cinema_PRN231Context();

        [HttpGet("getAll")]
        [EnableQuery]
        public IActionResult getAllRoom()
        {
            List<RoomDto> listRooms = _context.Rooms.Where(x => x.IsDeleted == false).Select(
               s => new RoomDto
               {
                   Id = s.Id,
                   Code = s.Code,
                   Name = s.Name,
                   BuildingId = s.BuildingId,
                   IsDeleted = s.IsDeleted,
               }
               ).ToList();
            return Ok(listRooms);
        }

        [HttpGet("getShowtime/{buildingId}")]
        [EnableQuery]
        public IActionResult GetByBuildingId(int buildingId)
        {
            var listBuilding = _context.Rooms.Include(r => r.FilmCalenders).Where(x => x.IsDeleted == false && x.BuildingId == buildingId).Select(
               s => new
               {
                   RoomId = s.Id,
                   RoomCode = s.Code,
                   RoomName = s.Name,
                   BuildingId = buildingId,
                   FilmCalenders = s.FilmCalenders.Where(fc => fc.Date.Day == DateTime.Now.Day).ToList()
               }
               ).ToList();
            return Ok(listBuilding);
        }
        [HttpGet("getShowtime/{buildingId}/{date}")]
        [EnableQuery]
        public IActionResult GetByBuildingIdAndDate(int buildingId,DateTime date)
        {
            var listBuilding = _context.Rooms.Include(r => r.FilmCalenders)
                .Where(x => x.IsDeleted == false && x.BuildingId == buildingId )
                .Select(
               s => new
               {
                   RoomId = s.Id,
                   RoomCode = s.Code,
                   RoomName = s.Name,
                   BuildingId = buildingId,
                   FilmCalenders = s.FilmCalenders.Where(fc => fc.Date.Equals(date)).ToList()
               }
               ).ToList();
            return Ok(listBuilding);
        }

        [HttpPost("{buildingId}/create")]
        public IActionResult createRoom(int buildingId, CreatedRoomRequest request)
        {
            if (request.Code == null || request.Code.Trim() == "")
            {
                return BadRequest("Code must be not null!!");
            }
            if (request.Name == null || request.Name.Trim() == "")
            {
                return BadRequest("Name must be not null!!");
            }

            Room r = _context.Rooms.FirstOrDefault(r => r.Code == request.Code && r.BuildingId == buildingId && r.IsDeleted == false);
            if (r != null)
            {
                return BadRequest("Room Code exsited");
            }
            _context.Rooms.Add(new Room
            {
                Code = request.Code,
                Name = request.Name,
                BuildingId = buildingId,
                IsDeleted = false,
                CreatedAt = new DateTime(),
                CreatedBy = request.CreatedBy
            });
            return Ok("Created successfull");
        }

        [HttpPost("{buildingId}/update/{roomId}")]
        public IActionResult updateRoom(int buildingId, UpdatedRoomRequest request, int roomId)
        {
            Room r = _context.Rooms.FirstOrDefault(r => r.Id == roomId && r.BuildingId == buildingId && r.IsDeleted == false);

            if (r == null)
            {
                return NotFound();
            }
            else
            {
                if (!request.Code.Equals(r.Code))
                {
                    Room r1 = _context.Rooms.FirstOrDefault(x => x.Code == request.Code && r.BuildingId == buildingId && x.IsDeleted == false);
                    if (r1 != null)
                    {
                        return BadRequest("Room Code already aaaaaaaaaaaaaaaaaaa!");
                    }
                }
            }
            _context.Rooms.Update(new Room
            {
                Code = request.Code,
                Name = request.Name,
                BuildingId = buildingId,
                UpdatedAt = new DateTime(),
            });
            _context.SaveChanges();

            return Ok("Update successfull");
        }

        [HttpPost("delete/{roomId}")]
        public IActionResult deleteRoom(int roomId)
        {
            Room room = _context.Rooms.FirstOrDefault(room => room.Id == roomId && room.IsDeleted == false);
            if (room == null)
            {
                return NotFound();
            }
            _context.Rooms.Update(new Room
            {
                IsDeleted = true
            });
            _context.SaveChanges();
            return Ok();
        }
    }
}
