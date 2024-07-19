namespace Project_Cinema_PRN231.domain.orderdetail
{
    public class CreatedOrderDetailRequest
    {
        public List<String> Lot { get; set; }

        public decimal Price { get; set; }
        public int UserId { get; set; }
        public int FilmCalenderId { get; set; }
        public string? CreatedBy { get; set; }
        public bool? IsDeleted { get; set; }
        public string? Status { get; set; } = "";
        public int? RoomId { get; set; }
        public int? BuildingId { get; set; }
        public string? BarCode { get; set; }
    }
}
