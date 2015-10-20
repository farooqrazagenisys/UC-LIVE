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
    public partial class ViewReferralInvoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int ClaimID = Convert.ToInt32(Request.QueryString["ClaimID"]);

            try
            {
                using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {

                    using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Invoice WHERE Invoice.InvoiceID = @InvoiceID", sqlConnection))
                    {
                        sqlCommand.Connection.Open();

                        sqlCommand.Parameters.AddWithValue("InvoiceID", Request.QueryString["InvoiceID"]);

                        using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                            if (dataReader.Read())
                            {

                                //ViewHeaderImage.InnerHtml = string.Format("<img src=\"{0}\" />", dataReader["DocHeader"]);
                                ViewHeaderImage.InnerHtml = string.Format("<img width='250' src=\"{0}\" />", dataReader["CompanyLogo"]
                                    );
                                ViewCompanyAddress.InnerHtml = string.Format(Convert.ToString(dataReader["CompanyAddressDetails"]));
                                ViewContactInfo.Text = string.Concat(Convert.ToString(dataReader["ContactAddress"]));

                                ViewTitle.InnerHtml = string.Format(Convert.ToString(dataReader["InvoiceTitle"]));
                                ViewHeader.InnerHtml = string.Format(Convert.ToString(dataReader["InvoiceHeader"]));
                                FooterValue.InnerHtml = string.Format(Convert.ToString(dataReader["InvoiceFootertext"]));
                                //InvoiceType.InnerHtml = string.Format(Convert.ToString(dataReader["InvoiceType"]));

                                // InvoiceType.logo = string.Format(Convert.ToString(dataReader["Invoicelogo"]));

                                ViewTotalCost.InnerHtml = string.Format(Convert.ToDouble(dataReader["TotalAmount"]).ToString("C"));
                                ViewVAT.InnerHtml = string.Format(Convert.ToDouble(dataReader["TotalVAT"]).ToString("C"));
                                ViewGrandTotal.InnerHtml = string.Format(Convert.ToDouble(dataReader["GrandTotal"]).ToString("C"));
                                VATRATE.InnerHtml = "&nbsp; &nbsp;Total VAT @ " + Convert.ToDouble(dataReader["VATRATE"]) + " %";

                                //HeaderText.InnerHtml = string.Format(Convert.ToString(dataReader["InvoiceHeader"]));
                                InvoiceNumber.InnerHtml = string.Concat("Our Ref: ", ClaimID, "<br/><br/>", "Invoice No: ",
                                    string.Format(Convert.ToString(dataReader["InvoiceID"])), "<br/><br/>", "Invoice Date: ",
                                   Convert.ToDateTime(dataReader["InvoiceDate"]).ToString("dd/MM/yyyy"));

                                if (Convert.ToString(dataReader["InvoiceType"]) == "CreditNote")
                                {
                                    ViewAmountDue.InnerHtml = string.Format(Convert.ToString(dataReader["AmountDue"]));
                                    ViewAmountDueText.Visible = true;

                                }

                                else
                                {

                                    ViewAmountDueText.Visible = false;

                                }



                                ViewAdditionalInstructions.InnerHtml =

             "<textarea style='width:400px;  font-family:Arial;   overflow:hidden;  border:Solid 1px white;height:200px; '>" + Convert.ToString(dataReader["AdditionalInstructions"]) + "</textarea>"


            ;

                               



                            }


                        sqlCommand.Parameters.Clear();
                        //sqlCommand.CommandText = "Select * from InvoiceDetails where  InvoiceID=@InvoiceID";
                        //sqlCommand.Parameters.AddWithValue("InvoiceID", Request.QueryString["InvoiceID"]);
                        //using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection))
                        //{
                        //    StringBuilder stringBuilder = new StringBuilder();
                        //    while (dataReader.Read())
                        //    {

                        //         stringBuilder.AppendLine(string.Concat("Details", Convert.ToString(dataReader["Details"]), "rate", Convert.ToString(dataReader["Rate"]), "<br/>",
                        //        "amount", Convert.ToString(dataReader["Amount"]), "<Br/><Br/><Br/>"));

                        //    }

                        //    ViewDescription.InnerHtml = stringBuilder.ToString();
                        //}


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
