using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;

namespace UC_LIVE.Controls
{
    public partial class ContactDetails : System.Web.UI.UserControl
    {
        public enum ViewType
        {
            Full,
            Compact,
			ContactDetails,
			Admin
        }

        private ViewType prpViewMode = ViewType.Full;

        private int prpContactID = -1;

        public ViewType ViewMode
        {
            get
            {
                if (this.EnableViewState)
                {
                    if (this.ViewState["ViewMode"] != null)
                        return (ViewType)this.ViewState["ViewMode"];
                    //return (ViewType)System.Enum.Parse(typeof(ViewType), this.ViewState["ViewMode"].ToString());
                    else
                        return ViewType.Full;
                }
                else
                    return this.prpViewMode;
            }
            set
            {
                if (this.EnableViewState)
                    this.ViewState["ViewMode"] = value;
                else
                    this.prpViewMode = value;
            }
        }
        public int ContactID
        {
            get
            {
                if (this.EnableViewState)
                {
                    if (this.ViewState["ContactID"] != null)
                        return (int)this.ViewState["ContactID"];
                    else
                        return -1;
                }
                else
                    return this.prpContactID;
            }
            set
            {
                if (this.EnableViewState)
                    this.ViewState["ContactID"] = value;
                else
                    this.prpContactID = value;
            }
        }
      
        public string FirstName { get { return this.FirstNameTextBox.Text; } set { this.FirstNameTextBox.Text = value; } } 
    
		

        public string SurName { get { return this.SurnameTextBox.Text; }  set { this.SurnameTextBox.Text = value; } }  
        public string Address1 { get { return this.Address1TextBox.Text;  } set { this.Address1TextBox.Text = value; } }  
        public string Address2 { get { return this.Address2TextBox.Text;  } set { this.Address2TextBox.Text = value; } }  
        public string City { get { return this.CityTextBox.Text; }  set { this.CityTextBox.Text = value; } }  
        public string PostCode { get { return this.PostCodeTextBox.Text;  } set { this.PostCodeTextBox.Text = value; } }  
        public string Country { get { return this.CountryTextBox.Text;  } set { this.CountryTextBox.Text = value; } }  
        public string Phone { get { return this.PhoneTextBox.Text; }  set { this.PhoneTextBox.Text = value; } }  
        public string Mobile { get { return this.MobileTextBox.Text;  } set { this.MobileTextBox.Text = value; } }  
        public string Email { get { return this.EmailTextBox.Text; }  set { this.EmailTextBox.Text = value; } }  
        public string Fax { get { return this.FaxTextBox.Text; }  set { this.FaxTextBox.Text = value; } }
		public string DateOfBirth { 
			
		get 
		
		{
			if (this.DOBTextBox.Text != "")
			{

				return Convert.ToDateTime(this.DOBTextBox.Text).ToString("yyyy/MM/dd");

			}

			else {

				return Convert.ToDateTime(DateTime.MaxValue).ToString("yyyy/MM/dd");
			}
				
			
			} 
			
			set { 
				
				this.DOBTextBox.Text = value;
			
			} 
		
		}  
        public string NINumber { get { return this.NINoTextBox.Text;  } set { this.NINoTextBox.Text = value; } }
		public string ContactID1 { get { return this.ContactUpdateIDHidden.Value; } set { this.ContactUpdateIDHidden.Value = value; } }
		public bool ContactTypeID1 { get { return this.ContactTypeID.Visible; } set { this.ContactTypeID.Visible = false; } }
		public string DriverInsurers { get { return this.DriverInsurersTextBox.Text; } set { this.DriverInsurersTextBox.Text = value; } }
		public string DriverPolicyNo { get { return this.DriverPolicyNoTextBox1.Text; } set { this.DriverPolicyNoTextBox1.Text = value; } }
		public FileUpload FileUpload { get { return this.UploadImage; } set {  } }
		public string BankDetails { get { return this.BankDetailsTextBox.Text; } set { this.BankDetailsTextBox.Text = value; } }
		public string VATApplicable { get { return this.VATApplicableChoice.SelectedItem.Value; } set { this.VATApplicableChoice.SelectedItem.Value = value; } }
		public string CompanyValue { get { return this.CompanyTextBox.Text; } set { this.CompanyTextBox.Text = value; } }
		

