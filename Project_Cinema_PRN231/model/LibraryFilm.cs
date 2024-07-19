using System;
using System.Collections.Generic;

namespace Project_Cinema_PRN231.model
{
    public partial class LibraryFilm
    {
        public LibraryFilm()
        {
            FilmCalenders = new HashSet<FilmCalender>();
        }

        public int Id { get; set; }
        public string Code { get; set; } = null!;
        public string Name { get; set; } = null!;
        public int CategoryId { get; set; }
        public string? Description { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public string? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string? UpdatedBy { get; set; }
        public string? Image { get; set; }
        public string? TrailerUrl { get; set; }
        public DateTime? ReleaseYear { get; set; }
        public string? Director { get; set; }

        public virtual Category Category { get; set; } = null!;
        public virtual ICollection<FilmCalender> FilmCalenders { get; set; }
    }
}
