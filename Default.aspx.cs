using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace UC_LIVE
{
	public partial class Default : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{


			//MembershipUser User = Membership.GetUser();

			//if (User.UserName != null)
			//{
			//    DivWelcome.InnerHtml = "Welcome " + User.UserName;
			//}

			if (this.Page.User.IsInRole("Staff"))
			{

			}

			if (this.Page.User.IsInRole("Administrator"))
			{
			
				Response.Redirect("~/home1.aspx");
			}
		}

		protected void AddNewClaim_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/AddClaim.aspx");
		}
	}
}
