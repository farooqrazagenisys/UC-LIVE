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
	public partial class AmountPaid : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddClaim.aspx?ClaimId=" + Request.QueryString["ClaimID"]);
        }

		protected void Button1_Click(object sender, EventArgs e)
		{

			string InvoiceIDValue = Convert.ToString(Request.QueryString["InvoiceID"]);
			 decimal AmountDue1 = 0;
            AmountDue1.ToString("F");

            decimal TotalAmountDue1 = 0;
            TotalAmountDue1.ToString("F");


            decimal TotalAmount = 0;
            TotalAmount.ToString("F");


            decimal TotalVAT = 0;
            TotalVAT.ToString("F");

			string InvoiceType = "";
			string InvoiceTitle = "";
			string InvoiceStatus = "";
			int ContactID = 0;
			int ClaimID = 0;
            decimal GrandTotal = 0;
            GrandTotal.ToString("F");

			int CreditNoteID = 0;
            decimal AmountPaid1 = 0;
            AmountPaid1.ToString("F");


            decimal TotalAmountPaid1 = 0;
            TotalAmountPaid1.ToString("F");

            decimal CurrentPaid = 0;
           TotalAmountPaid1.ToString("F");


        



               using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
               {

                   using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT * FROM Invoice WHERE InvoiceID=@InvoiceID", sqlConnection))
                   {
                       cmd.Connection.Open();

                       cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);

                       using (System.Data.IDataReader dataReader = cmd.ExecuteReader())
                       {
                           while (dataReader.Read())
                           {

                               AmountDue1 = Convert.ToDecimal(dataReader["AmountDue"]);
                               AmountPaid1 = Convert.ToDecimal(dataReader["AmountPaid"]);
                               TotalAmount = Convert.ToDecimal(dataReader["TotalAmount"]);
                               TotalVAT = Convert.ToDecimal(dataReader["TotalVAT"]);
                               //InvoiceStatus = Convert.ToInt32(dataReader["InvoiceStatus"]);
                               InvoiceTitle = Convert.ToString(dataReader["InvoiceTitle"]);
                               ContactID = Convert.ToInt32(dataReader["ContactID"]);
                               ClaimID = Convert.ToInt32(dataReader["ClaimID"]);
                               GrandTotal = Convert.ToDecimal(dataReader["GrandTotal"]);
                               ClaimReference.Value = Convert.ToString(ClaimID);
                               InvoiceReference.Value = Convert.ToString(InvoiceIDValue);
                           }


                       }
                       




                       AmountDueValue.InnerHtml = "Amount Due: " +  AmountDue1 ;

                       if (Convert.ToDecimal(AmountPaidTextBox.Text) > AmountDue1)
                       {

                           ErrorMsg.InnerHtml = "You cannot add amount more than Amount Due";

                       }
                       else
                       {
                              try
           {
 
                                 

                           cmd.Parameters.Clear();
                           CurrentPaid = Convert.ToDecimal(AmountPaidTextBox.Text);

                           TotalAmountPaid1 = AmountPaid1 + CurrentPaid;

                           TotalAmountDue1 = AmountDue1 - CurrentPaid;

                           cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);
                           cmd.Parameters.AddWithValue("AmountDue", TotalAmountDue1);
                           cmd.Parameters.AddWithValue("AmountPaid", TotalAmountPaid1);
                           cmd.Parameters.AddWithValue("InvoiceStatus", "Partial Paid");

                           //cmd.Parameters.AddWithValue("InvoiceTitle", InvoiceTitleTextBox.Text);
                           //cmd.Parameters.AddWithValue("InvoiceHeader", InvoiceHeaderTextBox.Text);
                           //cmd.Parameters.AddWithValue("AdditionalInstructions", AdditoinalInstrucitonTextBox.Text);

                           cmd.CommandText = "Update Invoice SET  AmountDue=@AmountDue , AmountPaid=@AmountPaid , InvoiceStatus=@InvoiceStatus where InvoiceID=@InvoiceID";
                           if (cmd.ExecuteNonQuery() > 0)
                           {

                           }




                           using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                           {

                               conn.Open();
                               using (SqlCommand cmd1 = conn.CreateCommand())
                               {


                                   cmd1.Parameters.AddWithValue("PaymentMade", AmountPaidTextBox.Text);
                                   cmd1.Parameters.AddWithValue("PaymentDate", AmountPaidDate.Text);
                                   cmd1.Parameters.AddWithValue("InvoiceReference", InvoiceReference.Value);
                                   cmd1.Parameters.AddWithValue("ClaimReference", ClaimReference.Value);
                                   cmd1.Parameters.AddWithValue("PaymentTakenBy", PaymentTakenBy.Text);
                                   cmd1.Parameters.AddWithValue("PaymentMadeBy", PaymentMadeTextBox.Text);
                                   cmd1.Parameters.AddWithValue("PaymentMethod", PaymentMethod.Text);


                                   //     cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

                                   cmd1.CommandText = "INSERT into PaymentReciept (PaymentMade,PaymentDate,InvoiceReference,ClaimReference,PaymentTakenBy,PaymentMadeBy,PaymentMethod) values (@PaymentMade,@PaymentDate,@InvoiceReference,@ClaimReference,@PaymentTakenBy,@PaymentMadeBy,@PaymentMethod)";


                                   if (cmd1.ExecuteNonQuery() > 0)
                                   {
                                       //msg.InnerHtml = cmd.CommandText.ToString();
                                       cmd1.Parameters.Clear();


                                   }


                               }


                           }


                           using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                           {

                               conn.Open();
                               using (SqlCommand cmd1 = conn.CreateCommand())
                               {


                                   cmd1.Parameters.AddWithValue("AmountOutstanding", TotalAmountDue1);
                                   cmd1.Parameters.AddWithValue("BalanceDate", AmountPaidDate.Text);
                                   cmd1.Parameters.AddWithValue("InvoiceReference", InvoiceReference.Value);
                                   cmd1.Parameters.AddWithValue("ClaimReference", ClaimReference.Value);
                                   //cmd1.Parameters.AddWithValue("CompanyAddress", PaymentTakenBy.Text);
                                   //cmd1.Parameters.AddWithValue("ContactAddress", PaymentMadeTextBox.Text);


                                   //     cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

                                   cmd1.CommandText = "INSERT into BalanceReminder (AmountOutstanding,BalanceDate,InvoiceReference,ClaimReference) values (@AmountOutstanding,@BalanceDate,@InvoiceReference,@ClaimReference)";


                                   if (cmd1.ExecuteNonQuery() > 0)
                                   {
                                       //msg.InnerHtml = cmd.CommandText.ToString();
                                       cmd1.Parameters.Clear();
                                   }


                               }


                           }


                           decimal AmountPaidvalue = 0;
                           decimal AmountDuevalue = 0;
                           decimal GrandTotalValue = 0;

                                   

                           using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                           {

                               cnn.Open();

                               using (SqlCommand Cmd = cnn.CreateCommand())
                               {

                                   //Cmd.Parameters.AddWithValue("Username1", Username1);

                                   Cmd.Parameters.Clear();
                                   Cmd.Parameters.AddWithValue("ClaimID", ClaimID);
                                   Cmd.Parameters.AddWithValue("InvoiceId", InvoiceIDValue);

                                   //string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
                                   string sSQL = string.Format("Select * from Invoice where ClaimID=@ClaimID and InvoiceID=@InvoiceID");
                                   Cmd.CommandText = sSQL;

                                   using (SqlDataReader Reader = Cmd.ExecuteReader())
                                   {


                                       if (Reader.Read())
                                       {

                                           AmountPaidvalue = Convert.ToDecimal(Reader["AmountPaid"]);
                                           AmountDuevalue = Convert.ToDecimal(Reader["AmountDue"]);

                                           GrandTotalValue = Convert.ToDecimal(Reader["GrandTotal"]);

                                           // AmountPaid = Convert.ToInt32(Reader["AmountPaid"]);
                                       }
                                   }
                               }

                               //if (AmountPaid1 < AmountDue1)
                               //{
                               //    cmd.Parameters.Clear();
                               //    cmd.Parameters.AddWithValue("InvoiceStatus", "Partially Paid");

                               //    cmd.CommandText = "Update Invoice SET InvoiceStatus=@InvoiceStatus where ClaimID=@ClaimID";

                               //    if (cmd.ExecuteNonQuery() > 0)
                               //    {

                               //    }

                               //}

                               //if (AmountPaid1 == 0)
                               //{

                               //    cmd.Parameters.Clear();
                               //    cmd.Parameters.AddWithValue("InvoiceStatus", "Pending");

                               //    cmd.CommandText = "Update Invoice SET InvoiceStatus=@InvoiceStatus where ClaimID=@ClaimID";

                               //    if (cmd.ExecuteNonQuery() > 0)
                               //    {

                               //    }

                               //}



                               if (AmountDuevalue > 0 && AmountPaidvalue > 0)
                               {
                                   cmd.Parameters.Clear();
                                   cmd.Parameters.AddWithValue("InvoiceStatus", "Partially Paid");
                                   cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);
                                   cmd.Parameters.AddWithValue("ClaimID", ClaimID);

                                   cmd.CommandText = "Update Invoice SET InvoiceStatus=@InvoiceStatus where ClaimID=@ClaimID and InvoiceID=@InvoiceID";

                                   if (cmd.ExecuteNonQuery() > 0)
                                   {

                                   }

                               }

                               if (GrandTotalValue == AmountPaidvalue && GrandTotalValue > 0 && AmountPaidvalue > 0)
                               {
                                   cmd.Parameters.Clear();
                                   cmd.Parameters.AddWithValue("InvoiceStatus", "Paid");
                                   cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);
                                   cmd.Parameters.AddWithValue("ClaimID", ClaimID);

                                   cmd.CommandText = "Update Invoice SET InvoiceStatus=@InvoiceStatus where ClaimID=@ClaimID and InvoiceID=@InvoiceID";

                                   if (cmd.ExecuteNonQuery() > 0)
                                   {

                                   }

                               }

                               if (AmountPaidvalue <= 0)
                               {
                                   cmd.Parameters.Clear();
                                   cmd.Parameters.AddWithValue("InvoiceStatus", "Pending");
                                   cmd.Parameters.AddWithValue("InvoiceID", InvoiceIDValue);
                                   cmd.Parameters.AddWithValue("ClaimID", ClaimID);

                                   cmd.CommandText = "Update Invoice SET InvoiceStatus=@InvoiceStatus where ClaimID=@ClaimID and InvoiceID=@InvoiceID";

                                   if (cmd.ExecuteNonQuery() > 0)
                                   {

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

                int ClaimID2 = Convert.ToInt32(Request.QueryString["ClaimId"]);

                Response.Redirect("~/AddClaim.aspx?ClaimID=" + ClaimID2);
			}

                       }
                   }
               }


		}
	}
}
