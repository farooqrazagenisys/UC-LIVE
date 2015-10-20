using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;

namespace UC_LIVE 
{
    public partial class AddClaim : System.Web.UI.Page
    {

			int ClaimIDvalue = 0;
			int WitnessIDvalue1 = 0;
			int WitnessIDvalue2 = 0;
			int PartyatFaultValue = 0 ;
			int ClientIDvalue = 0;
			int VehicleOwnerID = 0;
			int VehicleID = 0;
			int GPID = 0;
			int HospitalID = 0;		   

			//int ContactIDUpdate = 0;
			int WitnessID1Update = 0;
			int WitnessID2Update = 0;
		
			//int PartyatFaultUpdate = 0;
			int ClaimId = 0;
			
	
        protected void Page_Load(object sender, EventArgs e)
        {

			AddClaimButton.Visible = true;
            DisplayAccordion.Visible = false;

			//RedirectClaim.Visible = this.Page.User.IsInRole("Staff");
			//Logout.Visible = this.Page.User.IsInRole("Staff");
			
			if (!this.Page.User.IsInRole("Administrator"))
			{

				UpdateClaim.Visible = false;
				//TabAllocateSuppier.Visible = false;
				DivDoucments.Visible = false;
				DivInvoices.Visible = false;
				AddClaimButton.Visible = false;

		


			}

			
			if (!this.IsPostBack)
            {
				
				if (Request.QueryString["ClaimId"]!=null)
				{
					UpdateClaim.Visible = true;
					ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);
					AddClaimButton.Visible = false;
                    DisplayAccordion.Visible = true;

				}
				else 
				{

					UpdateClaim.Visible = false;
					
				}
							
			//int ClaimId = 58;

				// HiddenidCustomer.Value = idCustomer.ToString();
                try
                {

                    using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                    {

                        cnn.Open();

                        using (SqlCommand Cmd = cnn.CreateCommand())
                        {

				Cmd.Parameters.AddWithValue("ClaimId", ClaimId);
                
			    //string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
				string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and Claim.ClaimID=ClaimContact.ClaimID and ClaimContact.ContactId = Contact.ContactID and Contact.ContactTypeId=7");                                     
                Cmd.CommandText = sSQL;

		
                           
				using (SqlDataReader Reader = Cmd.ExecuteReader())
                      
				{
                                
					if (Reader.Read())
                
								{

                                  //  int idAddress = Convert.ToInt32(Reader["idAddress"]);

                                       ClaimTitle.Text = Convert.ToString(Reader["ClaimTitle"]);                                   
                                         
									    //DateCreated.Text = Convert.ToString(Reader["DateCreated"]);
                                       // DateUpdated.Text = Convert.ToString(Reader["DateUpdated"]);
                                        //DriverPolicyNo.Text = Convert.ToString(Reader["DriverPolicyNo"]);      
									     DamageToVehcle.Text = Convert.ToString(Reader["DamageToVehcle"]);
									    RefferedBy.Text = Convert.ToString(Reader["RefferedBy"]);
                                         AccidentLocation.Text = Convert.ToString(Reader["AccidentLocation"]);										 					
                                         AccidentInfo.Text = Convert.ToString(Reader["AccidentInfo"]);
                                         RoadCondition.Text = Convert.ToString(Reader["RoadCondition"]);
                                         WhotoBlame.Text = Convert.ToString(Reader["WhotoBlame"]);
                                         PoliceAttended.Text = Convert.ToString(Reader["PoliceAttended"]);
                                         PoliceOfficerName.Text = Convert.ToString(Reader["PoliceOfficerName"]);
                                         PoliceLogNo.Text = Convert.ToString(Reader["PoliceLogNo"]);
                                         PoliceAddress.Text = Convert.ToString(Reader["PoliceAddress"]);
                                         VehicleRoadworthy.Text = Convert.ToString(Reader["VehicleRoadworthy"]);
						                 GPOtherlosses.Text = Convert.ToString(Reader["OtherLosses"]);
										 InjurySustained.Text = Convert.ToString(Reader["InjuriesSustained"]);									                                         
									     AnyoneInjured.Text = Convert.ToString(Reader["AnyoneInjured"]);
                                         PassengerClaims.Text = Convert.ToString(Reader["PassengerClaims"]);

                                         if (Convert.ToString(Reader["ClaimTypeID"]) == "1")
                                         {

                                             CarHireForm.Visible = false;
                                             PaymentRequestButton.Visible = false;
                                             ViewDates.Visible = false;
                                             IconAddDates.Visible = false;
                                             ClaimAdviceButton1.Visible = false;
                                            

                                         
                                         }

                      



										 if (Convert.ToDateTime(Reader["AccidentDate"]).ToString("dd/MM/yyyy") == DateTime.MaxValue.ToString("dd/MM/yyyy"))
										 {
											 AccidentDate.Text = "";

										 }
										 else {

											 AccidentDate.Text = Convert.ToDateTime(Reader["AccidentDate"]).ToString("dd/MM/yyyy");
										 }


										 if (Convert.ToDateTime(Reader["DOB"]).ToString("dd/MM/yyyy") == DateTime.MaxValue.ToString("dd/MM/yyyy"))
										 {
											 ContactDetails1.DateOfBirth = "";

										 }
										 else
										 {

											 ContactDetails1.DateOfBirth = Convert.ToDateTime(Reader["DOB"]).ToString("dd/MM/yyyy");
										 }



										 if (Convert.ToDateTime(Reader["DateGPAttended"]).ToString("dd/MM/yyyy") == DateTime.MaxValue.ToString("dd/MM/yyyy"))
										 {
											 GPDateAttended.Text = "";

										 }
										 else
										 {

											 GPDateAttended.Text = Convert.ToDateTime(Reader["DateGPAttended"]).ToString("dd/MM/yyyy");
										 }


										 if (Convert.ToDateTime(Reader["DateHospitalAttended"]).ToString("dd/MM/yyyy") == DateTime.MaxValue.ToString("dd/MM/yyyy"))
										 {
											 HospitalDateAttended.Text = "";

										 }
										 else
										 {

											 HospitalDateAttended.Text = Convert.ToDateTime(Reader["DateHospitalAttended"]).ToString("dd/MM/yyyy");
										 }


										 ExistingCFA.Text = Convert.ToString(Reader["ExistingCFA"]);					
										DropDownFirstPartyDealing.Text = Convert.ToString(Reader["FirstPartyDealing"]);					
										RefferedBy.Text = Convert.ToString(Reader["RefferedBy"]);
                                         AnyWitnesses.Text = Convert.ToString(Reader["AnyWitnesses"]);
                                        // ClaimTypeID.Text = Convert.ToString(Reader["ClaimTypeID"]);
                                        // ClaimStatusID.Text = Convert.ToString(Reader["ClaimStatusID"]);
                                        // ContactId.Text = Convert.ToString(Reader["ContactId"]);
                                         PreviousAccidents.Text = Convert.ToString(Reader["PreviousAccidents"]);
                                         PreviousAccidents.Text = Convert.ToString(Reader["PreviousAccidents"]);
                                         ContactDetails1.FirstName = Convert.ToString(Reader["FirstName"]);
                                         ContactDetails1.Country = Convert.ToString(Reader["Country"]);
                                         ContactDetails1.SurName = Convert.ToString(Reader["Surname"]);
                                         ContactDetails1.Address1 = Convert.ToString(Reader["Address1"]);
                                         ContactDetails1.Address2 = Convert.ToString(Reader["Address2"]);
                                         ContactDetails1.City = Convert.ToString(Reader["City"]);
                                         ContactDetails1.Country = Convert.ToString(Reader["Country"]);
                                         ContactDetails1.PostCode = Convert.ToString(Reader["PostCode"]);
                                         ContactDetails1.Phone = Convert.ToString(Reader["Phone"]);
										 ContactDetails1.Mobile = Convert.ToString(Reader["Mobile"]);
                                         ContactDetails1.Fax = Convert.ToString(Reader["Fax"]);
                                         ContactDetails1.Email = Convert.ToString(Reader["Email"]);
										
                                         ContactDetails1.NINumber = Convert.ToString(Reader["NINO"]);

										 ContactDetails1.DriverInsurers = Convert.ToString(Reader["DriverInsurers"]);
										 ContactDetails1.DriverPolicyNo = Convert.ToString(Reader["DriverPolicyNo"]);

										 AdditionalInfo.Text = Convert.ToString(Reader["AdditionalInfo"]);
						
										 ContactDetails1.ContactID1 = Convert.ToString(Reader["ContactID"]);
										 ClaimUpdateID.Value = Reader["ClaimId"].ToString();
										 AllocateClaimUpdateID.Value = Reader["ClaimId"].ToString();

										 int ClaimTypeIDValue = Convert.ToInt32(Reader["ClaimTypeID"]);
										 this.ClaimType.SelectedIndex = Convert.ToInt32(ClaimTypeIDValue) -1;
										 if (ClaimTypeIDValue == 2|| ClaimTypeIDValue == 3)
										 {
											Panel1.Visible = true;
										 
										 }

									
										
										
										 
										 }

                                
                            }

						
							Cmd.Parameters.Clear();
							

							Cmd.Parameters.AddWithValue("ClaimId", ClaimId);
							//  string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
							sSQL = "Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and Claim.ClaimID=ClaimContact.ClaimID and ClaimContact.ContactId = Contact.ContactID and Contact.ContactTypeId=8";
							Cmd.CommandText = sSQL;
							using (SqlDataReader Reader = Cmd.ExecuteReader())
							{
								if (Reader.Read())
								{
								

								
											PFirstName.Text = Convert.ToString(Reader["FirstName"]);
											PSurname.Text = Convert.ToString(Reader["Surname"]);
											PAddress1.Text = Convert.ToString(Reader["Address1"]);
											PAddress2.Text = Convert.ToString(Reader["Address2"]);
											PCity.Text = Convert.ToString(Reader["City"]);
											PPostCode.Text = Convert.ToString(Reader["PostCode"]);
											PPhone.Text = Convert.ToString(Reader["Phone"]);
											PMobile.Text = Convert.ToString(Reader["Mobile"]);
											PPhone.Text = Convert.ToString(Reader["Phone"]);
											PDriverPolicyNo.Text = Convert.ToString(Reader["DriverPolicyNo"]);
											PInsuranceCover.Text = Convert.ToString(Reader["DriverInsurers"]);
											PInsuranceReferenceNo.Text = Convert.ToString(Reader["InsuranceReferenceNo"]);
											PartyatFaultUpdateID.Value = Convert.ToString(Reader["ContactID"]);
											PartyatFaultValue = Convert.ToInt32(Reader["ContactID"]);
										


								}
							}


						
							Cmd.Parameters.Clear();

							Cmd.Parameters.AddWithValue("ClaimId", ClaimId);
							//  string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
							sSQL = "Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and Claim.ClaimID=ClaimContact.ClaimID and ClaimContact.ContactId = Contact.ContactID and Contact.ContactTypeId=10";
							Cmd.CommandText = sSQL;
							using (SqlDataReader Reader = Cmd.ExecuteReader())
							{
								if (Reader.Read())
								{



									GPFirstName.Text = Convert.ToString(Reader["FirstName"]);
									GPSurname.Text = Convert.ToString(Reader["Surname"]);
									GPAddress1.Text = Convert.ToString(Reader["Address1"]);
									GPAddress2.Text = Convert.ToString(Reader["Address2"]);
									GPCityName.Text = Convert.ToString(Reader["City"]);
									GPPostCode.Text = Convert.ToString(Reader["PostCode"]);
									GPPhone.Text = Convert.ToString(Reader["Phone"]);
									//PartyatFaultUpdate = Convert.ToInt32(Reader["ContactID"]);
									GPUpdateID.Value = Convert.ToString(Reader["ContactID"]);



								}
							}



							Cmd.Parameters.Clear();

							Cmd.Parameters.AddWithValue("ClaimId", ClaimId);
							//  string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
							sSQL = "Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and Claim.ClaimID=ClaimContact.ClaimID and ClaimContact.ContactId = Contact.ContactID and Contact.ContactTypeId=11";
							Cmd.CommandText = sSQL;
							using (SqlDataReader Reader = Cmd.ExecuteReader())
							{
								if (Reader.Read())
								{



									HospitalName.Text = Convert.ToString(Reader["FirstName"]);
									Department.Text = Convert.ToString(Reader["Surname"]);
									HospitalAddress1.Text = Convert.ToString(Reader["Address1"]);
									HospitalAddress2.Text = Convert.ToString(Reader["Address2"]);
									HospitalCity.Text = Convert.ToString(Reader["City"]);
									HospitalPostCode.Text = Convert.ToString(Reader["PostCode"]);
									HospitalPhone.Text = Convert.ToString(Reader["Phone"]);
									//PartyatFaultUpdate = Convert.ToInt32(Reader["ContactID"]);
									HospitalUpdatID.Value = Convert.ToString(Reader["ContactID"]);



								}
							}



							Cmd.Parameters.Clear();

							Cmd.Parameters.AddWithValue("ClaimId", ClaimId);
							//  string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
							sSQL = "Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and Claim.ClaimID=ClaimContact.ClaimID and ClaimContact.ContactId = Contact.ContactID and Contact.ContactTypeId=9";
							Cmd.CommandText = sSQL;
							using (SqlDataReader Reader = Cmd.ExecuteReader())
							{
								if (Reader.Read())
								{



									OwnerFirstName.Text = Convert.ToString(Reader["FirstName"]);
									OwnerSurname.Text = Convert.ToString(Reader["Surname"]);
									OwnerAddress111.Text = Convert.ToString(Reader["Address1"]);
									OwnerAddress2.Text = Convert.ToString(Reader["Address2"]);
									OwnerCity.Text = Convert.ToString(Reader["City"]);
									OwnerPostCode.Text = Convert.ToString(Reader["PostCode"]);
									OwnerPhoneNo.Text = Convert.ToString(Reader["Phone"]);
									OwnerInsuranceCover.Text = Convert.ToString(Reader["DriverInsurers"]);
									OwnerDriverPolicyNo22.Text = Convert.ToString(Reader["DriverPolicyNo"]);
									VehicleOwnerUpdateID.Value = Convert.ToString(Reader["ContactID"]);
									VehicleOwnerID = Convert.ToInt32(Reader["ContactID"]);




								}
							}


							Cmd.Parameters.Clear();

							Cmd.Parameters.AddWithValue("ClaimId", ClaimId);
							Cmd.Parameters.AddWithValue("VehicleOwnerId", VehicleOwnerID);
							//  string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
							sSQL = "Select * from Vehicle where VehicleOwnerId=@VehicleOwnerId and ClaimId = @ClaimId";
							Cmd.CommandText = sSQL;
							using (SqlDataReader Reader = Cmd.ExecuteReader())
							{
								if (Reader.Read())
								{

									VehicleMake.Text = Convert.ToString(Reader["VehicleMake"]);
									VehicleModel.Text = Convert.ToString(Reader["VehicleModel"]);
									VehicleReg.Text = Convert.ToString(Reader["VehicleReg"]);					
									VehicleUpdateId.Value = Convert.ToString(Reader["VehicleId"]);
								}
							}


							Cmd.Parameters.Clear();

							
							Cmd.Parameters.AddWithValue("ClaimId", ClaimId);
							Cmd.Parameters.AddWithValue("VehicleOwnerId", PartyatFaultValue);
							//  string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
							sSQL = "Select * from Vehicle where VehicleOwnerId=@VehicleOwnerId and ClaimId = @ClaimId";
							Cmd.CommandText = sSQL;
							using (SqlDataReader Reader = Cmd.ExecuteReader())
							{
								if (Reader.Read())
								{

									PVehicleMake.Text = Convert.ToString(Reader["VehicleMake"]);
									PVehileModel.Text = Convert.ToString(Reader["VehicleModel"]);
									PVehicleReg.Text = Convert.ToString(Reader["VehicleReg"]);
									PVehicleRoadworthy.Text = Convert.ToString(Reader["VehicleRoadWorthy"]);
									PVehicleUpdateID.Value = Convert.ToString(Reader["VehicleId"]);
									
								}
							}

							Cmd.Parameters.Clear();


							Cmd.Parameters.AddWithValue("ClaimId", ClaimId);
							//  string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
							sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and Claim.ClaimID=ClaimContact.ClaimID and ClaimContact.ContactId = Contact.ContactID and Contact.ContactTypeId=6");
							Cmd.CommandText = sSQL;
							using (SqlDataReader Reader = Cmd.ExecuteReader())
							{
								if (Reader.HasRows)
								{
									int counter = 0;

									while (Reader.Read())
									{



										if (counter == 0)
										{

											W1FirstName.Text = Convert.ToString(Reader["FirstName"]);
											W1Surname.Text = Convert.ToString(Reader["Surname"]);
											W1Address1.Text = Convert.ToString(Reader["Address1"]);
											W1Address2.Text = Convert.ToString(Reader["Address2"]);
											W1CityTitle.Text = Convert.ToString(Reader["City"]);
											W1Postcode.Text = Convert.ToString(Reader["PostCode"]);
											W1Phone.Text = Convert.ToString(Reader["Phone"]);
											WitnessID1Update = Convert.ToInt32(Reader["ContactID"]);
											W1Mobile.Text = Convert.ToString(Reader["Mobile"]);
											//W1Fax.Text = Convert.ToString(Reader["Fax"]);
											//W1Email.Text = Convert.ToString(Reader["Email"]);
											WitnessID1UpdateID.Value = Convert.ToString(Reader["ContactID"]);
											counter++;
										}


										if (counter == 1)
										{

											W2FirstName.Text = Convert.ToString(Reader["FirstName"]);
											W2Surname.Text = Convert.ToString(Reader["Surname"]);
											W2Address1.Text = Convert.ToString(Reader["Address1"]);
											W2Address2.Text = Convert.ToString(Reader["Address2"]);
											W2City.Text = Convert.ToString(Reader["City"]);
											W2Postcode.Text = Convert.ToString(Reader["PostCode"]);
											W2Phone.Text = Convert.ToString(Reader["Phone"]);
											W2Mobile.Text = Convert.ToString(Reader["Mobile"]);
											WitnessID2Update = Convert.ToInt32(Reader["ContactID"]);
											WitnessID2UpdateID.Value = Convert.ToString(Reader["ContactID"]);

										}

										
									}




								}
							}


							Cmd.Parameters.Clear();


							Cmd.Parameters.AddWithValue("ClaimID", ClaimId);
					
							//  string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
							sSQL = "Select * from ClaimContact, Contact where Contact.ContactID = ClaimContact.ContactID and ClaimContact.ClaimID=@ClaimID";
							Cmd.CommandText = sSQL;
							using (SqlDataReader Reader = Cmd.ExecuteReader())
							{
								while (Reader.Read())
								{

									int ContactTypeID = Convert.ToInt32(Reader["ContactTypeID"]);



							if (ContactTypeID == 1)
								{
										AllocateInsurance.SelectedValue = Convert.ToString(Reader["ContactID"]);
								}
								
							if (ContactTypeID == 2)
									{

										AllocateSolicitor.SelectedValue = Convert.ToString(Reader["ContactID"]);


							}
							if (ContactTypeID == 3)
							{

								AllocateEngineer.SelectedValue = Convert.ToString(Reader["ContactID"]);


							}
							if (ContactTypeID == 4)
							{

								AllocateCarhire.SelectedValue = Convert.ToString(Reader["ContactID"]);


							}
							if (ContactTypeID == 5)
							{

								AllocateStorage.SelectedValue = Convert.ToString(Reader["ContactID"]);


							}

									
								}
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


                }




            }
        }

        protected void Button1_Click(object sender, ImageClickEventArgs e)
        {
            //TabContainer1.ActiveTab = TabContainer1.Tabs[1];
        }

        protected void Button2_Click(object sender, ImageClickEventArgs e)
        {
            //TabContainer1.ActiveTab = TabContainer1.Tabs[0];
        }

        protected void Button3_Click(object sender, ImageClickEventArgs e)
        {
           // TabContainer1.ActiveTab = TabContainer1.Tabs[2];
        }

        protected void Button4_Click(object sender, ImageClickEventArgs e)
        {
           // TabContainer1.ActiveTab = TabContainer1.Tabs[1];
        }

        protected void Button5_Click(object sender, ImageClickEventArgs e)
        {
           // TabContainer1.ActiveTab = TabContainer1.Tabs[3];
        }
        protected void PartatFaultNext(object sender, ImageClickEventArgs e)
        {
           // TabContainer1.ActiveTab = TabContainer1.Tabs[3];
        }
        protected void PartatFaultBack(object sender, ImageClickEventArgs e)
		{
			//TabContainer1.ActiveTab = TabContainer1.Tabs[1];
		}

 


        protected void WitnessBtnNext(object sender, ImageClickEventArgs e)
		{
			//TabContainer1.ActiveTab = TabContainer1.Tabs[4];
		}
        protected void WitnessBtnBack(object sender, ImageClickEventArgs e)
		{
			//TabContainer1.ActiveTab = TabContainer1.Tabs[2];
		}

        protected void GPNEXT_Click(object sender, ImageClickEventArgs e)
        {
           // TabContainer1.ActiveTab = TabContainer1.Tabs[5];
        }

        protected void GPBACK_Click(object sender, ImageClickEventArgs e)
        {
           // TabContainer1.ActiveTab = TabContainer1.Tabs[3];
        }

    

      

        protected void UpdateClaimClick(object sender, ImageClickEventArgs e)
        {


			//Update Owner and contact Details for Client
	
#region 

			
			try
				{

					

					string FirstName = ContactDetails1.FirstName;
                    string SurName = ContactDetails1.SurName;
                    string Phone = ContactDetails1.Phone;
                    string Mobile = ContactDetails1.Mobile;
                    string Address1 = ContactDetails1.Address1;
                    string Address2 = ContactDetails1.Address2; 
                    string PostCode = ContactDetails1.PostCode;
                    string City = ContactDetails1.City;
                    string Country = ContactDetails1.Country;
                    string Fax = ContactDetails1.Fax;
                    string Email = ContactDetails1.Email;
                    string DateOfBirth = ContactDetails1.DateOfBirth;                 
                    string NINumber = ContactDetails1.NINumber;
                    string DOB = ContactDetails1.DateOfBirth;
				    string ContactID1 = ContactDetails1.ContactID1;
					string DriverPolicyNo = ContactDetails1.DriverPolicyNo;
					string DriverInsurers = ContactDetails1.DriverInsurers;
					
					FileUpload FileUpload1 = ContactDetails1.FileUpload;
                 
                    using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                    {
                        conn.Open();
                        using (SqlCommand cmd = conn.CreateCommand())
                        {

							//Update Cotnact Details for Client

							#region 

							string extension = string.Empty;
							string strFileName = string.Empty;

							if (FileUpload1.HasFile)
							{

								HttpPostedFile PostedFileValue = ContactDetails1.FileUpload.PostedFile;

								int FileSizeKB = PostedFileValue.ContentLength / 1024;

								extension = System.IO.Path.GetExtension(PostedFileValue.FileName).ToLower();
								strFileName = System.IO.Path.GetFileNameWithoutExtension(PostedFileValue.FileName).ToLower();

								if ((extension != ".jpg" && extension != ".jpeg" && extension != ".gif" && extension != ".png") || (FileSizeKB > 500))
								{
									System.Text.StringBuilder stringBuilder = new System.Text.StringBuilder();

									stringBuilder.Append("<span style=\"color:Red;font-weight:bold;font-size:14px;\">Invalid image format. Only jpeg,jpg,gif,png images are permited not more than 1024 KB</span>");
									stringBuilder.Append(string.Format("<br/> <span style=\"color:Black;font-weight:bold;font-size:14px;\">File Extension : {0}", extension));
									stringBuilder.Append(string.Format(" File Size:  {0}(KB):", FileSizeKB) + "</span><br/>");

									//Msg.InnerHtml = stringBuilder.ToString();

									return;
								}

								ContactDetails1.FileUpload.SaveAs(Server.MapPath("~/Images") + "/" + strFileName + extension);
							}
							if (DOB != "")
							{
						     	cmd.Parameters.AddWithValue("DOB", Convert.ToDateTime(DOB).ToString("yyyy/MM/dd"));

							}

							else
							{
								cmd.Parameters.AddWithValue("DOB", Convert.ToDateTime(DateTime.MaxValue).ToString("yyyy/MM/dd"));

							}

                            cmd.CommandType = CommandType.Text;
                            cmd.Parameters.AddWithValue("FirstName", FirstName);
                            cmd.Parameters.AddWithValue("Surname", SurName);
                            cmd.Parameters.AddWithValue("Address1", Address1);
                            cmd.Parameters.AddWithValue("Address2", Address2);
                            cmd.Parameters.AddWithValue("City", City);
                            cmd.Parameters.AddWithValue("PostCode", PostCode);
                            cmd.Parameters.AddWithValue("Country", Country);
                            //cmd.Parameters.AddWithValue("Company", Company);
                            cmd.Parameters.AddWithValue("Phone", Phone);
                            cmd.Parameters.AddWithValue("Mobile", Mobile);
                            cmd.Parameters.AddWithValue("Fax", Fax);  
                            cmd.Parameters.AddWithValue("Email", Email);                                            
                        
                            cmd.Parameters.AddWithValue("NINO", NINumber);

							cmd.Parameters.AddWithValue("DriverInsurers", DriverInsurers);
							cmd.Parameters.AddWithValue("DriverPolicyNo", DriverPolicyNo);
								

							cmd.Parameters.AddWithValue("ContactTypeID", "7");
							cmd.Parameters.AddWithValue("ContactID", ContactID1);
							cmd.Parameters.AddWithValue("ContactImage", "Images/" + strFileName + extension);



							cmd.CommandText = "Update Contact SET FirstName = @FirstName, Surname = @Surname,  Address1 = @Address1, Address2 =  @Address2 , City = @City , PostCode = @PostCode, Country = @Country, Phone = @Phone, Mobile = @Mobile , DOB = @DOB , Fax = @Fax, Email = @Email, NINo=@NINo, ContactTypeID=@ContactTypeID, DriverInsurers = @DriverInsurers, DriverPolicyNo=@DriverPolicyNo, ContactImage = @ContactImage where ContactID=@ContactID";
				

                            if (cmd.ExecuteNonQuery() > 0)
                            {


                              msg.InnerHtml = cmd.CommandText.ToString();



							}

					#endregion 
							
							
							//Update Owner Details 	

							#region 

							if (OwnerDetailsDropDown.SelectedItem.Value == "Yes")
							{

								cmd.Parameters.Clear();

								cmd.CommandType = CommandType.Text;
								cmd.Parameters.AddWithValue("FirstName", FirstName);
								cmd.Parameters.AddWithValue("Surname", SurName);
								cmd.Parameters.AddWithValue("Address1", Address1);
								cmd.Parameters.AddWithValue("Address2", Address2);
								cmd.Parameters.AddWithValue("City", City);
								cmd.Parameters.AddWithValue("PostCode", PostCode);
								cmd.Parameters.AddWithValue("Country",Country);
								//cmd.Parameters.AddWithValue("Company", Company);
								cmd.Parameters.AddWithValue("Phone", Phone);
						

								cmd.Parameters.AddWithValue("DriverInsurers", ContactDetails1.DriverInsurers);
								cmd.Parameters.AddWithValue("DriverPolicyNo", ContactDetails1.DriverPolicyNo);


								cmd.Parameters.AddWithValue("ContactTypeID", "9");
								cmd.Parameters.AddWithValue("ContactID", ContactID1);
							

								cmd.CommandText = "Update Contact SET FirstName = @FirstName, Surname = @Surname,  Address1 = @Address1, Address2 =  @Address2 , City = @City , PostCode = @PostCode, Country = @Country, Phone = @Phone,  ContactTypeID=@ContactTypeID, DriverInsurers = @DriverInsurers, DriverPolicyNo=@DriverPolicyNo where ContactID=@ContactID";


								if (cmd.ExecuteNonQuery() > 0)
								{


									msg.InnerHtml = cmd.CommandText.ToString();



								}
							}


							cmd.Parameters.Clear();
							#endregion

						}

                    }
              
                }
                catch (Exception EXC)
                {
                    Console.Write(EXC.ToString());
                }
                finally
                {
                    //ResGridView1ult.Text = "Room updated successfully! ";
				}

#endregion 


				    
			//Update all contacts and Claim
			     
			#region
			 
			try
				{

					// Update Party at Fault Details
					#region

					using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                   {
                      conn.Open();
                       using (SqlCommand cmd = conn.CreateCommand())
                    {
						cmd.CommandType = CommandType.Text;
						cmd.Parameters.AddWithValue("FirstName", PFirstName.Text);
						cmd.Parameters.AddWithValue("Surname", PSurname.Text);
						cmd.Parameters.AddWithValue("Address1", PAddress1.Text);
						cmd.Parameters.AddWithValue("Address2", PAddress2.Text);
						cmd.Parameters.AddWithValue("City", PCity.Text);
						cmd.Parameters.AddWithValue("PostCode",PPostCode.Text);						
						cmd.Parameters.AddWithValue("Phone", PPhone.Text);
						cmd.Parameters.AddWithValue("Mobile", PMobile.Text);				
						cmd.Parameters.AddWithValue("ContactTypeID", "8");				
						cmd.Parameters.AddWithValue("ContactID", PartyatFaultUpdateID.Value);

						cmd.Parameters.AddWithValue("DriverPolicyNo", PDriverPolicyNo.Text);
						cmd.Parameters.AddWithValue("DriverInsurers", PInsuranceCover.Text);
						cmd.Parameters.AddWithValue("InsuranceReferenceNo", PInsuranceReferenceNo.Text);
				  //int ClaimID = -1;

				  //using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
				  //{
				  //    if (dataReader.RecordsAffected > 0 && dataReader.Read())
				  //        ClaimID = Convert.ToInt32(dataReader["Id"]);
				  //    dataReader.Close();
				  //}


						cmd.CommandText = "Update Contact SET FirstName = @FirstName, Surname = @Surname,  Address1 = @Address1, Address2 =  @Address2 , City = @City , PostCode = @PostCode, Phone = @Phone, Mobile = @Mobile , DriverPolicyNo = @DriverPolicyNo, DriverInsurers= @DriverInsurers, InsuranceReferenceNo = @InsuranceReferenceNo  ,  ContactTypeID=@ContactTypeID where ContactID=@ContactID";
						if (cmd.ExecuteNonQuery() > 0)
								  {
									 msg.InnerHtml = cmd.CommandText.ToString();

								   }

							cmd.Parameters.Clear();
						
					   }



				   }

				#endregion

					//Update Vehicle Details for party at fault

					#region


					using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
					{
						conn.Open();
						using (SqlCommand cmd = conn.CreateCommand())
						{

							cmd.CommandType = CommandType.Text;
							cmd.Parameters.AddWithValue("VehicleMake", PVehicleMake.Text);
							cmd.Parameters.AddWithValue("VehicleModel", PVehileModel.Text);
							cmd.Parameters.AddWithValue("VehicleReg", PVehicleReg.Text);
							cmd.Parameters.AddWithValue("VehicleId", PVehicleUpdateID.Value);
							cmd.Parameters.AddWithValue("VehicleRoadworthy", PVehicleRoadworthy.Text);
						


							cmd.CommandText = "Update Vehicle SET VehicleMake = @VehicleMake, VehicleModel = @VehicleModel,  VehicleReg = @VehicleReg, VehicleRoadworthy=@VehicleRoadworthy where VehicleId=@VehicleId";
							if (cmd.ExecuteNonQuery() > 0)
							{
								msg.InnerHtml = cmd.CommandText.ToString();

							}

							cmd.Parameters.Clear();

						}

					}

					#endregion 

					// Update GP details

					#region 

					using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
					{
						conn.Open();
						using (SqlCommand cmd = conn.CreateCommand())
						{


							

							cmd.CommandType = CommandType.Text;
							cmd.Parameters.AddWithValue("FirstName", GPFirstName.Text);
							cmd.Parameters.AddWithValue("Surname", GPSurname.Text);
							cmd.Parameters.AddWithValue("Address1", GPAddress1.Text);
							cmd.Parameters.AddWithValue("Address2", GPAddress2.Text);
							cmd.Parameters.AddWithValue("City", GPCityName.Text);
							cmd.Parameters.AddWithValue("PostCode", GPPostCode.Text);						
							cmd.Parameters.AddWithValue("Country", "");
							cmd.Parameters.AddWithValue("Phone", GPPhone.Text);
							cmd.Parameters.AddWithValue("Mobile","");
							cmd.Parameters.AddWithValue("DOB", "");
							cmd.Parameters.AddWithValue("NINO", "");
							cmd.Parameters.AddWithValue("ContactTypeID", "10");
							cmd.Parameters.AddWithValue("Fax", "");
							cmd.Parameters.AddWithValue("Email", "");
							cmd.Parameters.AddWithValue("ContactID", GPUpdateID.Value);



							//int ClaimID = -1;

							//using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
							//{
							//    if (dataReader.RecordsAffected > 0 && dataReader.Read())
							//        ClaimID = Convert.ToInt32(dataReader["Id"]);
							//    dataReader.Close();
							//}


							cmd.CommandText = "Update Contact SET FirstName = @FirstName, Surname = @Surname,  Address1 = @Address1, Address2 =  @Address2 , City = @City , PostCode = @PostCode, Country = @Country, Phone = @Phone, Mobile = @Mobile , Fax = @Fax, Email = @Email, NINo=@NINo, ContactTypeID=@ContactTypeID where ContactID=@ContactID";
							if (cmd.ExecuteNonQuery() > 0)
							{
								msg.InnerHtml = cmd.CommandText.ToString();

							}

							cmd.Parameters.Clear();

						}



					}
					#endregion 

					// Update Hopital  details

					#region 

					using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
					{
						conn.Open();
						using (SqlCommand cmd = conn.CreateCommand())
						{
							cmd.CommandType = CommandType.Text;
							cmd.Parameters.AddWithValue("FirstName", HospitalName.Text);
							cmd.Parameters.AddWithValue("Surname", Department.Text);
							cmd.Parameters.AddWithValue("Address1", HospitalAddress1.Text);
							cmd.Parameters.AddWithValue("Address2", HospitalAddress2.Text);
							cmd.Parameters.AddWithValue("City", HospitalCity.Text);
							cmd.Parameters.AddWithValue("PostCode", HospitalPostCode.Text);
							cmd.Parameters.AddWithValue("Country", "");
							cmd.Parameters.AddWithValue("Phone", HospitalPhone.Text);
							cmd.Parameters.AddWithValue("Mobile", "");
							cmd.Parameters.AddWithValue("DOB", "");
							cmd.Parameters.AddWithValue("NINO", "");
							cmd.Parameters.AddWithValue("ContactTypeID", "11");
							cmd.Parameters.AddWithValue("Fax", "");
							cmd.Parameters.AddWithValue("Email", "");
							cmd.Parameters.AddWithValue("ContactID", HospitalUpdatID.Value);




							//int ClaimID = -1;

							//using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
							//{
							//    if (dataReader.RecordsAffected > 0 && dataReader.Read())
							//        ClaimID = Convert.ToInt32(dataReader["Id"]);
							//    dataReader.Close();
							//}


							cmd.CommandText = "Update Contact SET FirstName = @FirstName, Surname = @Surname,  Address1 = @Address1, Address2 =  @Address2 , City = @City , PostCode = @PostCode, Country = @Country, Phone = @Phone, Mobile = @Mobile , Fax = @Fax, Email = @Email, NINo=@NINo, ContactTypeID=@ContactTypeID where ContactID=@ContactID";
							if (cmd.ExecuteNonQuery() > 0)
							{
								msg.InnerHtml = cmd.CommandText.ToString();

							}

							cmd.Parameters.Clear();

						}



					}


					#endregion 

					// Update Witness 1 details

					#region 
					using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
					{
						conn.Open();
						using (SqlCommand cmd = conn.CreateCommand())
						{
							
							
							cmd.CommandType = CommandType.Text;
							cmd.Parameters.AddWithValue("FirstName", W1FirstName.Text);
							cmd.Parameters.AddWithValue("Surname", W1Surname.Text);
							cmd.Parameters.AddWithValue("Address1", W1Address1.Text);
							cmd.Parameters.AddWithValue("Address2", W1Address2.Text);
							cmd.Parameters.AddWithValue("City", W1CityTitle.Text);
							cmd.Parameters.AddWithValue("Country", " ");
							cmd.Parameters.AddWithValue("PostCode", W1Postcode.Text);			
							cmd.Parameters.AddWithValue("Phone", W1Phone.Text);
							cmd.Parameters.AddWithValue("Mobile", W1Mobile.Text);
							cmd.Parameters.AddWithValue("ContactTypeID", "6");
							cmd.Parameters.AddWithValue("Fax", "");
							cmd.Parameters.AddWithValue("Email", "");
							cmd.Parameters.AddWithValue("DOB", "");
							cmd.Parameters.AddWithValue("NINO", "");
							cmd.Parameters.AddWithValue("ContactID", WitnessID1UpdateID.Value);
						



							//int ClaimID = -1;

							//using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
							//{
							//    if (dataReader.RecordsAffected > 0 && dataReader.Read())
							//        ClaimID = Convert.ToInt32(dataReader["Id"]);
							//    dataReader.Close();
							//}


							cmd.CommandText = "Update Contact SET FirstName = @FirstName, Surname = @Surname,  Address1 = @Address1, Address2 =  @Address2 , City = @City , PostCode = @PostCode, Country = @Country, Phone = @Phone, Mobile = @Mobile , Fax = @Fax, Email = @Email, NINo=@NINo, ContactTypeID=@ContactTypeID  where ContactID=@ContactID";
							if (cmd.ExecuteNonQuery() > 0)
							{
								msg.InnerHtml = cmd.CommandText.ToString();

							}

							cmd.Parameters.Clear();
					
						}

					}

					#endregion 

					// Update Witness  2 details
					#region 
					using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
					{
						conn.Open();
						using (SqlCommand cmd = conn.CreateCommand())
						{


							cmd.CommandType = CommandType.Text;
							cmd.Parameters.AddWithValue("FirstName", W2FirstName.Text);
							cmd.Parameters.AddWithValue("Surname", W2Surname.Text);
							cmd.Parameters.AddWithValue("Address1", W2Address1.Text);
							cmd.Parameters.AddWithValue("Address2", W2Address2.Text);
							cmd.Parameters.AddWithValue("City", W2City.Text);
							cmd.Parameters.AddWithValue("Country", " ");
							cmd.Parameters.AddWithValue("PostCode", W2Postcode.Text);
							cmd.Parameters.AddWithValue("Phone", W2Phone.Text);
							cmd.Parameters.AddWithValue("Mobile", W2Mobile.Text);
							cmd.Parameters.AddWithValue("ContactTypeID", "6");
							cmd.Parameters.AddWithValue("Fax", "");
							cmd.Parameters.AddWithValue("Email", "");
							cmd.Parameters.AddWithValue("DOB", "");
							cmd.Parameters.AddWithValue("NINO", "");
							cmd.Parameters.AddWithValue("ContactID", WitnessID2UpdateID.Value);
						
						
							


							//int ClaimID = -1;

							//using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
							//{
							//    if (dataReader.RecordsAffected > 0 && dataReader.Read())
							//        ClaimID = Convert.ToInt32(dataReader["Id"]);
							//    dataReader.Close();
							//}


							cmd.CommandText = "Update Contact SET FirstName = @FirstName, Surname = @Surname,  Address1 = @Address1, Address2 =  @Address2 , City = @City , PostCode = @PostCode, Country = @Country, Phone = @Phone, Mobile = @Mobile , Fax = @Fax, Email = @Email, NINo=@NINo, ContactTypeID=@ContactTypeID  where ContactID=@ContactID";
							

							if (cmd.ExecuteNonQuery() > 0)
							{
								msg.InnerHtml = cmd.CommandText.ToString();

							}

							cmd.Parameters.Clear();
						
						}

					}
#endregion 

					// Update Owner as driver 
		
					#region 
					if (OwnerDetailsDropDown.SelectedItem.Value == "No")
							{


								using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
								{
									conn.Open();
									using (SqlCommand cmd = conn.CreateCommand())
									{


										cmd.CommandType = CommandType.Text;
										cmd.Parameters.AddWithValue("FirstName", OwnerFirstName.Text);
										cmd.Parameters.AddWithValue("Surname", OwnerSurname.Text);
										cmd.Parameters.AddWithValue("Address1", OwnerAddress111.Text);
										cmd.Parameters.AddWithValue("Address2", OwnerAddress2.Text);
										cmd.Parameters.AddWithValue("City", OwnerCity.Text);
										cmd.Parameters.AddWithValue("Country", " ");
										cmd.Parameters.AddWithValue("PostCode", OwnerPostCode.Text);
										cmd.Parameters.AddWithValue("Phone", OwnerPhoneNo.Text);
										cmd.Parameters.AddWithValue("Mobile", "");
										cmd.Parameters.AddWithValue("ContactTypeID", "9");


										cmd.Parameters.AddWithValue("DriverInsurers", ContactDetails1.DriverInsurers);
										cmd.Parameters.AddWithValue("DriverPolicyNo", ContactDetails1.DriverPolicyNo);


										cmd.Parameters.AddWithValue("Fax", "");
										cmd.Parameters.AddWithValue("Email", "");
										cmd.Parameters.AddWithValue("DOB", "");
										cmd.Parameters.AddWithValue("NINO", "");
										cmd.Parameters.AddWithValue("ContactID", VehicleOwnerUpdateID.Value);

										//int ClaimID = -1;
										//using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
										//{
										//    if (dataReader.RecordsAffected > 0 && dataReader.Read())
										//        ClaimID = Convert.ToInt32(dataReader["Id"]);
										//    dataReader.Close();
										//}


										cmd.CommandText = "Update Contact SET FirstName = @FirstName, Surname = @Surname,  Address1 = @Address1, Address2 =  @Address2 , City = @City , PostCode = @PostCode, Country = @Country, Phone = @Phone, Mobile = @Mobile , Fax = @Fax, Email = @Email, NINo=@NINo, ContactTypeID=@ContactTypeID, DriverInsurers  = @DriverInsurers, DriverPolicyNo = @DriverPolicyNo  where ContactID=@ContactID";


										if (cmd.ExecuteNonQuery() > 0)
										{
											msg.InnerHtml = cmd.CommandText.ToString();

										}

										cmd.Parameters.Clear();

									}
								}

							}

					#endregion 
					
					//Update Vehicle Details 

					#region 


					using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
					{
						conn.Open();
						using (SqlCommand cmd = conn.CreateCommand())
						{
					
							cmd.CommandType = CommandType.Text;
							cmd.Parameters.AddWithValue("VehicleMake", VehicleMake.Text);
							cmd.Parameters.AddWithValue("VehicleModel", VehicleModel.Text);
							cmd.Parameters.AddWithValue("VehicleReg", VehicleReg.Text);						
							cmd.Parameters.AddWithValue("VehicleId", VehicleUpdateId.Value);
							cmd.Parameters.AddWithValue("VehicleRoadworthy", VehicleRoadworthy.Text);


							cmd.CommandText = "Update Vehicle SET VehicleMake = @VehicleMake, VehicleModel = @VehicleModel,  VehicleReg = @VehicleReg, VehicleRoadworthy=@VehicleRoadworthy where VehicleId=@VehicleId";
							if (cmd.ExecuteNonQuery() > 0)
							{
								msg.InnerHtml = cmd.CommandText.ToString();

							}

							cmd.Parameters.Clear();

						}

					}

					#endregion 

					//update Claim Values
					#region 
					using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
					{
						conn.Open();
						using (SqlCommand cmd = conn.CreateCommand())
						{



							if (AccidentDate.Text != "")
							{
								cmd.Parameters.AddWithValue("AccidentDate", Convert.ToDateTime(AccidentDate.Text).ToString("yyyy/MM/dd"));

							}

							else
							{
								cmd.Parameters.AddWithValue("AccidentDate", DateTime.MaxValue);

							}

							////////////////////


							if (HospitalDateAttended.Text != "")
							{
								cmd.Parameters.AddWithValue("DateHospitalAttended", Convert.ToDateTime(HospitalDateAttended.Text).ToString("yyyy/MM/dd"));

							}

							else
							{
								cmd.Parameters.AddWithValue("DateHospitalAttended", DateTime.MaxValue);

							}

							//////////////////////


							if (GPDateAttended.Text != "")
							{
								cmd.Parameters.AddWithValue("DateGPAttended", Convert.ToDateTime(GPDateAttended.Text).ToString("yyyy/MM/dd"));

							}

							else
							{
								cmd.Parameters.AddWithValue("DateGPAttended", DateTime.MaxValue);

							}


   
					cmd.CommandType = CommandType.Text;

							cmd.Parameters.AddWithValue("ClaimTitle", ClaimTitle.Text);
							cmd.Parameters.AddWithValue("DateUpdated", Convert.ToDateTime(DateTime.Now).ToString("yyyy/MM/dd HH:mm:ss"));
					
							cmd.Parameters.AddWithValue("AccidentLocation", AccidentLocation.Text);
							cmd.Parameters.AddWithValue("AccidentInfo", AccidentInfo.Text);
							cmd.Parameters.AddWithValue("RoadCondition", RoadCondition.Text);
							cmd.Parameters.AddWithValue("WhotoBlame", WhotoBlame.Text);
							cmd.Parameters.AddWithValue("PoliceAttended", PoliceAttended.Text);
							cmd.Parameters.AddWithValue("PoliceOfficerName",PoliceOfficerName.Text);
							cmd.Parameters.AddWithValue("PoliceLogNo",PoliceLogNo.Text);
							cmd.Parameters.AddWithValue("PoliceAddress", PoliceAddress.Text);							
							cmd.Parameters.AddWithValue("DamageToVehcle", DamageToVehcle.Text);	
							
							cmd.Parameters.AddWithValue("AdditionalInfo", AdditionalInfo.Text);
							cmd.Parameters.AddWithValue("AnyoneInjured", AnyoneInjured.Text);
							cmd.Parameters.AddWithValue("ExistingCFA", ExistingCFA.Text);
							cmd.Parameters.AddWithValue("PassengerClaims", PassengerClaims.Text);
							cmd.Parameters.AddWithValue("RefferedBy", RefferedBy.Text);
							cmd.Parameters.AddWithValue("FirstPartyDealing", DropDownFirstPartyDealing.SelectedItem.Value);
							cmd.Parameters.AddWithValue("AnyWitnesses", AnyWitnesses.Text);
							cmd.Parameters.AddWithValue("PreviousAccidents", PreviousAccidents.Text);						
							cmd.Parameters.AddWithValue("ClaimTypeID",ClaimType.SelectedItem.Value);						
							cmd.Parameters.AddWithValue("ClaimID",ClaimUpdateID.Value);

							cmd.Parameters.AddWithValue("OtherLosses", GPOtherlosses.Text);
							cmd.Parameters.AddWithValue("InjuriesSustained", InjurySustained.Text);

							
						

							//int ClaimID = -1;

							//using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
							//{
							//    if (dataReader.RecordsAffected > 0 && dataReader.Read())
							//        ClaimID = Convert.ToInt32(dataReader["Id"]);
							//    dataReader.Close();
							//}

							cmd.CommandText = "Update Claim SET ClaimTitle = @ClaimTitle ,DateUpdated = @DateUpdated ,RefferedBy = @RefferedBy,AccidentLocation  = @AccidentLocation,AccidentDate  = @AccidentDate,AccidentInfo = @AccidentInfo,RoadCondition = @RoadCondition ,WhotoBlame = @WhotoBlame,PoliceAttended = @PoliceAttended,PoliceOfficerName = @PoliceOfficerName,PoliceLogNo = @PoliceLogNo ,PoliceAddress  = @PoliceAddress,DamageToVehcle = @DamageToVehcle,AdditionalInfo = @AdditionalInfo,AnyoneInjured = @AnyoneInjured,PassengerClaims = @PassengerClaims ,AnyWitnesses = @AnyWitnesses,PreviousAccidents = @PreviousAccidents, FirstPartyDealing= @FirstPartyDealing,ExistingCFA = @ExistingCFA , DateGPAttended = @DateGPAttended, DateHospitalAttended = @DateHospitalAttended, OtherLosses = @OtherLosses, InjuriesSustained = @InjuriesSustained , ClaimTypeID = @ClaimTypeID where ClaimID=@ClaimID";


							if (cmd.ExecuteNonQuery() > 0)
							{
								msg.InnerHtml = cmd.CommandText.ToString();

							}

							cmd.Parameters.Clear();
						
						}

					}

					#endregion 


					
                }
                catch (Exception EXC)
                {
                    Console.Write(EXC.ToString());
                }
                finally
                {
					Response.Redirect("claims.aspx");							
                }
#endregion 


			//Update Suppliers




		}

     
		protected void AddNewClaim(object sender, ImageClickEventArgs e)
		{

		//add client details
			
			#region 


			try
			{
				// int Claimid= Convert.ToInt32(e.NewValues[0]);


				string FirstName = ContactDetails1.FirstName;
				string SurName = ContactDetails1.SurName;
				string Phone = ContactDetails1.Phone;
				string Mobile = ContactDetails1.Mobile;
				string Address1 = ContactDetails1.Address1;
				string Address2 = ContactDetails1.Address2;
				string PostCode = ContactDetails1.PostCode;
				string City = ContactDetails1.City;
				string Country = ContactDetails1.Country;
				string Fax = ContactDetails1.Fax;
				string Email = ContactDetails1.Email;
				string DateOfBirth = ContactDetails1.DateOfBirth;
				string NINumber = ContactDetails1.NINumber;
				string DOB = ContactDetails1.DateOfBirth;
				string DriverPolicyNo = ContactDetails1.DriverPolicyNo;
				string DriverInsurers = ContactDetails1.DriverInsurers;
				FileUpload FileUpload1 = ContactDetails1.FileUpload;




				using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{
					conn.Open();
					using (SqlCommand cmd = conn.CreateCommand())
					{

						string extension = string.Empty;
						string strFileName = string.Empty;

						if (FileUpload1.HasFile)
						{

							HttpPostedFile PostedFileValue = ContactDetails1.FileUpload.PostedFile;

							int FileSizeKB = PostedFileValue.ContentLength / 1024;

							extension = System.IO.Path.GetExtension(PostedFileValue.FileName).ToLower();
							strFileName = System.IO.Path.GetFileNameWithoutExtension(PostedFileValue.FileName).ToLower();

							if ((extension != ".jpg" && extension != ".jpeg" && extension != ".gif" && extension != ".png") || (FileSizeKB > 500))
							{
								System.Text.StringBuilder stringBuilder = new System.Text.StringBuilder();

								stringBuilder.Append("<span style=\"color:Red;font-weight:bold;font-size:14px;\">Invalid image format. Only jpeg,jpg,gif,png images are permited not more than 1024 KB</span>");
								stringBuilder.Append(string.Format("<br/> <span style=\"color:Black;font-weight:bold;font-size:14px;\">File Extension : {0}", extension));
								stringBuilder.Append(string.Format(" File Size:  {0}(KB):", FileSizeKB) + "</span><br/>");

								//Msg.InnerHtml = stringBuilder.ToString();

								return;
							}

							ContactDetails1.FileUpload.SaveAs(Server.MapPath("~/Images") + "/" + strFileName + extension);
						}

						cmd.CommandType = CommandType.Text;
						cmd.Parameters.AddWithValue("FirstName", FirstName);
						cmd.Parameters.AddWithValue("Surname", SurName);
						cmd.Parameters.AddWithValue("Address1", Address1);
						cmd.Parameters.AddWithValue("Address2", Address2);
						cmd.Parameters.AddWithValue("City", City);
						cmd.Parameters.AddWithValue("PostCode", PostCode);
						cmd.Parameters.AddWithValue("Country", Country);
						//cmd.Parameters.AddWithValue("Company", Company);
						cmd.Parameters.AddWithValue("Phone", Phone);
						cmd.Parameters.AddWithValue("Mobile", Mobile);
						cmd.Parameters.AddWithValue("Fax", Fax);
						cmd.Parameters.AddWithValue("Email", Email);
						cmd.Parameters.AddWithValue("DOB", DOB);
						cmd.Parameters.AddWithValue("NINO", NINumber);
						cmd.Parameters.AddWithValue("DriverPolicyNo", DriverPolicyNo);
						cmd.Parameters.AddWithValue("DriverInsurers", DriverInsurers);
						cmd.Parameters.AddWithValue("ContactTypeID", "7");

						cmd.Parameters.AddWithValue("ContactImage", "Images/" + strFileName + extension);

						cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, DOB, NINo, ContactTypeID,DriverPolicyNo, DriverInsurers, ContactImage) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @DOB, @NINo, @ContactTypeID, @DriverPolicyNo, @DriverInsurers, @ContactImage)";
						//cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo ) values (@PFirstName, @PSurname, @PAddress1, @PAddress2, @PCity , @PPostCode, @PCountry, @PPhone, @PMobile, @PFax, @PEmail, @PNINo )";


						if (cmd.ExecuteNonQuery() > 0)
						{

							msg.InnerHtml = cmd.CommandText.ToString();
											cmd.Parameters.Clear();
							cmd.CommandText = "SELECT @@IDENTITY";

							// Get the last inserted id.
							ClientIDvalue = Convert.ToInt32(cmd.ExecuteScalar());


						}

						if (OwnerDetailsDropDown.SelectedItem.Value == "Yes")
						{
							cmd.Parameters.Clear();
							cmd.CommandType = CommandType.Text;
							cmd.Parameters.AddWithValue("FirstName", FirstName);
							cmd.Parameters.AddWithValue("Surname", SurName);
							cmd.Parameters.AddWithValue("Address1", Address1);
							cmd.Parameters.AddWithValue("Address2", Address2);
							cmd.Parameters.AddWithValue("City", City);
							cmd.Parameters.AddWithValue("PostCode", PostCode);
							cmd.Parameters.AddWithValue("Country", Country);
							//cmd.Parameters.AddWithValue("Company", Company);
							cmd.Parameters.AddWithValue("Phone", Phone);
							cmd.Parameters.AddWithValue("Mobile", Mobile);
							cmd.Parameters.AddWithValue("Fax", Fax);
							cmd.Parameters.AddWithValue("Email", Email);

							cmd.Parameters.AddWithValue("DriverPolicyNo",OwnerDriverPolicyNo22.Text);
							cmd.Parameters.AddWithValue("DriverInsurers", OwnerInsuranceCover.Text);
						
							cmd.Parameters.AddWithValue("ContactTypeID", "9");

							cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email,ContactTypeID,DriverPolicyNo,DriverInsurers) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @ContactTypeID,@DriverPolicyNo,@DriverInsurers)";
							//cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo ) values (@PFirstName, @PSurname, @PAddress1, @PAddress2, @PCity , @PPostCode, @PCountry, @PPhone, @PMobile, @PFax, @PEmail, @PNINo )";


							if (cmd.ExecuteNonQuery() > 0)
							{

								msg.InnerHtml = cmd.CommandText.ToString();



							}

							cmd.Parameters.Clear();
							cmd.CommandText = "SELECT @@IDENTITY";

							// Get the last inserted id.
							VehicleOwnerID = Convert.ToInt32(cmd.ExecuteScalar());

							//Response.Write(insertID);



						}

					}

				}
			}
			catch (Exception EXC)
			{
				Console.Write(EXC.ToString());
			}
			finally
			{
				//ResGridView1ult.Text = "Room updated successfully! ";
			}

