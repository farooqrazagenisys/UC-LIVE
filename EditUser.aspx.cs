using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;


namespace UC_LIVE
{
    public partial class EditUser : System.Web.UI.Page
    {

        MembershipUser u;



        public void Page_Load(object sender, EventArgs args)
        {

            string Username = Request.QueryString["UserName"];
            u = Membership.GetUser(Username);
          

            UsernameValue.InnerHtml = "Username: " + Username;

            string[] AgentRole = Roles.FindUsersInRole("Agent", Username);
            string[] AdminRole = Roles.FindUsersInRole("Administrator", Username);
            string[] BranchRole = Roles.FindUsersInRole("Branch", Username);
            string[] GuestRole = Roles.FindUsersInRole("Guest", Username);
            string[] StaffRole = Roles.FindUsersInRole("Staff", Username);
            string[] claimsmanager = Roles.FindUsersInRole("Claims Manager", Username);

            if (!IsPostBack)
            {

                if (AgentRole.Length > 0)
                {

                    RoleDropDown.SelectedValue = "Agent";

                }



               else if (claimsmanager.Length > 0)
                {

                    RoleDropDown.SelectedValue = "Claims Manager";

                }


                else if (AdminRole.Length > 0)
                {


                    RoleDropDown.SelectedValue = "Administrator";

                }




                else if (BranchRole.Length > 0)
                {

                    RoleDropDown.SelectedValue = "Branch";

                }




                else if (GuestRole.Length > 0)
                {


                    RoleDropDown.SelectedValue = "Guest";
                }




                else if (StaffRole.Length > 0)
                {

                    RoleDropDown.SelectedValue = "Staff";


                }



                EmailTextBox.Text = u.Email;
            }
        }

        public void UpdateEmailButton_OnClick(object sender, EventArgs args)
        {
            try
            {
                u.Email = EmailTextBox.Text;
                string Username1 = u.UserName;

                if (u.Email != null)
                {


                   // Membership.DeleteUser(u.UserName);
                    
                    Membership.UpdateUser(u);

                    Msg.Text = "User Details Updated";

                }


            }
            catch (System.Configuration.Provider.ProviderException e)
            {
                Msg.Text = e.Message;
            }
        }

        public void Button1_Click(object sender, EventArgs e)
        {

            try
            {

                string Username1 = u.UserName;
                string RoleSelected = RoleDropDown.SelectedItem.Value;


                if (RoleSelected != null)
                {

                    string[] Agentrolevalue = Roles.FindUsersInRole("Agent", Username1);

                    if (Agentrolevalue.Length > 0)
                    {
                        Roles.RemoveUserFromRole(Username1, "Agent");

                    }

                    string[] AdministratorValue = Roles.FindUsersInRole("Administrator", Username1);

                    if (AdministratorValue.Length > 0)
                    {
                        Roles.RemoveUserFromRole(Username1, "Administrator");

                    }

                    string[] StaffValue = Roles.FindUsersInRole("Staff", Username1);

                    if (StaffValue.Length > 0)
                    {
                        Roles.RemoveUserFromRole(Username1, "Staff");

                    }

                    string[] GuestValue = Roles.FindUsersInRole("Guest", Username1);

                    if (GuestValue.Length > 0)
                    {
                        Roles.RemoveUserFromRole(Username1, "Guest");

                    }

                    string[] claimsmanager = Roles.FindUsersInRole("Claims Manager", Username1);

                    if (claimsmanager.Length > 0)
                    {
                        Roles.RemoveUserFromRole(Username1, "Claims Manager");

                    }

                    string[] branchvlaue = Roles.FindUsersInRole("Branch", Username1);

                    if (branchvlaue.Length > 0)
                    {
                        Roles.RemoveUserFromRole(Username1, "Branch");

                    }

                    Roles.AddUserToRole(Username1, RoleSelected);
                    Msg.Text = "Role Details updated";
                }
            }

            catch (System.Configuration.Provider.ProviderException f)
            {
                Msg.Text = f.Message;
            }
        }
        public void Delete_Click(object sender, EventArgs e)
        {

            string Username1 = Request.QueryString["UserName"];

            int PermissionID = 0;


            using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {

                cnn.Open();

                using (SqlCommand Cmd = cnn.CreateCommand())
                {

                    Cmd.Parameters.AddWithValue("Username1", Username1);

                    //string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
                    string sSQL = string.Format("Select * from UserPermission1 where UserName1=@Username1");
                    Cmd.CommandText = sSQL;

                    using (SqlDataReader Reader = Cmd.ExecuteReader())
                    {


                        if (Reader.Read())
                        {

                            PermissionID = Convert.ToInt32(Reader["PermissionID"]);
                        }
                    }
                }


                if (PermissionID == 0)
                {

      



                using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;

                        cmd.Parameters.AddWithValue("UserName1", Username1);

                        cmd.Parameters.AddWithValue("DeleteAllowed", ChooseDelete.SelectedItem.Value);

                        //cmd.Parameters.AddWithValue("EditAllowed", TotalAmount);

                        // cmd.Parameters.AddWithValue("AccessAllowed", NoOfDays);

                        cmd.CommandText = "INSERT INTO UserPermission1(DeleteAllowed, UserName1) VALUES (@DeleteAllowed,@UserName1)";


                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            Msg.Text = "User Permissions Updated";
                        }



                    }
                }

                }

                else
                {


                    using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                    {
                        conn.Open();
                        using (SqlCommand cmd = conn.CreateCommand())
                        {
                            cmd.CommandType = CommandType.Text;

                            cmd.Parameters.AddWithValue("UserName1", Username1);

                            cmd.Parameters.AddWithValue("DeleteAllowed", ChooseDelete.SelectedItem.Value);

                            cmd.CommandText = "Update UserPermission1 SET DeleteAllowed = @DeleteAllowed Where UserName1=@UserName1";


                            if (cmd.ExecuteNonQuery() > 0)
                            {
                                Msg.Text = "User Permissions Updated";
                            }



                        }
                    }

                }

            }

        }



    }

}

	


