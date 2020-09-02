using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebTintuc
{
    public partial class baiviet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["taikhoan"].ToString() == "")
            {
                txt_guibinhluan.Visible = false;
                txt_binhluan.Visible = false;                
            }            
        }

        protected void txt_guibinhluan_Click(object sender, EventArgs e)
        {
            string str_binhluan = txt_binhluan.Text.Replace(Environment.NewLine,"<br/>");
            if (str_binhluan.Length > 100)
            {
                lb_dodaibinhluan.Text = "Bình luận quá dài";
            }
            else
            if (str_binhluan.Length < 100 && Request.QueryString["id"]!="")
            {
                SqlConnection con = new SqlConnection(@"Data Source=(local)\SQLEXPRESS;Initial Catalog=tintuc;Integrated Security=True");
                SqlCommand cmd = new SqlCommand("insert into binhluan values(@mabaiviet,@noidung,@taikhoan,@thoidiem,@trangthai)", con);
                
                cmd.Parameters.Add("@mabaiviet", SqlDbType.Int);
                cmd.Parameters["@mabaiviet"].Value = Request.QueryString["id"];

                cmd.Parameters.Add("@noidung", SqlDbType.NVarChar, 100);
                cmd.Parameters["@noidung"].Value = str_binhluan;

                cmd.Parameters.Add("@taikhoan", SqlDbType.VarChar, 20);
                cmd.Parameters["@taikhoan"].Value = Session["taikhoan"].ToString();

                cmd.Parameters.Add("@thoidiem", SqlDbType.DateTime, 20);
                cmd.Parameters["@thoidiem"].Value = DateTime.Now.ToString("u");
                
                cmd.Parameters.Add("@trangthai", SqlDbType.VarChar, 10);
                cmd.Parameters["@trangthai"].Value = "Enabled";               
               
                SqlCommand cmd2 = new SqlCommand("insert into chudequantam values(@taikhoan,@mabaiviet)", con);
                cmd2.Parameters.AddWithValue("@taikhoan", Session["taikhoan"]);
                cmd2.Parameters.AddWithValue("@mabaiviet", Request.QueryString["id"]);
               
                con.Open();
                cmd.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                con.Close();
                
                Response.Redirect("baiviet.aspx?id=" + Request.QueryString["id"]);
            }
        }     
    }
}