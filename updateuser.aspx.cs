using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace UC_LIVE
{
	public partial class updateuser : System.Web.UI.Page
	{
		MembershipUserCollection myuser = Membership.GetAllUsers();

		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.QueryString["Id"] != null)
			{
				if (!IsPostBack)
				{
					string userName = Request.QueryString["Id"].ToString();

					MembershipUser Current = myuser[userName];

					UsernameLabel.Text = Current.UserName;
					EmailText.Text = Current.Email;
					CommentTextBox.Text = Current.Comment;
					IsApprovedCheck.Checked = Current.IsApproved;
					IsLockedOutCheck.Checked = Current.IsLockedOut;
					lblPassword.Text = Current.GetPassword();
				}
			}

		}

		//-- Update button
		protected void Button1_Click(object sender, EventArgs e)
		{
			try
			{
				string userName = Request.QueryString["Id"].ToString();

				MembershipUser Current = myuser[userName];
				Current.Email = EmailText.Text;
				Current.Comment = CommentTextBox.Text;
				Current.IsApproved = IsApprovedCheck.Checked;

				Membership.UpdateUser(Current);
			}
			catch (Exception ex)
			{
				Response.Write(ex.Message);
			}
			finally
			{
				Response.Redirect("~/Admin/ManageUsers.aspx");
			}
		}

	}
}
