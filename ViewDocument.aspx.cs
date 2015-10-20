using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;


namespace UC_LIVE
{
	public partial class ViewDocument : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

            #region
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

                            DocumentHeader.InnerHtml = string.Concat("<div style='text-align:center;padding-left:5px;padding-right:5px;  color:black;font-size:10px;'><img width='270' src='", Convert.ToString(dataReader["ContactImage"]), "'", "></div>", "<div style='text-align:center; color:black; padding-top:6px; width:700px; padding-left:50px; font-style:arial; font-size:12px;'>", (dataReader["Company"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["Address1"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["Address2"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["City"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["Postcode"]), "<br/><span style='font-style:bold;'>T:", Convert.ToString(dataReader["Phone"]), "&nbsp;&nbsp;F:", Convert.ToString(dataReader["Fax"]), "&nbsp;&nbsp;E:", Convert.ToString(dataReader["Email"]), "</span></div>");
                            
                            FooterValue.InnerHtml = string.Concat("<br/><span style='font-size:10px; text-decoration:underline; '>", Convert.ToString(dataReader["CompanyInfo"]), "</span>");


                        }
                }
            }
            #endregion

			try
			{

				using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{

					using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("select * from Documents, ClaimDoc, Contact where Documents.DocID=@DocID and Documents.DocID = ClaimDoc.DocID and ClaimDoc.ContactID = Contact.ContactID" , sqlConnection))
					{

						sqlCommand.Connection.Open();

						sqlCommand.Parameters.AddWithValue("DocID", Request.QueryString["DocID"]);

						using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection))

							if (dataReader.Read())
							{

                                if (Convert.ToString(dataReader["DocHeader"] )!= "")
                                {
                                    DocumentHeader.InnerHtml = string.Format("<img src=\"{0}\" />", dataReader["DocHeader"]);

                                }
                                    ViewContactInfo.InnerHtml = string.Concat(Convert.ToString(dataReader["Title"]), "&nbsp;", Convert.ToString(dataReader["FirstName"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["Surname"]), "<br/>", 
										Convert.ToString(dataReader["Company"]),"<Br/>" ,  Convert.ToString(dataReader["Address1"]), "<br/>", Convert.ToString(dataReader["Address2"]),
                                        "<Br/>", Convert.ToString(dataReader["City"]), "<br/>", Convert.ToString(dataReader["Postcode"]));

                                    ClaimReference.InnerHtml = string.Concat("Our Reference: ", Convert.ToString(dataReader["ClaimID"]), "<br/><br/><br/>", "Date: ", Convert.ToDateTime(dataReader["DateCreated"]).ToString("dd/MM/yyyy"));  
                                    //DateCreatedValue.InnerHtml =string.Concat("Date: ", Convert.ToString(dataReader["DateCreated"]));
                                    ViewDescription.InnerHtml = Convert.ToString(dataReader["DocBody"]);

                                  
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
