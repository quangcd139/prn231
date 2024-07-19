using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project_Cinema_PRN231.domain.orderdetail;
using Project_Cinema_PRN231.model;

namespace Project_Cinema_PRN231.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderDetailController : ControllerBase
    {
        private readonly Project_Cinema_PRN231Context _context = new Project_Cinema_PRN231Context();

        [HttpGet("GetOrderByUser/{userId}")]
        public IActionResult Get(int userId)
        {
            var list = _context.OrderDetails
                    .Include(s => s.FilmCalender)
                    .Include(s => s.Lot)
                    .Include(s => s.SeatBooking)
                    .Where(s => s.UserId == userId)
                    .Select(f => new
                    {
                        BuildingName = f.Lot.Building.Name,
                        RoomName = f.Lot.Room.Name,
                        MovieName = f.FilmCalender.Film.Name,
                        MovieImage = f.FilmCalender.Film.Image,
                        Lot = f.Lot.Row+"_"+f.Lot.Column,
                        Price = f.FilmCalender.Price,
                        BookingDate = f.CreatedAt,
                        StartTime = f.FilmCalender.StartTime,
                        EndTime = f.FilmCalender.EndTime,
                        BarCode = f.BarCode,
                        TimeDuration = f.FilmCalender != null ?
                    f.FilmCalender.EndTime
                    - f.FilmCalender.StartTime
                    : TimeSpan.Zero
                    });

            return Ok(list);
        }

        [HttpPost("create")]
        public IActionResult BookingSeat(CreatedOrderDetailRequest orderDetail)
        {

            int id = 0;
            SeatBooking seat = new SeatBooking();
            foreach (var od in orderDetail.Lot)
            {
                int row = int.Parse(od.Split("_")[0]);
                int column = int.Parse(od.Split("_")[1]);

                int lotId = _context.Lots.FirstOrDefault(l => l.Row == row
                   && l.Column == column
                   && l.BuildingId == orderDetail.BuildingId
                   && l.RoomId == orderDetail.RoomId
                   ).Id;

                seat = new SeatBooking
                {
                    LotId = lotId,
                    FilmCalendarId = orderDetail.FilmCalenderId,
                    Status = "Booked",
                    BookingTime = DateTime.Now,
                };
                _context.SeatBookings.Add(seat);
                _context.SaveChanges();

                OrderDetail order = new OrderDetail
                {
                    LotId = lotId,
                    Price = orderDetail.Price,
                    UserId = orderDetail.UserId,
                    FilmCalenderId = orderDetail.FilmCalenderId,
                    IsDeleted = false,
                    CreatedAt = DateTime.Now,
                    //CreatedBy = "",
                    Status = "Booked",
                    RoomId = orderDetail.RoomId.Value,
                    BuildingId = orderDetail.BuildingId.Value,
                    BarCode = orderDetail.BarCode,
                    SeatBookingId = seat.Id
                };
                _context.OrderDetails.Add(order);
                _context.SaveChanges();

            }

            id = seat.Id;
            return Ok(id);

        }
    }
}
