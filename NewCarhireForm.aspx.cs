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
    public partial class NewCarhireForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string VehicleIdValue = "";
            int NoOfDaysValue = 0;
            //int RentalChargesValue = 0;
   

            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {
              string LicenceIssueDateValue = "";
              string LicenceExpiryDateValue = "";
              string DriverLicenceNumber = "";
              string LicenseCategory = "";
              string Identification = "";
              //sqlCommand.CommandText = "Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimID and ClaimContact.ContactTypeID=7";
              using (System.Data.SqlClient.SqlCommand sqlCommand1 = new System.Data.SqlClient.SqlCommand("Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimID and ClaimContact.ContactTypeID=7 ", sqlConnection)) //select * from CarHireFormTable, Contact where CarHireFormTable.ClaimID=@ClaimID and CarHireFormTable.ContactID=Contact.ContactID
              {

                sqlCommand1.Connection.Open();
                sqlCommand1.Parameters.AddWithValue("ClaimID", Request.QueryString["ClaimID"]);

                using (System.Data.IDataReader dataReader1 = sqlCommand1.ExecuteReader())
                {
                  if (dataReader1.Read())
                  {
                    if (Convert.ToString(dataReader1["LicenceIssueDate"]) == "")
                    {

                      LicenceIssueDateValue = "";
                    }
                    else
                    {

                      //LicenceIssueDateValue = Convert.ToDateTime(dataReader1["LicenceIssueDate"]).ToString("dd/MM/yyyy");
                      LicenceIssueDateValue = Convert.ToString(dataReader1["LicenceIssueDate"]);

                    }



                    if (Convert.ToString(dataReader1["LicenceExpiryDate"]) == "")
                    {

                      LicenceExpiryDateValue = "";
                    }
                    else
                    {

                      //LicenceExpiryDateValue = Convert.ToDateTime(dataReader1["LicenceExpiryDate"]).ToString("dd/MM/yyyy");
                      LicenceExpiryDateValue = Convert.ToString(dataReader1["LicenceExpiryDate"]);

                    }


                    if (Convert.ToString(dataReader1["DriverLicenceNumber"]) == "")
                    {

                      DriverLicenceNumber = "*NB NOT Photocard No";
                    }
                    else
                    {

                      //LicenceExpiryDateValue = Convert.ToDateTime(dataReader1["LicenceExpiryDate"]).ToString("dd/MM/yyyy");
                      DriverLicenceNumber = Convert.ToString(dataReader1["DriverLicenceNumber"]);

                    }
                    LicenseCategory = Convert.ToString(dataReader1["LicenseCategory"]);
                    Identification = Convert.ToString(dataReader1["Identification1"]);
                  }
                }
              }
              using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT TOP 1 AdminFees,DeliveryCollectionCharges,NumberOfDays,VehicleRate, ISNULL(Contact.FirstName,'')+ ' '+ ISNULL(Contact.SurName,'') +  CHAR(13) + ISNULL(Contact.Address1,'') + CHAR(13) + ISNULL(Contact.Address2,'') +  CHAR(13) + ISNULL(Contact.City,'') + ISNULL(Contact.PostCode,'') AS ContactAddress, Company, VehicleReg,VehicleMake,VehicleModel,VehicleEngine,VehicleTransmission,Bodyshape,DateTimeOut, DOB,ClaimContact.ClaimID,LicenseCategory, LicenceIssueDate,Identification1, LicenceExpiryDate, DriverLicenceNumber FROM  Contact INNER JOIN ClaimContact ON Contact.ContactID = ClaimContact.ContactID INNER JOIN CarHireFormTable ON ClaimContact.ClaimID = CarHireFormTable.ClaimId WHERE ClaimContact.ClaimID = @ClaimID AND ClaimContact.ContactTypeID IN(7,9) ORDER BY ClaimContact.ContactTypeID DESC ", sqlConnection)) //select * from CarHireFormTable, Contact where CarHireFormTable.ClaimID=@ClaimID and CarHireFormTable.ContactID=Contact.ContactID
                {

                   // sqlCommand.Connection.Open();
                    sqlCommand.Parameters.AddWithValue("ClaimID", Request.QueryString["ClaimID"]);

                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                        if (dataReader.Read())
                        {

                            // ViewContactInfo.InnerHtml = "<table  width='350' border:solid 1px black; ><tr> <td >sdfa</td></tr><tr><td >dsfa</td></table>"; 

                            string DOBVAlue = "";

                            if (Convert.IsDBNull(dataReader["DOB"]))
                            {

                                DOBVAlue = "";
                            }
                            else {


                                DOBVAlue = Convert.ToDateTime(dataReader["DOB"]).ToString("dd/MM/yyyy");

                               
                            
                            }

                          
                         // }


                            ViewContactInfo.InnerHtml = string.Concat("<div style='text-align:left;'> &nbsp;1.	Hirer Reference Number:<span style='padding:10px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["ClaimID"]), "</span><span style='width:380px;'><hr/></style>&nbsp;2.		Company Name: <span style='padding:3px; font-weight:bold; font-size:13px;'>", (dataReader["Company"]), "</span>", "<hr/>&nbsp;3-6.Address:<br/><span style='padding:3px; font-weight:bold; font-size:13px;'>", "<span style='padding:3px; font-weight:bold; font-size:13px;'>", "<textarea style='width:300px;  font-family:Arial;   overflow:hidden;  border:Solid 1px white; height:70px;font-weight:bold;'>", dataReader["ContactAddress"], "</textarea>",

                            "</span><br/><hr/><span style='padding:10px;text-align:left;font-weight:normal;'>&nbsp;7.Date of Birth:</span>", DOBVAlue, "</span><br/><hr/>&nbsp;8.	Driver Licence Number: <span style='padding:10px; font-weight:bold; font-size:13px;'>", DriverLicenceNumber, "</span><br/><span style='padding-left:15px; padding-top:10px; font-weight:bold; font-size:13px;'>", (dataReader["DriverLicenceNumber"]), "</span><br/><hr/>&nbsp;9.		Issue Date: <span style='padding:3px; font-weight:bold; font-size:13px;'>", LicenceIssueDateValue, "</span><br/><hr/>&nbsp;10.  Expiry Date:<span style='padding:10px; font-weight:bold; font-size:13px;'>",
LicenceExpiryDateValue, "</span>");




                            //, "</span><br/><hr/>", "4.		Surname:<span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["Surname"]), "</span><br/><hr/>5.		Firstname:<span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["Firstname"]), "</span><br/><hr/>", "6.		Date of Birth:<span style='padding:3px; font-weight:bold; font-size:13px;'>", Convert.ToString(dataReader["DOB"]), "</span><Br/><hr/>7.		Permanant Licence Address:<br/><span style='padding:3px; font-weight:bold; font-size:13px;'>",
                            CategoryDiv.InnerHtml = LicenseCategory;//Convert.ToString(dataReader["LicenseCategory"]);
                            IdentificationDiv12.InnerHtml = Identification;//Convert.ToString(dataReader["Identification1"]);
                           // Convert.ToString(dataReader["ClaimID"]);
                            VehicleRegNo.InnerHtml = Convert.ToString(dataReader["VehicleReg"]);
                            Make.InnerHtml = Convert.ToString(dataReader["VehicleMake"]);
                            VehicleModel.InnerHtml = Convert.ToString(dataReader["VehicleModel"]);
                            Engine.InnerHtml = Convert.ToString(dataReader["VehicleEngine"]);
                            Transmission.InnerHtml = Convert.ToString(dataReader["VehicleTransmission"]);
                            BodyShape.InnerHtml = Convert.ToString(dataReader["Bodyshape"]);
                            DateOut.InnerHtml = Convert.ToDateTime(dataReader["DateTimeOut"]).ToString("dd/MM/yyyy");
                            DateOut1.InnerHtml = Convert.ToDateTime(dataReader["DateTimeOut"]).ToString("dd/MM/yyyy");
                           // DateBack.InnerHtml = Convert.ToDateTime(dataReader["DateTimeBack"]).ToString("dd/MM/yyyy");
                           // TimeBack.InnerHtml = "10:00 am";
                           TimeOut.InnerHtml = "10:00 am";
                        
                          double AbiRatevalue = Convert.ToDouble(dataReader["VehicleRate"]);

                            double ContracutalAbiRate = AbiRatevalue + AbiRatevalue / 100 * 22.5;

                           AbiRate.InnerHtml = Convert.ToString(String.Format("{0:C}",ContracutalAbiRate));

                          
                        //  NoOfDays.InnerHtml = Convert.ToString(dataReader["NumberOfDays"]);

                            double NoOfDaysValue1 = Convert.ToDouble(dataReader["NumberOfDays"]);
                           // double RentalCharges = NoOfDaysValue1 * ContracutalAbiRate;

                         //   RentalCharges1.InnerHtml = Convert.ToString(String.Format("{0:C}", RentalCharges));

                            double DeliveryCharagesValue = Convert.ToDouble(dataReader["DeliveryCollectionCharges"]);

                          //  double EstateVehicle = Convert.ToDouble(dataReader["EstateVehicle"]);

                          //  double ControlVehicle = Convert.ToDouble(dataReader["ControlVehicle"]);

                          //  double AutomaticValue = Convert.ToDouble(dataReader["Automatic"]);

                            //double TowBarsBabySeats = Convert.ToDouble(dataReader["TowBarsBabySeats"]);
//
                           // double AddtionalDriver = Convert.ToDouble(dataReader["AddtionalDriver"]);
                            double AdminFees1 = Convert.ToDouble(dataReader["AdminFees"]);

                            //double Total = Convert.ToDouble(dataReader["Total"]);
                            //double TotalVAt = Convert.ToDouble(dataReader["TotalVAt"]);

                           // double HireCharges1 = Convert.ToDouble(dataReader["HireCharges"]);

                           // double TotalVAt1 = Convert.ToDouble(dataReader["TotalVAt"]);


                            DeliveryCharges.InnerHtml = Convert.ToString(String.Format("{0:C}", DeliveryCharagesValue));
                           //Estate.InnerHtml = Convert.ToString(String.Format("{0:C}", EstateVehicle));
                           // Control.InnerHtml = Convert.ToString(String.Format("{0:C}", ControlVehicle));
                           // TowBars.InnerHtml = Convert.ToString(String.Format("{0:C}",TowBarsBabySeats));
                           // Additional.InnerHtml = Convert.ToString(String.Format("{0:C}", AddtionalDriver));
                            ABIHandlingFEE.InnerHtml = Convert.ToString(String.Format("{0:C}", AdminFees1));
                            //TotalCharges.InnerHtml = Convert.ToString(String.Format("{0:C}",Total));
                           // TotalVat.InnerHtml = Convert.ToString(String.Format("{0:C}",TotalVAt));
                           // HireCharges.InnerHtml = Convert.ToString(String.Format("{0:C}", HireCharges1));
                           // Automatic.InnerHtml = Convert.ToString(String.Format("{0:C}", AutomaticValue));

                            //Convert.ToString(dataReader["Automatic"], AutomaticCharges);     
                            //RentalCharges.InnerHtml = Convert.ToString(dataReader["HireCharges"]);
                            
                            //Convert.ToString(dataReader["VehicleReg"]);
                            //Convert.ToString(dataReader["Transmission"]);
                            //Convert.ToString(dataReader["BodyShape"]);
                            //Convert.ToString(dataReader["DateOut"]);
                            //Convert.ToString(dataReader["DateOut"]);
                            //Convert.ToString(dataReader["VehicleModel"]);
                            //Convert.ToString(dataReader["VehicleMake"]);                      
                            //Convert.ToString(dataReader["DeliveryCharges"]);
                            //Convert.ToString(dataReader["AdminFees"]);


                         


                        }

                    sqlCommand.CommandText = "select * from Contact where ContactTypeID='12'";


                    using (System.Data.IDataReader dataReader1 = sqlCommand.ExecuteReader())

                        if (dataReader1.Read())
                        {

                            DocumentHeader.InnerHtml = string.Concat("<div style='text-align:left;padding-left:5px;padding-right:5px;  float:left; color:black;font-size:13px; margin-right:25px;font-family:Arial; '><img width='200' src='", Convert.ToString(dataReader1["ContactImage"]), "'", "></div>", "<div style='text-align:left;padding-left:5px;padding-right:5px; float:left; color:gray; padding:10px; margin-left:5px; width:660px; line-height:1.5em; border:solid 1px black;'>", (dataReader1["Company"]), "&nbsp;&nbsp;", Convert.ToString(dataReader1["Address1"]), "&nbsp;&nbsp;", Convert.ToString(dataReader1["Address2"]), "&nbsp;&nbsp;", Convert.ToString(dataReader1["City"]), "&nbsp;&nbsp;", Convert.ToString(dataReader1["Postcode"]), "<br/><span style='font-style:bold;'>Tel:", Convert.ToString(dataReader1["Phone"]), "&nbsp;&nbsp;Fax:", Convert.ToString(dataReader1["Fax"]), "&nbsp;&nbsp;Email:", Convert.ToString(dataReader1["Email"]), "</span></div><div style='width:110px; float:right; border:solid 1px black; font-weight:bold; text-align:center; margin-right:10px;  height:55px;'>Agreement No:<br/>", "<span style='color:red; padding-top:4px; font-family:Times New Roman; font-size:30px;'>", Request.QueryString["ClaimID"], "</span></div>");
                            FooterValue.InnerHtml = FooterValue.InnerHtml = string.Concat("<br/><span style='font-size:10px;'>", Convert.ToString(dataReader1["CompanyInfo"]), "</span>");


                        }


                }




            }




        }

      
    }
}
