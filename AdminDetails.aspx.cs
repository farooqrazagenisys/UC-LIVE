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
    public partial class AdminDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int ContactID = Convert.ToInt32(Request.QueryString["ContactID"]);

            if (!this.IsPostBack)
            {


                using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {

                    cnn.Open();

                    using (SqlCommand Cmd = cnn.CreateCommand())
                    {

                        Cmd.Parameters.AddWithValue("ContactID", ContactID);
                        //  string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
                        string sSQL = "Select * from Contact where Contact.ContactID=@ContactID";
                        Cmd.CommandText = sSQL;
                        using (SqlDataReader Reader = Cmd.ExecuteReader())
                        {
                            if (Reader.Read())
                            {


                                FirstNameTextBox.Text = Convert.ToString(Reader["FirstName"]);
                                SurnameTextBox.Text = Convert.ToString(Reader["Surname"]);
                                Address1TextBox.Text = Convert.ToString(Reader["Address1"]);
                                Address2TextBox.Text = Convert.ToString(Reader["Address2"]);
                                CityTextBox.Text = Convert.ToString(Reader["City"]);
                                PostCodeTextBox.Text = Convert.ToString(Reader["PostCode"]);
                                PhoneTextBox.Text = Convert.ToString(Reader["Phone"]);
                                FaxTextBox.Text = Convert.ToString(Reader["Fax"]);
                                BankDetailsTextBox.Text = Convert.ToString(Reader["BankDetails"]);
                                EmailTextBox.Text = Convert.ToString(Reader["Email"]);
                                VATApplicableChoice.SelectedValue = Convert.ToString(Reader["VATRegistered"]);
                                CompanyTextBox.Text = Convert.ToString(Reader["Company"]);
                                ContactUpdateIDHidden.Value = Convert.ToString(Reader["ContactID"]);
                                CompanyInfoTextBox.Text = Convert.ToString(Reader["CompanyInfo"]);
                                VATVALUE.Text = Convert.ToString(Reader["VATVALUE"]);

                                // VATvalueTextBox.Text = Convert.ToString(Reader["VATvalue"]);






                            }
                        }



                        Cmd.Parameters.Clear();

                    }
                }
            }


        }
        protected void UpdateRecordDetails(object sender, EventArgs e)
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

                            cmd.Parameters.AddWithValue("ContactImage", "Images/" + strFileName + extension);

                            cmd.Parameters.AddWithValue("FirstName", FirstNameTextBox.Text);
                            cmd.Parameters.AddWithValue("Surname", SurnameTextBox.Text);
                            cmd.Parameters.AddWithValue("Company", CompanyTextBox.Text);
                            cmd.Parameters.AddWithValue("Address1", Address1TextBox.Text);
                            cmd.Parameters.AddWithValue("Address2", Address2TextBox.Text);
                            cmd.Parameters.AddWithValue("City", CityTextBox.Text);
                            cmd.Parameters.AddWithValue("PostCode", PostCodeTextBox.Text);
                            cmd.Parameters.AddWithValue("Country", "");
                            cmd.Parameters.AddWithValue("Phone", PhoneTextBox.Text);
                            cmd.Parameters.AddWithValue("Mobile", "");
                            cmd.Parameters.AddWithValue("Fax", FaxTextBox.Text);
                            cmd.Parameters.AddWithValue("Email", EmailTextBox.Text);
                            cmd.Parameters.AddWithValue("DOB", "");
                            cmd.Parameters.AddWithValue("NINO", "");
                            cmd.Parameters.AddWithValue("ContactID", ContactID);
                            cmd.Parameters.AddWithValue("BankDetails", BankDetailsTextBox.Text);
                            cmd.Parameters.AddWithValue("CompanyInfo", CompanyInfoTextBox.Text);
                            cmd.Parameters.AddWithValue("VATRegistered", VATApplicableChoice.SelectedItem.Value);
                            cmd.Parameters.AddWithValue("VATVALUE", VATVALUE.Text);


                            cmd.CommandText = "Update Contact SET FirstName = @FirstName , Surname = @Surname, Company = @Company, Address1 = @Address1, Address2 = @Address2, City =  @City , PostCode =  @PostCode, Country = @Country, Phone = @Phone, Mobile = @Mobile, Fax = @Fax, Email = @Email , NINo = @NINo,ContactImage=@ContactImage, BankDetails = @BankDetails, CompanyInfo = @CompanyInfo, VATRegistered = @VATRegistered, VATVALUE=@VATVALUE where ContactID= @ContactID";
                            //cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo ) values (@PFirstName, @PSurname, @PAddress1, @PAddress2, @PCity , @PPostCode, @PCountry, @PPhone, @PMobile, @PFax, @PEmail, @PNINo )";

                            if (cmd.ExecuteNonQuery() > 0)
                            {


                                //msg.InnerHtml = cmd.CommandText.ToString();


                            }

                        }

                        else
                        {

                            cmd.Parameters.AddWithValue("FirstName", FirstNameTextBox.Text);
                            cmd.Parameters.AddWithValue("Surname", SurnameTextBox.Text);
                            cmd.Parameters.AddWithValue("Company", CompanyTextBox.Text);
                            cmd.Parameters.AddWithValue("Address1", Address1TextBox.Text);
                            cmd.Parameters.AddWithValue("Address2", Address2TextBox.Text);
                            cmd.Parameters.AddWithValue("City", CityTextBox.Text);
                            cmd.Parameters.AddWithValue("PostCode", PostCodeTextBox.Text);
                            cmd.Parameters.AddWithValue("Country", "");
                            cmd.Parameters.AddWithValue("Phone", PhoneTextBox.Text);
                            cmd.Parameters.AddWithValue("Mobile", "");
                            cmd.Parameters.AddWithValue("Fax", FaxTextBox.Text);
                            cmd.Parameters.AddWithValue("Email", EmailTextBox.Text);
                            cmd.Parameters.AddWithValue("DOB", "");
                            cmd.Parameters.AddWithValue("NINO", "");
                            cmd.Parameters.AddWithValue("ContactID", ContactID);
                            cmd.Parameters.AddWithValue("BankDetails", BankDetailsTextBox.Text);
                            cmd.Parameters.AddWithValue("CompanyInfo", CompanyInfoTextBox.Text);
                            cmd.Parameters.AddWithValue("VATRegistered", VATApplicableChoice.SelectedItem.Value);
                            cmd.Parameters.AddWithValue("VATVALUE", VATVALUE.Text);


                            cmd.CommandText = "Update Contact SET FirstName = @FirstName , Surname = @Surname, Company = @Company, Address1 = @Address1, Address2 = @Address2, City =  @City , PostCode =  @PostCode, Country = @Country, Phone = @Phone, Mobile = @Mobile, Fax = @Fax, Email = @Email , NINo = @NINo, BankDetails = @BankDetails, CompanyInfo = @CompanyInfo, VATRegistered = @VATRegistered, VATVALUE= @VATVALUE where ContactID= @ContactID";
                            //cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo ) values (@PFirstName, @PSurname, @PAddress1, @PAddress2, @PCity , @PPostCode, @PCountry, @PPhone, @PMobile, @PFax, @PEmail, @PNINo )";

                            if (cmd.ExecuteNonQuery() > 0)
                            {


                                //msg.InnerHtml = cmd.CommandText.ToString();


                            }

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
                Message.InnerHtml = "<h5>Admin details successfully updated  </h5>";

            }
        }
      

    }
}