			#endregion 

			// int Claimid= Convert.ToInt32(e.NewValues[0]);

		     	//add party at fault
			    #region 

			try
			{


				using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{
					conn.Open();
					using (SqlCommand cmd = conn.CreateCommand())
					{
						cmd.CommandType = CommandType.Text;
						cmd.Parameters.AddWithValue("FirstName", PFirstName.Text);
						cmd.Parameters.AddWithValue("Surname", PSurname.Text);
						cmd.Parameters.AddWithValue("Address1", PAddress1.Text);
						cmd.Parameters.AddWithValue("Address2", PAddress2.Text);
						cmd.Parameters.AddWithValue("City", PCity.Text);
						cmd.Parameters.AddWithValue("PostCode", PPostCode.Text);
						cmd.Parameters.AddWithValue("Country", "");
						cmd.Parameters.AddWithValue("Phone", PPhone.Text);
						cmd.Parameters.AddWithValue("Mobile", PMobile.Text);
						cmd.Parameters.AddWithValue("DriverPolicyNo", PDriverPolicyNo.Text);
						cmd.Parameters.AddWithValue("DriverInsurers", PInsuranceCover.Text);
						cmd.Parameters.AddWithValue("InsuranceReferenceNo", PInsuranceReferenceNo.Text);
						cmd.Parameters.AddWithValue("DOB", "");
						cmd.Parameters.AddWithValue("NINO", "");
						cmd.Parameters.AddWithValue("ContactTypeID", "8");
						cmd.Parameters.AddWithValue("Fax", "");
						cmd.Parameters.AddWithValue("Email", "");




						//int ClaimID = -1;

						//using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
						//{
						//    if (dataReader.RecordsAffected > 0 && dataReader.Read())
						//        ClaimID = Convert.ToInt32(dataReader["Id"]);
						//    dataReader.Close();
						//}


						cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, DriverInsurers, InsuranceReferenceNo, DriverPolicyNo, Fax, Email, NINo, ContactTypeID) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @DriverInsurers, @InsuranceReferenceNo, @DriverPolicyNo, @Fax, @Email, @NINo, @ContactTypeID)";
						if (cmd.ExecuteNonQuery() > 0)
						{
							msg.InnerHtml = cmd.CommandText.ToString();

						}

						cmd.Parameters.Clear();
						cmd.CommandText = "SELECT @@IDENTITY";

						// Get the last inserted id.
						PartyatFaultValue = Convert.ToInt32(cmd.ExecuteScalar());

						//Response.Write(insertID);

					}



				}

			#endregion 


				//add GP details
				#region 


				using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{
					conn.Open();
					using (SqlCommand cmd = conn.CreateCommand())
					{
						cmd.CommandType = CommandType.Text;
						cmd.Parameters.AddWithValue("FirstName", GPFirstName.Text);
						cmd.Parameters.AddWithValue("Surname", GPSurname.Text);
						cmd.Parameters.AddWithValue("Address1", GPAddress1.Text);
						cmd.Parameters.AddWithValue("Address2", GPAddress2.Text);
						cmd.Parameters.AddWithValue("City", GPCityName.Text);
						cmd.Parameters.AddWithValue("PostCode", GPPostCode.Text);
						cmd.Parameters.AddWithValue("Country", "");
						cmd.Parameters.AddWithValue("Phone", GPPhone.Text);
						cmd.Parameters.AddWithValue("Mobile", "");
						cmd.Parameters.AddWithValue("DOB", "");
						cmd.Parameters.AddWithValue("NINO", "");
						cmd.Parameters.AddWithValue("ContactTypeID", "10");
						cmd.Parameters.AddWithValue("Fax", "");
						cmd.Parameters.AddWithValue("Email", "");




						//int ClaimID = -1;

						//using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
						//{
						//    if (dataReader.RecordsAffected > 0 && dataReader.Read())
						//        ClaimID = Convert.ToInt32(dataReader["Id"]);
						//    dataReader.Close();
						//}


						cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo, ContactTypeID) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @NINo, @ContactTypeID)";
						if (cmd.ExecuteNonQuery() > 0)
						{
							msg.InnerHtml = cmd.CommandText.ToString();

						}

						cmd.Parameters.Clear();
						cmd.CommandText = "SELECT @@IDENTITY";

						// Get the last inserted id.
						GPID = Convert.ToInt32(cmd.ExecuteScalar());

						//Response.Write(insertID);

					}
				}

				#endregion 


				//add Hosptial details
				#region 

				using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{
					conn.Open();
					using (SqlCommand cmd = conn.CreateCommand())
					{
						cmd.CommandType = CommandType.Text;
						cmd.Parameters.AddWithValue("FirstName", HospitalName.Text);
						cmd.Parameters.AddWithValue("Surname", Department.Text);
						cmd.Parameters.AddWithValue("Address1", HospitalAddress1.Text);
						cmd.Parameters.AddWithValue("Address2", HospitalAddress2.Text);
						cmd.Parameters.AddWithValue("City", HospitalCity.Text);
						cmd.Parameters.AddWithValue("PostCode", HospitalPostCode.Text);
						cmd.Parameters.AddWithValue("Country", "");
						cmd.Parameters.AddWithValue("Phone", HospitalPhone.Text);
						cmd.Parameters.AddWithValue("Mobile", "");
						cmd.Parameters.AddWithValue("DOB", "");
						cmd.Parameters.AddWithValue("NINO", "");
						cmd.Parameters.AddWithValue("ContactTypeID", "11");
						cmd.Parameters.AddWithValue("Fax", "");
						cmd.Parameters.AddWithValue("Email", "");




						//int ClaimID = -1;

						//using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
						//{
						//    if (dataReader.RecordsAffected > 0 && dataReader.Read())
						//        ClaimID = Convert.ToInt32(dataReader["Id"]);
						//    dataReader.Close();
						//}


						cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo, ContactTypeID) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @NINo, @ContactTypeID)";
						if (cmd.ExecuteNonQuery() > 0)
						{
							msg.InnerHtml = cmd.CommandText.ToString();

						}

						cmd.Parameters.Clear();
						cmd.CommandText = "SELECT @@IDENTITY";

						// Get the last inserted id.
						HospitalID = Convert.ToInt32(cmd.ExecuteScalar());

						//Response.Write(insertID);

					}
				}
				#endregion 

				//add witness details
				#region 

				using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{
					conn.Open();
					using (SqlCommand cmd = conn.CreateCommand())
					{


						cmd.CommandType = CommandType.Text;
						cmd.Parameters.AddWithValue("FirstName", W1FirstName.Text);
						cmd.Parameters.AddWithValue("Surname", W1Surname.Text);
						cmd.Parameters.AddWithValue("Address1", W1Address1.Text);
						cmd.Parameters.AddWithValue("Address2", W1Address2.Text);
						cmd.Parameters.AddWithValue("City", W1CityTitle.Text);
						cmd.Parameters.AddWithValue("Country", " ");
						cmd.Parameters.AddWithValue("PostCode", W1Postcode.Text);
						cmd.Parameters.AddWithValue("Phone", W1Phone.Text);
						cmd.Parameters.AddWithValue("Mobile", W1Mobile.Text);
						cmd.Parameters.AddWithValue("ContactTypeID", "6");
						cmd.Parameters.AddWithValue("Fax", "");
						cmd.Parameters.AddWithValue("Email", "");
						cmd.Parameters.AddWithValue("DOB", "");
						cmd.Parameters.AddWithValue("NINO", "");
						cmd.Parameters.AddWithValue("WitnessSequence", "1");





						//int ClaimID = -1;

						//using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
						//{
						//    if (dataReader.RecordsAffected > 0 && dataReader.Read())
						//        ClaimID = Convert.ToInt32(dataReader["Id"]);
						//    dataReader.Close();
						//}


						cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo, ContactTypeID, WitnessSequence) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @NINo, @ContactTypeID, @WitnessSequence)";

						if (cmd.ExecuteNonQuery() > 0)
						{
							msg.InnerHtml = cmd.CommandText.ToString();

						}

						cmd.Parameters.Clear();
						cmd.CommandText = "SELECT @@IDENTITY";

						// Get the last inserted id.
						WitnessIDvalue1 = Convert.ToInt32(cmd.ExecuteScalar());

						//Response.Write(insertID);
					}

				}
				#endregion 

				//add witness 2 details
				#region 

				using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{
					conn.Open();
					using (SqlCommand cmd = conn.CreateCommand())
					{
						cmd.CommandType = CommandType.Text;
						cmd.Parameters.AddWithValue("FirstName", W2FirstName.Text);
						cmd.Parameters.AddWithValue("Surname", W2Surname.Text);
						cmd.Parameters.AddWithValue("Address1", W2Address1.Text);
						cmd.Parameters.AddWithValue("Address2", W2Address2.Text);
						cmd.Parameters.AddWithValue("City",W2City.Text);
						cmd.Parameters.AddWithValue("Country", " ");
						cmd.Parameters.AddWithValue("PostCode", W2Postcode.Text);
						cmd.Parameters.AddWithValue("Phone", W2Phone.Text);
						cmd.Parameters.AddWithValue("Mobile", W2Mobile.Text);
						cmd.Parameters.AddWithValue("ContactTypeID", "6");
						cmd.Parameters.AddWithValue("Fax", "");
						cmd.Parameters.AddWithValue("Email", "");
						cmd.Parameters.AddWithValue("DOB", "");
						cmd.Parameters.AddWithValue("NINO", "");
						cmd.Parameters.AddWithValue("WitnessSequence", "2");

						




						//int ClaimID = -1;

						//using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
						//{
						//    if (dataReader.RecordsAffected > 0 && dataReader.Read())
						//        ClaimID = Convert.ToInt32(dataReader["Id"]);
						//    dataReader.Close();
						//}


						cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo, ContactTypeID,WitnessSequence) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @NINo, @ContactTypeID, @WitnessSequence)";

						if (cmd.ExecuteNonQuery() > 0)
						{
							msg.InnerHtml = cmd.CommandText.ToString();

						}

						cmd.Parameters.Clear();
						cmd.CommandText = "SELECT @@IDENTITY";

						// Get the last inserted id.
						WitnessIDvalue2 = Convert.ToInt32(cmd.ExecuteScalar());

						//Response.Write(insertID);
					}

				}

				#endregion 

				
				//for  PI & RTA owner details

				#region 


				if (ClaimType.SelectedItem.Text == "PI and RTA" || ClaimType.SelectedItem.Text == "RTA Claims" )
				
				{

					if (OwnerDetailsDropDown.SelectedItem.Value == "No")
					{

						using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
						{
							conn.Open();
							using (SqlCommand cmd = conn.CreateCommand())
							{


								cmd.CommandType = CommandType.Text;
								cmd.Parameters.AddWithValue("FirstName", OwnerFirstName.Text);
								cmd.Parameters.AddWithValue("Surname", OwnerSurname.Text);
								cmd.Parameters.AddWithValue("Address1", OwnerAddress111.Text);
								cmd.Parameters.AddWithValue("Address2", OwnerAddress2.Text);
								cmd.Parameters.AddWithValue("City", OwnerCity.Text);
								cmd.Parameters.AddWithValue("Country", " ");
								cmd.Parameters.AddWithValue("PostCode", OwnerPostCode.Text);
								cmd.Parameters.AddWithValue("Phone", OwnerPhoneNo.Text);
								cmd.Parameters.AddWithValue("Mobile", "");
								cmd.Parameters.AddWithValue("ContactTypeID", "9");
								cmd.Parameters.AddWithValue("Fax", "");
								cmd.Parameters.AddWithValue("Email", "");
								cmd.Parameters.AddWithValue("DOB", "");
								cmd.Parameters.AddWithValue("NINO", "");

								cmd.Parameters.AddWithValue("DriverPolicyNo", OwnerDriverPolicyNo22.Text);
								cmd.Parameters.AddWithValue("DriverInsurers", OwnerInsuranceCover.Text);




								//int ClaimID = -1;

								//using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
								//{
								//    if (dataReader.RecordsAffected > 0 && dataReader.Read())
								//        ClaimID = Convert.ToInt32(dataReader["Id"]);
								//    dataReader.Close();
								//}


								cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo, ContactTypeID,DriverPolicyNo,DriverInsurers) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @NINo, @ContactTypeID,@DriverPolicyNo,@DriverInsurers)";

								if (cmd.ExecuteNonQuery() > 0)
								{
									msg.InnerHtml = cmd.CommandText.ToString();

								}

								cmd.Parameters.Clear();
								cmd.CommandText = "SELECT @@IDENTITY";

								// Get the last inserted id.
								VehicleOwnerID = Convert.ToInt32(cmd.ExecuteScalar());

								//Response.Write(insertID);
							}
						}

					}

				}

				#endregion 

				// add claim

				#region 

				using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{
					conn.Open();
					using (SqlCommand cmd = conn.CreateCommand())
					{
						if (AccidentDate.Text != "")
						{
							cmd.Parameters.AddWithValue("AccidentDate", Convert.ToDateTime(AccidentDate.Text).ToString("yyyy/MM/dd"));
						
						}

					else 
					
						{
							cmd.Parameters.AddWithValue("AccidentDate", Convert.ToDateTime(DateTime.MaxValue).ToString("yyyy/MM/dd"));

						}

						if (GPDateAttended.Text != "")
						{
							cmd.Parameters.AddWithValue("DateGPAttended", Convert.ToDateTime(GPDateAttended.Text).ToString("yyyy/MM/dd"));

						}

						else
						{
							cmd.Parameters.AddWithValue("DateGPAttended", Convert.ToDateTime(DateTime.MaxValue).ToString("yyyy/MM/dd"));

						}

							if (HospitalDateAttended.Text != "")
						{
							cmd.Parameters.AddWithValue("DateHospitalAttended", Convert.ToDateTime(HospitalDateAttended.Text).ToString("yyyy/MM/dd"));

						}

						else
						{
							cmd.Parameters.AddWithValue("DateHospitalAttended", Convert.ToDateTime(DateTime.MaxValue).ToString("yyyy/MM/dd"));

						}




						cmd.CommandType = CommandType.Text;

						cmd.Parameters.AddWithValue("ClaimTitle", ClaimTitle.Text);

						cmd.Parameters.AddWithValue("DateCreated", Convert.ToDateTime(DateTime.Now).ToString("yyyy/MM/dd HH:mm:ss"));
						cmd.Parameters.AddWithValue("DateUpdated", Convert.ToDateTime(DateTime.Now).ToString("yyyy/MM/dd HH:mm:ss"));
						
						cmd.Parameters.AddWithValue("AccidentLocation", AccidentLocation.Text);
						cmd.Parameters.AddWithValue("AccidentInfo", AccidentInfo.Text);
						cmd.Parameters.AddWithValue("RoadCondition", RoadCondition.Text);
						cmd.Parameters.AddWithValue("WhotoBlame", WhotoBlame.Text);
						cmd.Parameters.AddWithValue("PoliceAttended", PoliceAttended.Text);
						cmd.Parameters.AddWithValue("PoliceOfficerName", PoliceOfficerName.Text);
						cmd.Parameters.AddWithValue("PoliceLogNo", PoliceLogNo.Text);
						cmd.Parameters.AddWithValue("PoliceAddress", PoliceAddress.Text);
						cmd.Parameters.AddWithValue("VehicleRoadworthy", VehicleRoadworthy.Text);
						cmd.Parameters.AddWithValue("DamageToVehcle", DamageToVehcle.Text);
						cmd.Parameters.AddWithValue("ExistingCFA", ExistingCFA.SelectedItem.Value);
						cmd.Parameters.AddWithValue("AdditionalInfo", AdditionalInfo.Text);
						cmd.Parameters.AddWithValue("AnyoneInjured", AnyoneInjured.Text);
						cmd.Parameters.AddWithValue("PassengerClaims", PassengerClaims.Text);
						cmd.Parameters.AddWithValue("RefferedBy", RefferedBy.Text);
						cmd.Parameters.AddWithValue("AnyWitnesses", AnyWitnesses.Text);
						cmd.Parameters.AddWithValue("PreviousAccidents", PreviousAccidents.Text);
					
						cmd.Parameters.AddWithValue("ClaimTypeID", ClaimType.SelectedItem.Value);
						cmd.Parameters.AddWithValue("ClaimStatusID", "1");
						
						cmd.Parameters.AddWithValue("InjuriesSustained",InjurySustained.Text);
						cmd.Parameters.AddWithValue("OtherLosses", GPOtherlosses.Text);
						cmd.Parameters.AddWithValue("FirstPartyDealing",DropDownFirstPartyDealing.SelectedItem.Value);


		
						
						//Date Hostpital Attended
						//Date GP Attended
						//InjurySustained
						//Other Losses
						//Driver Inurer
						//Driver Policy

						//int ClaimID = -1;

						//using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
						//{
						//    if (dataReader.RecordsAffected > 0 && dataReader.Read())
						//        ClaimID = Convert.ToInt32(dataReader["Id"]);
						//    dataReader.Close();
						//}

						cmd.CommandText = "INSERT into Claim (ClaimTitle ,DateCreated ,DateUpdated ,RefferedBy ,AccidentLocation ,AccidentDate ,AccidentInfo ,RoadCondition ,WhotoBlame ,PoliceAttended ,PoliceOfficerName ,PoliceLogNo ,PoliceAddress  ,vehicleRoadworthy ,DamageToVehcle,AdditionalInfo,AnyoneInjured,PassengerClaims ,ExistingCFA, AnyWitnesses,PreviousAccidents,ClaimTypeID ,ClaimStatusID,InjuriesSustained ,OtherLosses,FirstPartyDealing, DateGPAttended, DateHospitalAttended) values(@ClaimTitle ,@DateCreated ,@DateUpdated ,@RefferedBy ,@AccidentLocation ,@AccidentDate ,@AccidentInfo ,@RoadCondition ,@WhotoBlame ,@PoliceAttended ,@PoliceOfficerName ,@PoliceLogNo ,@PoliceAddress ,@vehicleRoadworthy ,@DamageToVehcle,@AdditionalInfo,@AnyoneInjured,@PassengerClaims ,@ExistingCFA, @AnyWitnesses,@PreviousAccidents,@ClaimTypeID ,@ClaimStatusID,@InjuriesSustained ,@OtherLosses,@FirstPartyDealing, @DateGPAttended, @DateHospitalAttended)";


						if (cmd.ExecuteNonQuery() > 0)
						{
							msg.InnerHtml = cmd.CommandText.ToString();

						}

						cmd.Parameters.Clear();
						cmd.CommandText = "SELECT @@IDENTITY";

						// Get the last inserted id.
						ClaimIDvalue = Convert.ToInt32(cmd.ExecuteScalar());

						//Response.Write(insertID);
					}

				}
				#endregion 

				// add Vehicle 

				#region 

				using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{
					conn.Open();


					using (SqlCommand cmd = conn.CreateCommand())
					{

						cmd.Parameters.AddWithValue("VehicleMake", VehicleMake.Text);
						cmd.Parameters.AddWithValue("VehicleModel", VehicleModel.Text);
						cmd.Parameters.AddWithValue("VehicleReg", VehicleReg.Text);
						cmd.Parameters.AddWithValue("VehicleOwnerId", VehicleOwnerID);
						cmd.Parameters.AddWithValue("ClaimId", ClaimIDvalue);
						cmd.Parameters.AddWithValue("VehicleType", "ClientCar");

						cmd.CommandText = "INSERT into Vehicle (VehicleMake,VehicleModel,VehicleReg,VehicleOwnerId, ClaimId,VehicleType) values(@VehicleMake,@VehicleModel,@VehicleReg,@VehicleOwnerId,@ClaimId,@VehicleType)";


						if (cmd.ExecuteNonQuery() > 0)
						{
							cmd.Parameters.Clear();

						}
						cmd.Parameters.Clear();
						cmd.CommandText = "SELECT @@IDENTITY";

						// Get the last inserted id.
						VehicleID = Convert.ToInt32(cmd.ExecuteScalar());

						//Response.Write(insertID);

						cmd.Parameters.AddWithValue("VehicleMake", PVehicleMake.Text);
						cmd.Parameters.AddWithValue("VehicleModel", PVehileModel.Text);
						cmd.Parameters.AddWithValue("VehicleReg", PVehicleReg.Text);
						cmd.Parameters.AddWithValue("VehicleRoadWorthy", PVehicleRoadworthy.Text);
						cmd.Parameters.AddWithValue("VehicleOwnerId", PartyatFaultValue);
						cmd.Parameters.AddWithValue("ClaimId", ClaimIDvalue);
						cmd.Parameters.AddWithValue("VehicleType", "PartyatFaultCar");


						cmd.CommandText = "INSERT into Vehicle (VehicleMake,VehicleModel,VehicleReg,VehicleOwnerId, ClaimId,VehicleRoadWorthy,VehicleType) values(@VehicleMake,@VehicleModel,@VehicleReg,@VehicleOwnerId,@ClaimId,@VehicleRoadWorthy,@VehicleType)";


						if (cmd.ExecuteNonQuery() > 0)
						{
							cmd.Parameters.Clear();

						}
						cmd.Parameters.Clear();
						cmd.CommandText = "SELECT @@IDENTITY";

						// Get the last inserted id.
						VehicleID = Convert.ToInt32(cmd.ExecuteScalar());

						//Response.Write(insertID);


					}



				}

				#endregion 

				// Join all contacts with claim
				#region 

				using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{
					conn.Open();
					using (SqlCommand cmd = conn.CreateCommand())
					{


						cmd.Parameters.AddWithValue("ClaimID", ClaimIDvalue);
						cmd.Parameters.AddWithValue("ContactID", ClientIDvalue);
						cmd.Parameters.AddWithValue("ContactTypeID", "7");
						cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";


						if (cmd.ExecuteNonQuery() > 0)
						{
							msg.InnerHtml = cmd.CommandText.ToString();
							cmd.Parameters.Clear();
						}

						cmd.Parameters.AddWithValue("ClaimID", ClaimIDvalue);
						cmd.Parameters.AddWithValue("ContactID", WitnessIDvalue1);
						cmd.Parameters.AddWithValue("ContactTypeID", "6");
						cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";


						if (cmd.ExecuteNonQuery() > 0)
						{
							msg.InnerHtml = cmd.CommandText.ToString();
							cmd.Parameters.Clear();
						}

						cmd.Parameters.AddWithValue("ClaimID", ClaimIDvalue);
						cmd.Parameters.AddWithValue("ContactID", WitnessIDvalue2);
						cmd.Parameters.AddWithValue("ContactTypeID", "6");
						cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";


						if (cmd.ExecuteNonQuery() > 0)
						{
							msg.InnerHtml = cmd.CommandText.ToString();
							cmd.Parameters.Clear();
						}

						cmd.Parameters.AddWithValue("ClaimID", ClaimIDvalue);
						cmd.Parameters.AddWithValue("ContactID", PartyatFaultValue);
						cmd.Parameters.AddWithValue("ContactTypeID", "8");
						cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";

						if (cmd.ExecuteNonQuery() > 0)
						{
							msg.InnerHtml = cmd.CommandText.ToString();
							cmd.Parameters.Clear();
						}

						cmd.Parameters.AddWithValue("ClaimID", ClaimIDvalue);
						cmd.Parameters.AddWithValue("ContactID", GPID);
						cmd.Parameters.AddWithValue("ContactTypeID", "10");
						cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";

						if (cmd.ExecuteNonQuery() > 0)
						{
							msg.InnerHtml = cmd.CommandText.ToString();
							cmd.Parameters.Clear();
						}

						cmd.Parameters.AddWithValue("ClaimID", ClaimIDvalue);
						cmd.Parameters.AddWithValue("ContactID", HospitalID);
						cmd.Parameters.AddWithValue("ContactTypeID", "11");
						cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";

						if (cmd.ExecuteNonQuery() > 0)
						{
							msg.InnerHtml = cmd.CommandText.ToString();
							cmd.Parameters.Clear();
						}


						cmd.Parameters.AddWithValue("ClaimID", ClaimIDvalue);
						cmd.Parameters.AddWithValue("ContactID", VehicleOwnerID);
						cmd.Parameters.AddWithValue("ContactTypeID", "9");
						cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";


						if (cmd.ExecuteNonQuery() > 0)
						{
							msg.InnerHtml = cmd.CommandText.ToString();
							cmd.Parameters.Clear();
						}


					}

				}

				#endregion 
			}
			catch (Exception EXC)
			{
				Console.Write(EXC.ToString());
			}
			finally
			{
				if (this.Page.User.IsInRole("Administrator"))
				{
						Response.Redirect("claims.aspx");
				}
				if (this.Page.User.IsInRole("Staff"))
				{
					DivMessage.InnerHtml = "You Have Successfully added New claim" ;
					DivMessage.InnerHtml = DivMessage.InnerHtml + "<br/><br/>" ;
					DivClaim.Visible = false;


					//RedirectClaim.Visible = true;
					//Logout.Visible = true;

				
				
				}
				
			}

		}
		
		protected void AllocateSuppliers(object sender, EventArgs e)
			 
		    {


			

				using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{
					conn.Open();
					using (SqlCommand cmd = conn.CreateCommand())
					{
						cmd.Parameters.AddWithValue("ClaimID", AllocateClaimUpdateID.Value);
						cmd.Parameters.AddWithValue("ContactTypeID", "1");  // Insurance

						//string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
						cmd.CommandText = "Select count(*) from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimID and Claim.ClaimID=ClaimContact.ClaimID and ClaimContact.ContactId = Contact.ContactID and Contact.ContactTypeID=@ContactTypeID";

						if (Convert.ToInt32(cmd.ExecuteScalar()) > 0)
						{
							cmd.Parameters.Clear();

						
							cmd.Parameters.AddWithValue("ContactID", AllocateInsurance.SelectedItem.Value);
							cmd.Parameters.AddWithValue("ContactTypeID", "1");
							cmd.CommandText = "UPDATE ClaimContact SET ContactID = @ContactID where ContactTypeID=@ContactTypeID";


							if (cmd.ExecuteNonQuery() > 0)
							{
								//msg.InnerHtml = cmd.CommandText.ToString();
								cmd.Parameters.Clear();
							}

						}

						else
						{
							cmd.Parameters.Clear();
							cmd.Parameters.AddWithValue("ClaimID", AllocateClaimUpdateID.Value);
							cmd.Parameters.AddWithValue("ContactID", AllocateInsurance.SelectedItem.Value);
							cmd.Parameters.AddWithValue("ContactTypeID", '1');
							cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";


							if (cmd.ExecuteNonQuery() > 0)
							{
								msg.InnerHtml = cmd.CommandText.ToString();
								cmd.Parameters.Clear();
							}

						}

///////////////////////////////////////////Solicitors ///////////////////////////////////////////////////////////////


						cmd.Parameters.AddWithValue("ClaimID", AllocateClaimUpdateID.Value);
						cmd.Parameters.AddWithValue("ContactTypeID", "2");  // Solicitor

						//string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
						cmd.CommandText = "Select count(*) from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimID and Claim.ClaimID=ClaimContact.ClaimID and ClaimContact.ContactId = Contact.ContactID and Contact.ContactTypeID=@ContactTypeID";

						if (Convert.ToInt32(cmd.ExecuteScalar()) > 0)
						{
							cmd.Parameters.Clear();


							cmd.Parameters.AddWithValue("ContactID", AllocateSolicitor.SelectedItem.Value);
							cmd.Parameters.AddWithValue("ContactTypeID", "2");
							cmd.CommandText = "UPDATE ClaimContact SET ContactID = @ContactID where ContactTypeID=@ContactTypeID";


							if (cmd.ExecuteNonQuery() > 0)
							{
								//msg.InnerHtml = cmd.CommandText.ToString();
								cmd.Parameters.Clear();
							}

						}

						else
						{
							cmd.Parameters.Clear();
							cmd.Parameters.AddWithValue("ClaimID", AllocateClaimUpdateID.Value);
							cmd.Parameters.AddWithValue("ContactID", AllocateSolicitor.SelectedItem.Value);
							cmd.Parameters.AddWithValue("ContactTypeID", '2');
							cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";


							if (cmd.ExecuteNonQuery() > 0)
							{
								msg.InnerHtml = cmd.CommandText.ToString();
								cmd.Parameters.Clear();
							}

						}


						///////////////////////////////////////////Engineers ///////////////////////////////////////////////////////////////


						cmd.Parameters.AddWithValue("ClaimID", AllocateClaimUpdateID.Value);
						cmd.Parameters.AddWithValue("ContactTypeID", "3");  // Engineer

						//string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
						cmd.CommandText = "Select count(*) from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimID and Claim.ClaimID=ClaimContact.ClaimID and ClaimContact.ContactId = Contact.ContactID and Contact.ContactTypeID=@ContactTypeID";

						if (Convert.ToInt32(cmd.ExecuteScalar()) > 0)
						{
							cmd.Parameters.Clear();


							cmd.Parameters.AddWithValue("ContactID", AllocateEngineer.SelectedItem.Value);
							cmd.Parameters.AddWithValue("ContactTypeID", "3");
							cmd.CommandText = "UPDATE ClaimContact SET ContactID = @ContactID where ContactTypeID=@ContactTypeID";


							if (cmd.ExecuteNonQuery() > 0)
							{
								//msg.InnerHtml = cmd.CommandText.ToString();
								cmd.Parameters.Clear();
							}

						}

						else
						{
							cmd.Parameters.Clear();
							cmd.Parameters.AddWithValue("ClaimID", AllocateClaimUpdateID.Value);
							cmd.Parameters.AddWithValue("ContactID", AllocateEngineer.SelectedItem.Value);
							cmd.Parameters.AddWithValue("ContactTypeID", '3');
							cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";


							if (cmd.ExecuteNonQuery() > 0)
							{
								msg.InnerHtml = cmd.CommandText.ToString();
								cmd.Parameters.Clear();
							}

						}


						///////////////////////////////////////////Carhire ///////////////////////////////////////////////////////////////


						cmd.Parameters.AddWithValue("ClaimID", AllocateClaimUpdateID.Value);
						cmd.Parameters.AddWithValue("ContactTypeID", "4");  // Carhire

						//string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
						cmd.CommandText = "Select count(*) from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimID and Claim.ClaimID=ClaimContact.ClaimID and ClaimContact.ContactId = Contact.ContactID and Contact.ContactTypeID=@ContactTypeID";

						if (Convert.ToInt32(cmd.ExecuteScalar()) > 0)
						{
							cmd.Parameters.Clear();


							cmd.Parameters.AddWithValue("ContactID", AllocateCarhire.SelectedItem.Value);
							cmd.Parameters.AddWithValue("ContactTypeID", "4");
							cmd.CommandText = "UPDATE ClaimContact SET ContactID = @ContactID where ContactTypeID=@ContactTypeID";


							if (cmd.ExecuteNonQuery() > 0)
							{
								//msg.InnerHtml = cmd.CommandText.ToString();
								cmd.Parameters.Clear();
							}

						}

						else
						{
							cmd.Parameters.Clear();
							cmd.Parameters.AddWithValue("ClaimID", AllocateClaimUpdateID.Value);
							cmd.Parameters.AddWithValue("ContactID", AllocateCarhire.SelectedItem.Value);
							cmd.Parameters.AddWithValue("ContactTypeID", '4');
							cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";


							if (cmd.ExecuteNonQuery() > 0)
							{
								msg.InnerHtml = cmd.CommandText.ToString();
								cmd.Parameters.Clear();
							}

						}

						///////////////////////////////////////////Solicitors ///////////////////////////////////////////////////////////////


						cmd.Parameters.AddWithValue("ClaimID", AllocateClaimUpdateID.Value);
						cmd.Parameters.AddWithValue("ContactTypeID", "5");  // Storage

						//string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
						cmd.CommandText = "Select count(*) from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimID and Claim.ClaimID=ClaimContact.ClaimID and ClaimContact.ContactId = Contact.ContactID and Contact.ContactTypeID=@ContactTypeID";

						if (Convert.ToInt32(cmd.ExecuteScalar()) > 0)
						{
							cmd.Parameters.Clear();


							cmd.Parameters.AddWithValue("ContactID", AllocateStorage.SelectedItem.Value);
							cmd.Parameters.AddWithValue("ContactTypeID", "5");
							cmd.CommandText = "UPDATE ClaimContact SET ContactID = @ContactID where ContactTypeID=@ContactTypeID";


							if (cmd.ExecuteNonQuery() > 0)
							{
								//msg.InnerHtml = cmd.CommandText.ToString();
								cmd.Parameters.Clear();
							}

						}

						else
						{
							cmd.Parameters.Clear();
							cmd.Parameters.AddWithValue("ClaimID", AllocateClaimUpdateID.Value);
							cmd.Parameters.AddWithValue("ContactID", AllocateStorage.SelectedItem.Value);
							cmd.Parameters.AddWithValue("ContactTypeID", '5');
							cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";


							if (cmd.ExecuteNonQuery() > 0)
							{
								msg.InnerHtml = cmd.CommandText.ToString();
								cmd.Parameters.Clear();
							}

						}


				
					}

				}
	
	
	
	          }

		protected void ClaimType_SelectedIndexChanged(object sender, EventArgs e)
		{

			if (this.ClaimType.SelectedItem.Text == "PI Claims")
			{
				this.Panel1.Visible = false;
			}

			 if (this.ClaimType.SelectedItem.Text == "PI and RTA")
			{
				this.Panel1.Visible = true;
		    }

			 if (this.ClaimType.SelectedItem.Text == "RTA Claims")
			{
				this.Panel1.Visible = true;
			}
					
		}
				
		protected void Logout_Click(object sender, EventArgs e)
		{
			System.Web.Security.FormsAuthentication.SignOut();
			Response.Redirect("~/login.aspx");
		}

		protected void RedirectClaim_Click(object sender, EventArgs e)
		{
			if (Request.QueryString["ClaimId"] != null)
			{

				ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

			} Response.Redirect("~/AddClaim.aspx");
		}

		protected void ClaimTitle_TextChanged(object sender, EventArgs e)
		{

		}

		protected void Button6_Click(object sender, EventArgs e)
		{
			if (Request.QueryString["ClaimId"] != null)
			{

				ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

			} Response.Redirect("~/AddInvoice.aspx?ClaimID=" + ClaimId);
		}

        protected void Button6_Click1(object sender, ImageClickEventArgs e)
		{
			if (Request.QueryString["ClaimId"] != null)
			{

				ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

			}
			Response.Redirect("~/CarHireForm.aspx?ClaimID=" + ClaimId);
		}

        protected void ClaimAdviceButton1_Click(object sender, ImageClickEventArgs e)
		{
			if (Request.QueryString["ClaimId"] != null)
			{

				ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

			}
			Response.Redirect("~/ClaimAdviceForm.aspx?ClaimID=" + ClaimId);
		}

        protected void PersonalInjuryIcon_Click(object sender, ImageClickEventArgs e)
        {
            if (Request.QueryString["ClaimId"] != null)
            {

                ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

            }
            Response.Redirect("~/PersonalInjuryForm.aspx?ClaimID=" + ClaimId);
        }


        protected void PaymentRequestButton_Click(object sender, ImageClickEventArgs e)
		{
			if (Request.QueryString["ClaimId"] != null)
			{
				
				ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);				

			}
			
			Response.Redirect("~/PaymentRequestLetter.aspx?ClaimID=" + ClaimId);
		}

		protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
		{


			if (OwnerDetailsDropDown.SelectedItem.Value == "Yes")
			{

				OwnerFirstName.Visible = false;
				OwnerSurname.Visible = false;
				OwnerCity.Visible = false;
				OwnerAddress111.Visible = false;
				OwnerAddress2.Visible = false;
				OwnerCity.Visible = false;
				OwnerPostCode.Visible = false;
				OwnerFirstNameLabel.Visible = false;
				OwnerSurnameLabel.Visible = false;
				OwnerCityLabel.Visible = false;
				OwnerOwnerAddress1Label.Visible = false;
				OwnerOwnerAddress2Label.Visible = false;
				OwnerPostCodeLabel.Visible = false;
				OwnerPhoneLabel.Visible = false;
				OwnerPhoneNo.Visible = false;
                OwnerDriverPolicyNo22.Visible = false;
                OwnerInsuranceCover.Visible = false;

                LabelInsuranceCover.Visible = false;
                LabelOwnerDriverPolicy.Visible = false;





			
			}


			if (OwnerDetailsDropDown.SelectedItem.Value == "No")
			{

				OwnerFirstName.Visible = true;
				OwnerSurname.Visible = true;
				OwnerCity.Visible = true;
				OwnerAddress111.Visible = true;
				OwnerAddress2.Visible = true;
				OwnerCity.Visible = true;
				OwnerPostCode.Visible = true;
				OwnerFirstNameLabel.Visible = true;
				OwnerSurnameLabel.Visible = true;
				OwnerCityLabel.Visible = true;
				OwnerOwnerAddress1Label.Visible = true;
				OwnerOwnerAddress2Label.Visible = true;
				OwnerPostCodeLabel.Visible = true;
				OwnerPhoneLabel.Visible = true;
				OwnerPhoneNo.Visible = true;


			}



		}



        protected void CarhireInvoiceButton_Click(object sender, ImageClickEventArgs e)
		{
			if (Request.QueryString["ClaimId"] != null)
			{

				ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

			}
			Response.Redirect("~/VehicleInvoice.aspx?ClaimID=" + ClaimId);
		}

        protected void RefferalInvoiceButton_Click(object sender, ImageClickEventArgs e)
		{
			if (Request.QueryString["ClaimId"] != null)
			{

				ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

			}
			Response.Redirect("~/AddInvoice.aspx?ClaimID=" + ClaimId);
		}

        protected void StorageInvoiceButton_Click(object sender, ImageClickEventArgs e)
		{
			if (Request.QueryString["ClaimId"] != null)
			{

				ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

			}
			Response.Redirect("~/StorageInvoice.aspx?ClaimID=" + ClaimId);
		}

        protected void IconAddDates_Click(object sender, ImageClickEventArgs e)
        {
            if (Request.QueryString["ClaimId"] != null)
            {

                ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

            }
            Response.Redirect("~/LossofUsedDates.aspx?ClaimID=" + ClaimId);
        }

        protected void ViewDates_Click(object sender, ImageClickEventArgs e)
        {
            if (Request.QueryString["ClaimId"] != null)
            {

                ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

            }
            Response.Redirect("~/UsefulDates.aspx?ClaimID=" + ClaimId);
        }



        protected void AddDocument_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/UploadDocument.aspx?ClaimId=" + ClaimId);
        }

     

		

        
    }
}
