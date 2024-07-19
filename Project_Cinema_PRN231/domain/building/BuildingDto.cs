using System.ComponentModel.DataAnnotations;

namespace Project_Cinema_PRN231.domain.building
{
    public class BuildingDto
    {
        [Key]
        public int Id { get; set; }
        public string Code { get; set; } = null!;
        public string Name { get; set; } = null!;
        public string? Address { get; set; } = null!;

        public bool IsDeleted { get; set; }
    }
}
