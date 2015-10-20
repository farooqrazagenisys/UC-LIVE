using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;


namespace UC_LIVE
{
	public partial class ViewInvoice : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

			try
			{

                

				using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{

					using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Invoice ,Contact WHERE Invoice.InvoiceID = @InvoiceID and Invoice.ContactID = Contact.ContactID", sqlConnection))
					{
						sqlCommand.Connection.Open();

						sqlCommand.Parameters.AddWithValue("InvoiceID", Request.QueryString["InvoiceID"]);
					
						using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

							if (dataReader.Read())
							{
								
								//ViewHeaderImage.InnerHtml = string.Format("<img src=\"{0}\" />", dataReader["DocHeader"]);
								    ViewHeaderImage.InnerHtml = string.Format("<img src=\"{0}\" />", dataReader["InvoiceHeaderImage"]);
									ViewContactInfo.InnerHtml = string.Concat(Convert.ToString(dataReader["FirstName"]), Convert.ToString(dataReader["Surname"]), "<br/>",
									Convert.ToString(dataReader["Company"]), "<Br/>", Convert.ToString(dataReader["Address1"]), "<br/>", Convert.ToString(dataReader["Address2"]),
									"<Br/>", Convert.ToString(dataReader["Postcode"]), "<br/>", Convert.ToString(dataReader["City"]));
									ViewTitle.InnerHtml = string.Format(Convert.ToString(dataReader["InvoiceTitle"]));
									ViewAdditionalInstructions.InnerHtml = string.Format(Convert.ToString(dataReader["AdditionalInstructions"]));
									InvoiceType.InnerHtml = string.Format(Convert.ToString(dataReader["InvoiceType"]));
									ViewTotalCost.InnerHtml = string.Format(Convert.ToString(dataReader["TotalAmount"]));
								    ViewVAT.InnerHtml = string.Format(Convert.ToString(dataReader["TotalVAT"]));
									ViewAmountDue.InnerHtml = string.Format(Convert.ToString(dataReader["AmountDue"]));
									InvoiceNumber.InnerHtml = string.Concat("Invoice Number: ", string.Format(Convert.ToString(dataReader["InvoiceID"])), "<br/> ", "Date: ", DateTime.Now.ToString("dd - MM - yyyy"));
                                    VATRATE.InnerHtml = "&nbsp;&nbsp; Total VAT @" + Convert.ToDouble(dataReader["VATRATE"]);
									

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
