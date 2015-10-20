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
	public partial class ViewContact : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

			{
				try
				{

					
					using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
					{

						using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Contact WHERE ContactID=@ContactID", sqlConnection))
						{
							sqlCommand.Connection.Open();

							sqlCommand.Parameters.AddWithValue("ContactID", Request.QueryString["ContactID"]);

							using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

								if (dataReader.Read())
								{

									//ViewHeaderImage.InnerHtml = string.Format("<img src=\"{0}\" />", dataReader["DocHeader"]);
									ViewImage.InnerHtml = string.Format("<img src=\"{0}\" width=\"250\" />", dataReader["ContactImage"]);

									ViewContactInfo.InnerHtml = string.Concat(Convert.ToString(dataReader["FirstName"]), Convert.ToString(dataReader["Surname"]), "<br/><br/>",
									Convert.ToString(dataReader["Company"]), "<Br/>", Convert.ToString(dataReader["Address1"]), "<br/>", Convert.ToString(dataReader["Address2"]),
									"<Br/>", Convert.ToString(dataReader["Postcode"]), "<br/>", Convert.ToString(dataReader["City"])
									, "<br/><br/>Phone:", Convert.ToString(dataReader["Phone"])
									, "<br/><br/>Email:", Convert.ToString(dataReader["Email"])
									, "<br/><br/>Mobile:", Convert.ToString(dataReader["Mobile"])
									, "<br/><br/>Fax:", Convert.ToString(dataReader["Fax"]), "<br/><br/><br/>");
								
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
}
