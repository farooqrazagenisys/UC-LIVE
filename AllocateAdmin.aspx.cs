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
	public partial class AllocateAdmin : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void AddNewRecord(object sender, EventArgs e)
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
                        cmd.Parameters.AddWithValue("DOB", DateTime.MaxValue);

                       

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
                        cmd.Parameters.AddWithValue("Mobile", "");
                        cmd.Parameters.AddWithValue("Fax", "");
                        cmd.Parameters.AddWithValue("Email", EmailTextBox.Text);
                        cmd.Parameters.AddWithValue("NINO", "");
                        cmd.Parameters.AddWithValue("BankDetails", BankDetailsTextBox.Text);
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

        protected void UpdateRecordDetails(object sender, EventArgs e)
        {

        }
	}
}
