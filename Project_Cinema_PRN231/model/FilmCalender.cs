using System;
using System.Collections.Generic;

namespace Project_Cinema_PRN231.model
{
    public partial class FilmCalender
    {
        public FilmCalender()
        {
            OrderDetails = new HashSet<OrderDetail>();
            SeatBookings = new HashSet<SeatBooking>();
        }

        public int Id { get; set; }
        public DateTime Date { get; set; }
        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }
        public int RoomId { get; set; }
        public int FilmId { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public string? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string? UpdatedBy { get; set; }
        public decimal Price { get; set; }

        public virtual LibraryFilm Film { get; set; } = null!;
        public virtual Room Room { get; set; } = null!;
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<SeatBooking> SeatBookings { get; set; }
    }
}
