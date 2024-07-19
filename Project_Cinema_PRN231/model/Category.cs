using System;
using System.Collections.Generic;

namespace Project_Cinema_PRN231.model
{
    public partial class Category
    {
        public Category()
        {
            LibraryFilms = new HashSet<LibraryFilm>();
        }

        public int Id { get; set; }
        public string Code { get; set; } = null!;
        public string Name { get; set; } = null!;
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public string? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string? UpdatedBy { get; set; }
        public string? Image { get; set; }

        public virtual ICollection<LibraryFilm> LibraryFilms { get; set; }
    }
}
