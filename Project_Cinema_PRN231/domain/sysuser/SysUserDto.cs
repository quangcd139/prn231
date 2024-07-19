namespace Project_Cinema_PRN231.domain.sysuser
{
    public class SysUserDto
    {
        public int Id { get; set; }
        public string Username { get;set; }
        public string Fullname { get;set; }
        public bool IsAdmin { get;set; }

        public string? Token {  get;set; }
    }
}
