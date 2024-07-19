using System;
using System.Collections.Generic;

namespace Project_Cinema_PRN231.model
{
    public partial class OrderDetail
    {
        public int Id { get; set; }
        public int LotId { get; set; }
        public decimal Price { get; set; }
        public int UserId { get; set; }
        public int FilmCalenderId { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public string? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string? UpdatedBy { get; set; }
        public string Status { get; set; } = null!;
        public int RoomId { get; set; }
        public int BuildingId { get; set; }
        public string? BarCode { get; set; }
        public int? SeatBookingId { get; set; }

        public virtual FilmCalender FilmCalender { get; set; } = null!;
        public virtual Lot Lot { get; set; } = null!;
        public virtual SeatBooking? SeatBooking { get; set; }
        public virtual SysUser User { get; set; } = null!;
    }
}
