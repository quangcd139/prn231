namespace Project_Cinema_PRN231.domain.filmcalender
{
    public class FilmCalenderDto
    {
        public int Id { get; set; }
        public string FilmName { get; set; }
        public string RoomName { get; set; }
        public DateTime Date { get; set; }
        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }
        public int RoomId { get; set; }
        public double Price { get; set; }

    }
}
