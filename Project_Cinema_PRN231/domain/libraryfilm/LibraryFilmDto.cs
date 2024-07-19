using Project_Cinema_PRN231.domain.filmcalender;
using Project_Cinema_PRN231.model;

namespace Project_Cinema_PRN231.domain.libraryfilm
{
    public class LibraryFilmDTO
    {
        public int Id { get; set; }
        public string Code { get; set; } = null!;
        public string Name { get; set; } = null!;
        public int CategoryId { get; set; }
        public string? CategoryName { get; set; }
        public string? Description { get; set; }
        public string? Image { get; set; }
        public string? TrailerUrl { get; set; }
        public string ReleaseYear { get; set; }

        public string? Director { get; set; }

        public DateTime? CreatedAt { get; set; }
        public TimeSpan? TimeDuration { get; set; }
    }
}
