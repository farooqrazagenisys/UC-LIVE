using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;



namespace UC_LIVE
{
	public partial class AddGroup : System.Web.UI.Page
	{
             
        protected void Page_Load(object sender, EventArgs e)
		{
            string DeleteAllowed = "";


            using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {

                cnn.Open();
                using (SqlCommand Cmd = cnn.CreateCommand())
                {

                    string Username1 = Page.User.Identity.Name;


                    Cmd.Parameters.AddWithValue("Username1", Username1);

                    //string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
                    string sSQL = string.Format("Select * from UserPermission1 where UserName1=@Username1");
                    Cmd.CommandText = sSQL;

                    using (SqlDataReader Reader = Cmd.ExecuteReader())
                    {


                        if (Reader.Read())
                        {

                            DeleteAllowed = Convert.ToString(Reader["DeleteAllowed"]);
                        }
                    }
                }


                if (DeleteAllowed == "No")
                {


                    GridView1.Columns[6].Visible = false;
                    GridView2.Columns[4].Visible = false;

                }

            }
		}

		protected void AddGroupButton_Click(object sender, EventArgs e)
		{
			int CategoryID = Convert.ToInt32(CategoryDropDown.SelectedItem.Value);
		
			using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
			{

				conn.Open();
				using (SqlCommand cmd = conn.CreateCommand())
				{

					cmd.Parameters.AddWithValue("VehicleGroupTitle", "");
					cmd.Parameters.AddWithValue("GroupDailyRate", "");
				    cmd.Parameters.AddWithValue("VehicleCategoryID", CategoryID);

					cmd.CommandText = "INSERT into VehicleGroup (VehicleGroupTitle,GroupDailyRate,VehicleCategoryID) values(@VehicleGroupTitle,@GroupDailyRate,@VehicleCategoryID)";

					if (cmd.ExecuteNonQuery() > 0)
					{
						//msg.InnerHtml = cmd.CommandText.ToString();
						cmd.Parameters.Clear();


					}


				}


			}
			
			GridView1.EditIndex = 0;
			GridView1.DataBind();
		}

		protected void AddCategory_Click(object sender, EventArgs e)
		{
			using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
		
			{

				conn.Open();
				using (SqlCommand cmd = conn.CreateCommand())
				{

					cmd.Parameters.AddWithValue("VehicleCategory", "");

					cmd.CommandText = "INSERT into VehicleCategory (VehicleCategory) values(@VehicleCategory)";

					if (cmd.ExecuteNonQuery() > 0)
					{
						//msg.InnerHtml = cmd.CommandText.ToString();
						cmd.Parameters.Clear();


					}


				}


			}

			GridView2.EditIndex = 0;
			GridView2.DataBind();
		}
	}
}
