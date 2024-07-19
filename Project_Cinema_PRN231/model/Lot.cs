using System;
using System.Collections.Generic;

namespace Project_Cinema_PRN231.model
{
    public partial class Lot
    {
        public Lot()
        {
            OrderDetails = new HashSet<OrderDetail>();
            SeatBookings = new HashSet<SeatBooking>();
        }

        public int Id { get; set; }
        public string Code { get; set; } = null!;
        public string Name { get; set; } = null!;
        public int RoomId { get; set; }
        public int BuildingId { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public string CreatedBy { get; set; } = null!;
        public DateTime? UpdatedAt { get; set; }
        public string? UpdatedBy { get; set; }
        public string Status { get; set; } = null!;
        public int? Row { get; set; }
        public int? Column { get; set; }

        public virtual Building Building { get; set; } = null!;
        public virtual Room Room { get; set; } = null!;
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<SeatBooking> SeatBookings { get; set; }
    }
}
