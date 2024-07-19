﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OData.Query;
using Microsoft.EntityFrameworkCore;
using Project_Cinema_PRN231.domain.room;
using Project_Cinema_PRN231.model;
using System.Xml.Linq;

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

        [HttpGet("getShowtime1/{buildingId}/{filmId}")]
        [EnableQuery]
        public IActionResult GetByBuildingId(int buildingId,int filmId)
        {
            var listBuilding = _context.Rooms.Include(r => r.FilmCalenders).Where(x => x.IsDeleted == false && x.BuildingId == buildingId).Select(
               s => new
               {
                   RoomId = s.Id,
                   RoomCode = s.Code,
                   RoomName = s.Name,
                   BuildingId = buildingId,
                   FilmCalenders = s.FilmCalenders.Where(fc => fc.Date.Day == DateTime.Now.Day && fc.FilmId== filmId).ToList()
               }
               ).ToList();
            return Ok(listBuilding);
        }
        [HttpGet("getShowtime/{buildingId}/{date}/{filmId}")]
        [EnableQuery]
        public IActionResult GetByBuildingIdAndDate(int buildingId,DateTime date,int filmId)
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
                   FilmCalenders = s.FilmCalenders.Where(fc => fc.Date.Equals(date) && fc.FilmId== filmId).ToList()
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
            });
            return Ok("Created successfull");
        }

        [HttpPost("update")]
        public IActionResult updateRoom(UpdatedRoomRequest request)
        {
            Room r = _context.Rooms.FirstOrDefault(r => r.Id == request.Id && r.BuildingId == request.BuildingId && r.IsDeleted == false);

            if (r == null)
            {
                return NotFound();
            }
            else
            {
                if (!request.Code.Equals(r.Code))
                {
                    Room r1 = _context.Rooms.FirstOrDefault(x => x.Code == request.Code && r.BuildingId == request.BuildingId && x.IsDeleted == false);
                    if (r1 != null)
                    {
                        return BadRequest("Room Code already exsits!");
                    }
                }
            }
            r.Code = request.Code;
            r.Name = request.Name;
            r.BuildingId = request.BuildingId;
            _context.Rooms.Update(r);
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

        [HttpPost("add")]
        public IActionResult addRoom(CreatedRoomRequest request)
        {
            if (request.Code == null || request.Code.Trim() == "")
            {
                return BadRequest("Code must be not null!!");
            }
            if (request.Name == null || request.Name.Trim() == "")
            {
                return BadRequest("Name must be not null!!");
            }
            var room = _context.Rooms.FirstOrDefault(s => s.Code == request.Code);

            if(room != null)
            {
                return BadRequest("Room Code already exists!");
            }
            Room r = new Room();
            r.Code = request.Code;
            r.Name = request.Name;
            r.BuildingId = request.BuildingId;
            r.CreatedBy = "Admin";

            _context.Rooms.Add(r);
            _context.SaveChanges();

            return Ok("Add successfully");
        }
    }
}
