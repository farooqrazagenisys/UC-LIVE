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
    public partial class NewTask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                int ContactID = Convert.ToInt32(Request.QueryString["ContactID"]);





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


                                    //ContactDetails1.FirstName = Convert.ToString(Reader["FirstName"]);
                                    //ContactDetails1.Country = Convert.ToString(Reader["Country"]);
                                    //ContactDetails1.SurName = Convert.ToString(Reader["Surname"]);
                                    //ContactDetails1.Address1 = Convert.ToString(Reader["Address1"]);
                                    //ContactDetails1.Address2 = Convert.ToString(Reader["Address2"]);
                                    //ContactDetails1.City = Convert.ToString(Reader["City"]);
                                    //ContactDetails1.Country = Convert.ToString(Reader["Country"]);
                                    //ContactDetails1.PostCode = Convert.ToString(Reader["PostCode"]);
                                    //ContactDetails1.Phone = Convert.ToString(Reader["Phone"]);
                                    //ContactDetails1.Fax = Convert.ToString(Reader["Fax"]);
                                    //ContactDetails1.Email = Convert.ToString(Reader["Email"]);
                                    //ContactDetails1.DateOfBirth = Convert.ToString(Reader["DOB"]);
                                    //ContactDetails1.NINumber = Convert.ToString(Reader["NINO"]);
                                    //ContactDetails1.CompanyValue = Convert.ToString(Reader["Company"]);
                                    //ContactDetails1.VATApplicable = Convert.ToString(Reader["VATRegistered"]);
                                    //ContactDetails1.ContactTypeID1 = false;
                                    //ContactDetails1.ContactID1 = Convert.ToString(Reader["ContactID"]);




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



                protected void AddNewRecord(object sender, ImageClickEventArgs e)
		{

			try
			{
				// int Claimid= Convert.ToInt32(e.NewValues[0]);



				using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{
					conn.Open();
					using (SqlCommand cmd = conn.CreateCommand())
					{

						cmd.CommandType = CommandType.Text;

						

                        //cmd.Parameters.AddWithValue("FirstName", FirstNameTextBox.Text);
                        //cmd.Parameters.AddWithValue("Surname", SurnameTextBox.Text);
                        //cmd.Parameters.AddWithValue("Address1", Address1TextBox.Text);
                        //cmd.Parameters.AddWithValue("Address2", Address2TextBox.Text);
                        //cmd.Parameters.AddWithValue("City", CityTextBox.Text);
                        //cmd.Parameters.AddWithValue("PostCode", PostCodeTextBox.Text);
                        //cmd.Parameters.AddWithValue("Country", CountryTextBox.Text);
                        //cmd.Parameters.AddWithValue("Phone", PhoneTextBox.Text);
                        //cmd.Parameters.AddWithValue("Mobile", MobileTextBox.Text);
                        //cmd.Parameters.AddWithValue("Fax", FaxTextBox.Text);
                        //cmd.Parameters.AddWithValue("Email", EmailTextBox.Text);					
                        //cmd.Parameters.AddWithValue("NINO", NINoTextBox.Text);		
                        //cmd.Parameters.AddWithValue("BankDetails",BankDetailsTextBox.Text);
                        //cmd.Parameters.AddWithValue("VATRegistered", VATApplicableChoice.SelectedItem.Value);
                        //cmd.Parameters.AddWithValue("Company", CompanyTextBox.Text);
                        //cmd.Parameters.AddWithValue("ContactImage", "Images/" + strFileName + extension);						
                        //cmd.Parameters.AddWithValue("ContactTypeID", ContactTypeID.Text);
					
				
						cmd.CommandText = "INSERT into Contact (FirstName, Surname, Company, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, DOB, NINo, ContactTypeID,ContactImage,BankDetails, VATRegistered ) values (@FirstName, @Surname, @Company, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @DOB, @NINo, @ContactTypeID,@ContactImage,@BankDetails, @VATRegistered)";
						//cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo ) values (@PFirstName, @PSurname, @PAddress1, @PAddress2, @PCity , @PPostCode, @PCountry, @PPhone, @PMobile, @PFax, @PEmail, @PNINo )";


						if (cmd.ExecuteNonQuery() > 0)
						{


							//msg.InnerHtml = cmd.CommandText.ToString();


						}

					}

				}

			}
			catch (Exception EXC)
			{
				Console.Write(EXC.ToString());
			}
			finally
			{
				//ResGridView1ult.Text = "Room updated successfully! ";
			}



		}

        protected void UpdateRecordDetails(object sender, ImageClickEventArgs e)
		{


			try
			{
	
				//String ContactID = ContactUpdateIDHidden.Value;


				using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{
					conn.Open();
					using (SqlCommand cmd = conn.CreateCommand())
					{

						cmd.CommandType = CommandType.Text;

						string extension = string.Empty;
						string strFileName = string.Empty;

						

                        //cmd.Parameters.AddWithValue("FirstName", FirstNameTextBox.Text);
                        //cmd.Parameters.AddWithValue("Surname", SurnameTextBox.Text);
                        //cmd.Parameters.AddWithValue("Company", CompanyTextBox.Text);
                        //cmd.Parameters.AddWithValue("Address1", Address1TextBox.Text);
                        //cmd.Parameters.AddWithValue("Address2", Address2TextBox.Text);
                        //cmd.Parameters.AddWithValue("City", CityTextBox.Text);
                        //cmd.Parameters.AddWithValue("PostCode", PostCodeTextBox.Text);
                        //cmd.Parameters.AddWithValue("Country", CountryTextBox.Text);
                        //cmd.Parameters.AddWithValue("Phone", PhoneTextBox.Text);
                        //cmd.Parameters.AddWithValue("Mobile", MobileTextBox.Text);
                        //cmd.Parameters.AddWithValue("Fax", FaxTextBox.Text);
                        //cmd.Parameters.AddWithValue("Email", EmailTextBox.Text);
                        //cmd.Parameters.AddWithValue("DOB", DOBTextBox.Text);
                        //cmd.Parameters.AddWithValue("NINO", NINoTextBox.Text);
                        //cmd.Parameters.AddWithValue("ContactID", ContactID);
                        //cmd.Parameters.AddWithValue("BankDetails", BankDetailsTextBox.Text);
                        //cmd.Parameters.AddWithValue("VATRegistered", VATApplicableChoice.SelectedItem.Value);
				
						cmd.Parameters.AddWithValue("ContactImage", "Images/" + strFileName + extension);

						cmd.CommandText = "Update Contact SET FirstName = @FirstName , Surname = @Surname, Company = @Company, Address1 = @Address1, Address2 = @Address2, City =  @City , PostCode =  @PostCode, Country = @Country, Phone = @Phone, Mobile = @Mobile, Fax = @Fax, Email = @Email , NINo = @NINo,ContactImage=@ContactImage, BankDetails = @BankDetails, VATRegistered = @VATRegistered where ContactID= @ContactID";
						//cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo ) values (@PFirstName, @PSurname, @PAddress1, @PAddress2, @PCity , @PPostCode, @PCountry, @PPhone, @PMobile, @PFax, @PEmail, @PNINo )";


						if (cmd.ExecuteNonQuery() > 0)
						{


							//msg.InnerHtml = cmd.CommandText.ToString();


						}

					}

				}

			}
			catch (Exception EXC)
			{
				Console.Write(EXC.ToString());
			}
			finally
			{
				//ResGridView1ult.Text = "Room updated successfully! ";
			}
            }
        }
    }
