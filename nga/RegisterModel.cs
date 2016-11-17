using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace EShop.Models
{
    public class RegisterModel
    {
        //UserName
        [Display(Name = "Tên đăng nhập")]
        [Required(ErrorMessage = "Mời bạn nhập tên đăng nhập!")]
        public string TenDangNhap { get; set; }
        //Email
        [Display (Name = "Email")]// Dùng để đặt tên lại cho cột
        [Required (ErrorMessage = "Bạn chưa nhập email")]   // Kiểm tra rỗng
        [RegularExpression (@"^([\w-\.]+)@((\[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$",ErrorMessage = "Mời bạn nhập lại email!")]
        public string Email { get; set; }
        //FullName
        [Display(Name = "Họ và tên")]
        public string FullName { get; set; }
        //GioiTinh
        [Display (Name = "Giới tính")]
        public string GioiTinh { get; set; }
        //Identify
        [Display(Name = "Identify")]
        public string Identify;
        //Dia Chi
        [Display(Name = "Địa chỉ")]
        public string DiaChi {get; set;}
        //Ngay Sinh
        [Display(Name = "Ngày sinh")]
        [DataType (DataType.DateTime)]
        public DateTime NgaySinh { get; set; }
        //SoDT
        [Display(Name = "Số điện thoại")]
        public string SDT { get; set; }
        //Password
        [Display(Name = "Mật khẩu")]
        [Required (ErrorMessage = "Bạn chưa nhập mật khẩu")]
        [DataType(DataType.Password)]
        public string MatKhau { get; set; }
        //Confirm Password
        [Display(Name = "Xác nhận mật khẩu")]
        [Required (ErrorMessage="Bạn chưa nhập xác nhận mật khẩu")]
        [Compare("MatKhau",ErrorMessage = "Mời bạn nhập lại mật khẩu")]
        [DataType (DataType.Password)]
        public string XacNhanMatKhau { get; set; }
    }
}