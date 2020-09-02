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
    public partial class thongtintaikhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["taikhoan"].ToString() != "")
            //{
            //    load();
            //    btn_dangky.Text = "Cập nhật";
            //    txt_matkhau.TextMode = TextBoxMode.SingleLine;
            //    //txt_tentaikhoan.Visible = false;
            //    a_thongtinbatbuoc.Visible = false;
            //    txt_tentaikhoan.ReadOnly = true;
            //}
        }

        //protected void load()
        //{
        //    string acc = Session["taikhoan"].ToString();
        //    SqlConnection con = new SqlConnection(@"Data Source=(local)\SQLEXPRESS;Initial Catalog=tintuc;Integrated Security=True");
        //    SqlCommand cmd = new SqlCommand("SELECT * from taikhoan where taikhoan=N'" + acc + "'", con);
        //    if (con.State != System.Data.ConnectionState.Open)
        //        con.Open();
        //    SqlDataReader reader = cmd.ExecuteReader();
        //    while (reader.Read())
        //    {
        //        txt_tentaikhoan.Text = reader["taikhoan"].ToString();
        //        txt_matkhau.Text = reader["matkhau"].ToString();
        //        txt_hovaten.Text = reader["hoten"].ToString();
        //        txt_ngaysinh.Text = reader["ngaysinh"].ToString();
        //        txt_diachi.Text = reader["diachi"].ToString();
        //        txt_ghichu.Text = reader["ghichu"].ToString();
        //    }
        //    reader.Close();
        //}

        

        protected void btn_dangky_Click(object sender, EventArgs e)
        {
            Page.Validate("thongtinnguoidung");
            if (Page.IsValid && txt_tentaikhoan.Text != "" && txt_matkhau.Text != " " && Session["taikhoan"].ToString() == "")
            {
                insert();                    
            }
            //else
            //    if(Session["taikhoan"].ToString()!="")
            //    {
                    
            //        string matkhau = txt_matkhau.Text;
            //        string taikhoan = txt_tentaikhoan.Text;
            //        SqlConnection con = new SqlConnection(@"Data Source=(local)\SQLEXPRESS;Initial Catalog=tintuc;Integrated Security=True");
            //        SqlCommand cmd = new SqlCommand("update taikhoan set matkhau=@matkhau, hoten=@hoten, diachi=@diachi, ngaysinh=@ngaysinh, ghichu=@ghichu where taikhoan=@taikhoan", con);
            //        if (con.State != System.Data.ConnectionState.Open)
            //            con.Open();
            //        cmd.CommandType = CommandType.Text;
            //        cmd.Parameters.AddWithValue("@matkhau", matkhau);
            //        cmd.Parameters.AddWithValue("@hoten", txt_hovaten.Text);
            //        cmd.Parameters.AddWithValue("@diachi", txt_diachi.Text);
            //        cmd.Parameters.AddWithValue("@ngaysinh", txt_ngaysinh.Text);
            //        cmd.Parameters.AddWithValue("@ghichu", txt_ghichu.Text);
            //        cmd.Parameters.Add("@taikhoan",SqlDbType.NVarChar,20);
            //        cmd.Parameters["@taikhoan"].Value=txt_tentaikhoan.Text;
            //        cmd.ExecuteNonQuery();
            //        con.Close();
            //        lb_trungtaikhoan.Text = "Cập nhật thành công!";
                    
            //    }
        }


        private void insert()
        {
            Boolean flag = false;
            SqlConnection con = new SqlConnection(@"Data Source=(local)\SQLEXPRESS;Initial Catalog=tintuc;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("SELECT taikhoan from taikhoan where taikhoan='" + txt_tentaikhoan.Text+"'",con);
            if (con.State != System.Data.ConnectionState.Open)
                con.Open();
            SqlDataReader reader = cmd.ExecuteReader(); 
            while (reader.Read())
            {
                flag = true;
            }
            reader.Close();
            
            if (flag == false)
            {
                cmd.CommandText = ("insert into taikhoan values(@tentaikhoan,@matkhau,@trangthai,@quyenhan,@hoten,@diachi,@ngaysinh,@ghichu)");
                cmd.Parameters.Add("@tentaikhoan",SqlDbType.VarChar,20);
                cmd.Parameters["@tentaikhoan"].Value=txt_tentaikhoan.Text;

                cmd.Parameters.Add("@matkhau",SqlDbType.VarChar,20);
                cmd.Parameters["@matkhau"].Value=txt_matkhau.Text;

                cmd.Parameters.Add("@trangthai", SqlDbType.VarChar, 10);
                cmd.Parameters["@trangthai"].Value = "Enabled";


                cmd.Parameters.Add("@quyenhan", SqlDbType.VarChar, 10);
                cmd.Parameters["@quyenhan"].Value = "user"; 
                
                cmd.Parameters.Add("@hoten", SqlDbType.NVarChar, 50);
                cmd.Parameters["@hoten"].Value=txt_hovaten.Text;

                cmd.Parameters.Add("@diachi",SqlDbType.NVarChar,100);
                cmd.Parameters["@diachi"].Value=txt_diachi.Text;

                cmd.Parameters.Add("@ngaysinh",SqlDbType.VarChar,10);
                cmd.Parameters["@ngaysinh"].Value=txt_ngaysinh.Text;

                cmd.Parameters.Add("@ghichu",SqlDbType.NVarChar,200);
                cmd.Parameters["@ghichu"].Value = txt_ghichu.Text;

                cmd.ExecuteNonQuery();
                con.Close();
                
                Response.Redirect("trangchu.aspx");
            }
            if (flag == true)
            {
                con.Close();
                lb_trungtaikhoan.Text = "Tên tài khoản đã bị trùng!"; 
                
                
            }            
        }
    }
}