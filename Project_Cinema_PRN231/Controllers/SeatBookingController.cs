using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project_Cinema_PRN231.model;

namespace Project_Cinema_PRN231.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SeatBookingController : ControllerBase
    {
        private readonly Project_Cinema_PRN231Context _context = new Project_Cinema_PRN231Context();

        [HttpGet("GetDetail/{id}")]
        public IActionResult getDetail(int id)
        {
            //building name, ROOM name, movie name, movie image, seat
            //price, date, timeDuration
            var list = _context.SeatBookings
                .Include(s => s.FilmCalendar)
                .Include(s => s.Lot)
                .Where(s => s.Id == id)
                .Select(f => new
                {
                    BuildingName = f.Lot.Building.Name,
                    RoomName = f.Lot.Room.Name,
                    MovieName = f.FilmCalendar.Film.Name,
                    MovieImage = f.FilmCalendar.Film.Image,
                    //seat = 
                    Price = f.FilmCalendar.Price,
                    BookingDate = f.BookingTime.Value.ToString("dd/MM/yyyy"),
                    StartTime = f.FilmCalendar.StartTime,
                    EndTime = f.FilmCalendar.EndTime,

                    TimeDuration = f.FilmCalendar != null ?
                f.FilmCalendar.EndTime
                - f.FilmCalendar.StartTime
                : TimeSpan.Zero
                });

            return Ok(list);
        }

        [HttpGet("getSeat/{buildingId}/{filmId}")]
        public IActionResult getAllBooked(int buildingId, int filmId)
        {
            var filmCalendar = _context.FilmCalenders.FirstOrDefault(s => s.Id == filmId);

            var listSeatBooking = _context.SeatBookings.Where(s => s.FilmCalendarId == filmId).Select(s => s.LotId);

            var listLots = _context.Lots
                .Where(l => l.BuildingId == buildingId && l.RoomId == filmCalendar.RoomId)
                .Select(s => new
                {
                    lotId = s.Id,
                    name = s.Name,
                    buildingId = s.BuildingId,
                    roomId = s.RoomId,
                    filmCalenderId = filmId,
                    status = listSeatBooking.Contains(s.Id),
                    statusString = listSeatBooking.Contains(s.Id) == true ? "booked" : "avalible"

                }).ToList();

            return Ok(listLots);
        }

        [HttpGet("getSeatMap/{buildingId}/{filmId}/{roomId}")]
        public IActionResult getAllSeat(int buildingId, int filmId, int roomId)
        {
            var filmCalendar = _context.FilmCalenders.FirstOrDefault(s => s.Id == filmId);

            var soldSeats = _context.SeatBookings
                .Include(s => s.Lot)
                .Where(s => s.FilmCalendarId == filmId)
                .Select(s => new
                {
                    s.Lot.Row,
                    s.Lot.Column
                })
                .AsEnumerable() // Convert to in-memory collection to use string interpolation
                .Select(s => $"{s.Row}_{s.Column}")
                .ToList();

            var seatData = _context.Lots
                .Where(s => s.BuildingId == buildingId && s.RoomId == roomId)
                .Select(s => new
                {
                    s.Row,
                    s.Column
                })
                .ToList();
            if (seatData.Count() <= 0)
            {
                return NotFound("not found");
            }
            // Tìm số hàng và số cột tối đa
            int maxRow = seatData.Max(s => s.Row).Value;
            int maxColumn = seatData.Max(s => s.Column).Value;

            // Tạo seatMap với mặc định là '_'
            var seatMap = new List<string>();

            for (int i = 1; i <= maxRow; i++)
            {
                var rowMap = new char[maxColumn];

                for (int j = 0; j < maxColumn; j++)
                {
                    rowMap[j] = '_';
                }

                // Điền 'a' cho các ghế có mặt trong danh sách seatData
                var seatsInRow = seatData.Where(s => s.Row == i);
                foreach (var seat in seatsInRow)
                {
                    rowMap[seat.Column.Value - 1] = 'a';
                }

                seatMap.Add(new string(rowMap));
            }

            var result = new
            {
                seatMap,
                soldSeats
            };

            return Ok(result);
        }
    }
}
