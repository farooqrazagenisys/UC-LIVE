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
    public partial class ViewCreditNote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int ClaimID = Convert.ToInt32(Request.QueryString["ClaimID"]);
            string InvoiceReference = Convert.ToString(Request.QueryString["InvoiceID"]);
            string CreditNoteID = "";

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
                              //  "<br/><span style='font-style:bold;'>T:", Convert.ToString(dataReader["Phone"]), "&nbsp;&nbsp;F:", Convert.ToString(dataReader["Fax"]), "&nbsp;&nbsp;E:", Convert.ToString(dataReader["Email"]),
                            //   ViewAdditionalInstructions.InnerHtml = string.Format(Convert.ToString(dataReader["BankDetails"]));

                            FooterValue.InnerHtml = string.Concat(Convert.ToString(dataReader["CompanyInfo"]));
                            //

                        }
                }
            }
            #endregion

            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {

                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("select * from Claim, ClaimContact, Contact where Claim.ClaimID=@ClaimID and Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Contact.ContactTypeID='7'", sqlConnection))
                {

                    sqlCommand.Connection.Open();

                    sqlCommand.Parameters.Clear();

                    sqlCommand.CommandText = "Select * from CreditNote where InvoiceID=@InvoiceID";


                       sqlCommand.Parameters.AddWithValue("InvoiceID", InvoiceReference);
                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())


                        if (dataReader.Read())
                        {
                            
                            CreditNoteID = Convert.ToString(dataReader["CreditNoteID"]);
                         
                        }
                }
            }
            try
            {
                using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {

                    using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM CreditNote where CreditNoteID=@CreditNoteID", sqlConnection))
                    {
                        string sString = "";

                        sqlCommand.Connection.Open();

                        sqlCommand.Parameters.AddWithValue("CreditNoteID", CreditNoteID);

                        using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                            if (dataReader.Read())
                            {


                                InvoiceType.InnerHtml = "CrditNote";


                                double CreditAmount = Convert.ToDouble(dataReader["CreditAmount"]);
                                sString = string.Format("{0:C}", CreditAmount);


                                string CreditDate = "02/02/2010";// Convert.ToDateTime(dataReader["CreditNoteDate"]).ToString("dd-MM-yyyy");


                                ViewCreditNoteDiv.InnerHtml = string.Format("Credit Amount:  " + sString + "<br/><br/>");


                                InvoiceNumber.InnerHtml = string.Concat("<br/>Our Ref: ", ClaimID, "<br/><br/>", "Invoice No: ", InvoiceReference, "<br/><br/>", "Statement Date: ", CreditDate);



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
    }
}
