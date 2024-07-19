using System;
using System.Collections.Generic;

namespace Project_Cinema_PRN231.model
{
    public partial class Room
    {
        public Room()
        {
            FilmCalenders = new HashSet<FilmCalender>();
            Lots = new HashSet<Lot>();
        }

        public int Id { get; set; }
        public string Code { get; set; } = null!;
        public string Name { get; set; } = null!;
        public int BuildingId { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime? CreatedAt { get; set; }
        public string? CreatedBy { get; set; } = null!;
        public DateTime? UpdatedAt { get; set; }
        public string? UpdatedBy { get; set; }

        public virtual Building Building { get; set; } = null!;
        public virtual ICollection<FilmCalender> FilmCalenders { get; set; }
        public virtual ICollection<Lot> Lots { get; set; }
    }
}
