using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Web.Security;
using EShop.Models;
using EShop.Entities;
namespace EShop.Controllers
{
    public class AccountController : Controller
    {
        // GET: TaiKhoan
        //Dang Nhap
        ConnectDB db = new ConnectDB();
        [HttpGet]
        public ActionResult LogIn()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LogIn(LogInModel taikhoan)
        {
            if (ModelState.IsValid)
            {
                //cấu trúc linq kiểm tra xem có tài khoản nào khớp hay không
                var checkLogin = db.Users.Any(s => s.username == taikhoan.TenDangNhap && s.password == taikhoan.MatKhau);
                //nếu có checklogin = true
                if (checkLogin)
                {
                    
                    Session["UserName"] = taikhoan.TenDangNhap.ToString();

                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", "Sai tên đăng nhập hoặc mật khẩu, kiểm tra lại nhé!");
                    //trở lại trang đăng nhập, báo lỗi
                    return View("LogIn", taikhoan);
                }
            }
            return View("LogIn");
        }
        //Dang Ky
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(RegisterModel taikhoan)
        {
            if (ModelState.IsValid)
            {
                //kiểm tra tên đăng nhập, email có bị đã tồn tại hay chưa?
                var checkUserName = db.Users.Any(s => s.username == taikhoan.TenDangNhap);
                var checkEmail = db.Users.Any(s => s.mail == taikhoan.Email);

                //Các lỗi nếu có trong quá trình đăng ký tài khoản
                if (checkUserName)
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại!");
                }
                if (checkEmail)
                {
                    ModelState.AddModelError("", "Email đã có người sử dụng!");
                }
                if (checkUserName == true || checkEmail == true)
                {
                    //trả về view đăng ký và thông báo các lỗi ở trên
                    //return RedirectToAction("DangKy", "TaiKhoan"); 
                    return View("Register");
                }
                else
                {
                    //Lưu thông tin tài khoản vào CSDL
                    User acc = new User();
                    acc.username= taikhoan.TenDangNhap;
                    acc.password = taikhoan.MatKhau;
                    acc.mail = taikhoan.Email;
                    db.Users.Add(acc);
                    db.SaveChanges();
                    //xác thực tài khoản trong ứng dụng
                    FormsAuthentication.SetAuthCookie(taikhoan.TenDangNhap, false);
                    //trả về trang chủ đăng ký thành công
                    return Redirect("/");
                }
            }
            return View();
        }
        //Dang Xuat
        public ActionResult LogOut()
        {
            Session["TaiKhoan"] = null; 
            Session["UserName"] = null;
            return RedirectToAction("Index", "Home");
        }

        //thử trang đăng ký
        public ActionResult VDDangKy()
        {
            return View("DangKy1");
        }
    }
}