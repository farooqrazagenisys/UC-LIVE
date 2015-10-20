using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;

using System.Data;

namespace UC_LIVE
{
	public partial class LossofUsedDates : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            // Claim ID - Query Request Values	

            string ClaimID = Convert.ToString(Request.QueryString["ClaimId"]);
            if (!this.IsPostBack)
            {

                using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {
                    using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM LossOfUseDate Where ClaimID = @ClaimID", sqlConnection))
                    {
                        sqlCommand.Connection.Open();

                        sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

                        using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())
                        {
                            if (dataReader.Read())
                            {

                                if (Convert.IsDBNull(dataReader["EngineerInstructed"]))
                                {
                                    ReportInstructed.Text = null;

                                }
                                else
                                {
                                    DateTime ReportInstructed1 = Convert.ToDateTime(dataReader["EngineerInstructed"]);
                                    ReportInstructed.Text = ReportInstructed1.ToString("dd/MM/yyyy");

                                }


                                /////////////////////////////

                                if (Convert.IsDBNull(dataReader["ChequeReceived"]))
                                {
                                    ChequeReceivedTextBox.Text = null;

                                }
                                else
                                {
                                    DateTime ChequeReceivedTextBox1 = Convert.ToDateTime(dataReader["ChequeReceived"]);
                                    ChequeReceivedTextBox.Text = ChequeReceivedTextBox1.ToString("dd/MM/yyyy");

                                }

                                /////////////////////////////

                                if (Convert.IsDBNull(dataReader["ReportSubmitted"]))
                                {
                                    ReportSubmittedTextBox.Text = null;

                                }
                                else
                                {
                                    DateTime ReportSubmittedTextBox1 = Convert.ToDateTime(dataReader["ReportSubmitted"]);
                                    ReportSubmittedTextBox.Text = ReportSubmittedTextBox1.ToString("dd/MM/yyyy");
                          
                                }

                                /////////////////////////////

                                if (Convert.IsDBNull(dataReader["ReportReceieved"]))
                                {
                                    ReportRecievedDate.Text = null;

                                }
                                else
                                {
                                    DateTime ReportRecievedDate1 = Convert.ToDateTime(dataReader["ReportReceieved"]);
                                    ReportRecievedDate.Text = ReportRecievedDate1.ToString("dd/MM/yyyy");

                                }

                                /////////////////////////////

                                //if (Convert.IsDBNull(dataReader["SignedDate"]))
                                //{
                                //    SettlementDateTextBox.Text = null;

                                //}
                                //else
                                //{
                                //    DateTime SettlementDateTextBox1 = Convert.ToDateTime(dataReader["SignedDate"]);
                                //    SettlementDateTextBox.Text = SettlementDateTextBox1.ToString("dd/MM/yyyy");

                                //}


                                /////////////////////////////

                                if (Convert.IsDBNull(dataReader["OfferAccepted"]))
                                {
                                    OfferAcceptedTextBox.Text = null;

                                }
                                else
                                {
                                    DateTime SettlementDateTextBox1 = Convert.ToDateTime(dataReader["OfferAccepted"]);
                                    OfferAcceptedTextBox.Text = SettlementDateTextBox1.ToString("dd/MM/yyyy");
                          
                                } 
                                /////////////////////////////

                                if (Convert.IsDBNull(dataReader["DateRepairAuthorized"]))
                                {
                                    DateRepairAuthorizedTextBox.Text = null;

                                }
                                else
                                {

                                    DateTime DateRepairAuthorizedTextBox1 = Convert.ToDateTime(dataReader["DateRepairAuthorized"]);
                                    DateRepairAuthorizedTextBox.Text = DateRepairAuthorizedTextBox1.ToString("dd/MM/yyyy");

                                }

                                /////////////////////////////

                                if (Convert.IsDBNull(dataReader["InspectionDate"]))
                                {
                                    ReportInspected.Text = null;

                                }
                                else
                                {

                                   DateTime ReportInspected1 = Convert.ToDateTime(dataReader["InspectionDate"]);
                                   ReportInspected.Text = ReportInspected1.ToString("dd/MM/yyyy");
                                }

                                /////////////////////////////

                                if (Convert.IsDBNull(dataReader["NotificationDate"]))
                                {
                                    NotificationDateTextBox.Text = null;

                                }
                                else
                                {
                                    DateTime NotificationDateTextBox1 = Convert.ToDateTime(dataReader["NotificationDate"]);
                                    NotificationDateTextBox.Text = NotificationDateTextBox1.ToString("dd/MM/yyyy");
                                 
                                }

                                /////////////////////////////




                                sqlCommand.Connection.Close();
                            }
                            else
                            {

                                string QueryText = "INSERT into LossOfUseDate (ClaimID) values(@ClaimID)";
                                using (SqlConnection sqlConnection1 = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                                {
                                    using (System.Data.SqlClient.SqlCommand sqlCommand1 = new System.Data.SqlClient.SqlCommand(QueryText, sqlConnection1))
                                    {
                                        sqlCommand1.Connection.Open();

                                        sqlCommand1.Parameters.AddWithValue("ClaimID", ClaimID);


                                        if (sqlCommand1.ExecuteNonQuery() > 0)
                                        {
                                            //msg.InnerHtml = cmd.CommandText.ToString();
                                            sqlCommand1.Parameters.Clear();

                                            sqlCommand.Connection.Close();
                                        }



                                    }

                                }


                            }
                        }



                    }
                }
            }
        }
        protected void SubmitLossofUsedDates_Click(object sender, EventArgs e)
        {


            string EngineerInstructedValue = "";
            string InspectionDateValue = "";
            string ReportReceievedValue = "";

            string HireStartDateValue = "";
            string HireEndDateValue = "";
            string NoOfDaysValue = "";

            string StorageStartDateValue = "";
            string StorageEndDateValue = "";
            string StorageNoOfDaysValue = "";


                      string ClaimID = Convert.ToString(Request.QueryString["ClaimId"]);
          
            // VehicleHire Dates		
            #region

            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {
                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM VehicleHire where ClaimID=@ClaimID", sqlConnection))
                {
                    sqlCommand.Connection.Open();

                    sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())
                    {
                        if (dataReader.Read())
                        {

                            HireStartDateValue = Convert.ToString(dataReader["HireStartDate"]);
                            HireEndDateValue = Convert.ToString(dataReader["HireEndDate"]);
                            NoOfDaysValue = Convert.ToString(dataReader["NoOfDays"]);

                        }
                    }
                }
            }

            #endregion

            // Storage VAT Applicable 
            #region


            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {
                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM VehicleStorage Where ClaimID = @ClaimID", sqlConnection))
                {
                    sqlCommand.Connection.Open();

                    sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())
                    {
                        if (dataReader.Read())
                        {
                            StorageStartDateValue = Convert.ToString(dataReader["StorageStartDate"]);
                            StorageEndDateValue = Convert.ToString(dataReader["StorageEndDate"]);
                            StorageNoOfDaysValue = Convert.ToString(dataReader["StorageNoOfDays"]);




                        }
                    }
                }
            }

            #endregion


            using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = conn.CreateCommand())
                {

                    if (ReportInstructed.Text != "")
                    {
                        cmd.Parameters.AddWithValue("EngineerInstructed", Convert.ToDateTime(ReportInstructed.Text).ToString("yyyy/MM/dd"));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("EngineerInstructed", Convert.DBNull);
                    }
                    

                    if (NotificationDateTextBox.Text != "")
                    {
                        cmd.Parameters.AddWithValue("NotificationDate", Convert.ToDateTime(NotificationDateTextBox.Text).ToString("yyyy/MM/dd"));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("NotificationDate", Convert.DBNull);
                    }


                    if (ReportInspected.Text != "")
                    {
                        cmd.Parameters.AddWithValue("InspectionDate", Convert.ToDateTime(ReportInspected.Text).ToString("yyyy/MM/dd"));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("InspectionDate", Convert.DBNull);
                    }


                    if (DateRepairAuthorizedTextBox.Text != "")
                    {
                        cmd.Parameters.AddWithValue("DateRepairAuthorized", Convert.ToDateTime(DateRepairAuthorizedTextBox.Text).ToString("yyyy/MM/dd"));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("DateRepairAuthorized", Convert.DBNull);
                    }




                    if (OfferAcceptedTextBox.Text != "")
                    {
                        cmd.Parameters.AddWithValue("OfferAccepted", Convert.ToDateTime(OfferAcceptedTextBox.Text).ToString("yyyy/MM/dd"));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("OfferAccepted", Convert.DBNull);
                    }



                    if (ReportRecievedDate.Text != "")
                    {
                        cmd.Parameters.AddWithValue("ReportReceieved", Convert.ToDateTime(ReportRecievedDate.Text).ToString("yyyy/MM/dd"));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("ReportReceieved", Convert.DBNull);
                    }
                 

                     if (ChequeReceivedTextBox.Text != "")
                     {
                         cmd.Parameters.AddWithValue("ChequeReceived", Convert.ToDateTime(ChequeReceivedTextBox.Text).ToString("yyyy/MM/dd"));
                     }
                     else
                     {
                         cmd.Parameters.AddWithValue("ChequeReceived", Convert.DBNull);
                     }

                     if (ReportSubmittedTextBox.Text != "")
                     {
                         cmd.Parameters.AddWithValue("ReportSubmitted", Convert.ToDateTime(ReportSubmittedTextBox.Text).ToString("yyyy/MM/dd"));
                     }
                     else
                     {
                         cmd.Parameters.AddWithValue("ReportSubmitted", Convert.DBNull);
                     }

                    
                    


                        cmd.Parameters.AddWithValue("ClaimID", ClaimID);




                        //	cmd.CommandText = "INSERT into LossOfUseDate(EngineerInstructed,NotificationDate,InspectionDate ,DateRepairAuthorized,OfferAccepted,OfferDate,SignedDate ,ReportReceieved,ReportSubmitted,HireStartDate,HireEndDate,HireNoOfDays ,ChequeReceived,StorageStartDate,StorageEndDate,StorageNoOfDays) Values (@EngineerInstructed,@NotificationDate,@InspectionDate ,@DateRepairAuthorized,@OfferAccepted,@OfferDate,@SignedDate ,@ReportReceieved,@ReportSubmitted,@HireStartDate,@HireEndDate,@HireNoOfDays ,@ChequeReceived,@StorageStartDate,@StorageEndDate,@StorageNoOfDays)";
                        cmd.CommandText = "Update LossOfUseDate SET NotificationDate=@NotificationDate,DateRepairAuthorized=@DateRepairAuthorized,OfferAccepted=@OfferAccepted,ReportSubmitted=@ReportSubmitted,ChequeReceived=@ChequeReceived,InspectionDate=@InspectionDate ,EngineerInstructed=@EngineerInstructed ,ReportReceieved=@ReportReceieved  where ClaimID=@ClaimID";


                        if (cmd.ExecuteNonQuery() > 0)
                        {

                            string ClaimID1 = Convert.ToString(Request.QueryString["ClaimID"]);
                            //msg.InnerHtml = cmd.CommandText.ToString();

                            Response.Redirect("~/AddClaim.aspx?ClaimId=" + ClaimID1);



                        }




                    }


                }
            }
        

        protected void Button1_Click(object sender, EventArgs e)
        {

            string ClaimID1 = Convert.ToString(Request.QueryString["ClaimID"]);
            Response.Redirect("~/AddClaim.aspx?ClaimId=" + ClaimID1);
        }
	}
}
