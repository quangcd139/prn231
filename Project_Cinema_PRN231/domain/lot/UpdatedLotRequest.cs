namespace Project_Cinema_PRN231.domain.lot
{
    public class UpdatedLotRequest
    {
        public string Code { get; set; } = null!;
        public string Name { get; set; } = null!;
        public int RoomId { get; set; }
        public int BuildingId { get; set; }
        public string UpdatedBy { get; set; }
    }
}
