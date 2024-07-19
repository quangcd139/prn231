using System;
using System.Collections.Generic;

namespace Project_Cinema_PRN231.model
{
    public partial class SysUser
    {
        public SysUser()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int Id { get; set; }
        public string UserName { get; set; } = null!;
        public string? FullName { get; set; }
        public string? PhoneNumber { get; set; }
        public string PassWord { get; set; } = null!;
        public bool IsAdmin { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedAt { get; set; }
        public string? CreatedBy { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string? UpdatedBy { get; set; }

        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
