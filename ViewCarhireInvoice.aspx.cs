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
    public partial class ViewCarhireInvoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int ClaimID = Convert.ToInt32(Request.QueryString["ClaimID"]);
            string CompanyLogo = "";
            string CompanyAddress = "";

            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {
                try
                {
                    using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Contact where ContactTypeID = 12", sqlConnection))
                    {
                        sqlCommand.Connection.Open();

                        using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                            if (dataReader.Read())
                            {
                                CompanyLogo = Convert.ToString(dataReader["ContactImage"]);
                                CompanyAddress = string.Concat("<div style='text-align:center;padding-left:5px;padding-right:5px;  color:black;font-size:10px;'><img width='270' src='", Convert.ToString(dataReader["ContactImage"]), "'", "></div>", "<div style='text-align:center; color:black; padding-top:6px; width:700px; padding-left:50px; font-style:arial; font-size:12px;'>", (dataReader["Company"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["Address1"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["Address2"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["City"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["Postcode"]), "<br/><span style='font-style:bold;'>T:", Convert.ToString(dataReader["Phone"]), "&nbsp;&nbsp;F:", Convert.ToString(dataReader["Fax"]), "&nbsp;&nbsp;E:", Convert.ToString(dataReader["Email"]), "</span></div>");
                                                             
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
         // ViewHeaderImage.InnerHtml = string.Format("<img width='250' src=\"{0}\" />", dataReader["CompanyLogo"]);
                                ViewHeaderImage.InnerHtml =   "<div style='margin:5px;'>" + string.Format("<img height='100' src=\"{0}\" />", dataReader["CompanyLogo"] 
                                              ) + "</div>";
                                ViewCompanyAddress.InnerHtml = string.Format(Convert.ToString(dataReader["CompanyAddressDetails"]));

                                
                                ViewContactInfo.Text = string.Concat(Convert.ToString(dataReader["ContactAddress"]));

                                ViewTitle.InnerHtml = string.Format(Convert.ToString(dataReader["InvoiceTitle"]));
                            //    ViewHeader.InnerHtml = string.Format(Convert.ToString(dataReader["InvoiceHeader"]));
                                InvoiceType.InnerHtml = string.Format(Convert.ToString(dataReader["InvoiceType"]));

                                // InvoiceType.logo = string.Format(Convert.ToString(dataReader["Invoicelogo"]));

                                ViewTotalCost.InnerHtml = string.Format(Convert.ToDouble(dataReader["TotalAmount"]).ToString("C"));
                                ViewVAT.InnerHtml = string.Format(Convert.ToDouble(dataReader["TotalVAT"]).ToString("C"));
                                ViewGrandTotal.InnerHtml = string.Format(Convert.ToDouble(dataReader["GrandTotal"]).ToString("C"));
                                VATRATE.InnerHtml = "&nbsp; &nbsp;Total VAT @ " + Convert.ToDouble(dataReader["VATRATE"]) + " %";

                                InvoiceNumber.InnerHtml = string.Concat("Our Ref: ", ClaimID, "<br/><br/>", "Invoice No: ",
                                    string.Format(Convert.ToString(dataReader["InvoiceID"])), "<br/><br/>", "Statement Date: ",
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

                                FooterValue.InnerHtml = Convert.ToString(dataReader["InvoiceFootertext"]); 

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
