using System;
using System.Collections.Generic;

namespace Project_Cinema_PRN231.model
{
    public partial class Building
    {
        public Building()
        {
            Lots = new HashSet<Lot>();
            Rooms = new HashSet<Room>();
        }

        public int Id { get; set; }
        public string Code { get; set; } = null!;
        public string Name { get; set; } = null!;
        public string Address { get; set; } = null!;
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public string CreatedBy { get; set; } = null!;
        public DateTime? UpdatedAt { get; set; }
        public string? UpdatedBy { get; set; }

        public virtual ICollection<Lot> Lots { get; set; }
        public virtual ICollection<Room> Rooms { get; set; }
    }
}
