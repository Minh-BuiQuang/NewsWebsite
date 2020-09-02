using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebTintuc
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        string connectionstring = string.Format(@"Data Source=(local)\SQLEXPRESS;Initial Catalog=tintuc;Integrated Security=True");
        protected void btn_dangnhap_Click(object sender, EventArgs e)
        {      
            Boolean flag = false;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["tintucconnectionstring"].ConnectionString);
            SqlCommand cmd = new SqlCommand("SELECT taikhoan,matkhau,quyenhan from taikhoan where taikhoan='" + txt_username.Text + "'and matkhau='"+txt_password.Text+"'", con);
            if (con.State != System.Data.ConnectionState.Open)
                con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Session["taikhoan"] = reader["taikhoan"].ToString();
                Session["quyenhan"] = reader["quyenhan"].ToString();
                flag = true;
            }
            reader.Close();
            if (flag == false)
            {
                con.Close();
                lb_thongtin.Text = "Tên tài khoản hoặc mật khẩu không đúng";
            }
            if (flag == true)
            {
                con.Close();                
                Response.Redirect("trangchu.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["taikhoan"].ToString() != "")
            {
                lb_thongtin.Text = "Chào mừng " + Session["taikhoan"].ToString();
                lbl_taikhoan.Visible = false;
                lbl_matkhau.Visible = false;
                txt_password.Visible = false;
                txt_username.Visible = false;                
                btn_dangky.Visible = false;
                btn_dangnhap.Visible = false;
                if (Session["quyenhan"].ToString() != "admin")
                {
                    btn_duyetbai.Visible = false;
                    btn_thanhvien.Visible = false;
                }
               
            }
            else
                if (Session["taikhoan"].ToString() == "")
                {
                    btn_dangxuat.Visible = false;
                    btn_tuychon.Visible = false;
                    btn_vietbai.Visible = false;
                    btn_theodoi.Visible = false;
                    btn_duyetbai.Visible = false;
                    btn_thanhvien.Visible = false;
                   

                }
        }

        protected void btn_dangky_Click(object sender, EventArgs e)
        {
            Response.Redirect("thongtintaikhoan.aspx");
        }

        protected void btn_dangxuat_Click(object sender, EventArgs e)
        {
            Session["taikhoan"] = "";
            Session["quyenhan"] = "";
            Response.Redirect("trangchu.aspx");
        }

        protected void btn_tuychon_Click(object sender, EventArgs e)
        {
            Response.Redirect("capnhatthongtin.aspx");
        }

        protected void btn_vietbai_Click(object sender, EventArgs e)
        {
            Response.Redirect("vietbai.aspx");
        }

        protected void btn_duyetbai_Click(object sender, EventArgs e)
        {
            Response.Redirect("duyetbai.aspx");
        }

        protected void btn_thanhvien_Click(object sender, EventArgs e)
        {
            Response.Redirect("thanhvien.aspx");
        }

        protected void btn_theodoi_Click1(object sender, EventArgs e)
        {
            Response.Redirect("chudequantam.aspx");
        }

        protected void btn_timkiem_Click(object sender, EventArgs e)
        {
            if (txt_timkiem.Text.Trim() != "")
            {
                Session["key"] = txt_timkiem.Text;
                Response.Redirect("ketquatimkiem.aspx");
            }
        }

        protected void btn_timkiemnangcao_Click(object sender, EventArgs e)
        {
            Response.Redirect("nangcao.aspx");
        }
    }
}
