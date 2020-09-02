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
    public partial class vietbai : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["taikhoan"].ToString() == "") Response.Redirect("trangchu.aspx");
        }

        protected void btn_guibai_Click(object sender, EventArgs e)
        {
            if (txt_tomtat.Text != "" && txt_tieude.Text != "" && txt_noidung.Text != "")
            {
                SqlConnection con = new SqlConnection(@"Data Source=(local)\SQLEXPRESS;Initial Catalog=tintuc;Integrated Security=True");
                SqlCommand cmd = new SqlCommand("insert into baiviet values ( @tieude, @tomtat, @ngay, @noidung, @tacgia, @trangthai, @hinh,'','0')", con);
                cmd.Parameters.AddWithValue("@tieude", txt_tieude.Text);
                cmd.Parameters.AddWithValue("@tomtat", txt_tomtat.Text.Replace(Environment.NewLine, " "));
                cmd.Parameters.AddWithValue("@ngay", DateTime.Now);
                cmd.Parameters.AddWithValue("@noidung", txt_noidung.Text.Replace(Environment.NewLine, "<br/>"));
                cmd.Parameters.AddWithValue("@tacgia", Session["taikhoan"].ToString());
                cmd.Parameters.AddWithValue("@trangthai", "Waiting");
                cmd.Parameters.AddWithValue("@hinh", txt_linkhinh.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lb_thongbao.Text = "Gửi bài thành công, vui lòng chờ duyệt!";
                txt_linkhinh.Text = "";
                txt_noidung.Text = "";
                txt_tieude.Text = "";
                txt_tomtat.Text = "";
                
                SqlCommand cmd2 = new SqlCommand("insert into chudequantam values(@taikhoan,@mabaiviet)", con);
                cmd2.Parameters.AddWithValue("@taikhoan", Session["taikhoan"]);
                cmd2.Parameters.AddWithValue("@mabaiviet", Request.QueryString["id"]);

                con.Open();                
                cmd2.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                lb_thongbao.Text = "Vui lòng nhập đầy đủ thông tin!";
            }
        }
    }
}