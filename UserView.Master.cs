using System;
using System.Collections.Generic;
using AjaxControlToolkit;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;

namespace UC_LIVE
{
    public partial class UserView : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)

        {

            if (this.Page.User.IsInRole("Guest"))
            {
                viewclaims.Visible = false;
            }

            if (!Page.User.Identity.IsAuthenticated)
            {

                FormsAuthentication.SignOut();
                Response.Redirect("~/systemlogin.aspx");

            }
            
            DivUserName.InnerHtml = Page.User.Identity.Name;

            DivTodayDate.InnerHtml = Convert.ToString(DateTime.Now);
        }


        protected void Logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/systemlogin.aspx");

        }
    }
}
