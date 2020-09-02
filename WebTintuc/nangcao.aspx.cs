using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebTintuc
{
    public partial class nangcao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_tim_Click(object sender, EventArgs e)
        {
            if (txt_tieude.Text.Trim()!="" ||txt_tomtat.Text.Trim()!=""||txt_noidung.Text.Trim()!="")
            {
            Session["tukhoatieude"] = txt_tieude.Text;
            Session["tukhoatomtat"] = txt_tomtat.Text;
            Session["tukhoanoidung"] = txt_noidung.Text;
            Response.Redirect("ketquatimkiem.aspx");
            }
        }
    }
}