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
	public partial class StorageInvoice1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			{
				InvoiceIDUpdate.Value = "";
                double vatadminvalue = ((Site1)this.Master).VATVALUE;


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
		}

        protected void AddInvoiceClick(object sender, EventArgs e)
        {
            string InvoiceIDValue = "";
            using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {

                conn.Open();
                using (SqlCommand cmd = conn.CreateCommand())
                {




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


                    cmd.Parameters.AddWithValue("ContactID", ContactID);
                    cmd.Parameters.AddWithValue("ClaimID", ClaimID);
                    cmd.Parameters.AddWithValue("InvoiceTitle", "Storage & Recovery Charges");
                    cmd.Parameters.AddWithValue("InvoiceType", "Storage Invoice");


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


                        //  string StorageCompanyValue = Convert.ToString(StorageCompany.SelectedItem.Text);


                        double GroupDailyRate = Convert.ToDouble(StorageDailyRate.Text);
                        string VehicleMake = "";
                        string VehicleModel = "";
                        string VehicleReg = "";
                        double Amount = 0;
                        int VehicleId = 0;

                        using (SqlCommand Cmd = conn.CreateCommand())
                        {


                            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                            {

                                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Vehicle WHERE ClaimID=@ClaimID", sqlConnection))
                                {
                                    sqlCommand.Connection.Open();

                                    sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

                                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                                        if (dataReader.Read())
                                        {


                                            VehicleId = Convert.ToInt32(dataReader["VehicleId"]);


                                        }


                                    sqlCommand.Parameters.Clear();

                                }
                            }

                            Cmd.Parameters.AddWithValue("VehicleId", VehicleId);

                            //string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
                            string sSQL = string.Format("Select * from Vehicle where VehicleId=@VehicleId");
                            Cmd.CommandText = sSQL;


                            using (SqlDataReader Reader = Cmd.ExecuteReader())
                            {


                                if (Reader.Read())
                                {

                                    //	GroupDailyRate = Convert.ToInt32(Reader["GroupDailyRate"]);
                                    VehicleMake = Convert.ToString(Reader["VehicleMake"]);
                                    VehicleModel = Convert.ToString(Reader["VehicleModel"]);
                                    VehicleReg = Convert.ToString(Reader["VehicleReg"]);


                                    //VehicleAbiRate = Convert.ToInt32(Reader["AbiRate"]);
                                    Amount = GroupDailyRate * NoOfDays;

                                    Amount = Amount + Convert.ToDouble(RecoverChargesTextBox.Text);
                                    double vatadminvalue = ((Site1)this.Master).VATVALUE;
                                    double Total = (Amount / 100) * vatadminvalue;




                                }

                            }

                        }


                        System.Text.StringBuilder Details = new System.Text.StringBuilder();

                        Details.Append("Storage of ");
                        Details.Append(VehicleMake);
                        Details.Append(" ");
                        Details.Append(VehicleModel);
                        Details.Append(" from (");
                        Details.Append(StorageStartDate.Text);
                        Details.Append(") to (");
                        Details.Append(StorageEndDate.Text);
                        //Details.Append(")                 Storage Location of Vehicle ");
                        //Details.Append(StorageCompanyValue);
                        Details.Append("                 Recovery From ");
                        Details.Append(RecoveryFrom.Text);

                        string Details1 = Convert.ToString(Details);


                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("Details", Details1);
                        cmd.Parameters.AddWithValue("NoOfDays", NoOfDays);
                        cmd.Parameters.AddWithValue("Rate", GroupDailyRate);
                        cmd.Parameters.AddWithValue("Amount", Amount);
                        cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);


                        cmd.CommandText = "INSERT into InvoiceDetails (Details,NoOfDays,Rate,Amount,InvoiceID) values(@Details,@NoOfDays,@Rate,@Amount,@InvoiceID)";

                        PanelInvoiceDetials.Visible = true;

                        if (cmd.ExecuteNonQuery() > 0)
                        {

                        }

                    }
                }
            }


            double TotalAmount = 0;
            double VAT = 0;
            double AmountDue = 0;

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
                        cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);
                        cmd.Parameters.AddWithValue("GrandTotal", AmountDue);

                        cmd.CommandText = "Update Invoice SET TotalAmount=@TotalAmount , AmountDue=@AmountDue, GrandTotal=@GrandTotal, TotalVAT=@TotalVAT where InvoiceID=@InvoiceID";

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

                                    Response.Redirect("AddClaim.aspx?ClaimID=" + ClaimIDValue);

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

			double TotalAmount = 0;
			double VAT = 0;
			double AmountDue = 0;
			int InvoiceID = Convert.ToInt32(InvoiceIDUpdate.Value);
			try
			{

				using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{

					using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT * FROM InvoiceDetails WHERE InvoiceID=@InvoiceID", sqlConnection))
					{
						cmd.Connection.Open();

						cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

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
						cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

						cmd.CommandText = "Update Invoice SET InvoiceTitle=@InvoiceTitle, TotalAmount=@TotalAmount , AmountDue=@AmountDue, TotalVAT=@TotalVAT where InvoiceID=@InvoiceID";

						if (cmd.ExecuteNonQuery() > 0)
						{
							//msg.InnerHtml = cmd.CommandText.ToString();
							cmd.Parameters.Clear();

							cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

							//string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
							string sSQL = string.Format("Select * from Invoice where InvoiceID=@InvoiceID");
							cmd.CommandText = sSQL;

							using (SqlDataReader Reader = cmd.ExecuteReader())
							{

								if (Reader.Read())
								{
									string ClaimIDValue = Convert.ToString(Reader["ClaimID"]);

									Response.Redirect("AddClaim.aspx?ClaimID=" + ClaimIDValue);

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

		protected void Button1_Click(object sender, EventArgs e)
		{

			int VehicleID = 0;

			//Get Contact and Claim ID
			#region 

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


			#endregion 

			// GET Vehicle ID

			#region 

			using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
			{

				using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Vehicle WHERE ClaimID=@ClaimID", sqlConnection))
				{
					sqlCommand.Connection.Open();

					sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

					using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

						if (dataReader.Read())
						{


							VehicleID = Convert.ToInt32(dataReader["VehicleId"]);


						}


					sqlCommand.Parameters.Clear();

				}
			}
			#endregion 

	
	
			
			using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
			{
				conn.Open();
				using (SqlCommand cmd = conn.CreateCommand())
				{

					DateTime StorageStartDateValue = new DateTime();

					StorageStartDateValue = System.DateTime.ParseExact(StorageStartDate.Text, @"dd/MM/yyyy", null);

					DateTime StorageEndDateValue = new DateTime();

					StorageEndDateValue = System.DateTime.ParseExact(StorageEndDate.Text, @"dd/MM/yyyy", null);

					TimeSpan dateDifference = StorageEndDateValue.Subtract(StorageStartDateValue);
					int NoOfDays = dateDifference.Days;

					double DailyRate = Convert.ToDouble(StorageDailyRate.Text);

					double TotalStorageCharges = DailyRate * NoOfDays;


					cmd.Parameters.AddWithValue("StorageStartDate", Convert.ToDateTime(StorageStartDate.Text).ToString("yyyy/MM/dd HH:mm:ss"));
					cmd.Parameters.AddWithValue("StorageEndDate", Convert.ToDateTime(StorageEndDate.Text).ToString("yyyy/MM/dd HH:mm:ss"));
					cmd.Parameters.AddWithValue("RecoverCharges", RecoverChargesTextBox.Text);
					cmd.Parameters.AddWithValue("DailyRate", DailyRate);
					cmd.Parameters.AddWithValue("StorageCompany", StorageLocation.Text);
					cmd.Parameters.AddWithValue("VehicleRepairedFrom", RecoveryFrom.Text);
					cmd.Parameters.AddWithValue("RecoveryCharges",RecoverChargesTextBox.Text);
					cmd.Parameters.AddWithValue("ClientID", ContactID);
					cmd.Parameters.AddWithValue("ClaimID", ClaimID);
					cmd.Parameters.AddWithValue("VehicleID", VehicleID);
					cmd.Parameters.AddWithValue("StorageCharges", TotalStorageCharges);

					cmd.CommandText = "Insert into VehicleStorage (StorageStartDate,StorageEndDate,DailyRate,RecoveryCharges,StorageCompany, VehicleID,ClientID,VehicleRepairedFrom,StorageCharges,ClaimID) values (@StorageStartDate,@StorageEndDate,@DailyRate,@RecoveryCharges,@StorageCompany,@VehicleID,@ClientID,@VehicleRepairedFrom,@StorageCharges,@ClaimID)";
					if (cmd.ExecuteNonQuery() > 0)
					{



					}

				}

			}
		}
	}

}