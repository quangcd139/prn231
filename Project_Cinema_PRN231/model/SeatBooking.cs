using System;
using System.Collections.Generic;

namespace Project_Cinema_PRN231.model
{
    public partial class SeatBooking
    {
        public SeatBooking()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int Id { get; set; }
        public int? LotId { get; set; }
        public int? FilmCalendarId { get; set; }
        public string? Status { get; set; }
        public DateTime? BookingTime { get; set; }

        public virtual FilmCalender? FilmCalendar { get; set; }
        public virtual Lot? Lot { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
