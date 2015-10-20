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
	public partial class VehicleInvoice : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

			InvoiceIDUpdate.Value = "";
            
		

			if (Convert.ToString(Request.QueryString["InvoiceID"]) != null)
			{
				PanelInvoiceDetials.Visible = true;
				AddTable.Visible = false;
				//ClaimTypeDropDown.Visible = false;
				//InvoiceTypeDropdown.Visible = false;
				//ContactDropDown.Visible = false;
				//TemplateTypeID.Visible = false;
				//ClaimtTypeLabel.Visible = false;
				//ClaimLabel.Visible = false;
				//ContactLabel.Visible = false;
				//InvoiceLabel.Visible = false;
				//ChooseClaim.Visible = false;
				//ContactLabel.Visible = false;
				//ContactTypeLabel.Visible = false;

				string InvoiceID = Convert.ToString(Request.QueryString["InvoiceID"]);
				InvoiceIDUpdate.Value = InvoiceID;
				if (!this.IsPostBack)
				{

				
					try
					{

						using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
						{

							cnn.Open();

							using (SqlCommand Cmd = cnn.CreateCommand())
							{

								Cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

								//string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
								string sSQL = string.Format("Select * from Invoice where InvoiceID=@InvoiceID");
								Cmd.CommandText = sSQL;



								using (SqlDataReader Reader = Cmd.ExecuteReader())
								{

									if (Reader.Read())
									{
										//InvoiceTitleTextBox.Text = Convert.ToString(Reader["InvoiceTitle"]);
										//InvoiceHeaderTextBox.Text = Convert.ToString(Reader["InvoiceHeader"]);
										//AdditoinalInstrucitonTextBox.Text = Convert.ToString(Reader["AdditionalInstructions"]);
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
		}

		protected void AddInvoiceClick(object sender, EventArgs e)
		{

			string InvoiceIDValue = "";
			double VAT = 0.00;
			double TotalAmount = 0.00;
			double AmountDue = 0;

				using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
			{

				conn.Open();
				using (SqlCommand cmd = conn.CreateCommand())
				{

					//string extension = string.Empty;
					//string strFileName = string.Empty;

					//if (FileUpload1.HasFile)
					//{

					//    HttpPostedFile PostedFile = FileUpload1.PostedFile;

					//    int FileSizeKB = PostedFile.ContentLength / 1024;

					//    extension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
					//    strFileName = System.IO.Path.GetFileNameWithoutExtension(FileUpload1.FileName).ToLower();

					//    if ((extension != ".jpg" && extension != ".jpeg" && extension != ".gif" && extension != ".png") || (FileSizeKB > 500))
					//    {
					//        System.Text.StringBuilder stringBuilder = new System.Text.StringBuilder();

					//        stringBuilder.Append("<span style=\"color:Red;font-weight:bold;font-size:14px;\">Invalid image format. Only jpeg,jpg,gif,png images are permited not more than 1024 KB</span>");
					//        stringBuilder.Append(string.Format("<br/> <span style=\"color:Black;font-weight:bold;font-size:14px;\">File Extension : {0}", extension));
					//        stringBuilder.Append(string.Format(" File Size:  {0}(KB):", FileSizeKB) + "</span><br/>");

					//        Msg.InnerHtml = stringBuilder.ToString();

					//        return;
					//    }

					//    FileUpload1.SaveAs(Server.MapPath("~/Images") + "/" + strFileName + extension);
					//}






					int ContactID = 0;
					int ClaimID = Convert.ToInt32(Request.QueryString["ClaimID"]);

					try
					{

						using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
						{

							using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM ClaimContact WHERE ClaimID=@ClaimID and ContactTypeID=7", sqlConnection))
							{
								sqlCommand.Connection.Open();

								sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

								using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

									if (dataReader.Read())
									{
                                        ContactID = Convert.ToInt32(dataReader["ContactID"]);
                              
                                    }


								sqlCommand.Parameters.Clear();
					
							}




						}
				



					}



					catch (Exception EXC)
					{

#if DEBUG
						Console.WriteLine(EXC.ToString());
#endif

					}


				//string InvoiceTitle = Convert.ToString(InvoiceTitleTextBox.Text);
					//string InvoiceHeader = Convert.ToString(InvoiceHeaderTextBox.Text);
					//string AdditionalInstructions = Convert.ToString(AdditoinalInstrucitonTextBox.Text);
					string InvoiceType = "Hire Invoice";

                                        
                    cmd.CommandText = "Delete from Invoice where ClaimID = @ClaimID and InvoiceTitle = 'Carhire Invoice'";
                    cmd.Parameters.AddWithValue("ClaimID", ClaimID);

                    if (cmd.ExecuteNonQuery() > 0)
                    {

                    }

                    cmd.Parameters.Clear();
					cmd.Parameters.AddWithValue("ContactID", ContactID);
					cmd.Parameters.AddWithValue("ClaimID", ClaimID);
					cmd.Parameters.AddWithValue("InvoiceTitle", "Hire & Additional Charges");
					//cmd.Parameters.AddWithValue("AdditionalInstructions", AdditionalInstructions);
					//cmd.Parameters.AddWithValue("InvoiceHeader", InvoiceHeader);
				    cmd.Parameters.AddWithValue("InvoiceType", InvoiceType);
					//cmd.Parameters.AddWithValue("InvoiceHeaderImage", "Images/" + strFileName + extension);

					//cmd.CommandText = "INSERT into Invoice (InvoiceTitle,AdditionalInstructions,InvoiceHeader,ContactID,ClaimID,InvoiceHeaderImage,InvoiceType) values(@InvoiceTitle,@AdditionalInstructions,@InvoiceHeader,@ContactID,@ClaimID,@InvoiceHeaderImage,@InvoiceType)";

					cmd.CommandText = "INSERT into Invoice (InvoiceTitle,ContactID,ClaimID,InvoiceType) values(@InvoiceTitle,@ContactID,@ClaimID,@InvoiceType)";

					if (cmd.ExecuteNonQuery() > 0)
					{
						//msg.InnerHtml = cmd.CommandText.ToString();
						cmd.Parameters.Clear();
						cmd.CommandText = "SELECT @@IDENTITY";

						//// Get the last inserted id.
						InvoiceIDUpdate.Value = Convert.ToString(cmd.ExecuteScalar());
						InvoiceIDValue = Convert.ToString(cmd.ExecuteScalar());												

						//System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US"); 

						DateTime StorageStartDateValue = new DateTime();

						StorageStartDateValue = System.DateTime.ParseExact(StorageStartDate.Text, @"dd/MM/yyyy", null);

						DateTime StorageEndDateValue = new DateTime();

                        StorageEndDateValue = System.DateTime.ParseExact(StorageEndDate.Text, @"dd/MM/yyyy", null);


						TimeSpan dateDifference = StorageEndDateValue.Subtract(StorageStartDateValue);
						int NoOfDays = dateDifference.Days;


					//    string StorageCompanyValue = Convert.ToString(StorageCompany.SelectedItem.Text);
						//string StorageCompanyValue = "2";
						
						
						double GroupDailyRate = 0.00;
						string VehicleMake = "";
						string VehicleModel = "";
						string VehicleReg = "";
						double Amount = 0;
						string VehicleGroupTitle = "";
						int VehicleId = 0;
						

						using (SqlCommand Cmd = conn.CreateCommand())
						       {


								   VehicleId = Convert.ToInt32(VehicleDropDown.SelectedItem.Value);
							
	#region 
						//            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
						//            {

						//                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Vehicle WHERE ClaimID=@ClaimID", sqlConnection))
						//                {
						//                    sqlCommand.Connection.Open();

						//                    sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

						//                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

						//                        if (dataReader.Read())
						//                        {


						//                            VehicleId = Convert.ToInt32(dataReader["VehicleId"]);


						//                        }


						//                    sqlCommand.Parameters.Clear();

						//                }
						//            }


#endregion
								
							
							
							
							
							Cmd.Parameters.AddWithValue("VehicleId", VehicleId);


									//string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
									string sSQL = string.Format("Select * from Vehicle, VehicleGroup where vehicle.VehicleGroupId = VehicleGroup.VehicleGroupId and VehicleId=@VehicleId");
									Cmd.CommandText = sSQL;


									using (SqlDataReader Reader = Cmd.ExecuteReader())
									{


									

										
										if (Reader.Read())
										{

											 GroupDailyRate = Convert.ToDouble(Reader["GroupDailyRate"]);
											 VehicleMake = Convert.ToString(Reader["VehicleMake"]);
											 VehicleModel = Convert.ToString(Reader["VehicleModel"]);
											 VehicleReg = Convert.ToString(Reader["VehicleReg"]);
											 VehicleGroupTitle = Convert.ToString(Reader["VehicleGroupTitle"]);


											//VehicleAbiRate = Convert.ToInt32(Reader["AbiRate"]);
											Amount = GroupDailyRate * NoOfDays;

                                            double vatadminvalue = ((Site1)this.Master).VATVALUE;
											double Total = (Amount / 100) * vatadminvalue;  

										}

									}

								}


						System.Text.StringBuilder Details = new System.Text.StringBuilder();

						Details.Append("Ref No: ");
						Details.Append(ClaimID);
						Details.Append(" Rental of ");
						Details.Append(VehicleMake );
						Details.Append(" ");
						Details.Append(VehicleModel );
                        Details.Append(" ");
                        Details.Append(" Vehicle Reg:(");
                        Details.Append(VehicleReg);
                        Details.Append(") ");
             			Details.Append(" from ");
						Details.Append(StorageStartDate.Text);
						Details.Append(" to ");
						Details.Append(StorageEndDate.Text);
						Details.Append(" ");                  
						Details.Append(" ABI Group: ");
						Details.Append(VehicleGroupTitle);

						

						string Details1 = Convert.ToString(Details);
						
						cmd.Parameters.Clear();
						cmd.Parameters.AddWithValue("Details", Details1);
						cmd.Parameters.AddWithValue("NoOfDays", NoOfDays);
						cmd.Parameters.AddWithValue("Rate", GroupDailyRate);
						cmd.Parameters.AddWithValue("Amount", Amount);
						cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);

						//ControlVehiclesDropDown


						cmd.CommandText = "INSERT into InvoiceDetails (Details,NoOfDays,Rate,Amount,InvoiceID) values(@Details,@NoOfDays,@Rate,@Amount,@InvoiceID)";

						PanelInvoiceDetials.Visible = true;

						if (cmd.ExecuteNonQuery() > 0)
						{

						}


						//if (AdditionalDriverDropDown.SelectedItem.Value == "Yes")
						//{

						//    using (SqlCommand Cmd = conn.CreateCommand())
						//    {

						//        Cmd.Parameters.AddWithValue("ContactID", ContactID);

						//        //string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
						//        string sSQL = string.Format("Select * from Contact where ContactID=@ContactID");
						//        Cmd.CommandText = sSQL;



						//        using (SqlDataReader Reader = Cmd.ExecuteReader())
						//        {

						//            if (Reader.Read())
						//            {



						//            string AdditionalDriver = Convert.ToString(Reader["AdditionalDriver"]);

						//            string Details2 = "Additonal Driver: " + AdditionalDriver; 

						//            cmd.Parameters.Clear();
						//            cmd.Parameters.AddWithValue("Details", Details2);
						//            cmd.Parameters.AddWithValue("NoOfDays", "");
						//            cmd.Parameters.AddWithValue("Rate", "");
						//            cmd.Parameters.AddWithValue("Amount", "");
						//            cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);

						//            //ControlVehiclesDropDown


						//            cmd.CommandText = "INSERT into InvoiceDetails (Details,NoOfDays,Rate,Amount,InvoiceID) values(@Details,@NoOfDays,@Rate,@Amount,@InvoiceID)";

						//            PanelInvoiceDetials.Visible = true;

						//            if (cmd.ExecuteNonQuery() > 0)
						//            {

						//            }
										


						//            }

						//        }

						//    }
						//}

                        if (AdditionalDriverDropDown.SelectedItem.Value == "Yes")
                        {


                            string Details3 = "Additonal Driver Charges ";



                            double Amount3 = NoOfDays * 5.00;


                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("Details", Details3);
                            cmd.Parameters.AddWithValue("NoOfDays", NoOfDays);
                            cmd.Parameters.AddWithValue("Rate", "5");
                            cmd.Parameters.AddWithValue("Amount", Amount3);
                            cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);

                            //ControlVehiclesDropDown


                            cmd.CommandText = "INSERT into InvoiceDetails (Details,NoOfDays,Rate,Amount,InvoiceID) values(@Details,@NoOfDays,@Rate,@Amount,@InvoiceID)";

                            PanelInvoiceDetials.Visible = true;

                            if (cmd.ExecuteNonQuery() > 0)
                            {

                            }


                        }


						if (AutomaticDropDown1.SelectedItem.Value == "Yes")
						{


							string Details3 = "Automatic Baby Seat or Tow Bar ";



							double Amount3 = NoOfDays * 5.00;


							cmd.Parameters.Clear();
							cmd.Parameters.AddWithValue("Details", Details3);
							cmd.Parameters.AddWithValue("NoOfDays", NoOfDays);
							cmd.Parameters.AddWithValue("Rate", "5" );
							cmd.Parameters.AddWithValue("Amount", Amount3);
							cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);

							//ControlVehiclesDropDown


							cmd.CommandText = "INSERT into InvoiceDetails (Details,NoOfDays,Rate,Amount,InvoiceID) values(@Details,@NoOfDays,@Rate,@Amount,@InvoiceID)";

							PanelInvoiceDetials.Visible = true;

							if (cmd.ExecuteNonQuery() > 0)
							{

							}
						
						
						}

						if (EstateVehiclesDropDown.SelectedItem.Value == "Yes")
						{


							string Details3 = "Estate Vehicle Charge ";



							double Amount3 = NoOfDays * 5.00;


							cmd.Parameters.Clear();
							cmd.Parameters.AddWithValue("Details", Details3);
							cmd.Parameters.AddWithValue("NoOfDays", NoOfDays);
							cmd.Parameters.AddWithValue("Rate", "5");
							cmd.Parameters.AddWithValue("Amount", Amount3);
							cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);

							//ControlVehiclesDropDown


							cmd.CommandText = "INSERT into InvoiceDetails (Details,NoOfDays,Rate,Amount,InvoiceID) values(@Details,@NoOfDays,@Rate,@Amount,@InvoiceID)";

							PanelInvoiceDetials.Visible = true;

							if (cmd.ExecuteNonQuery() > 0)
							{

							}


						}

						if (ControlVehiclesDropDown.SelectedItem.Value == "Yes")
						{


							string Details3 = "Control Vehile Charge ";



							double Amount3 = NoOfDays * 5.00;


							cmd.Parameters.Clear();
							cmd.Parameters.AddWithValue("Details", Details3);
							cmd.Parameters.AddWithValue("NoOfDays", NoOfDays);
							cmd.Parameters.AddWithValue("Rate", "5");
							cmd.Parameters.AddWithValue("Amount", Amount3);
							cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);

							//ControlVehiclesDropDown


							cmd.CommandText = "INSERT into InvoiceDetails (Details,NoOfDays,Rate,Amount,InvoiceID) values(@Details,@NoOfDays,@Rate,@Amount,@InvoiceID)";

							PanelInvoiceDetials.Visible = true;

							if (cmd.ExecuteNonQuery() > 0)
							{

							}


						}


                        if (DeliveryCharges.Text != null)
                        {


                            string Details3 = "Delivery & Collection Charges ";



                            double Amount4 = Convert.ToInt32(DeliveryCharges.Text);


                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("Details", Details3);
                            cmd.Parameters.AddWithValue("NoOfDays", "");
                            cmd.Parameters.AddWithValue("Rate", "");
                            cmd.Parameters.AddWithValue("Amount", Amount4);
                            cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);

                            //ControlVehiclesDropDown


                            cmd.CommandText = "INSERT into InvoiceDetails (Details,NoOfDays,Rate,Amount,InvoiceID) values(@Details,@NoOfDays,@Rate,@Amount,@InvoiceID)";

                            PanelInvoiceDetials.Visible = true;

                            if (cmd.ExecuteNonQuery() > 0)
                            {

                            }


                        }





						//Response.Redirect("AddInvoice.aspx?InvoiceID=" + InvoiceIDValue);

					}

				}
			}

				try
				{

				
					using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
					{

						using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT * FROM InvoiceDetails WHERE InvoiceID=@InvoiceID", sqlConnection))
						{
							cmd.Connection.Open();

							cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);

							using (System.Data.IDataReader dataReader = cmd.ExecuteReader())
							{
								while (dataReader.Read())
								{

									TotalAmount = TotalAmount + Convert.ToInt32(dataReader["Amount"]);

								}
                                double vatadminvalue = ((Site1)this.Master).VATVALUE;
								VAT = (TotalAmount / 100) * vatadminvalue;
								AmountDue = TotalAmount + VAT;


							}



							cmd.Parameters.Clear();
							cmd.Parameters.AddWithValue("TotalAmount", TotalAmount);
							cmd.Parameters.AddWithValue("TotalVAT", VAT);
							cmd.Parameters.AddWithValue("AmountDue", AmountDue);
							cmd.Parameters.AddWithValue("GrandTotal", AmountDue);
							cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);
							cmd.Parameters.AddWithValue("InvoiceType", "Hire Invoice");
							cmd.Parameters.AddWithValue("InvoiceStatus", "Pending");
						//	cmd.Parameters.AddWithValue("InvoiceTitle", InvoiceTitleTextBox.Text);
							//cmd.Parameters.AddWithValue("InvoiceHeader", InvoiceHeaderTextBox.Text);
							//cmd.Parameters.AddWithValue("AdditionalInstructions", AdditoinalInstrucitonTextBox.Text);

							cmd.CommandText = "Update Invoice SET TotalAmount=@TotalAmount , AmountDue=@AmountDue, TotalVAT=@TotalVAT, GrandTotal=@GrandTotal, InvoiceType=@InvoiceType, InvoiceStatus=@InvoiceStatus where InvoiceID=@InvoiceID";

							if (cmd.ExecuteNonQuery() > 0)
							{
								//msg.InnerHtml = cmd.CommandText.ToString();
								cmd.Parameters.Clear();

								cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);

								//string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
								string sSQL = string.Format("Select * from Invoice where InvoiceID=@InvoiceID");
								cmd.CommandText = sSQL;

								using (SqlDataReader Reader = cmd.ExecuteReader())
								{

									if (Reader.Read())
									{
										string ClaimIDValue = Convert.ToString(Reader["ClaimID"]);

										//Response.Redirect("AddClaim.aspx?ClaimID=100");

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

		}

		protected void UpdateInvoice_Click(object sender, EventArgs e)
		{

		}

		protected void AddCarHire_Click(object sender, EventArgs e)
		{
            double GroupDailyRate = 0.0;
	
		int VehicleId = 0;
		
	    DateTime StartDateValue = new DateTime();
		StartDateValue = System.DateTime.ParseExact(StorageStartDate.Text, @"dd/MM/yyyy", null);

		DateTime EndDateValue = new DateTime();
		EndDateValue = System.DateTime.ParseExact(StorageEndDate.Text, @"dd/MM/yyyy", null);

		DateTime TodayDate = System.DateTime.Now;

		TimeSpan dateDifference = EndDateValue.Subtract(StartDateValue);
		int NoOfDays = dateDifference.Days;

		TimeSpan DateDifferenceTillToday = EndDateValue.Subtract(TodayDate);
		int NoOfDaysTillToday = DateDifferenceTillToday.Days; 


		using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
			{

				conn.Open();
				using (SqlCommand cmd = conn.CreateCommand())
				{

					int ContactID = 0;
					
					int ClaimID = Convert.ToInt32(Request.QueryString["ClaimID"]);
				    double AutomaticAmount = 0.00;
					double EstateAmount  =0.00;
					double ControlAmount  =0.00;
					double BabySeatsAmount = 0.00;
					double AdditonalDriverAmount = 0.00;
					double AdminFeesAmount= 0.00 ;
					double DeliveryChargesAmount = 0.00;	
					double TotalAmount = 0.00;
					double HireCharges = 0.00;
					double AutomaticAmountToday = 0.00;
					double EstateAmountToday = 0.00;
					double ControlAmountToday = 0.00;
					double BabySeatsAmountToday = 0.00;
					double AdditonalDriverAmountToday = 0.00;
					//double AdminFeesAmountToday = 0.00;
					//double DeliveryChargesAmountToday = 0.00;
					double TotalAmountToday = 0.00;
					double HireChargesToday = 0.00;
				
				
					try
					{

						using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
						{

							using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM ClaimContact WHERE ClaimID=@ClaimID and ContactTypeID=9", sqlConnection))
							{
								sqlCommand.Connection.Open();

								sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

								using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

									if (dataReader.Read())
									{

										ContactID = Convert.ToInt32(dataReader["ContactID"]);

									}
							sqlCommand.Parameters.Clear();
							}

						}

	                	using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
							{

								using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Vehicle", sqlConnection))
								{								
                                    
                                    sqlCommand.Connection.Open();
									
									//string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
									string sSQL = string.Format("Select * from Vehicle, VehicleGroup where vehicle.VehicleGroupId = VehicleGroup.VehicleGroupId and VehicleId=@VehicleId");
									sqlCommand.CommandText = sSQL;


									sqlCommand.Parameters.AddWithValue("VehicleId",VehicleDropDown.SelectedItem.Value);
									using (SqlDataReader Reader = sqlCommand.ExecuteReader())
									{


																			
										if (Reader.Read())
										{

											 GroupDailyRate = Convert.ToInt32(Reader["GroupDailyRate"]);
											
											//VehicleAbiRate = Convert.ToInt32(Reader["AbiRate"]);
											TotalAmount = GroupDailyRate * NoOfDays;

											TotalAmountToday = GroupDailyRate * NoOfDays;
																				

											HireCharges = GroupDailyRate * NoOfDays;

											HireChargesToday = GroupDailyRate * NoOfDays;


										

										}

									}



								}
							}


						if (AutomaticDropDown1.SelectedItem.Value == "Yes")
						{
							AutomaticAmount = NoOfDays * 5.00;
							TotalAmount = TotalAmount + AutomaticAmount;

							AutomaticAmountToday = NoOfDaysTillToday * 5.00;
							TotalAmountToday = TotalAmountToday + AutomaticAmountToday;
							

						}

						if (EstateVehiclesDropDown.SelectedItem.Value == "Yes")
						{
							EstateAmount = NoOfDays * 5.00;
							TotalAmount = TotalAmount + EstateAmount;

							EstateAmountToday = NoOfDaysTillToday * 5.00;
							TotalAmountToday = TotalAmountToday + EstateAmountToday;

							
						}

						if (ControlVehiclesDropDown.SelectedItem.Value == "Yes")
						{
							ControlAmount = NoOfDays * 5.00;
							TotalAmount = TotalAmount + ControlAmount;

							ControlAmountToday = NoOfDaysTillToday * 5.00;
							TotalAmountToday = TotalAmountToday + ControlAmountToday;


							
						}

						if (BabySeatsDropDown.SelectedItem.Value == "Yes")
						{
							BabySeatsAmount = NoOfDays * 5.00;
							TotalAmount = TotalAmount + BabySeatsAmount;


							BabySeatsAmountToday = NoOfDaysTillToday * 5.00;
							TotalAmountToday = TotalAmountToday + BabySeatsAmountToday;

						}

						if (AdditionalDriverDropDown.SelectedItem.Value == "Yes")
						{
							AdditonalDriverAmount = NoOfDays * 5.00;
							TotalAmount = TotalAmount + AdditonalDriverAmount;

							AdditonalDriverAmountToday = NoOfDaysTillToday * 5.00;
							TotalAmountToday = TotalAmountToday + AdditonalDriverAmountToday;

						}

											
					   if (DeliveryCharges.Text != null)
						{
							DeliveryChargesAmount = Convert.ToDouble(DeliveryCharges.Text);
						   TotalAmount = TotalAmount + DeliveryChargesAmount;

						}
						
						if (AdminFees.Text != null)
						{
							AdminFeesAmount = Convert.ToDouble(AdminFees.Text);
							TotalAmount = TotalAmount + AdminFeesAmount; 
						}

                        double vatadminvalue = ((Site1)this.Master).VATVALUE;
						double VAT = (TotalAmount / 100) * vatadminvalue;

                        

						double GrandTotal = VAT + TotalAmount;

						double TodayVAT = (TotalAmountToday / 100) * vatadminvalue;

						double TodayGrandTotal = VAT + TotalAmountToday;


                        cmd.CommandText = "Delete from VehicleHire where ClaimID = @ClaimID";
                        cmd.Parameters.AddWithValue("ClaimID", ClaimID);


                        if (cmd.ExecuteNonQuery() > 0)
                        {

                        }

                        cmd.Parameters.Clear();

						cmd.Parameters.AddWithValue("ContactID", ContactID);
						cmd.Parameters.AddWithValue("ClaimID", ClaimID);
                        cmd.Parameters.AddWithValue("VehicleId", VehicleDropDown.SelectedItem.Value);

						cmd.Parameters.AddWithValue("HireStartDate", StartDateValue);
						cmd.Parameters.AddWithValue("HireEndDate", EndDateValue);

						cmd.Parameters.AddWithValue("AutomaticAmount", AutomaticAmount);

						cmd.Parameters.AddWithValue("EstateAmount", EstateAmount);

						cmd.Parameters.AddWithValue("ControlAmount", ControlAmount);

						cmd.Parameters.AddWithValue("BabySeatsAmount", BabySeatsAmount);

						cmd.Parameters.AddWithValue("AdditionalDriver", AdditonalDriverAmount);

						cmd.Parameters.AddWithValue("DeliveryCharges", DeliveryChargesAmount);

						cmd.Parameters.AddWithValue("AdminFees", AdminFeesAmount);

						cmd.Parameters.AddWithValue("VAT", VAT);

						cmd.Parameters.AddWithValue("GrandTotal", GrandTotal);

						cmd.Parameters.AddWithValue("TotalAmount", TotalAmount);

						cmd.Parameters.AddWithValue("NoOfDays", NoOfDays);

						cmd.Parameters.AddWithValue("HireCharges", HireCharges);

                        cmd.Parameters.AddWithValue("GroupDailyRate", GroupDailyRate);

                        cmd.CommandText = "INSERT into VehicleHire (HireStartDate,HireEndDate,AutomaticAmount,EstateAmount,ControlAmount,BabySeatsAmount, HireCharges,NoOfDays, AdditionalDriver,DeliveryCharges,AdminFees,TotalAmount, VAT, GrandTotal, ClaimID, ContactID, VehicleID, GroupDailyRate) values (@HireStartDate,@HireEndDate,@AutomaticAmount,@EstateAmount,@ControlAmount,@BabySeatsAmount, @HireCharges,@NoOfDays, @AdditionalDriver,@DeliveryCharges,@AdminFees,@TotalAmount, @VAT, @GrandTotal, @ClaimID, @ContactID,@VehicleID, @GroupDailyRate)";

							PanelInvoiceDetials.Visible = true;

							if (cmd.ExecuteNonQuery() > 0)
							{

							}						


					}



					catch (Exception EXC)
					{

#if DEBUG
						Console.WriteLine(EXC.ToString());
#endif

					}

				}

				}
			}

		}

	}


		

		
	
