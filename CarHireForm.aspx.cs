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
	public partial class CarHireForm : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

            string VehicleIdValue = "";
            int NoOfDaysValue = 0;
            int RentalChargesValue = 0;

			using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
			{
				
				using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("select * from Claim, ClaimContact, Contact where Claim.ClaimID=@ClaimID and Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Contact.ContactTypeID='7'", sqlConnection))
				 {
				
					sqlCommand.Connection.Open();
					sqlCommand.Parameters.AddWithValue("ClaimID", Request.QueryString["ClaimID"]);

					using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

						if (dataReader.Read())
						{

                           // ViewContactInfo.InnerHtml = "<table  width='350' border:solid 1px black; ><tr> <td >sdfa</td></tr><tr><td >dsfa</td></table>"; 


                            //ViewContactInfo.InnerHtml = string.Concat("<div style='text-align:left;padding-left:5px;padding-right:5px;'> 1.	Hirer Reference Number:<br/><br/><span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["ClaimID"]), "</span><br/><span style='padding:0px; width:380px;'><hr/></style>2.		Company Name<br/><span style='padding:3px; font-weight:bold; font-size:13px;'>", (dataReader["Company"]),
                            //"</span><br/><hr/>3.		Address:<br/><span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["Address1"]), "</span><br/><span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["Address2"]), "</span><br/><span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["City"]), "</span><Br/><hr/>",
                            //"PostCode:<span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["Postcode"]), "</span><br/><hr/>", "4.		Surname:<span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["Surname"]), "</span><br/><hr/>5.		Firstname:<span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["Firstname"]), "</span><br/><hr/>", "6.		Date of Birth:<span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["DOB"]), "</span><Br/><hr/>7.		Permanant Licence Address:<br/><span style='padding:3px; font-weight:bold; font-size:13px;'>",
                            //(dataReader["LicenceAddress"]), "</span><br/><hr/>8.	Driver Licence Number <span style='font-size:9px;'>*NB NOT Photocard No</span><br/><span style='padding:3px; font-weight:bold; font-size:13px;'>", (dataReader["DriverLicenceNumber"]), "</span><br/><hr/><br/>9.		Issue Date: <span style='padding:3px; font-weight:bold; font-size:13px;'>", (dataReader["LicenceIssueDate"]), "</span><br/><hr/><br/>10.  Expiry Date:<span style='padding:3px; font-weight:bold; font-size:13px;'>",
                            //(dataReader["LicenceExpiryDate"]), "</span><br/><hr/>Agreement Date:<span style='padding:3px; font-weight:bold; font-size:13px;'>", System.DateTime.Now, "</span></div>");

                          ViewContactInfo.InnerHtml = string.Concat("<div style='text-align:left;padding-left:5px;padding-right:5px;'> 1.	Hirer Reference Number:<br/><br/><span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["ClaimID"]), "</span><br/><span style='padding:0px; width:380px;'><hr/></style>2.		Company Name<br/><span style='padding:3px; font-weight:bold; font-size:13px;'>", (dataReader["Company"]),
                          "</span><br/><hr/>3.		Address:<br/><span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["Address1"]), "</span><br/><span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["Address2"]), "</span><br/><span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["City"]), "</span><Br/><hr/>",
                          "PostCode:<span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["Postcode"]), "</span><br/><hr/>", "4.		Surname:<span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["Surname"]), "</span><br/><hr/>5.		Firstname:<span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["Firstname"]), "</span><br/><hr/>", "6.		Date of Birth:<span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["DOB"]), "</span><Br/><hr/>7.		Permanant Licence Address:<br/><span style='padding:3px; font-weight:bold; font-size:13px;'>",
                          (dataReader["LicenceAddress"]), "</span><br/><hr/>8.	Driver Licence Number <span style='font-size:9px;'>*NB NOT Photocard No</span><br/><span style='padding:3px; font-weight:bold; font-size:13px;'>", (dataReader["DriverLicenceNumber"]), "</span><br/><hr/><br/>9.		Issue Date: <span style='padding:3px; font-weight:bold; font-size:13px;'>", (dataReader["LicenceIssueDate"]), "</span><br/><hr/><br/>10.  Expiry Date:<span style='padding:3px; font-weight:bold; font-size:13px;'>",
                          (dataReader["LicenceExpiryDate"]), "</span><br/><hr/>Agreement Date:<span style='padding:3px; font-weight:bold; font-size:13px;'>", System.DateTime.Now, "</span></div>");

						}
                    sqlCommand.Parameters.Clear();

                    sqlCommand.CommandText = "select * from Contact where ContactTypeID='12'";


                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                        if (dataReader.Read())
                        {

                            DocumentHeader.InnerHtml = string.Concat("<div style='text-align:left;padding-left:5px;padding-right:5px; line-height:1.5px; float:left; color:black;font-size:11px;'><img width='180' src='", Convert.ToString(dataReader["ContactImage"]), "'", "></div>", "<div style='text-align:left;padding-left:5px;padding-right:5px; float:left; color:gray; padding:10px; margin-left:5px; width:700px; border:solid 1px black;'>", (dataReader["Company"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["Address1"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["Address2"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["City"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["Postcode"]), "<br/><span style='font-style:bold;'>Phone:", Convert.ToString(dataReader["Phone"]), "&nbsp;&nbsp;Fax:", Convert.ToString(dataReader["Fax"]), "&nbsp;&nbsp;Email:", Convert.ToString(dataReader["Email"]), "</span><br/><span style='font-size:10px;'>", Convert.ToString(dataReader["CompanyInfo"]), "</span></div><div style='width:115px; float:left; border:solid 1px black; font-weight:bold; text-align:center; padding:5px; margin-left:10px; height:55px;'>Agreement No<br/>", Request.QueryString["ClaimID"], "</div>");
                            


                        }





				}


                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Vehicle , VehicleHire where Vehicle.VehicleId = VehicleHire.VehicleID and VehicleHire.ClaimId=@ClaimID", sqlConnection))
				{
                    
                    sqlCommand.Parameters.Clear();
					sqlCommand.Parameters.AddWithValue("ClaimID", Request.QueryString["ClaimID"]);

					using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

						if (dataReader.Read())
						{

							VehicleRegNo.InnerHtml = Convert.ToString(dataReader["VehicleReg"]);
							Transmission.InnerHtml = Convert.ToString(dataReader["Transmission"]);
                            BodyShape.InnerHtml = Convert.ToString(dataReader["BodyShape"]);
                            DateOut.InnerHtml = Convert.ToString(dataReader["DateOut"]);
                            DateOut.InnerHtml = Convert.ToString(dataReader["DateOut"]);
							VehicleModel.InnerHtml = Convert.ToString(dataReader["VehicleModel"]);
							Make.InnerHtml = Convert.ToString(dataReader["VehicleMake"]);
							Engine.InnerHtml = Convert.ToString(dataReader["VehicleEngine"]);
                            VehicleIdValue = Convert.ToString(dataReader["VehicleID"]);
                          
			

						}


				}

                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Vehicle , VehicleHire where Vehicle.VehicleId = VehicleHire.VehicleID and VehicleHire.ClaimId=@ClaimID", sqlConnection))
				{

					sqlCommand.Parameters.Clear();
                    sqlCommand.Parameters.AddWithValue("ClaimID", Request.QueryString["ClaimID"]);

					using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

						if (dataReader.Read())
						{

							Estate.InnerHtml = Convert.ToString(dataReader["EstateAmount"]);
							Automatic.InnerHtml = Convert.ToString(dataReader["AutomaticAmount"]);
							Control.InnerHtml = Convert.ToString(dataReader["ControlAmount"]);
							TotalCharges.InnerHtml = Convert.ToString(dataReader["TotalAmount"]);
							TotalVat.InnerHtml = Convert.ToString(dataReader["VAT"]);
							TowBars.InnerHtml = Convert.ToString(dataReader["BabySeatsAmount"]);
							Additional.InnerHtml = Convert.ToString(dataReader["AdditionalDriver"]);
							HireCharges.InnerHtml = Convert.ToString(dataReader["GrandTotal"]);
							NoOfDays.InnerHtml = Convert.ToString(dataReader["NoOfDays"]);

                            NoOfDaysValue = Convert.ToInt32(dataReader["NoOfDays"]);

                            DeliveryCharges.InnerHtml = Convert.ToString(dataReader["DeliveryCharges"]);
                            AdminFees.InnerHtml = Convert.ToString(dataReader["AdminFees"]);          

                            AbiRate.InnerHtml = Convert.ToString(dataReader["GroupDailyRate"]);         

                            RentalCharges.InnerHtml = Convert.ToString(dataReader["HireCharges"]);                       



						}


				}




			}
		}
	}

}