        public ContactDetails()
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {



		    string ContactTypeID1 = Convert.ToString(Request.QueryString["ContactTypeID"]);

			ContactTypeID.SelectedValue = ContactTypeID1;
			
			this.ContactTypeID.Visible = false;
            if (!this.IsPostBack)
            {



                using (System.Data.SqlClient.SqlConnection sqlConnection = new System.Data.SqlClient.SqlConnection(Properties.Settings.Default.ConnectionString))
                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Contact WHERE ContactId = @ContactID", sqlConnection))
                {

                    sqlCommand.Connection.Open();

                    sqlCommand.Parameters.AddWithValue("ContactID", this.ContactID);

                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection))
                        if (dataReader.Read())
                        {

                            foreach (System.Web.UI.Control webControl in this.Controls)
                                if (webControl is TextBox)
                                    for (int index = 0; index < dataReader.FieldCount; index++)
                                    {
                                        string fieldName = dataReader.GetName(index);

                                        if (webControl.ID.StartsWith(fieldName))
                                        {
                                            ((TextBox)webControl).Text = Convert.ToString(dataReader[fieldName]);
                                            break;
                                        }

                                    }

										//this.FirstNameTextBox.Text = Convert.ToString(dataReader["FirstName"]);
										//this.SurnameTextBox.Text = Convert.ToString(dataReader["Surname"]);
										//this.Address1TextBox.Text = Convert.ToString(dataReader["Address1"]);
										//this.Address2TextBox.Text = Convert.ToString(dataReader["Address2"]);
										//this.CityTextBox.Text = Convert.ToString(dataReader["City"]);
										//this.PostCodeTextBox.Text = Convert.ToString(dataReader["PostCode"]);
										//this.CountryTextBox.Text = Convert.ToString(dataReader["Country"]);
										//this.PhoneTextBox.Text = Convert.ToString(dataReader["Phone"]);
										//this.MobileTextBox.Text = Convert.ToString(dataReader["Mobile"]);
										//this.FaxTextBox.Text = Convert.ToString(dataReader["Fax"]);
										//this.EmailTextBox.Text = Convert.ToString(dataReader["Email"]);
										//this.DOBTextBox.Text = Convert.ToString(dataReader["DOB"]);
										//this.NINoTextBox.Text = Convert.ToString(dataReader["NINo"]);

                        }
                }

