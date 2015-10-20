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
	public partial class AddVehicles : System.Web.UI.Page
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


                                GridView1.Columns[8].Visible = false;

                            }
                        }











		}

		protected void AddVehicle_Click(object sender, EventArgs e)
		{
			int GroupID = Convert.ToInt32(GroupDropDown1.SelectedItem.Value);
		

			using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
			{

				conn.Open();
				using (SqlCommand cmd = conn.CreateCommand())
				{

					cmd.Parameters.AddWithValue("VehicleMake", "");
					cmd.Parameters.AddWithValue("VehicleModel", "");
					cmd.Parameters.AddWithValue("VehicleReg", "");
					cmd.Parameters.AddWithValue("InsranceCompanyId", "");
					cmd.Parameters.AddWithValue("InsurancePolicyNo", "");
					cmd.Parameters.AddWithValue("VehicleOwnerId", "");
					cmd.Parameters.AddWithValue("VehicleGroupId", GroupID);
					cmd.Parameters.AddWithValue("VehicleType", "CourtesyCar");


					cmd.CommandText = "INSERT into Vehicle (VehicleMake,VehicleModel,VehicleReg,InsranceCompanyId, InsurancePolicyNo,VehicleOwnerId, VehicleGroupId, VehicleType) values(@VehicleMake,@VehicleModel,@VehicleReg,@InsranceCompanyId,@InsurancePolicyNo,@VehicleOwnerId,@VehicleGroupId, @VehicleType)";


					if (cmd.ExecuteNonQuery() > 0)
					{
					    cmd.Parameters.Clear();
						
					}


				}


			}


			GridView1.EditIndex = 0;
			GridView1.SelectedIndex = GridView1.Rows.Count - 1; 
			GridView1.DataBind();
		}

        protected void GroupDropDown1_SelectedIndexChanged(object sender, EventArgs e)
        {

              
        }


        protected void DropdownCategory_DataBound(object sender, EventArgs e)
        {

            CategoryDropDown.Items.Insert(0, new ListItem("Choose Category ", "-1"));

        }


        protected void DropdownGroupType_DataBound(object sender, EventArgs e)
        {

            GroupDropDown1.Items.Insert(0, new ListItem("Choose Group ", "-1"));

        }

        protected void CategoryDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            
       
        }
	}
}
