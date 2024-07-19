using Project_Cinema_PRN231.domain.libraryfilm;
using Project_Cinema_PRN231.model;

namespace Project_Cinema_PRN231.domain.category
{
    public class CategoryDto
    {
		public int Id { get; set; }
		public string Code { get; set; } = null!;
		public string Name { get; set; } = null!;
		public string? Image { get; set; }

		public virtual ICollection<LibraryFilmDTO> LibraryFilms { get; set; }
	}
}
