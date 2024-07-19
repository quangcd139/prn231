namespace Project_Cinema_PRN231.domain.libraryfilm

{
    public class CreatedLibraryFilmRequest
    {
        public int Id { get; set; }
        public string Code { get; set; } = null!;
        public string Name { get; set; } = null!;
        public int CategoryId { get; set; }
        public string? Description { get; set; }
        public string? Image { get; set; }
        public string? TrailerUrl { get; set; }
        public DateTime? ReleaseYear { get; set; }

        public string? Director { get; set; }
    }
}
