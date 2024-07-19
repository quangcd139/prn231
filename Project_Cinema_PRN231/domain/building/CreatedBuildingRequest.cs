namespace Project_Cinema_PRN231.domain.building
{
    public class CreatedBuildingRequest
    {
        public string Code { get; set; } = null!;
        public string Name { get; set; } = null!;
        public string? Address { get; set; } = null!;
        public string? CreatedBy { get; set; } = null!;
      
    }
}
