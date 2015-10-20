using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;

namespace UC_LIVE
{
    public partial class LossofUsedDate2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void SubmitLossofUsedDates_Click1(object sender, EventArgs e)
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



            // Claim ID - Query Request Values	
            #region
            string ClaimID = Convert.ToString(Request.QueryString["ClaimID"]);
            #endregion

            #region




            #endregion

            // Engineer Dates
            #region
            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {
                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM EngineerReport Where ClaimID = @ClaimID", sqlConnection))
                {
                    sqlCommand.Connection.Open();

                    sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())
                    {
                        if (dataReader.Read())
                        {

                            EngineerInstructedValue = Convert.ToString(dataReader["DateInstructed"]);
                            InspectionDateValue = Convert.ToString(dataReader["DateInspected"]);
                            ReportReceievedValue = Convert.ToString(dataReader["DateReceived"]);


                        }
                    }
                }
            }
            #endregion

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


                    if (NotificationDateTextBox.Text != "")
                    {
                        cmd.Parameters.AddWithValue("NotificationDate", Convert.ToDateTime(NotificationDateTextBox.Text).ToString("yyyy/MM/dd HH:mm:ss"));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("NotificationDate", Convert.ToDateTime(DateTime.MaxValue).ToString("yyyy/MM/dd HH:mm:ss"));
                    }


                    if (DateRepairAuthorizedTextBox.Text != "")
                    {
                        cmd.Parameters.AddWithValue("DateRepairAuthorized", Convert.ToDateTime(DateRepairAuthorizedTextBox.Text).ToString("yyyy/MM/dd HH:mm:ss"));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("DateRepairAuthorized", Convert.ToDateTime(DateTime.MaxValue).ToString("yyyy/MM/dd HH:mm:ss"));
                    }


                    if (DateRepairAuthorizedTextBox.Text != "")
                    {
                        cmd.Parameters.AddWithValue("OfferAccepted", Convert.ToDateTime(OfferAcceptedTextBox.Text).ToString("yyyy/MM/dd HH:mm:ss"));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("OfferAccepted", Convert.ToDateTime(DateTime.MaxValue).ToString("yyyy/MM/dd HH:mm:ss"));
                    }

                    if (DateRepairAuthorizedTextBox.Text != "")
                    {
                        cmd.Parameters.AddWithValue("ReportSubmitted", Convert.ToDateTime(OfferAcceptedTextBox.Text).ToString("yyyy/MM/dd HH:mm:ss"));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("ReportSubmitted", Convert.ToDateTime(DateTime.MaxValue).ToString("yyyy/MM/dd HH:mm:ss"));
                    }



                    if (SettlementDateTextBox.Text != "")
                    {
                        cmd.Parameters.AddWithValue("ChequeReceived", Convert.ToDateTime(ChequeReceivedTextBox.Text).ToString("yyyy/MM/dd HH:mm:ss"));
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("ChequeReceived", Convert.ToDateTime(DateTime.MaxValue).ToString("yyyy/MM/dd HH:mm:ss"));
                    }

                    cmd.Parameters.AddWithValue("ClaimID", ClaimID);




                    //	cmd.CommandText = "INSERT into LossOfUseDate(EngineerInstructed,NotificationDate,InspectionDate ,DateRepairAuthorized,OfferAccepted,OfferDate,SignedDate ,ReportReceieved,ReportSubmitted,HireStartDate,HireEndDate,HireNoOfDays ,ChequeReceived,StorageStartDate,StorageEndDate,StorageNoOfDays) Values (@EngineerInstructed,@NotificationDate,@InspectionDate ,@DateRepairAuthorized,@OfferAccepted,@OfferDate,@SignedDate ,@ReportReceieved,@ReportSubmitted,@HireStartDate,@HireEndDate,@HireNoOfDays ,@ChequeReceived,@StorageStartDate,@StorageEndDate,@StorageNoOfDays)";
                    cmd.CommandText = "Update LossOfUseDatesManual SET NotificationDate=@NotificationDate,DateRepairAuthorized=@DateRepairAuthorized,OfferAccepted=@OfferAccepted,ReportSubmitted=@ReportSubmitted,ChequeReceived=@ChequeReceived where ClaimID=@ClaimID";


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
