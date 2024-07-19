namespace Project_Cinema_PRN231.domain.category
{
    public class UpdatedCategoryRequest
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string? Image { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string? UpdatedBy { get; set; }
    }
}
