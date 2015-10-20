using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace UC_LIVE
{
	public partial class users1 : System.Web.UI.Page
	{
		
		private MembershipUserCollection allRegisteredUsers = Membership.GetAllUsers();
		MembershipUserCollection myuser = Membership.GetAllUsers();

		public void RefreshGridview()
		{
			gvUsers.DataSource = Membership.GetAllUsers();
			gvUsers.DataBind();
		}

		protected void Page_Load(object sender, EventArgs e)
		{
			btn_Delete.Visible = false;

			if (!IsPostBack)
			{
				//RefreshGridview();

				lblOnlineUsers.Text = Membership.GetNumberOfUsersOnline().ToString();
				lblTotalUsers.Text = allRegisteredUsers.Count.ToString();
				string[] alph = "A;B;C;D;E;F;G;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z;All".Split(';');

				//-- Bind Reprater control to Alphapitical
				rptAlphabetBar.DataSource = alph;
				rptAlphabetBar.DataBind();

			
			}
		}

		//-- for Reprater control
		protected void rptAlphabetBar_ItemCommand(object source, RepeaterCommandEventArgs e)
		{
			btn_Delete.Visible = true;

			gvUsers.Attributes.Add("SearchByEmail", false.ToString());
			if (e.CommandArgument.ToString().Length == 1)
			{
				gvUsers.Attributes.Add("SearchText", e.CommandArgument.ToString() + "%");
				this.BindAllUsers(false);
			}
			else
			{
				gvUsers.Attributes.Add("SearchText", "");
				this.BindAllUsers(false);
			}
		}

		private void BindAllUsers(bool reloadAllUsers)
		{
			MembershipUserCollection allUsers = null;
			if (reloadAllUsers)
				allUsers = Membership.GetAllUsers();

			string searchText = "";
			if (!string.IsNullOrEmpty(gvUsers.Attributes["SearchText"]))
				searchText = gvUsers.Attributes["SearchText"];
			bool searchByEmail = false;
			if (!string.IsNullOrEmpty(gvUsers.Attributes["SearchByEmail"]))
				searchByEmail = bool.Parse(gvUsers.Attributes["SearchByEmail"]);
			if (searchText.Length > 0)
			{
				if (searchByEmail)
					allUsers = Membership.FindUsersByEmail(searchText);
				else
					allUsers = Membership.FindUsersByName(searchText);
			}
			else
			{
				allUsers = allRegisteredUsers;
			}
			gvUsers.DataSource = allUsers;
			gvUsers.DataBind();
		}

		//-- Search button
		protected void btnSearch_Click(object sender, EventArgs e)
		{
			btn_Delete.Visible = true;

			bool searchByEmail = (ddlUserSearchTypes.SelectedValue == "E-mail");
			//gvUsers.Attributes.Add("SearchText", "%" + txtSearchText.Text + "%");
			gvUsers.Attributes.Add("SearchText", txtSearchText.Text + "%");
			gvUsers.Attributes.Add("SearchByEmail", searchByEmail.ToString());
			BindAllUsers(false);
		}

		//-- Delete button
		protected void btn_Delete_Click(object sender, EventArgs e)
		{
			try
			{
				foreach (GridViewRow row in gvUsers.Rows)
				{
					CheckBox checkbox = (CheckBox)row.FindControl("cbxId");

					if (checkbox.Checked == true)
					{

						Label lblUserName = (Label)gvUsers.Rows[row.RowIndex].FindControl("lblUserName");

						bool x = Membership.DeleteUser(lblUserName.Text);

						if (x == true)
						{
							lblMsg.Text = "Selected deleted";

							RefreshGridview();

							btn_Delete.Visible = false;

						}
						else
						{
							lblMsg.Text = "Try again";
						}

					}

				}
			}
			catch (Exception ex)
			{
				lblMsg.Text = ex.Message.ToString();
			}
		}

		//-- for Checkbox
		protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if ((e.Row.RowType == DataControlRowType.Header))
			{
				//adding an attribut for onclick event on the check box in the hearder and passing the ClientID of the Select All checkbox 
				((CheckBox)e.Row.FindControl("cbxAll")).Attributes.Add("onclick", "javascript:SelectAll('" + ((CheckBox)e.Row.FindControl("cbxAll")).ClientID + "')");

			}
		}


		protected void gvUsers_DataBound(object sender, EventArgs e)
		{
			if (gvUsers.Rows.Count == 0)
			{

				btn_Delete.Visible = false;
			}
			else
			{
				btn_Delete.Visible = true;
			}
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
		
					Response.Redirect("testusers.aspx");

		
		}
		
	}
}
