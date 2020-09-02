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
    public partial class ketquatimkiem : System.Web.UI.Page
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
            string selectionstring = "where ";
            if (Session["key"].ToString() != "")
                selectionstring += "tieude like '%" + Session["key"] + "%' or tomtat like '%" + Session["key"] + "%' or noidung like '%" + Session["key"] + "%'";
            else
            {
                if (Session["tukhoatieude"].ToString() != "")
                    selectionstring += "tieude like '%" + Session["tukhoatieude"] + "%' and ";
                if (Session["tukhoatomtat"].ToString() != "")
                    selectionstring += "tomtat like '%" + Session["tukhoatomtat"] + "%' and ";
                if (Session["tukhoanoidung"].ToString() != "")
                    selectionstring += "noidung like '%" + Session["tukhoanoidung"] + "%' and ";
                selectionstring=selectionstring.Substring(0, selectionstring.Length - 4);
            }
            
            SqlCommand cmd = new SqlCommand("select * from  baiviet "+selectionstring, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }
    }
}