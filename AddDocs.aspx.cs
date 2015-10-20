using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UC_LIVE
{
	public partial class AddDocs : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!this.Page.User.IsInRole("Administrator"))
				throw new System.Security.Authentication.AuthenticationException("You do not have suffecient privlages to access this resource.");
			    
		
		}

		protected void AddDocument_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/AddNewDoc.aspx");
		}

		protected void ClientDocuments_SelectedIndexChanged(object sender, EventArgs e)
		{

		}
	}
}
