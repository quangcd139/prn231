namespace Project_Cinema_PRN231.domain.lot
{
    public class CreatedLotRequest
    {
        public string Code { get; set; } = null!;
        public string Name { get; set; } = null!;
        public int RoomId { get; set; }
        public int BuildingId { get; set; }

        public string? CreatedBy { get; set; }
    }
}
