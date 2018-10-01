﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace QuanLySieuThi
{
    public partial class frmLogin : Form
    {
        KetNoiDuLieu link;

        public frmLogin(string s)
        {
            InitializeComponent();
        }

        public frmLogin(KetNoiDuLieu link)
        {
            InitializeComponent();
            this.link = link;
            txtTenDangNhap.Focus();
        }

        private string xacNhanTaiKhoan(string username, string password)
        {
            link.Connec();
            try
            {
                string chuoiCommand = "select MaNhanVien from Users where UserName = '" + username + "' and Passwords = '" + password + "'";
                return link.commandScalar(chuoiCommand);
            }
            catch
            {
                MessageBox.Show("Không thể kết nối vào DATABASE !", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            return "";
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            //xét các ràng buộc csdl
            if (txtTenDangNhap.Text != "" && txtTenDangNhap.Text.Length < 30 && txtMatKhau.Text != "" && txtMatKhau.Text.Length < 30)
            {
                if (xacNhanTaiKhoan(txtTenDangNhap.Text, txtMatKhau.Text).Equals("") == false)
                {
                    string manv = xacNhanTaiKhoan(txtTenDangNhap.Text, txtMatKhau.Text);
                    MessageBox.Show(manv);
                    frmMain frmMain = new frmMain(link, manv);
                    frmMain.Show();
                    this.Hide();
                }
                else
                    MessageBox.Show("Tài khoảng không đúng !\nVui lòng nhập lại !", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            //nếu các text vi phạm ràng buộc thì cảnh báo
            if (txtTenDangNhap.Text == "")
                this.errorProvider1.SetError(txtTenDangNhap, "Bạn không được để trống tên đăng nhập !");
            else
                this.errorProvider1.Clear();
            
            if (txtTenDangNhap.Text.Length > 30)
                this.errorProvider1.SetError(txtTenDangNhap, "Tên đang nhập không quá 30 ký tự !");
            else
                this.errorProvider1.Clear();

            if (txtMatKhau.Text == "")
                this.errorProvider1.SetError(txtMatKhau, "Bạn không được để trống mật khẩu !");
            else
                this.errorProvider1.Clear();
            
            if (txtMatKhau.Text.Length > 30)
                this.errorProvider1.SetError(txtMatKhau, "Mật khẩu không quá 30 ký tự !");
            else
                this.errorProvider1.Clear();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            //xác nhận trước khi thoát
            DialogResult result = MessageBox.Show("Bạn có muốn thoát không ?", "EXIT", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (result == DialogResult.Yes)
                Application.Exit(); 
        }

        private void txtTenDangNhap_Leave(object sender, EventArgs e)
        {
            if (txtTenDangNhap.Text == "")
                this.errorProvider1.SetError(txtTenDangNhap, "Bạn không được để trống tên đăng nhập !");
            else
                this.errorProvider1.Clear();
        }

        private void txtMatKhau_Leave(object sender, EventArgs e)
        {
            if (txtMatKhau.Text == "")
                this.errorProvider1.SetError(txtMatKhau, "Bạn không được để trống mật khẩu !");
            else
                this.errorProvider1.Clear();
        }

        private void txtTenDangNhap_KeyPress(object sender, KeyPressEventArgs e)
        {
            Control trl = (Control)sender;
            if (txtTenDangNhap.Text.Length > 30)
                this.errorProvider1.SetError(trl, "Tên đăng nhập không quá 30 ký tự !");
            else
                this.errorProvider1.Clear();
        }

        private void txtMatKhau_KeyPress(object sender, KeyPressEventArgs e)
        {
            Control trl = (Control)sender;
            if (txtMatKhau.Text.Length > 30)
                this.errorProvider1.SetError(trl, "Mật khẩu không quá 30 ký tự !");
            else
                this.errorProvider1.Clear();
        }
    }
}