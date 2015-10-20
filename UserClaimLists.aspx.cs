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
    public partial class UserClaimLists : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource6.SelectParameters["UserName"].DefaultValue = Page.User.Identity.Name;
            SqlDataSource1.SelectParameters["UserName"].DefaultValue = Page.User.Identity.Name;
            SqlDataSource2.SelectParameters["UserName"].DefaultValue = Page.User.Identity.Name;
            SqlDataSource3.SelectParameters["UserName"].DefaultValue = Page.User.Identity.Name;
            SqlDataSource4.SelectParameters["UserName"].DefaultValue = Page.User.Identity.Name;
        }

        protected void GridView2_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

          //this.GridView1.DataBind();
          //  this.GridView2.DataBind();
           //// this.GridView3.DataBind();
      //      this.GridView4.DataBind();


        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            //this.GridView2.DataBind();
            //this.GridView3.DataBind();
            //this.GridView4.DataBind();
            //this.GridView5.DataBind();

        }

        protected void GridView3_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            //this.GridView1.DataBind();
            //this.GridView2.DataBind();
            //this.GridView4.DataBind();
            //this.GridView5.DataBind();
        }

        protected void GridView4_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            //this.GridView1.DataBind();
            //this.GridView2.DataBind();
            //this.GridView3.DataBind();
            //this.GridView5.DataBind();
        }


        protected void GridView5_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            //this.GridView1.DataBind();
            //this.GridView2.DataBind();
            //this.GridView3.DataBind();
            //this.GridView4.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }



    }
}
