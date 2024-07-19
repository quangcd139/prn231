namespace Project_Cinema_PRN231.domain.room
{
    public class CreatedRoomRequest
    {
        public string Code { get; set; } = null!;
        public string Name { get; set; } = null!;

        public int BuildingId { get; set; }
    }
}
