using System;
using System.Collections.Generic;
using AjaxControlToolkit;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace UC_LIVE
{
	public partial class admin : System.Web.UI.MasterPage
	{
	
		MembershipUser UserInfo;
		protected void Page_Load(object sender, EventArgs e)
		{

			DivTodayDate.InnerHtml = Convert.ToString(DateTime.Today);
			DivTodayDate.InnerHtml = Membership.GetNumberOfUsersOnline().ToString();
			if (this.Page.User.IsInRole("Administrator"))
			{
				TopMenu.Visible = true;
				//WelcomeMessage.Visible = false;

                DivTodayDate.InnerHtml = Convert.ToString(DateTime.Now);
			}
		
		

			if (Membership.GetUser() != null)
			{
				UserInfo = Membership.GetUser();
				DivUserName.InnerHtml = UserInfo.UserName;

			}
		
		}

		protected void Logout_Click(object sender, EventArgs e)
		
		{
            FormsAuthentication.SignOut();
            Response.Redirect("~/systemlogin.aspx");
			
		}

		}
	}

