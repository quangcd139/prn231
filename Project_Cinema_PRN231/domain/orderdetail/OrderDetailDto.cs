namespace Project_Cinema_PRN231.domain.orderdetail
{
    public class OrderDetailDto
    {
        public string BuildingName { get; set; }
        public string RoomName { get; set; }
        public string MovieName { get; set; }
        public string MovieImage { get; set; }
        public string Lot { get; set; }

        public decimal Price { get; set; }
        public DateTime BookingDate { get; set; }

        public TimeSpan StartTime {  get; set; }
        public TimeSpan EndTime { get; set; }
        public string BarCode { get; set; }
        public string TimeDuration { get;set; }


    }
}
