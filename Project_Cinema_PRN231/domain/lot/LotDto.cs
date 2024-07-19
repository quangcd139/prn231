using System.ComponentModel.DataAnnotations;

namespace Project_Cinema_PRN231.domain.lot
{
    public class LotDto
    {
        [Key]
        public int Id { get; set; }
        public string Code { get; set; } = null!;
        public string Name { get; set; } = null!;
        public int RoomId { get; set; }
        public int BuildingId { get; set; }

        public string status { get; set; }
    }
}
