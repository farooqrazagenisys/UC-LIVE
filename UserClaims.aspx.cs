using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace UC_LIVE
{
    public partial class UserClaims : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["UserName"].DefaultValue = Page.User.Identity.Name;
        }

        protected void GridView2_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

            this.GridView1.DataBind();
            this.GridView2.DataBind();
            this.GridView3.DataBind();
            this.GridView4.DataBind();


        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            this.GridView2.DataBind();
            this.GridView3.DataBind();
            this.GridView4.DataBind();
            this.GridView5.DataBind();

        }

        protected void GridView3_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            this.GridView1.DataBind();
            this.GridView2.DataBind();
            this.GridView4.DataBind();
            this.GridView5.DataBind();
        }

        protected void GridView4_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            this.GridView1.DataBind();
            this.GridView2.DataBind();
            this.GridView3.DataBind();
            this.GridView5.DataBind();
        }


        protected void GridView5_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            this.GridView1.DataBind();
            this.GridView2.DataBind();
            this.GridView3.DataBind();
            this.GridView4.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

    }
}
