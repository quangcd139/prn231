namespace Project_Cinema_PRN231.domain.filmcalender
{
    public class UpdatedFilmCalenderRequest
    {
        public int Id { get; set; }
        public DateTime Date { get; set; }
        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }
        public int RoomId { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public DateTime? CreatedAt { get; set; }
        public int FilmId { get; set; }

        public string? UpdatedBy { get; set; }
        public decimal Price { get; set; }
    }
}
