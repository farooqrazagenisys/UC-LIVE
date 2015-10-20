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
	public partial class ClaimSummary : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

			if (!this.IsPostBack)
			{

				try
				{

					using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))

			
								
					
					using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and Claim.ClaimID=ClaimContact.ClaimID and ClaimContact.ContactId = Contact.ContactID", sqlConnection))
					{

						sqlCommand.Connection.Open();

						sqlCommand.Parameters.AddWithValue("ClaimID", Request.QueryString["ClaimID"]);

						using (SqlDataReader dataReader = sqlCommand.ExecuteReader())
							while(dataReader.Read())
							{

								ClaimTitle.InnerHtml = string.Concat(Convert.ToString(dataReader["ClaimTitle"]) +
		"   [ " + Convert.ToString(dataReader["ClaimID"]) + "]");


								if (Convert.ToString(dataReader["ContactTypeID"]) == "1")
								{

									InsuranceDetails.InnerHtml = string.Concat(Convert.ToString(dataReader["FirstName"]), Convert.ToString(dataReader["Surname"]), "<br/>",
									Convert.ToString(dataReader["Company"]), "<Br/>", Convert.ToString(dataReader["Address1"]), "<br/>", Convert.ToString(dataReader["Address2"]),
									"<Br/>", Convert.ToString(dataReader["Postcode"]), "<br/>", "<br/>", Convert.ToString(dataReader["Phone"]),
									 "<br/>", Convert.ToString(dataReader["Email"]));



								}

								if (Convert.ToString(dataReader["ContactTypeID"]) == "2")
								{

									SolicitorDetails.InnerHtml = string.Concat(Convert.ToString(dataReader["FirstName"]), Convert.ToString(dataReader["Surname"]), "<br/>",
									Convert.ToString(dataReader["Company"]), "<Br/>", Convert.ToString(dataReader["Address1"]), "<br/>", Convert.ToString(dataReader["Address2"]),
									"<Br/>", Convert.ToString(dataReader["Postcode"]), "<br/>", Convert.ToString(dataReader["City"]),
									Convert.ToString(dataReader["Phone"]),
									 "<br/>", Convert.ToString(dataReader["Email"]));


								}

								if (Convert.ToString(dataReader["ContactTypeID"]) == "3")
								{

									EngineerDetails.InnerHtml = string.Concat(Convert.ToString(dataReader["FirstName"]), Convert.ToString(dataReader["Surname"]), "<br/>",
									Convert.ToString(dataReader["Company"]), "<Br/>", Convert.ToString(dataReader["Address1"]), "<br/>", Convert.ToString(dataReader["Address2"]),
									"<Br/>", Convert.ToString(dataReader["Postcode"]), "<br/>", Convert.ToString(dataReader["City"]),
									"<br/>", "<br/>", Convert.ToString(dataReader["Phone"]),
									 "<br/>", Convert.ToString(dataReader["Email"]));


								}

								if (Convert.ToString(dataReader["ContactTypeID"]) == "4")
								{

									CarhireDetails.InnerHtml = string.Concat(Convert.ToString(dataReader["FirstName"]), Convert.ToString(dataReader["Surname"]), "<br/>",
									Convert.ToString(dataReader["Company"]), "<Br/>", Convert.ToString(dataReader["Address1"]), "<br/>", Convert.ToString(dataReader["Address2"]),
									"<Br/>", Convert.ToString(dataReader["Postcode"]), "<br/>", Convert.ToString(dataReader["City"]),
									"<br/>", "<br/>", Convert.ToString(dataReader["Phone"]),
									 "<br/>", Convert.ToString(dataReader["Email"]));


								}

								if (Convert.ToString(dataReader["ContactTypeID"]) == "5")
								{

                                    StorageDetails.InnerHtml = string.Concat(Convert.ToString(dataReader["FirstName"]), Convert.ToString(dataReader["Surname"]), "<br/>",
									"<br/>", "<br/>", Convert.ToString(dataReader["Company"]), "<Br/>", Convert.ToString(dataReader["Address1"]), "<br/>", Convert.ToString(dataReader["Address2"]),
									"<Br/>", Convert.ToString(dataReader["Postcode"]), "<br/>", Convert.ToString(dataReader["City"]),
									"<br/>", "<br/>", Convert.ToString(dataReader["Phone"]),
									 "<br/>", Convert.ToString(dataReader["Email"]));


								}

							
								if (Convert.ToString(dataReader["ContactTypeID"]) == "7")
								{

									ClientDetails.InnerHtml = string.Concat(Convert.ToString(dataReader["FirstName"]), Convert.ToString(dataReader["Surname"]), "<br/>",
									Convert.ToString(dataReader["Company"]), "<Br/>", Convert.ToString(dataReader["Address1"]), "<br/>", Convert.ToString(dataReader["Address2"]),
									"<Br/>", Convert.ToString(dataReader["Postcode"]), "<br/>", Convert.ToString(dataReader["City"]),
									"<br/>","<br/>", Convert.ToString(dataReader["Phone"]),
									 "<br/>", Convert.ToString(dataReader["Email"]));

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
}
