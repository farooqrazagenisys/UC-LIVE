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
    public partial class CreateCreditNote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddClaim.aspx?ClaimId=" + Request.QueryString["ClaimID"]);
        }
        protected void CreateCreditNote1_Click(object sender, EventArgs e)
        {



            double AmountDue = 0;
            int InvoiceID = Convert.ToInt32(Request.QueryString["InvoiceID"]);
            string CreditNoteExists = "false";
            // int ClaimID = Convert.ToInt32(Request.QueryString["ClaimID"]);

            using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {

                cnn.Open();

                using (SqlCommand Cmd = cnn.CreateCommand())
                {

                    Cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

                    //string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
                    string sSQL = string.Format("Select * from CreditNote where InvoiceID = @InvoiceID");
                    Cmd.CommandText = sSQL;



                    using (SqlDataReader Reader = Cmd.ExecuteReader())
                    {

                        if (Reader.Read())
                        {

                            //  int idAddress = Convert.ToInt32(Reader["idAddress"]);

                            CreditNoteExists = "true";
                        }
                    }
                }
            }

            if (CreditNoteExists == "false")
            {

                using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {

                    cnn.Open();

                    using (SqlCommand Cmd = cnn.CreateCommand())
                    {

                        Cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

                        //string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
                        string sSQL = string.Format("Select * from Invoice where InvoiceID = @InvoiceID");
                        Cmd.CommandText = sSQL;



                        using (SqlDataReader Reader = Cmd.ExecuteReader())
                        {

                            if (Reader.Read())
                            {

                                //  int idAddress = Convert.ToInt32(Reader["idAddress"]);

                                AmountDue = Convert.ToDouble(Reader["AmountDue"]);
                            }
                        }
                    }
                }



                if (AmountDue == '0')
                {
                    ErrorMessage.InnerHtml = "Credit Note cannot be created as amount is not paid" + AmountDue;

                }


                else
                {
                    using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                    {


                        conn.Open();
                        using (SqlCommand cmd1 = conn.CreateCommand())
                        {
                            cmd1.Parameters.AddWithValue("InvoiceID", InvoiceID);
                            cmd1.Parameters.AddWithValue("AmountDue", "0");
                            cmd1.CommandText = "Update Invoice SET AmountDue=@AmountDue where InvoiceID=@InvoiceID";

                            if (cmd1.ExecuteNonQuery() > 0)
                            {

                            }

                        }



                        using (SqlCommand cmd1 = conn.CreateCommand())
                        {
                            cmd1.Parameters.AddWithValue("AmountDue", Convert.ToString(AmountDue));
                                     cmd1.Parameters.AddWithValue("InvoiceID", Convert.ToString(InvoiceID));
                            cmd1.CommandText = "Insert into CreditNote (CreditAmount,InvoiceID) values(@AmountDue,@InvoiceID)";

                            if (cmd1.ExecuteNonQuery() > 0)
                            {

                            }

                            //  Response.Redirect("~/AddClaim.aspx?ClaimID=@ClaimID");

                        }

                        conn.Close();
                    }

                }

            }

            else
            {

                ErrorMessage.InnerHtml = "Credit Note Already Exists";
            }



        }
    }

    

     
}
