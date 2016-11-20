using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace EShop.Models
{
    public class LogInModel
    {
        [Display(Name = "Tên Đăng Nhập")]
        [Required(ErrorMessage = "Hãy nhập tên đăng nhập!")]
        public string TenDangNhap { get; set; }
        [Display(Name = "Mật Khẩu")]
        [Required(ErrorMessage = "Hãy nhập mật khẩu!")]
        public string MatKhau { get; set; }
    }
}