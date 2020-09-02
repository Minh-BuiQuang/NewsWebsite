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
    public partial class chudequantam : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["tintucConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gv_PatientList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("baiviet.aspx?id="+ gv_PatientList.SelectedDataKey["mabaiviet"].ToString());
        }
    }
}