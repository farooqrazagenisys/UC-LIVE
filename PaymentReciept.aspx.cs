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
    public partial class PaymentReciept : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            int ClaimID = Convert.ToInt32(Request.QueryString["ClaimID"]);
            string InvoiceReference = Convert.ToString(Request.QueryString["InvoiceID"]);
            string PaymentRecieptID = Convert.ToString(Request.QueryString["PaymentRecieptID"]);

            #region
            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {

                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=7", sqlConnection))
                {

                    sqlCommand.Connection.Open();



                    sqlCommand.Parameters.Clear();

                    sqlCommand.CommandText = "Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=7";


                    sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);
                    
                    using (System.Data.IDataReader dataReader1 = sqlCommand.ExecuteReader())

                        if (dataReader1.Read())
                        {




                            ViewContactInfo.InnerHtml = string.Format
                               (Convert.ToString(dataReader1["FirstName"]) + "  " + Convert.ToString(dataReader1["Surname"]) + "<br/>" +
                              Convert.ToString(dataReader1["Address1"])
                              + "<br/>" + Convert.ToString(dataReader1["Address2"]) + "<br/>" +
                              Convert.ToString(dataReader1["City"]) + "<br/>" +
                              Convert.ToString(dataReader1["Postcode"]) + "<br/>");

                        }
                }
            }


            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {

                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("select * from Claim, ClaimContact, Contact where Claim.ClaimID=@ClaimID and Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Contact.ContactTypeID='7'", sqlConnection))
                {

                    sqlCommand.Connection.Open();

                    sqlCommand.Parameters.Clear();

                    sqlCommand.CommandText = "Select * from Contact where ContactTypeID='12'";


                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                        if (dataReader.Read())
                        {

                            DocumentHeader.InnerHtml = string.Concat("<div style='text-align:center;padding-left:5px;padding-right:5px;  color:black;font-size:10px;'><img width='270' src='", Convert.ToString(dataReader["ContactImage"]), "'", "></div>", "<div style='text-align:center; color:black; padding-top:6px; width:700px; padding-left:50px; font-style:arial; font-size:12px;'>", (dataReader["Company"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["Address1"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["Address2"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["City"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["Postcode"]), "</span></div>"); 
                                
                                //"<br/><span style='font-style:bold;'>T:", Convert.ToString(dataReader["Phone"]), "&nbsp;&nbsp;F:", Convert.ToString(dataReader["Fax"]), "&nbsp;&nbsp;E:", Convert.ToString(dataReader["Email"]),
                         //   ViewAdditionalInstructions.InnerHtml = string.Format(Convert.ToString(dataReader["BankDetails"]));

                            FooterValue.InnerHtml = string.Concat(Convert.ToString(dataReader["CompanyInfo"]));


                        }
                }
            }
            #endregion


            try
            {
                using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {

                    using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM PaymentReciept where PaymentRecieptID=@PaymentRecieptID", sqlConnection))
                    {
                        string sString = "";
                        
                        sqlCommand.Connection.Open();

                        sqlCommand.Parameters.AddWithValue("PaymentRecieptID", PaymentRecieptID);
                        
                        using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                            if (dataReader.Read())
                            {

                                
                                InvoiceType.InnerHtml = "Payment Receipt";


                                int PaymentMade = Convert.ToInt32(dataReader["PaymentMade"]);
                                sString = string.Format("{0:C}", PaymentMade);


                                string PaymentDate = Convert.ToDateTime(dataReader["PaymentDate"]).ToString("dd-MM-yyyy");


                                ViewPaymentReciept.InnerHtml = string.Format("Thank you for your prompt payment" + "<br/><br/>" + "Payment Made: " + sString + "<br/><br/>" + "Payment Made By: " + Convert.ToString(dataReader["PaymentMadeBy"]) + "<br/><br/>Payment Taken By: " + Convert.ToString(dataReader["PaymentTakenBy"]));


                                InvoiceNumber.InnerHtml = string.Concat("<br/>Our Ref: ", ClaimID, "<br/><br/>", "Invoice No: ", InvoiceReference, "<br/><br/>", "Statement Date: ", PaymentDate);
                   
                                              

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

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