                switch (this.ViewMode)
                {
                    case ViewType.Compact:

                        this.DOBTextBox.Visible = false;
                        this.NINoTextBox.Visible = false;
						this.ContactTypeID.Visible = false;		
						this.AddRecord.Visible = false;
						//this.NINumber = " ";
						this.DateOfBirth = "  ";
                        break;

                    case ViewType.Full:

                        foreach (System.Web.UI.Control webControl in this.Controls)
                            if (webControl is TextBox)
                                webControl.Visible = true;
						this.ContactTypeID.Visible = false;
								this.AddRecord.Visible = false;
								this.Updaterecord.Visible = false;
								this.BankDetailsTextBox.Visible = false;
								this.VATApplicableChoice.Visible = false;
								this.CompanyTextBox.Visible = false;
								this.CompanyName.Visible = false;
								this.BankDetailsLable.Visible = false;
								this.VATRegisteredLable.Visible = false;

						


                        break;
					
					case ViewType.ContactDetails:

						this.DOBTextBox.Visible = false;
						this.NINoTextBox.Visible = false;
						this.ContactTypeID.Visible = true;
						this.DOB.Visible = false;
						this.DateValidator1.Visible = false;
						this.NINumber1.Visible = false;
						this.AddRecord.Visible = true;
						this.BankDetailsTextBox.Visible = true;
						this.VATApplicableChoice.Visible = true;
						this.CompanyTextBox.Visible = true;
						this.ContactTypeID.Visible = true;
						this.DriverInsurersTextBox.Visible = false;
						this.DriverPolicyNoTextBox1.Visible = false;
						this.DriverInsurersTextBoxLabel.Visible = false;
						this.DriverPolicyNoTextBox1Label.Visible = false;
						break;


					case ViewType.Admin:

						this.DOBTextBox.Visible = false;
						this.NINoTextBox.Visible = false;
						this.ContactTypeID.Visible = true;
						this.DOB.Visible = false;
						this.DateValidator1.Visible = false;
						this.NINumber1.Visible = false;
						this.AddRecord.Visible = true;
						this.BankDetailsTextBox.Visible = true;
						this.VATApplicableChoice.Visible = true;
						this.CompanyTextBox.Visible = true;
						this.ContactTypeID.Visible = true;
						this.DriverInsurersTextBox.Visible = false;
						this.DriverPolicyNoTextBox1.Visible = false;
						this.DriverInsurersTextBoxLabel.Visible = false;
						this.DriverPolicyNoTextBox1Label.Visible = false;
						this.ContactTypeID.Visible = false;
						break;

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

						if (DOBTextBox.Text != "")
						{
							cmd.Parameters.AddWithValue("DOB", Convert.ToDateTime(DOBTextBox.Text).ToString("yyyy/MM/dd HH:mm:ss"));

						}

						else
						{
							cmd.Parameters.AddWithValue("DOB", DateTime.MaxValue);

						}

						string extension = string.Empty;
						string strFileName = string.Empty;

						if (UploadImage.HasFile)
						{

							HttpPostedFile PostedFile = UploadImage.PostedFile;

							int FileSizeKB = PostedFile.ContentLength / 1024;

							extension = System.IO.Path.GetExtension(UploadImage.FileName).ToLower();
							strFileName = System.IO.Path.GetFileNameWithoutExtension(UploadImage.FileName).ToLower();

							if ((extension != ".jpg" && extension != ".jpeg" && extension != ".gif" && extension != ".png") || (FileSizeKB > 500))
							{
								System.Text.StringBuilder stringBuilder = new System.Text.StringBuilder();

								stringBuilder.Append("<span style=\"color:Red;font-weight:bold;font-size:14px;\">Invalid image format. Only jpeg,jpg,gif,png images are permited not more than 1024 KB</span>");
								stringBuilder.Append(string.Format("<br/> <span style=\"color:Black;font-weight:bold;font-size:14px;\">File Extension : {0}", extension));
								stringBuilder.Append(string.Format(" File Size:  {0}(KB):", FileSizeKB) + "</span><br/>");

								//Msg.InnerHtml = stringBuilder.ToString();

								return;
							}

							UploadImage.SaveAs(Server.MapPath("~/Images") + "/" + strFileName + extension);
						}
						
						cmd.Parameters.AddWithValue("FirstName", FirstNameTextBox.Text);
						cmd.Parameters.AddWithValue("Surname", SurnameTextBox.Text);
						cmd.Parameters.AddWithValue("Address1", Address1TextBox.Text);
						cmd.Parameters.AddWithValue("Address2", Address2TextBox.Text);
						cmd.Parameters.AddWithValue("City", CityTextBox.Text);
						cmd.Parameters.AddWithValue("PostCode", PostCodeTextBox.Text);
						cmd.Parameters.AddWithValue("Country", CountryTextBox.Text);
						cmd.Parameters.AddWithValue("Phone", PhoneTextBox.Text);
						cmd.Parameters.AddWithValue("Mobile", MobileTextBox.Text);
						cmd.Parameters.AddWithValue("Fax", FaxTextBox.Text);
						cmd.Parameters.AddWithValue("Email", EmailTextBox.Text);					
						cmd.Parameters.AddWithValue("NINO", NINoTextBox.Text);		
						cmd.Parameters.AddWithValue("BankDetails",BankDetailsTextBox.Text);
						cmd.Parameters.AddWithValue("VATRegistered", VATApplicableChoice.SelectedItem.Value);
						cmd.Parameters.AddWithValue("Company", CompanyTextBox.Text);
						cmd.Parameters.AddWithValue("ContactImage", "Images/" + strFileName + extension);						
						cmd.Parameters.AddWithValue("ContactTypeID", ContactTypeID.Text);
					
				
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
	
				String ContactID = ContactUpdateIDHidden.Value;


				using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{
					conn.Open();
					using (SqlCommand cmd = conn.CreateCommand())
					{

						cmd.CommandType = CommandType.Text;

						string extension = string.Empty;
						string strFileName = string.Empty;

						if (UploadImage.HasFile)
						{

							HttpPostedFile PostedFile = UploadImage.PostedFile;

							int FileSizeKB = PostedFile.ContentLength / 1024;

							extension = System.IO.Path.GetExtension(UploadImage.FileName).ToLower();
							strFileName = System.IO.Path.GetFileNameWithoutExtension(UploadImage.FileName).ToLower();

							if ((extension != ".jpg" && extension != ".jpeg" && extension != ".gif" && extension != ".png") || (FileSizeKB > 500))
							{
								System.Text.StringBuilder stringBuilder = new System.Text.StringBuilder();

								stringBuilder.Append("<span style=\"color:Red;font-weight:bold;font-size:14px;\">Invalid image format. Only jpeg,jpg,gif,png images are permited not more than 1024 KB</span>");
								stringBuilder.Append(string.Format("<br/> <span style=\"color:Black;font-weight:bold;font-size:14px;\">File Extension : {0}", extension));
								stringBuilder.Append(string.Format(" File Size:  {0}(KB):", FileSizeKB) + "</span><br/>");

								//Msg.InnerHtml = stringBuilder.ToString();

								return;
							}

							UploadImage.SaveAs(Server.MapPath("~/Images") + "/" + strFileName + extension);
						}


						cmd.Parameters.AddWithValue("FirstName", FirstNameTextBox.Text);
						cmd.Parameters.AddWithValue("Surname", SurnameTextBox.Text);
						cmd.Parameters.AddWithValue("Company", CompanyTextBox.Text);
						cmd.Parameters.AddWithValue("Address1", Address1TextBox.Text);
						cmd.Parameters.AddWithValue("Address2", Address2TextBox.Text);
						cmd.Parameters.AddWithValue("City", CityTextBox.Text);
						cmd.Parameters.AddWithValue("PostCode", PostCodeTextBox.Text);
						cmd.Parameters.AddWithValue("Country", CountryTextBox.Text);
						cmd.Parameters.AddWithValue("Phone", PhoneTextBox.Text);
						cmd.Parameters.AddWithValue("Mobile", MobileTextBox.Text);
						cmd.Parameters.AddWithValue("Fax", FaxTextBox.Text);
						cmd.Parameters.AddWithValue("Email", EmailTextBox.Text);
						cmd.Parameters.AddWithValue("DOB", DOBTextBox.Text);
						cmd.Parameters.AddWithValue("NINO", NINoTextBox.Text);
						cmd.Parameters.AddWithValue("ContactID", ContactID);
						cmd.Parameters.AddWithValue("BankDetails", BankDetailsTextBox.Text);
						cmd.Parameters.AddWithValue("VATRegistered", VATApplicableChoice.SelectedItem.Value);
				
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