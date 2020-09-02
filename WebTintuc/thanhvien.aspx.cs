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
    public partial class thanhvien : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["tintucConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGV();
            }
        }

        private void loadGV()
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connectionString;
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from  taikhoan", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gv_PatientList.DataSource = dt;
            gv_PatientList.DataBind();
        }

        protected void LoadList(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            txt_taikhoan.Text = btn.Text.Trim();

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connectionString;
            SqlCommand cmd = new SqlCommand("select * from taikhoan where taikhoan = @taikhoan", conn);
            cmd.Parameters.AddWithValue("@taikhoan", txt_taikhoan.Text);
            if (conn.State != System.Data.ConnectionState.Open)
                conn.Open();
            SqlDataReader r = cmd.ExecuteReader();

            while (r.Read())
            {
                txt_matkhau.Text = r["matkhau"].ToString();
                ddl_trangthai.SelectedValue = r["trangthai"].ToString();
                ddl_quyenhan.SelectedValue = r["quyenhan"].ToString();
                txt_hoten.Text = r["hoten"].ToString();
                txt_diachi.Text = r["diachi"].ToString();
                txt_ngaysinh.Text = r["ngaysinh"].ToString();
                txt_ghichu.Text = r["ghichu"].ToString();
            }
            r.Close();
            conn.Close();
        }

        private void update()
        {
            string taikhoan = txt_taikhoan.Text;
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connectionString;
            SqlCommand cmd = new SqlCommand("update taikhoan set trangthai = @trangthai, quyenhan = @quyenhan, hoten = @hoten, diachi = @diachi, ngaysinh = @ngaysinh, ghichu = @ghichu where taikhoan = @taikhoan", conn);

            if (conn.State != System.Data.ConnectionState.Open)
                conn.Open();
            cmd.Parameters.AddWithValue("@trangthai", ddl_trangthai.SelectedValue);
            cmd.Parameters.AddWithValue("@quyenhan", ddl_quyenhan.SelectedValue);
            cmd.Parameters.AddWithValue("@hoten", txt_hoten.Text);
            cmd.Parameters.AddWithValue("@diachi", txt_diachi.Text);
            cmd.Parameters.AddWithValue("@ngaysinh", txt_ngaysinh.Text);
            cmd.Parameters.AddWithValue("@ghichu", txt_ghichu.Text);
            cmd.Parameters.AddWithValue("@taikhoan", taikhoan);
            cmd.ExecuteNonQuery();
            lbl_error.Text = "Đã cập nhật thành công";
            loadGV();
            conn.Close();
        }

        protected void btn_edit_Click(object sender, EventArgs e)
        {
            if (txt_taikhoan.Text != null)
            {
                update();
            }
        }

    }
}