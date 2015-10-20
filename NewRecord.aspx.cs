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
	public partial class NewRecord : System.Web.UI.Page
	{


		protected void Page_Load(object sender, EventArgs e)
		{
			if (!this.IsPostBack)
			{

				string ContactID = Convert.ToString(Request.QueryString["ContactID"]);


              

                    string ContactTypeIDnew = Convert.ToString(Request.QueryString["ContactTypeID"]);

                    this.ContactDetails1.ContactTypeID1 = ContactTypeIDnew;



                if (ContactID != null)
                {
                    this.MainHeading.InnerHtml = "Update Contact";
                    
                }
                else 
                {
                    this.MainHeading.InnerHtml = "Add Contact";
                
                }



				try
				{

					using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
					{

						cnn.Open();

						using (SqlCommand Cmd = cnn.CreateCommand())
						{

							Cmd.Parameters.AddWithValue("ContactID", ContactID);

							//string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
							string sSQL = string.Format("Select * from Contact where ContactID=@ContactID");
							Cmd.CommandText = sSQL;


							using (SqlDataReader Reader = Cmd.ExecuteReader())
							{

								if (Reader.Read())
								{

                                    ContactDetails1.TitleValue = Convert.ToString(Reader["Title"]);
									ContactDetails1.FirstName = Convert.ToString(Reader["FirstName"]);
									ContactDetails1.Country = Convert.ToString(Reader["Country"]);
									ContactDetails1.SurName = Convert.ToString(Reader["Surname"]);
									ContactDetails1.Address1 = Convert.ToString(Reader["Address1"]);
									ContactDetails1.Address2 = Convert.ToString(Reader["Address2"]);
									ContactDetails1.City = Convert.ToString(Reader["City"]);
									ContactDetails1.Country = Convert.ToString(Reader["Country"]);
									ContactDetails1.PostCode = Convert.ToString(Reader["PostCode"]);
                                    ContactDetails1.Mobile = Convert.ToString(Reader["Mobile"]);
                                    ContactDetails1.BankDetails = Convert.ToString(Reader["BankDetails"]);
									ContactDetails1.Phone = Convert.ToString(Reader["Phone"]);
									ContactDetails1.Fax = Convert.ToString(Reader["Fax"]);
									ContactDetails1.Email = Convert.ToString(Reader["Email"]);
									ContactDetails1.DateOfBirth = Convert.ToString(Reader["DOB"]);
									ContactDetails1.NINumber = Convert.ToString(Reader["NINO"]);
									ContactDetails1.CompanyValue = Convert.ToString(Reader["Company"]);
									ContactDetails1.VATApplicable = Convert.ToString(Reader["VATRegistered"]);


                                  
							//		ContactDetails1.ContactTypeID1 = false;
									ContactDetails1.ContactID1 = Convert.ToString(Reader["ContactID"]);


                                    ContactDetails1.ContactTypeID1 = Convert.ToString(Reader["ContactTypeID"]);



                                    
                                    




								}
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
                    

				}




			}
		}

	}
}


        