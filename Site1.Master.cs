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
	public partial class Site1 : System.Web.UI.MasterPage
	{
		MembershipUser UserInfo;

        public string ADMINEMAIL = "";
        public string ADMINMOBILE = "";
       public double VATVALUE = 0.00;


       protected void Page_Load(object sender, EventArgs e)
       {
           using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
           {

               using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("select * from Claim, ClaimContact, Contact where Claim.ClaimID=@ClaimID and Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Contact.ContactTypeID='9'", sqlConnection))
               {

                   sqlCommand.Connection.Open();

                   sqlCommand.Parameters.Clear();

                   sqlCommand.CommandText = "Select * from Contact where ContactTypeID='12'";


                   using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                       if (dataReader.Read())
                       {

                           VATVALUE = Convert.ToDouble(dataReader["VATVALUE"]);
                           ADMINEMAIL = Convert.ToString(dataReader["Email"]);
                           ADMINMOBILE = Convert.ToString(dataReader["Mobile"]);


                       }
               }
           }
           if (!Page.User.Identity.IsAuthenticated)
           {


               Response.Redirect("~/systemlogin.aspx");

           }


           AccessAdmin.Visible = false;

           TopMenu.Visible = false;

           SubMenu.Visible = false;

           DivUserName.InnerHtml = Page.User.Identity.Name;

           DivTodayDate.InnerHtml = Convert.ToString(DateTime.Now);


           if (Page.User.Identity.IsAuthenticated)
           {

               if (this.Page.User.IsInRole("Administrator"))
               {
                   TopMenu.Visible = true;
                   AccessAdmin.Visible = true;
                   //WelcomeMessage.Visible = false;
                   SubMenu.Visible = true;
               }

               else if (this.Page.User.IsInRole("Claims Manager"))
               {
                   TopMenu.Visible = true;
                   AccessAdmin.Visible = true;
                   SubMenu.Visible = true;
                   AdminIcon.Visible = false;
                   //TopMenu.Visible = false;
                   AccessAdmin.Visible =false;
                   //SubMenu.Visible = false;
               }
               else if (this.Page.User.IsInRole("Staff"))
               {

                   TopMenu.Visible = true;
                   AccessAdmin.Visible = true;
                   SubMenu.Visible = true;
                   AdminIcon.Visible = false;
                   //TopMenu.Visible = false;
                   AccessAdmin.Visible = false;
                   //SubMenu.Visible = false;
               }

               else
               {
                   Response.Redirect("~/UserClaimLists.aspx");
               
               
               
               }
           }
       }
	

		protected void Logout_Click(object sender, EventArgs e)
		{
			FormsAuthentication.SignOut();
            Response.Redirect("~/systemlogin.aspx");

		}



		protected void Admin_Click(object sender, EventArgs e)
		{
            Response.Redirect("~/ManageUsers.aspx");
		}

        protected void ImageButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ChangePassword.aspx");
        }
	}
}
