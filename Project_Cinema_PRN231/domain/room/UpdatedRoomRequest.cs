namespace Project_Cinema_PRN231.domain.room
{
    public class UpdatedRoomRequest
    {
        public string Code { get; set; } = null!;
        public string Name { get; set; } = null!;
        public string? UpdatedBy { get; set; } = null!;
    }
}
