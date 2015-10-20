using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace UC_LIVE
{
	public partial class CarHire1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			try
			{
				using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{
					sqlConnection.Open();


					using (SqlCommand cmd = sqlConnection.CreateCommand())
					{

						cmd.Parameters.AddWithValue("HireStartDate", Convert.ToDateTime(HireStartDate.Text).ToString("yyyy/MM/dd"));
						cmd.Parameters.AddWithValue("HireEndDate", Convert.ToDateTime(HireEndDate.Text).ToString("yyyy/MM/dd"));				
						cmd.Parameters.AddWithValue("VehicleID", VehicleDropDown.SelectedItem.Value);
						cmd.Parameters.AddWithValue("ClientID", ClientDropDown.SelectedItem.Value);
						cmd.Parameters.AddWithValue("AdminFees", AdminFees.Text);
						cmd.Parameters.AddWithValue("DeliveryCollectionCharge", DeliveryCharge.Text);
					


						cmd.CommandText = "INSERT into VehicleHire (HireStartDate, HireEndDate, VehicleID, ClientID,DeliveryCollectionCharge) values (@HireStartDate, @HireEndDate, @VehicleID, @ClientID,@DeliveryCollectionCharge)";

						if (cmd.ExecuteNonQuery() > 0)
						{
							//msg.InnerHtml = cmd.CommandText.ToString();

						}

					}
				}
			}

			catch (Exception EXC)
			{

#if DEBUG
				Console.WriteLine(EXC.ToString());
#endif

			}
			finally
			{
				//Msg.InnerHtml = string.Format("<span style=\"color:Red;font-weight:bold;font-size:14px;\">{0}</span>", "Template Uploaded Successfully!");
			}
		}
	}
}
