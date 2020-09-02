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
    public partial class chitietduyetbai : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == "" && Session["quyenhan"].ToString() != "admin")
                Response.Redirect("trangchu.aspx");
        }

        protected void txt_duyet_Click(object sender, EventArgs e)
        {
            int theloai = int.Parse(ddl_theloai.SelectedValue);
            
            SqlConnection con = new SqlConnection(@"Data Source=(local)\SQLEXPRESS;Initial Catalog=tintuc;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("update baiviet set theloai=@theloai,trangthai='Enabled' where id=@id", con);

            cmd.Parameters.AddWithValue("@theloai", theloai);
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("duyetbai.aspx");    
        }

        protected void txt_khongduyet_Click(object sender, EventArgs e)
        {
            int theloai = int.Parse(ddl_theloai.SelectedValue);

            SqlConnection con = new SqlConnection(@"Data Source=(local)\SQLEXPRESS;Initial Catalog=tintuc;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("update baiviet set trangthai='Disabled' where id=@id", con);

            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("duyetbai.aspx"); 
        }
    }
}