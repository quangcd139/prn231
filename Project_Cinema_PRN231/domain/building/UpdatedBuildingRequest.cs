namespace Project_Cinema_PRN231.domain.building
{
    public class UpdatedBuildingRequest
    {
        public int id { get; set; }
        public string Code { get; set; } = null!;
        public string Name { get; set; } = null!;
        public string? Address { get; set; } = null!;
        public string? UpdatedBy { get; set; }
    }
}
