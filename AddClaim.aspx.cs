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
            int ClaimTypeIDValue1 = 1;
            int ClaimTypeIDValue = 1;
		
			//int PartyatFaultUpdate = 0;
			int ClaimId = 0;
            string FirstName = "";
            string SurName = "";
            string Phone = "";
            string Mobile = "";
            string ClientEmail = "";
	
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

              
                    this.ClientDocuments.Columns[6].Visible = false;
                    this.StorageDocsUploaded.Columns[6].Visible = false;
                    this.CarhireUploaded.Columns[6].Visible = false;
                    this.SolicitorDocsUploaded.Columns[6].Visible = false;
                    this.EngineersDocsUploaded.Columns[6].Visible = false;
                    this.InsuranceDocsUploaded.Columns[6].Visible = false;
                  
                    //this.GridView5.Columns[12].Visible = false;

                    this.GridView4.Columns[7].Visible = false;

                }



            }










            if (Request.QueryString["ClaimId"] != null)
            {
                AllocateSuppliersPanel1.Visible = true;
                ManageInvoices1.Visible = true;
                ManageDocuments1.Visible = true;
                ManageFiles.Visible = true;  
                AddClaimButton.Visible = false;
                UpdateClaim.Visible = true;               
               
                string ClaimId = Request.QueryString["ClaimId"];

                //using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                //{

                //    cnn.Open();

                //    using (SqlCommand Cmd = cnn.CreateCommand())
                //    {

                //        Cmd.Parameters.AddWithValue("ClaimId", ClaimId);

                //        //string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
                //        string sSQL = string.Format("SELECT * FROM [Documents] , [ClaimDoc] where ClaimID=@ClaimID and Documents.DocID = ClaimDoc.DocID");
                //        Cmd.CommandText = sSQL;

                //        using (SqlDataReader Reader = Cmd.ExecuteReader())
                //        {


                //            if (Reader.Read())
                //            {
                //                //ClaimTypeIDValue1 = Convert.ToString(Reader["ClaimTypeID"]);

                //                if (Convert.ToString(Reader["DocType"]) == "File")
                //                {
                //                                                    }


                //                //  int idAddress = Convert.ToInt32(Reader["idAddress"]);
                //                //ClaimHeading.InnerHtml = "<a href='AddClaim.aspx?ClaimId=" + Convert.ToString(Reader["ClaimID"]) + "' style='text-decoration:none; color:gray; font-size:12px;'>" + "ClaimTitle: " + Convert.ToString(Reader["ClaimTitle"]) + "   " + "        Claim ID: " + Convert.ToString(Reader["ClaimID"]) + "</a>";
                //            }
                //        }
                //    }
                //}

                using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {

                    cnn.Open();

                    using (SqlCommand Cmd = cnn.CreateCommand())
                    {

                        Cmd.Parameters.AddWithValue("ClaimId", ClaimId);

                        //string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
                        string sSQL = string.Format("Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=7");
                        Cmd.CommandText = sSQL;

                        using (SqlDataReader Reader = Cmd.ExecuteReader())
                        {

                           
                            if (Reader.Read())
                            {
                                //ClaimTypeIDValue1 = Convert.ToString(Reader["ClaimTypeID"]);

                                if (Convert.ToString(Reader["ClaimTypeID"]) == "1")
                                {
                                    
                                    PIClaims.Visible = true;

                                    DisplaysidePanel.Visible = false;
                                    PIDisplay.Visible = true;
                                   // ClaimType1.Visible = true;
                                    PEngineerReport.Visible = true;
                                    LossofUsedDates.Visible = false;
                          
                                    
                                }

                                if (Convert.ToString(Reader["ClaimTypeID"]) == "2" || Convert.ToString(Reader["ClaimTypeID"]) == "3")
                                {
                                    PIClaims.Visible = false;
                                    LossofUsedDates.Visible = true;
                                    DisplaysidePanel.Visible = true;
                                    PIRTADisplay.Visible = true;
                                    ClaimType.Visible = true;
                                    EngineerReport.Visible = true;
                              
                                }
                            
                          

                                //  int idAddress = Convert.ToInt32(Reader["idAddress"]);
//ClaimHeading.InnerHtml = "<a href='AddClaim.aspx?ClaimId=" + Convert.ToString(Reader["ClaimID"]) + "' style='text-decoration:none; color:gray; font-size:12px;'>" + "ClaimTitle: " + Convert.ToString(Reader["ClaimTitle"]) + "   " + "        Claim ID: " + Convert.ToString(Reader["ClaimID"]) + "</a>";
                            }
                        }
                    }
                }

            }


			//AddClaimButton.Visible = true;
         //   ClaimType3.Visible = true;
           // DisplayAccordion.Visible = false;

			//RedirectClaim.Visible = this.Page.User.IsInRole("Staff");
			//Logout.Visible = this.Page.User.IsInRole("Staff");
			
			if (!this.Page.User.IsInRole("Administrator") && !this.Page.User.IsInRole("Claims Manager"))
			{

				//UpdateClaim.Visible = false;
				//TabAllocateSuppier.Visible = false;
				//DivDoucments.Visible = false;
				DivInvoices.Visible = false;
				//AddClaimButton.Visible = false;

                ManageInvoices1.Visible = false;


		


			}
    

			
			if (!this.IsPostBack)
            {
				
				if (Request.QueryString["ClaimId"]!=null)
				{
					UpdateClaim.Visible = true;
					ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);
					AddClaimButton.Visible = false;
                   
                  //  DisplayAccordion.Visible = true;

				}
				else 
				{

					UpdateClaim.Visible = false;
                    ImageButton1.Visible = false;
					
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
                string sSQL = string.Format("Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=7");                                     
                Cmd.CommandText = sSQL;

		
                           
				using (SqlDataReader Reader = Cmd.ExecuteReader())
                      
				{
                                
					if (Reader.Read())
                
								{

                                  //  int idAddress = Convert.ToInt32(Reader["idAddress"]);

                                         ClaimTitle.Text = Convert.ToString(Reader["ClaimTitle"]);                                   
                                         
									    //DateCreated.Text = Convert.ToString(Reader["DateCreated"]);
                                        //DateUpdated.Text = Convert.ToString(Reader["DateUpdated"]);
                                        //DriverPolicyNo.Text = Convert.ToString(Reader["DriverPolicyNo"]);      
									     DamageToVehcle.Text = Convert.ToString(Reader["DamageToVehcle"]);
									     RefferedBy.Text = Convert.ToString(Reader["RefferedBy"]);
                                         AccidentLocation.Text = Convert.ToString(Reader["AccidentLocation"]);										 					
                                         AccidentInfo.Text = Convert.ToString(Reader["AccidentInfo"]);
                                         RoadConditionDropdown.Text = Convert.ToString(Reader["RoadCondition"]);
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
                                         ExpiryDate.Text = Convert.ToString(Reader["LicenceExpiryDate"]);
                                         LicenseCategory.Text = Convert.ToString(Reader["LicenseCategory"]);
                                         Identification.Text = Convert.ToString(Reader["Identification1"]);
                                         IssueDate.Text = Convert.ToString(Reader["LicenceIssueDate"]);
                                         DriverLicenceNumber.Text = Convert.ToString(Reader["DriverLicenceNumber"]);
                                         if (Reader["UserFee"] == "")
                                         {
                                             UserFee.Text = "0";
                                         }

                                         else
                                         {
                                             UserFee.Text = Convert.ToString(Reader["UserFee"]);

                                         }
                                         if (PoliceAttended.Text=="Yes")
                                         {
                                             PolicePanel.Visible = true;

                                         }



                                         if (AnyWitnesses.Text == "Yes")
                                         {
                                             ViewWitnesses.Visible = true;

                                         }


                                       //  RadDateTimePicker1.SelectedDate = Convert.ToDateTime(Reader["AccidentDate"]);

                                         if (Convert.IsDBNull(Reader["AccidentDate"]))
                                        {
                                            RadDateTimePicker1.SelectedDate = null;

                                        }
                                         else
                                         {

                                             RadDateTimePicker1.SelectedDate = Convert.ToDateTime(Reader["AccidentDate"]);
                                         }             
                            
                            //}


                                         if (Convert.IsDBNull(Reader["DOB"]))
										 {
											 ContactDetails1.DateOfBirth = "";

										 }
										 else
										 {

											 ContactDetails1.DateOfBirth = Convert.ToDateTime(Reader["DOB"]).ToString("dd/MM/yyyy");
										 }



                                         if (Convert.IsDBNull(Reader["DateGPAttended"]))
										 {
                                             GPDateAttended.Text = "";

										 }
										 else
										 {

											 GPDateAttended.Text = Convert.ToDateTime(Reader["DateGPAttended"]).ToString("dd/MM/yyyy");
										 }


                                         if (Convert.IsDBNull(Reader["DateHospitalAttended"]))
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

                                         ContactDetails1.TitleValue = Convert.ToString(Reader["Title"]);
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
                                         ContactDetails1.CompanyTextBox1Value = Convert.ToString(Reader["Company"]);
										
                                         ContactDetails1.NINumber = Convert.ToString(Reader["NINO"]);

										 ContactDetails1.DriverInsurers = Convert.ToString(Reader["DriverInsurers"]);
										 ContactDetails1.DriverPolicyNo = Convert.ToString(Reader["DriverPolicyNo"]);

										 AdditionalInfo.Text = Convert.ToString(Reader["AdditionalInfo"]);
						
										 ContactDetails1.ContactID1 = Convert.ToString(Reader["ContactID"]);
										 ClaimUpdateID.Value = Reader["ClaimId"].ToString();
										 AllocateClaimUpdateID.Value = Reader["ClaimId"].ToString();

										 ClaimTypeIDValue = Convert.ToInt32(Reader["ClaimTypeID"]);
										 this.ClaimType.SelectedIndex = Convert.ToInt32(ClaimTypeIDValue) -1;
										 if (ClaimTypeIDValue == 2|| ClaimTypeIDValue == 3)
										 {
											Panel1.Visible = true;
                                            DriveLicencePanel.Visible = true;
                                            this.Panel1.Visible = true;
                                            this.DriveLicencePanel.Visible = true;
                                            //this.VehicleDetailsTitle.Visible = true;
                                            //this.VehicleDetailstable.Visible = true;
                                            this.PassengerClaimsDropDown.Visible = true;
                                            this.PassengerClaims.Visible = true;
                                            this.VehicleRoadWorthTD.Visible = true;
                                            this.VehicleRoadWorthyTd.Visible = true;
                                            this.VehicleRoadworthy.Visible = true;
                                            this.RoadConditionsTd.Visible = true;
                                            this.PassengerClaimsDropDown.Visible = true;

                                            this.PVehicleModel1.Visible = true;
                                            this.PVehicleMake1.Visible = true;
                                            this.PVehicleReg1.Visible = true;

                                            this.PVehicleRoadworthy1.Visible = true;
                                            this.Td1.Visible = false;

										 
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


                                            PTitle.Text = Convert.ToString(Reader["Title"]);
											PFirstName.Text = Convert.ToString(Reader["FirstName"]);
											PSurname.Text = Convert.ToString(Reader["Surname"]);
											PAddress1.Text = Convert.ToString(Reader["Address1"]);
											PAddress2.Text = Convert.ToString(Reader["Address2"]);
                                            PCompanyTextBox.Text = Convert.ToString(Reader["Company"]);
											PCity.Text = Convert.ToString(Reader["City"]);
											PPostCode.Text = Convert.ToString(Reader["PostCode"]);
											PPhone.Text = Convert.ToString(Reader["Phone"]);
											PMobile.Text = Convert.ToString(Reader["Mobile"]);
											PPhone.Text = Convert.ToString(Reader["Phone"]);
											PDriverPolicyNo.Text = Convert.ToString(Reader["DriverPolicyNo"]);
											//PInsuranceCover.Text = Convert.ToString(Reader["DriverInsurers"]);
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
                                    
                                    GPTitle.Text = Convert.ToString(Reader["Title"]);
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



                                    //HospitalTitle.Text = Convert.ToString(Reader["Title"]);
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
                                    // OwnerDetailsDropDown.SelectedItem.Text = "No";

                                    if (Convert.ToString(Reader["SameDriver"]) == "No")

                                    {

                                        VehicleOwner.Visible = true;
                                        OwnerDetailsDropDown.SelectedValue = "No";
                                    
                                    }

                                      if (Convert.ToString(Reader["SameDriver"]) == "Yes")
                                      {
                                        VehicleOwner.Visible = false;
                                        OwnerDetailsDropDown.SelectedValue = "Yes";


                                    }

                                  

                                    OwnerTitle.Text = Convert.ToString(Reader["Title"]);
                                    OwnerFirstName.Text = Convert.ToString(Reader["FirstName"]);
                                    OwnerSurname.Text = Convert.ToString(Reader["Surname"]);
                                    OwnerAddress111.Text = Convert.ToString(Reader["Address1"]);
                                    OwnerAddress2.Text = Convert.ToString(Reader["Address2"]);
                                    OwnerCity.Text = Convert.ToString(Reader["City"]);
                                    OwnerPostCode.Text = Convert.ToString(Reader["PostCode"]);
                                    OwnerPhoneNo.Text = Convert.ToString(Reader["Phone"]);
                                    Ocompany.Text = Convert.ToString(Reader["Company"]);


                                    if (Convert.IsDBNull(Reader["DOB"]))
                                    {

                                       DOBTextBoxowner.Text = "";
                                    }

                                    else { DOBTextBoxowner.Text = Convert.ToDateTime(Reader["DOB"]).ToString("dd/MM/yyyy"); }
                               
                                    //OwnerInsuranceCover.Text = Convert.ToString(Reader["DriverInsurers"]);
                                    //OwnerDriverPolicyNo22.Text = Convert.ToString(Reader["DriverPolicyNo"]);
                                    VehicleOwnerUpdateID.Value = Convert.ToString(Reader["ContactID"]);
                                    VehicleOwnerID = Convert.ToInt32(Reader["ContactID"]);




                                }

                                
							}


							Cmd.Parameters.Clear();

							Cmd.Parameters.AddWithValue("ClaimId", ClaimId);
                            Cmd.Parameters.AddWithValue("VehicleOwnerId", VehicleOwnerUpdateID.Value);
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
                                    VehicleRoadworthy.Text = Convert.ToString(Reader["VehicleRoadWorthy"]);                           
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

                                            W1Title.Text = Convert.ToString(Reader["Title"]);
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
                                            W2Title.Text = Convert.ToString(Reader["Title"]);
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


                                    if (this.AnyWitnesses.SelectedItem.Text == "No")
                                    {
                                        this.ViewWitnesses.Visible = false;
                                        this.WitnessTabText.Visible = true;
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

        //protected void Button1_Click(object sender, ImageClickEventArgs e)
        //{
        //  //  TabContainer1.ActiveTab = TabContainer1.Tabs[1];
        //}

        //protected void Button2_Click(object sender, ImageClickEventArgs e)
        //{
        //    //TabContainer1.ActiveTab = TabContainer1.Tabs[0];
        //}

        //protected void Button3_Click(object sender, ImageClickEventArgs e)
        //{
        //   // TabContainer1.ActiveTab = TabContainer1.Tabs[2];
        //}

        //protected void Button4_Click(object sender, ImageClickEventArgs e)
        //{
        //    //TabContainer1.ActiveTab = TabContainer1.Tabs[1];
        //}

        //protected void Button5_Click(object sender, ImageClickEventArgs e)
        //{
        //  //  TabContainer1.ActiveTab = TabContainer1.Tabs[3];
        //}
        //protected void PartatFaultNext(object sender, ImageClickEventArgs e)
        //{
        //  //  TabContainer1.ActiveTab = TabContainer1.Tabs[3];
        //}
        //protected void PartatFaultBack(object sender, ImageClickEventArgs e)
        //{
        //    //TabContainer1.ActiveTab = TabContainer1.Tabs[1];
        //}
        //protected void WitnessBtnNext(object sender, ImageClickEventArgs e)
        //{
        //    //TabContainer1.ActiveTab = TabContainer1.Tabs[4];
        //}
        //protected void WitnessBtnBack(object sender, ImageClickEventArgs e)
        //{
        //    //TabContainer1.ActiveTab = TabContainer1.Tabs[2];
        //}


        protected void UpdateClaimClick(object sender, ImageClickEventArgs e)
        {


			//Update Owner and contact Details for Client
	
#region 

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
                    ClientEmail = Email;
                    string DateOfBirth = ContactDetails1.DateOfBirth;                 
                    string NINumber = ContactDetails1.NINumber;
                    string DOB = ContactDetails1.DateOfBirth;
				    string ContactID1 = ContactDetails1.ContactID1;
					string DriverPolicyNo = ContactDetails1.DriverPolicyNo;
					string DriverInsurers = ContactDetails1.DriverInsurers;
                    string Title = ContactDetails1.TitleValue;
                    string Company = ContactDetails1.CompanyTextBox1Value;
			
			try
				{



					
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
							if (DOB == null)


							{
                                cmd.Parameters.AddWithValue("DOB", System.Data.SqlTypes.SqlDateTime.Null);

                          

							}

							else
							{
                                cmd.Parameters.AddWithValue("DOB", Convert.ToDateTime(DOB).ToString("yyyy/MM/dd"));
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
                               cmd.Parameters.AddWithValue("Company", Company);             
                            
                            cmd.Parameters.AddWithValue("NINO", NINumber);

                            cmd.Parameters.AddWithValue("Title", Title);

							cmd.Parameters.AddWithValue("DriverInsurers", DriverInsurers);
							cmd.Parameters.AddWithValue("DriverPolicyNo", DriverPolicyNo);


                            cmd.Parameters.AddWithValue("LicenceExpiryDate", ExpiryDate.Text);
                            cmd.Parameters.AddWithValue("LicenseCategory", LicenseCategory.Text);
                            cmd.Parameters.AddWithValue("Identification1", Identification.Text);
                            cmd.Parameters.AddWithValue("LicenceIssueDate", IssueDate.Text);
                            cmd.Parameters.AddWithValue("DriverLicenceNumber", DriverLicenceNumber.Text);
                        


							//cmd.Parameters.AddWithValue("ContactTypeID", "7");
							cmd.Parameters.AddWithValue("ContactID", ContactID1);
							cmd.Parameters.AddWithValue("ContactImage", "Images/" + strFileName + extension);


                             cmd.CommandText = "Update Contact SET FirstName = @FirstName, Company=@Company, LicenceExpiryDate=@LicenceExpiryDate,LicenseCategory=@LicenseCategory,Identification1=@Identification1, LicenceIssueDate=@LicenceIssueDate,DriverLicenceNumber=@DriverLicenceNumber,Surname = @Surname,  Address1 = @Address1, Address2 =  @Address2 , City = @City , PostCode = @PostCode, Country = @Country, Phone = @Phone, Mobile = @Mobile , DOB = @DOB , Fax = @Fax, Email = @Email, NINo=@NINo, DriverInsurers = @DriverInsurers, DriverPolicyNo=@DriverPolicyNo, ContactImage = @ContactImage ,Title = @Title where ContactID=@ContactID";
				
                   
                            if (cmd.ExecuteNonQuery() > 0)
                            {


                              msg.InnerHtml = cmd.CommandText.ToString();



							}

					#endregion 
							
							
							//Update Owner Details 	

							#region 

							if (OwnerDetailsDropDown.SelectedItem.Text == "Yes")
							{
                               // OwnerDetailsDropDown.SelectedItem.Value == "No"

								cmd.Parameters.Clear();

								cmd.CommandType = CommandType.Text;
                                cmd.Parameters.AddWithValue("Title", Title);
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


							
								cmd.Parameters.AddWithValue("ContactID", ContactID1);


                                cmd.CommandText = "Update Contact SET Title=@Title, FirstName = @FirstName, Surname = @Surname,  Address1 = @Address1, Address2 =  @Address2 , City = @City , PostCode = @PostCode, Country = @Country, Phone = @Phone, DriverInsurers = @DriverInsurers, DriverPolicyNo=@DriverPolicyNo  where ContactID=@ContactID";


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

                        cmd.Parameters.AddWithValue("Title", PTitle.Text);
						cmd.Parameters.AddWithValue("FirstName", PFirstName.Text);
						cmd.Parameters.AddWithValue("Surname", PSurname.Text);
						cmd.Parameters.AddWithValue("Address1", PAddress1.Text);
						cmd.Parameters.AddWithValue("Address2", PAddress2.Text);
                        cmd.Parameters.AddWithValue("Company", PCompanyTextBox.Text);
						cmd.Parameters.AddWithValue("City", PCity.Text);
						cmd.Parameters.AddWithValue("PostCode",PPostCode.Text);						
						cmd.Parameters.AddWithValue("Phone", PPhone.Text);
						cmd.Parameters.AddWithValue("Mobile", PMobile.Text);				
						cmd.Parameters.AddWithValue("ContactTypeID", "8");				
						cmd.Parameters.AddWithValue("ContactID", PartyatFaultUpdateID.Value);



						cmd.Parameters.AddWithValue("DriverPolicyNo", PDriverPolicyNo.Text);
						//cmd.Parameters.AddWithValue("DriverInsurers", PInsuranceCover.Text);
						cmd.Parameters.AddWithValue("InsuranceReferenceNo", PInsuranceReferenceNo.Text);
				  //int ClaimID = -1;

				  //using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
				  //{
				  //    if (dataReader.RecordsAffected > 0 && dataReader.Read())
				  //        ClaimID = Convert.ToInt32(dataReader["Id"]);
				  //    dataReader.Close();
				  //}


                        cmd.CommandText = "Update Contact SET Title = @Title, FirstName = @FirstName, Surname = @Surname, Company = @Company,  Address1 = @Address1, Address2 =  @Address2 , City = @City , PostCode = @PostCode, Phone = @Phone, Mobile = @Mobile , DriverPolicyNo = @DriverPolicyNo, InsuranceReferenceNo = @InsuranceReferenceNo  ,  ContactTypeID=@ContactTypeID where ContactID=@ContactID";
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
                            cmd.Parameters.AddWithValue("Title", GPTitle.Text);
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


                            cmd.CommandText = "Update Contact SET Title = @Title, FirstName = @FirstName, Surname = @Surname,  Address1 = @Address1, Address2 =  @Address2 , City = @City , PostCode = @PostCode, Country = @Country, Phone = @Phone, Mobile = @Mobile , Fax = @Fax, Email = @Email, NINo=@NINo, ContactTypeID=@ContactTypeID where ContactID=@ContactID";
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
                            cmd.Parameters.AddWithValue("Title", W1Title.Text);
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


                            cmd.CommandText = "Update Contact SET Title = @Title, FirstName = @FirstName, Surname = @Surname,  Address1 = @Address1, Address2 =  @Address2 , City = @City , PostCode = @PostCode, Country = @Country, Phone = @Phone, Mobile = @Mobile , Fax = @Fax, Email = @Email, NINo=@NINo, ContactTypeID=@ContactTypeID  where ContactID=@ContactID";
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
                            cmd.Parameters.AddWithValue("Title", W2Title.Text);
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


                            cmd.CommandText = "Update Contact SET  Title = @Title, FirstName = @FirstName, Surname = @Surname,  Address1 = @Address1, Address2 =  @Address2 , City = @City , PostCode = @PostCode, Country = @Country, Phone = @Phone, Mobile = @Mobile , Fax = @Fax, Email = @Email, NINo=@NINo, ContactTypeID=@ContactTypeID  where ContactID=@ContactID";
							

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
					if (OwnerDetailsDropDown.SelectedItem.Text == "No")
							{


								using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
								{
									conn.Open();
									using (SqlCommand cmd = conn.CreateCommand())
									{


										cmd.CommandType = CommandType.Text;
                                        cmd.Parameters.AddWithValue("Title", OwnerTitle.Text);
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
                                        cmd.Parameters.AddWithValue("Company", Ocompany.Text);

										cmd.Parameters.AddWithValue("DriverInsurers", ContactDetails1.DriverInsurers);
										cmd.Parameters.AddWithValue("DriverPolicyNo", ContactDetails1.DriverPolicyNo);


										cmd.Parameters.AddWithValue("Fax", "");
										cmd.Parameters.AddWithValue("Email", "");
                                        if (DOBTextBoxowner.Text != "")
                                        {
                                            cmd.Parameters.AddWithValue("DOB", Convert.ToDateTime(DOBTextBoxowner.Text).ToString("yyyy/MM/dd"));

                                        }

                                        else
                                        {
                                            cmd.Parameters.AddWithValue("DOB", System.Data.SqlTypes.SqlDateTime.Null);

                                        }
                                     

										cmd.Parameters.AddWithValue("NINO", "");
										cmd.Parameters.AddWithValue("ContactID", VehicleOwnerUpdateID.Value);

										//int ClaimID = -1;
										//using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
										//{
										//    if (dataReader.RecordsAffected > 0 && dataReader.Read())
										//        ClaimID = Convert.ToInt32(dataReader["Id"]);
										//    dataReader.Close();
										//}


                                        cmd.CommandText = "Update Contact SET Title = @Title, FirstName = @FirstName, Surname = @Surname,Company = @Company,Address1 = @Address1, Address2 =  @Address2 , City = @City , PostCode = @PostCode, Country = @Country, Phone = @Phone, Mobile = @Mobile , Fax = @Fax, Email = @Email, NINo=@NINo, ContactTypeID=@ContactTypeID, DriverInsurers  = @DriverInsurers, DriverPolicyNo = @DriverPolicyNo, DOB=@DOB where ContactID=@ContactID";


										if (cmd.ExecuteNonQuery() > 0)
										{
											msg.InnerHtml = cmd.CommandText.ToString();

										}

										cmd.Parameters.Clear();

									}
								}

							}
#endregion 
					
                    if (OwnerDetailsDropDown.SelectedItem.Text == "Yes")
                    {


                        using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                        {
                            conn.Open();
                            using (SqlCommand cmd = conn.CreateCommand())
                            {


                               
                                
                                
                                cmd.CommandType = CommandType.Text;

                            


                              //  cmd.Parameters.AddWithValue("DriverInsurers", ContactDetails1.DriverInsurers);
                               // cmd.Parameters.AddWithValue("DriverPolicyNo", ContactDetails1.DriverPolicyNo);


                                cmd.Parameters.AddWithValue("Title", Title);
                                cmd.Parameters.AddWithValue("FirstName", FirstName);
                                cmd.Parameters.AddWithValue("Surname", SurName);
                                cmd.Parameters.AddWithValue("Address1", Address1);
                                cmd.Parameters.AddWithValue("Address2", Address2);
                                cmd.Parameters.AddWithValue("City", City);
                                cmd.Parameters.AddWithValue("Country", " ");
                                cmd.Parameters.AddWithValue("PostCode", PostCode);
                                cmd.Parameters.AddWithValue("Phone", Phone);
                                cmd.Parameters.AddWithValue("Mobile", "");
                                cmd.Parameters.AddWithValue("ContactTypeID", "9");
                                cmd.Parameters.AddWithValue("Company", Company);

                                //cmd.Parameters.AddWithValue("Title", OwnerTitle.Text);
                                //cmd.Parameters.AddWithValue("FirstName", OwnerFirstName.Text);
                                //cmd.Parameters.AddWithValue("Surname", OwnerSurname.Text);
                                //cmd.Parameters.AddWithValue("Address1", OwnerAddress111.Text);
                                //cmd.Parameters.AddWithValue("Address2", OwnerAddress2.Text);
                                //cmd.Parameters.AddWithValue("City", OwnerCity.Text);
                                //cmd.Parameters.AddWithValue("Country", " ");
                                //cmd.Parameters.AddWithValue("PostCode", OwnerPostCode.Text);
                                //cmd.Parameters.AddWithValue("Phone", OwnerPhoneNo.Text);
                                //cmd.Parameters.AddWithValue("Mobile", "");
                                //cmd.Parameters.AddWithValue("ContactTypeID", "9");
                                //cmd.Parameters.AddWithValue("Company", Ocompany.Text);

                                cmd.Parameters.AddWithValue("DriverInsurers", ContactDetails1.DriverInsurers);
                                cmd.Parameters.AddWithValue("DriverPolicyNo", ContactDetails1.DriverPolicyNo);


                                cmd.Parameters.AddWithValue("Fax", "");
                                cmd.Parameters.AddWithValue("Email", "");
                                if (DOBTextBoxowner.Text != "")
                                {
                                    cmd.Parameters.AddWithValue("DOB", Convert.ToDateTime(DOBTextBoxowner.Text).ToString("yyyy/MM/dd"));

                                }

                                else
                                {
                                    cmd.Parameters.AddWithValue("DOB", System.Data.SqlTypes.SqlDateTime.Null);

                                }
                                cmd.Parameters.AddWithValue("NINO", "");
                                cmd.Parameters.AddWithValue("ContactID", VehicleOwnerUpdateID.Value);

                                //int ClaimID = -1;
                                //using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                                //{
                                //    if (dataReader.RecordsAffected > 0 && dataReader.Read())
                                //        ClaimID = Convert.ToInt32(dataReader["Id"]);
                                //    dataReader.Close();
                                //}


                                cmd.CommandText = "Update Contact SET Title = @Title, FirstName = @FirstName, Surname = @Surname,Company = @Company,Address1 = @Address1, Address2 =  @Address2 , City = @City , PostCode = @PostCode, Country = @Country, Phone = @Phone, Mobile = @Mobile , Fax = @Fax, Email = @Email, NINo=@NINo, ContactTypeID=@ContactTypeID, DriverInsurers  = @DriverInsurers, DriverPolicyNo = @DriverPolicyNo, DOB=@DOB  where ContactID=@ContactID";


                                if (cmd.ExecuteNonQuery() > 0)
                                {
                                    msg.InnerHtml = cmd.CommandText.ToString();

                                }

                                cmd.Parameters.Clear();

                            }
                        }

                    }













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



                            if (RadDateTimePicker1.SelectedDate != null)
							{
                                cmd.Parameters.AddWithValue("AccidentDate", RadDateTimePicker1.SelectedDate.Value);

							}

							else
							{
                               // cmd.Parameters.AddWithValue("AccidentDate", DateTime.MaxValue.ToString("yyyy/MM/dd 00:00"));
                                cmd.Parameters.AddWithValue("AccidentDate",  System.Data.SqlTypes.SqlDateTime.Null);

							}

							////////////////////


							if (HospitalDateAttended.Text != "")
							{
								cmd.Parameters.AddWithValue("DateHospitalAttended", Convert.ToDateTime(HospitalDateAttended.Text).ToString("yyyy/MM/dd"));

							}

							else
							{
                                cmd.Parameters.AddWithValue("DateHospitalAttended", System.Data.SqlTypes.SqlDateTime.Null);

							}

							//////////////////////


							if (GPDateAttended.Text != "")
							{
								cmd.Parameters.AddWithValue("DateGPAttended", Convert.ToDateTime(GPDateAttended.Text).ToString("yyyy/MM/dd"));

							}

							else
							{
                                cmd.Parameters.AddWithValue("DateGPAttended", System.Data.SqlTypes.SqlDateTime.Null);

							}


   
					cmd.CommandType = CommandType.Text;

							cmd.Parameters.AddWithValue("ClaimTitle", ClaimTitle.Text);
							cmd.Parameters.AddWithValue("DateUpdated", Convert.ToDateTime(DateTime.Now).ToString("yyyy/MM/dd HH:mm:ss"));
					
							cmd.Parameters.AddWithValue("AccidentLocation", AccidentLocation.Text);
							cmd.Parameters.AddWithValue("AccidentInfo", AccidentInfo.Text);
							cmd.Parameters.AddWithValue("RoadCondition", RoadConditionDropdown.SelectedItem.Value);
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
                            cmd.Parameters.AddWithValue("UserFee", UserFee.Text);
                            
                            
                            if(OwnerDetailsDropDown.SelectedItem.Value == null)
                            {
                               
                                cmd.Parameters.AddWithValue("SameDriver","No" );
                            }

                            else
                            {

                                cmd.Parameters.AddWithValue("SameDriver", OwnerDetailsDropDown.SelectedItem.Value);
                            }
                           
						

							//int ClaimID = -1;

							//using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
							//{
							//    if (dataReader.RecordsAffected > 0 && dataReader.Read())
							//        ClaimID = Convert.ToInt32(dataReader["Id"]);
							//    dataReader.Close();
							//}

                            cmd.CommandText = "Update Claim SET UserFee=@UserFee, ClaimTitle = @ClaimTitle , DateUpdated = @DateUpdated ,RefferedBy = @RefferedBy,AccidentLocation  = @AccidentLocation,AccidentDate  = @AccidentDate,AccidentInfo = @AccidentInfo,RoadCondition = @RoadCondition ,WhotoBlame = @WhotoBlame,PoliceAttended = @PoliceAttended,PoliceOfficerName = @PoliceOfficerName,PoliceLogNo = @PoliceLogNo ,PoliceAddress  = @PoliceAddress,DamageToVehcle = @DamageToVehcle,AdditionalInfo = @AdditionalInfo,AnyoneInjured = @AnyoneInjured,PassengerClaims = @PassengerClaims ,AnyWitnesses = @AnyWitnesses,PreviousAccidents = @PreviousAccidents, FirstPartyDealing= @FirstPartyDealing,ExistingCFA = @ExistingCFA , DateGPAttended = @DateGPAttended, DateHospitalAttended = @DateHospitalAttended, OtherLosses = @OtherLosses, InjuriesSustained = @InjuriesSustained , ClaimTypeID = @ClaimTypeID, SameDriver = @SameDriver where ClaimID=@ClaimID";


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
                {
                    Response.Redirect("AddClaim.aspx?ClaimId=" + Request.QueryString["ClaimId"]);							
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


				 FirstName = ContactDetails1.FirstName;
				 SurName = ContactDetails1.SurName;
				 Phone = ContactDetails1.Phone;
				 Mobile = ContactDetails1.Mobile;
				string Address1 = ContactDetails1.Address1;
				string Address2 = ContactDetails1.Address2;
				string PostCode = ContactDetails1.PostCode;
				string City = ContactDetails1.City;
				string Country = ContactDetails1.Country;
				string Fax = ContactDetails1.Fax;
				string Email = ContactDetails1.Email;
                ClientEmail = Email;
				string DateOfBirth = ContactDetails1.DateOfBirth;
				string NINumber = ContactDetails1.NINumber;
				string DOB = ContactDetails1.DateOfBirth;

           



				string DriverPolicyNo = ContactDetails1.DriverPolicyNo;
				string DriverInsurers = ContactDetails1.DriverInsurers;
                string Title = ContactDetails1.TitleValue;
                string Company = ContactDetails1.CompanyTextBox1Value;
                string ExpiryDate1 = Convert.ToString(ExpiryDate.Text);
                string LicenseCategory1 = Convert.ToString(LicenseCategory.Text);
                string Identification1 = Convert.ToString(Identification.Text);
                string IssueDate1 = Convert.ToString(IssueDate.Text);
                string DriverLicenceNumber1 = Convert.ToString(DriverLicenceNumber.Text);

                 
				
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
                        cmd.Parameters.AddWithValue("Title", Title);
						cmd.Parameters.AddWithValue("FirstName", FirstName);
						cmd.Parameters.AddWithValue("Surname", SurName);
						cmd.Parameters.AddWithValue("Address1", Address1);
						cmd.Parameters.AddWithValue("Address2", Address2);
						cmd.Parameters.AddWithValue("City", City);
						cmd.Parameters.AddWithValue("PostCode", PostCode);
						cmd.Parameters.AddWithValue("Country", Country);
                        cmd.Parameters.AddWithValue("LicenceExpiryDate", ExpiryDate1);
                        cmd.Parameters.AddWithValue("LicenseCategory", LicenseCategory1);
                        cmd.Parameters.AddWithValue("Identification1", Identification1);
                        cmd.Parameters.AddWithValue("LicenceIssueDate", IssueDate1);
                        cmd.Parameters.AddWithValue("DriverLicenceNumber", DriverLicenceNumber1);
						//cmd.Parameters.AddWithValue("Company", Company);
						cmd.Parameters.AddWithValue("Phone", Phone);
						cmd.Parameters.AddWithValue("Mobile", Mobile);
						cmd.Parameters.AddWithValue("Fax", Fax);
						cmd.Parameters.AddWithValue("Email", Email);

                        if (DOB == null)
                        {

                            cmd.Parameters.AddWithValue("DOB", System.Data.SqlTypes.SqlDateTime.Null);
                            


                        }
                        else {

                            cmd.Parameters.AddWithValue("DOB", DOB);
                          
                        }

						
						cmd.Parameters.AddWithValue("NINO", NINumber);
						cmd.Parameters.AddWithValue("DriverPolicyNo", DriverPolicyNo);
						cmd.Parameters.AddWithValue("DriverInsurers", DriverInsurers);
						cmd.Parameters.AddWithValue("ContactTypeID", "7");
                        cmd.Parameters.AddWithValue("Company", Company);
						cmd.Parameters.AddWithValue("ContactImage", "Images/" + strFileName + extension);

                        cmd.CommandText = "INSERT into Contact (FirstName, Surname, Company, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, DOB, NINo, ContactTypeID,DriverPolicyNo, DriverInsurers, ContactImage, Title,LicenceExpiryDate,LicenceIssueDate, LicenseCategory,Identification1,DriverLicenceNumber) values (@FirstName, @Surname, @Company, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @DOB, @NINo, @ContactTypeID, @DriverPolicyNo, @DriverInsurers, @ContactImage, @Title,@LicenceExpiryDate,@LicenceIssueDate, @LicenseCategory,@Identification1,@DriverLicenceNumber)";
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
                            cmd.Parameters.AddWithValue("Title", Title);
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

							//cmd.Parameters.AddWithValue("DriverPolicyNo",OwnerDriverPolicyNo22.Text);
							//cmd.Parameters.AddWithValue("DriverInsurers", OwnerInsuranceCover.Text);
						
							cmd.Parameters.AddWithValue("ContactTypeID", "9");

							cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email,ContactTypeID,Title) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @ContactTypeID,@Title)";
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
                        cmd.Parameters.AddWithValue("Title", PTitle.Text);
						cmd.Parameters.AddWithValue("FirstName", PFirstName.Text);
						cmd.Parameters.AddWithValue("Surname", PSurname.Text);
                        cmd.Parameters.AddWithValue("Company", PCompanyTextBox.Text);
						cmd.Parameters.AddWithValue("Address1", PAddress1.Text);
						cmd.Parameters.AddWithValue("Address2", PAddress2.Text);
						cmd.Parameters.AddWithValue("City", PCity.Text);
						cmd.Parameters.AddWithValue("PostCode", PPostCode.Text);
						cmd.Parameters.AddWithValue("Country", "");
						cmd.Parameters.AddWithValue("Phone", PPhone.Text);
						cmd.Parameters.AddWithValue("Mobile", PMobile.Text);
						cmd.Parameters.AddWithValue("DriverPolicyNo", PDriverPolicyNo.Text);
						//cmd.Parameters.AddWithValue("DriverInsurers", PInsuranceCover.Text);
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


						cmd.CommandText = "INSERT into Contact (FirstName, Surname, Company, Address1, Address2, City , PostCode, Country, Phone, Mobile, InsuranceReferenceNo, DriverPolicyNo, Fax, Email, NINo, ContactTypeID, Title) values (@FirstName, @Surname, @Company, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @InsuranceReferenceNo, @DriverPolicyNo, @Fax, @Email, @NINo, @ContactTypeID, @Title)";
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
                        cmd.Parameters.AddWithValue("Title", GPTitle.Text);
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


						cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo, ContactTypeID, Title) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @NINo, @ContactTypeID, @Title)";
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
                        //cmd.Parameters.AddWithValue("Title", HospitalTitle.Text);
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
                        cmd.Parameters.AddWithValue("Title", W1Title.Text);
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


						cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo, ContactTypeID, WitnessSequence, Title) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @NINo, @ContactTypeID, @WitnessSequence, @Title)";

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
                        cmd.Parameters.AddWithValue("Title", W2Title.Text);
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


						cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo, ContactTypeID,WitnessSequence,Title) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @NINo, @ContactTypeID, @WitnessSequence, @Title)";

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
                    //ContactDetails1

                 //   this.ContactDetails1.DrivingLicencePanel = true;
					if (OwnerDetailsDropDown.SelectedItem.Value == "No")
					{

						using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
						{
							conn.Open();
							using (SqlCommand cmd = conn.CreateCommand())
							{


								cmd.CommandType = CommandType.Text;
                                cmd.Parameters.AddWithValue("Title", OwnerTitle.Text);
								cmd.Parameters.AddWithValue("FirstName", OwnerFirstName.Text);
								cmd.Parameters.AddWithValue("Surname", OwnerSurname.Text);
                                cmd.Parameters.AddWithValue("Company", Ocompany.Text);
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

                                if (DOBTextBoxowner.Text != "")
                                {
                                    cmd.Parameters.AddWithValue("DOB", Convert.ToDateTime(DOBTextBoxowner.Text).ToString("yyyy/MM/dd"));

                                }

                                else
                                {
                                    cmd.Parameters.AddWithValue("DOB", System.Data.SqlTypes.SqlDateTime.Null);

                                }
							
								cmd.Parameters.AddWithValue("NINO", "");

								//cmd.Parameters.AddWithValue("DriverPolicyNo", OwnerDriverPolicyNo22.Text);
								//cmd.Parameters.AddWithValue("DriverInsurers", OwnerInsuranceCover.Text);




								//int ClaimID = -1;

								//using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
								//{
								//    if (dataReader.RecordsAffected > 0 && dataReader.Read())
								//        ClaimID = Convert.ToInt32(dataReader["Id"]);
								//    dataReader.Close();
								//}


                                cmd.CommandText = "INSERT into Contact (FirstName, Surname, Company,  Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo, ContactTypeID,Title,DOB) values (@FirstName, @Surname, @Company, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @NINo, @ContactTypeID, @Title, @DOB)";

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
                        if (RadDateTimePicker1.SelectedDate != null) 
						{
                            cmd.Parameters.AddWithValue("AccidentDate", RadDateTimePicker1.SelectedDate.Value);
						
						}

					else 
					
						{
                            cmd.Parameters.AddWithValue("AccidentDate",System.Data.SqlTypes.SqlDateTime.Null);

						}

						if (GPDateAttended.Text != "")
						{
							cmd.Parameters.AddWithValue("DateGPAttended", Convert.ToDateTime(GPDateAttended.Text).ToString("yyyy/MM/dd"));

						}

						else
						{
                            cmd.Parameters.AddWithValue("DateGPAttended", System.Data.SqlTypes.SqlDateTime.Null);

						}

							if (HospitalDateAttended.Text != "")
						{
							cmd.Parameters.AddWithValue("DateHospitalAttended", Convert.ToDateTime(HospitalDateAttended.Text).ToString("yyyy/MM/dd"));

						}

						else
						{
							cmd.Parameters.AddWithValue("DateHospitalAttended", System.Data.SqlTypes.SqlDateTime.Null);

						}




						cmd.CommandType = CommandType.Text;

						cmd.Parameters.AddWithValue("ClaimTitle", ClaimTitle.Text);

						cmd.Parameters.AddWithValue("DateCreated", Convert.ToDateTime(DateTime.Now).ToString("yyyy/MM/dd HH:mm:ss"));
						cmd.Parameters.AddWithValue("DateUpdated", Convert.ToDateTime(DateTime.Now).ToString("yyyy/MM/dd HH:mm:ss"));
						
						cmd.Parameters.AddWithValue("AccidentLocation", AccidentLocation.Text);
						cmd.Parameters.AddWithValue("AccidentInfo", AccidentInfo.Text);
						cmd.Parameters.AddWithValue("RoadCondition", RoadConditionDropdown.SelectedItem.Value);
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
                        cmd.Parameters.AddWithValue("UserFee", UserFee.Text);

                        cmd.Parameters.AddWithValue("SameDriver", OwnerDetailsDropDown.SelectedItem.Value);



                        cmd.Parameters.AddWithValue("ClaimUserValue", Page.User.Identity.Name);

                        if (this.Page.User.IsInRole("Administrator"))
                        {
                            cmd.Parameters.AddWithValue("ClaimUserRole", "Administrator");
                        }


                        else if (this.Page.User.IsInRole("Agent"))
                        {
                            cmd.Parameters.AddWithValue("ClaimUserRole", "Agent");
                        }


                        else if (this.Page.User.IsInRole("Branch"))
                        {
                            cmd.Parameters.AddWithValue("ClaimUserRole", "Branch");
                        }


                        else if (this.Page.User.IsInRole("Staff"))
                        {
                            cmd.Parameters.AddWithValue("ClaimUserRole", "Staff");
                        }

                        else if (this.Page.User.IsInRole("Guest"))
                        {
                            cmd.Parameters.AddWithValue("ClaimUserRole", "Guest");
                        }
                        else if (this.Page.User.IsInRole("Claims Manager"))
                        {
                            cmd.Parameters.AddWithValue("ClaimUserRole", "Claims Manager");
                        }
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

                        cmd.CommandText = "INSERT into Claim (ClaimTitle ,DateCreated ,DateUpdated ,RefferedBy ,AccidentLocation ,AccidentDate ,AccidentInfo ,RoadCondition ,WhotoBlame ,PoliceAttended ,PoliceOfficerName ,PoliceLogNo ,PoliceAddress  ,vehicleRoadworthy ,DamageToVehcle,AdditionalInfo,AnyoneInjured,PassengerClaims ,ExistingCFA, AnyWitnesses,PreviousAccidents,ClaimTypeID ,ClaimStatusID,InjuriesSustained ,OtherLosses,FirstPartyDealing, DateGPAttended, DateHospitalAttended, ClaimUserValue, ClaimUserRole,UserFee, SameDriver) values(@ClaimTitle ,@DateCreated ,@DateUpdated ,@RefferedBy ,@AccidentLocation ,@AccidentDate ,@AccidentInfo ,@RoadCondition ,@WhotoBlame ,@PoliceAttended ,@PoliceOfficerName ,@PoliceLogNo ,@PoliceAddress ,@vehicleRoadworthy ,@DamageToVehcle,@AdditionalInfo,@AnyoneInjured,@PassengerClaims ,@ExistingCFA, @AnyWitnesses,@PreviousAccidents,@ClaimTypeID ,@ClaimStatusID,@InjuriesSustained ,@OtherLosses,@FirstPartyDealing, @DateGPAttended, @DateHospitalAttended, @ClaimUserValue, @ClaimUserRole,@UserFee,@SameDriver)";


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
                        cmd.Parameters.AddWithValue("VehicleRoadWorthy", VehicleRoadworthy.Text);
						cmd.Parameters.AddWithValue("ClaimId", ClaimIDvalue);
						cmd.Parameters.AddWithValue("VehicleType", "ClientCar");

                        cmd.CommandText = "INSERT into Vehicle (VehicleMake,VehicleModel,VehicleReg,VehicleOwnerId, ClaimId,VehicleType,VehicleRoadworthy) values(@VehicleMake,@VehicleModel,@VehicleReg,@VehicleOwnerId,@ClaimId,@VehicleType,@VehicleRoadworthy)";


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

                        cmd.Parameters.AddWithValue("ClaimID", ClaimIDvalue);

                        cmd.CommandText = "INSERT into LossOfUseDate (ClaimID) Values(@ClaimID)";
                        //cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo ) values (@PFirstName, @PSurname, @PAddress1, @PAddress2, @PCity , @PPostCode, @PCountry, @PPhone, @PMobile, @PFax, @PEmail, @PNINo )";


                        if (cmd.ExecuteNonQuery() > 0)
                        {

                            msg.InnerHtml = cmd.CommandText.ToString();
                            cmd.Parameters.Clear();



                        }


					}



                    string ToEmailValue = "info@uclive.co.uk";
                    System.Text.StringBuilder stringBuilder = new System.Text.StringBuilder();




                    // Send the email to Custoemr for booking details. Put the booking information in message one you completed the booking.

                    System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient("mail.uclive.co.uk");

                    smtpClient.Credentials = new System.Net.NetworkCredential("info@uclive.co.uk", "password123");
                    //System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient("92.48.110.7");

                    System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();



                    //mailMessage.Attachments.Add(new System.Net.Mail.Attachment(string.Concat(System.IO.Directory.GetCurrentDirectory(),strFileName)));

                    mailMessage.From = new System.Net.Mail.MailAddress("info@uclive.co.uk");

                    mailMessage.Subject = "New Claim Referral - " + User.Identity.Name;

                    string MessageValue = "<br/>" +


                       "<table border='0' cellspacing='0' cellpadding='0' width='836'><tr><td><img src='http://www.uclive.co.uk/admin/Images/Eshot1.png' width='832' height='159' /></td></tr><tr><td width='836'><table width='900' border='0' cellspacing='0' cellpadding='0'><tr><td valign='top'><p><br />Thank you for submitting the claim, your claim reference no and client details are given below" +
                       "<br/><br/>Claim Reference No: " + ClaimIDvalue +
                       "<br/><br/>Claim Submitted by: " + User.Identity.Name +
                       "<br/><br/>Accident Date: " + RadDateTimePicker1.SelectedDate +
                       "<br/><br/>Client Name: " + FirstName + " " + SurName +
                       "<br/><br/>Client Phone: " + Phone +
                       "<br/><br/>Client Mobile: " + Mobile +
                       "<br/><br/>Client Email: " + ClientEmail + "<br/><br/><br/><br/>" +
                      "<p><img src='http://www.uclive.co.uk/admin/Images/Eshot3.png' width='459' height='255' /></p></td><td><img src='http://www.uclive.co.uk/admin/Images/Eshot2.png' width='365' height='624' /></td> </tr></table><p>&nbsp;</p></td></tr></table>";

                    stringBuilder.Append(string.Format(MessageValue));

                    mailMessage.Body = stringBuilder.ToString();

                    mailMessage.IsBodyHtml = true;

                    ToEmailValue = "info@uclive.co.uk";


#if DEBUG
                    mailMessage.To.Add("info@uclive.co.uk");
#else
				
                mailMessage.To.Add(ToEmailValue);
#endif
                    smtpClient.Send(mailMessage);

                    //TxtNameCV.Text = string.Empty;

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

                Response.Redirect("AddClaim.aspx?ClaimId=" + Request.QueryString["ClaimId"]);
	
	          }

		protected void ClaimType_SelectedIndexChanged(object sender, EventArgs e)
		{

			if (this.ClaimType.SelectedItem.Text == "PI Claims")
			{
				this.Panel1.Visible = false;
                this.DriveLicencePanel.Visible = false;
                this.Panel1.Visible = false;
                this.DriveLicencePanel.Visible = false;
               // this.VehicleDetailsTitle.Visible = false;
               // this.VehicleDetailstable.Visible = false;
                this.PassengerClaimsDropDown.Visible = false;
                this.PassengerClaims.Visible = false;
                this.VehicleRoadWorthTD.Visible = false;
                this.VehicleRoadWorthyTd.Visible = false;
                this.VehicleRoadworthy.Visible = false;
                this.RoadConditionsTd.Visible = false;
            
                this.PVehicleModel1.Visible = false;
                this.PVehicleMake1.Visible = false;
                this.PVehicleReg1.Visible = false;
                this.PVehicleRoadworthy1.Visible = false;
                this.LossofUsedDates.Visible = false;

                this.Td1.Visible = true;



            }

			 if (this.ClaimType.SelectedItem.Text == "PI and RTA")
			{
				this.Panel1.Visible = true;
                this.DriveLicencePanel.Visible = true;       
                //this.VehicleDetailsTitle.Visible = true;
                //this.VehicleDetailstable.Visible = true;
                this.PassengerClaimsDropDown.Visible = true;
                this.PassengerClaims.Visible = true;
                this.VehicleRoadWorthTD.Visible = true;
                this.VehicleRoadWorthyTd.Visible = true;
                this.VehicleRoadworthy.Visible = true;
                this.RoadConditionsTd.Visible = true;
                this.PassengerClaimsDropDown.Visible = true;
                this.LossofUsedDates.Visible = true;
                this.PVehicleModel1.Visible = true;
                this.PVehicleMake1.Visible = true;
                this.PVehicleReg1.Visible = true;

                this.PVehicleRoadworthy1.Visible = true;
                this.Td1.Visible = false;
               
               
		    }

			 if (this.ClaimType.SelectedItem.Text == "RTA Claims")
			{
				this.Panel1.Visible = true;
                this.DriveLicencePanel.Visible = true;
                //this.ContactDetails1.DrivingLicencePanel = true;
                this.Panel1.Visible = true;
                this.DriveLicencePanel.Visible = true;
                //this.VehicleDetailsTitle.Visible = true;
              //  this.VehicleDetailstable.Visible = true;
                this.PassengerClaimsDropDown.Visible = true;
                this.PassengerClaims.Visible = true;
                this.VehicleRoadWorthTD.Visible = true;
                this.VehicleRoadWorthyTd.Visible = true;
                this.VehicleRoadworthy.Visible = true;
                this.RoadConditionsTd.Visible = true;
                this.LossofUsedDates.Visible = true;
                this.PVehicleModel1.Visible = true;
                this.PVehicleMake1.Visible = true;
                this.PVehicleReg1.Visible = true;
                this.PVehicleRoadworthy1.Visible = true;


                this.Td1.Visible = false;
			}
					
		}

        protected void PolicePanleVisibility(object sender, EventArgs e)
        {

            if (this.PoliceAttended.SelectedItem.Text == "No")
            {
                this.PolicePanel.Visible = false;
            }
            if (this.PoliceAttended.SelectedItem.Text == "Yes")
            {
                this.PolicePanel.Visible = true;
            }

        }

        protected void WitnessVisiblityTab(object sender, EventArgs e)
        {

            if (this.AnyWitnesses.SelectedItem.Text == "No")
            {
                this.ViewWitnesses.Visible = false;
                this.WitnessTabText.Visible = true;
            }
            if (this.AnyWitnesses.SelectedItem.Text == "Yes")
            {
                this.WitnessTabText.Visible = false;
                this.ViewWitnesses.Visible = true;
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

        //protected void Button6_Click(object sender, EventArgs e)
        //{
        //    if (Request.QueryString["ClaimId"] != null)
        //    {

        //        ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

        //    } Response.Redirect("~/AddInvoice.aspx?ClaimID=" + ClaimId);
        //}

        //protected void Button6_Click1(object sender, ImageClickEventArgs e)
        //{
        //    if (Request.QueryString["ClaimId"] != null)
        //    {

        //        ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

        //    }
        //    Response.Redirect("~/CarHireForm.aspx?ClaimID=" + ClaimId);
        //}

        //protected void ClaimAdviceButton1_Click(object sender, ImageClickEventArgs e)
        //{
        //    if (Request.QueryString["ClaimId"] != null)
        //    {

        //        ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

        //    }
        //    Response.Redirect("~/ClaimAdviceForm.aspx?ClaimID=" + ClaimId);
        //}

        //protected void PersonalInjuryIcon_Click(object sender, ImageClickEventArgs e)
        //{
        //    if (Request.QueryString["ClaimId"] != null)
        //    {

        //        ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

        //    }
        //    Response.Redirect("~/PersonalInjuryForm.aspx?ClaimID=" + ClaimId);
        //}


        //protected void PaymentRequestButton_Click(object sender, ImageClickEventArgs e)
        //{
        //    if (Request.QueryString["ClaimId"] != null)
        //    {
				
        //        ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);				

        //    }
			
        //    Response.Redirect("~/PaymentRequestLetter.aspx?ClaimID=" + ClaimId);
        //}

		protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
		{


			if (OwnerDetailsDropDown.SelectedItem.Value == "No")
			{
                VehicleOwner.Visible = true;
                //OwnerFirstName.Visible = false;
                //OwnerSurname.Visible = false;
                //OwnerCity.Visible = false;
                //OwnerAddress111.Visible = false;
                //OwnerAddress2.Visible = false;
                //OwnerCity.Visible = false;
                //OwnerPostCode.Visible = false;
                //OwnerFirstNameLabel.Visible = false;
                //OwnerSurnameLabel.Visible = false;
                //OwnerCityLabel.Visible = false;
                //OwnerOwnerAddress1Label.Visible = false;
                //OwnerOwnerAddress2Label.Visible = false;
                //OwnerPostCodeLabel.Visible = false;
                //OwnerPhoneLabel.Visible = false;
                //OwnerPhoneNo.Visible = false;

			
			}
            if (OwnerDetailsDropDown.SelectedItem.Value == "Yes")
            {
                VehicleOwner.Visible = false;


            }

            //if (OwnerDetailsDropDown.SelectedItem.Value == "No")
            //{

            //    OwnerFirstName.Visible = true;
            //    OwnerSurname.Visible = true;
            //    OwnerCity.Visible = true;
            //    OwnerAddress111.Visible = true;
            //    OwnerAddress2.Visible = true;
            //    OwnerCity.Visible = true;
            //    OwnerPostCode.Visible = true;
            //    OwnerFirstNameLabel.Visible = true;
            //    OwnerSurnameLabel.Visible = true;
            //    OwnerCityLabel.Visible = true;
            //    OwnerOwnerAddress1Label.Visible = true;
            //    OwnerOwnerAddress2Label.Visible = true;
            //    OwnerPostCodeLabel.Visible = true;
            //    OwnerPhoneLabel.Visible = true;
            //    OwnerPhoneNo.Visible = true;


            //}



		}



        protected void CarhireInvoiceButton_Click(object sender, ImageClickEventArgs e)
		{
			if (Request.QueryString["ClaimId"] != null)
			{

				ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

			}
            Response.Redirect("~/NewCarHireInvoice.aspx?ClaimID=" + ClaimId + "&action=NewInvoice");
		}

        protected void RefferalInvoiceButton_Click(object sender, ImageClickEventArgs e)
		{
			if (Request.QueryString["ClaimId"] != null)
			{

				ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

			}

            Response.Redirect("~/AddInvoice.aspx?ClaimID=" + ClaimId + "&action=NewInvoice");
		}

        protected void StorageInvoiceButton_Click(object sender, ImageClickEventArgs e)
		{
			if (Request.QueryString["ClaimId"] != null)
			{

				ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

			}
            Response.Redirect("~/NewStorageInvoice.aspx?ClaimID=" + ClaimId + "&action=NewInvoice");
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
            Response.Redirect("~/UsefulDates.aspx?ClaimId=" + ClaimId);
        }



        protected void AddDocument_Click(object sender, ImageClickEventArgs e)
        {

            if (Request.QueryString["ClaimId"] != null)
            {

                ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

                Response.Redirect("~/UploadDocument.aspx?ClaimId=" + ClaimId);
            }
          
        }

        protected void AddDocument_Click1(object sender, ImageClickEventArgs e)
        {
            
		  if (Request.QueryString["ClaimId"] != null)
            {

                ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);
            Response.Redirect("~/AddNewDoc.aspx?ClaimId=" + ClaimId);
            }

        }

        protected void AddDocument_Click2(object sender, ImageClickEventArgs e)
        {
            if (Request.QueryString["ClaimId"] != null)
            {

                ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

                Response.Redirect("~/AddEngineerReport.aspx?ClaimId=" + ClaimId);
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

               string ClaimId = Request.QueryString["ClaimId"];
               using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
               {

                   cnn.Open();

                   using (SqlCommand Cmd = cnn.CreateCommand())
                   {

                       Cmd.Parameters.AddWithValue("ClaimId", ClaimId);

                       //string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
                       string sSQL = string.Format("Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=7");
                       Cmd.CommandText = sSQL;

                       using (SqlDataReader Reader = Cmd.ExecuteReader())
                       {


                           if (Reader.Read())
                           {
                               ClaimTypeIDValue1 = Convert.ToInt16(Reader["ClaimTypeID"]);

                           }
                       }
                   }
               }

            Response.Redirect("PrintDocuments.aspx?ClaimID=" + Request.QueryString["ClaimId"] + "&ClaimType=" + ClaimTypeIDValue1);

        }

        protected void LossofUsedDates_Click(object sender, ImageClickEventArgs e)
        {
            ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

            Response.Redirect("~/LossofUsedDates.aspx?ClaimId=" + ClaimId);
        }

        



   
    }
}
