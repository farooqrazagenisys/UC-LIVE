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
    public partial class AddUserClaim : System.Web.UI.Page
    {
        int ClaimIDvalue = 0;
        int WitnessIDvalue1 = 0;
        int WitnessIDvalue2 = 0;
        int PartyatFaultValue = 0;
        int ClientIDvalue = 0;
        int VehicleOwnerID = 0;
        int VehicleID = 0;
        int GPID = 0;
        int HospitalID = 0;
        //int ContactIDUpdate = 0;
        int WitnessID1Update = 0;
        int WitnessID2Update = 0;
        string FirstName = "";
        string SurName = "";
        string Phone = "";
        string Mobile = "";
        string ClientEmail = "";

        string AccidentDateValue = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddNewClaim(object sender, ImageClickEventArgs e)
        {
            string UserEmail = "admin@uclive.co.uk";
            //add client details

            #region


            try
            {
                // int Claimid= Convert.ToInt32(e.NewValues[0]);


                 FirstName = ContactDetails1.FirstName;
                 SurName = ContactDetails1.SurName;
                 Phone = ContactDetails1.Phone;
                 Mobile = ContactDetails1.Mobile;
                string Address1 = ContactDetails1.Address1;
                string Address2 = ContactDetails1.Address2;
                string PostCode = ContactDetails1.PostCode;
                string City = ContactDetails1.City;
                string Country = ContactDetails1.Country;
                string Fax = ContactDetails1.Fax;
                string Email = ContactDetails1.Email;

                ClientEmail = Email;
                string DateOfBirth = ContactDetails1.DateOfBirth;
                string NINumber = ContactDetails1.NINumber;
                string DOB = ContactDetails1.DateOfBirth;
                string DriverPolicyNo = ContactDetails1.DriverPolicyNo;
                string DriverInsurers = ContactDetails1.DriverInsurers;
                string Title = ContactDetails1.TitleValue;
                string Company = ContactDetails1.CompanyTextBox1Value;
                string ExpiryDate1 = Convert.ToString(ExpiryDate.Text);
                string LicenseCategory1 = Convert.ToString(LicenseCategory.Text);
                string Identification1 = Convert.ToString(Identification.Text);
                string IssueDate1 = Convert.ToString(IssueDate.Text);
                string DriverLicenceNumber1 = Convert.ToString(DriverLicenceNumber.Text);



                FileUpload FileUpload1 = ContactDetails1.FileUpload;




                using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {

                        string extension = string.Empty;
                        string strFileName = string.Empty;

                        if (FileUpload1.HasFile)
                        {

                            HttpPostedFile PostedFileValue = ContactDetails1.FileUpload.PostedFile;

                            int FileSizeKB = PostedFileValue.ContentLength / 1024;

                            extension = System.IO.Path.GetExtension(PostedFileValue.FileName).ToLower();
                            strFileName = System.IO.Path.GetFileNameWithoutExtension(PostedFileValue.FileName).ToLower();

                            if ((extension != ".jpg" && extension != ".jpeg" && extension != ".gif" && extension != ".png") || (FileSizeKB > 500))
                            {
                                System.Text.StringBuilder stringBuilder = new System.Text.StringBuilder();

                                stringBuilder.Append("<span style=\"color:Red;font-weight:bold;font-size:14px;\">Invalid image format. Only jpeg,jpg,gif,png images are permited not more than 1024 KB</span>");
                                stringBuilder.Append(string.Format("<br/> <span style=\"color:Black;font-weight:bold;font-size:14px;\">File Extension : {0}", extension));
                                stringBuilder.Append(string.Format(" File Size:  {0}(KB):", FileSizeKB) + "</span><br/>");

                                //Msg.InnerHtml = stringBuilder.ToString();

                                return;
                            }

                            ContactDetails1.FileUpload.SaveAs(Server.MapPath("~/Images") + "/" + strFileName + extension);
                        }

                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("Title", Title);
                        cmd.Parameters.AddWithValue("FirstName", FirstName);
                        cmd.Parameters.AddWithValue("Surname", SurName);
                        cmd.Parameters.AddWithValue("Address1", Address1);
                        cmd.Parameters.AddWithValue("Address2", Address2);
                        cmd.Parameters.AddWithValue("City", City);
                        cmd.Parameters.AddWithValue("PostCode", PostCode);
                        cmd.Parameters.AddWithValue("Country", Country);
                        cmd.Parameters.AddWithValue("LicenceExpiryDate", ExpiryDate1);
                        cmd.Parameters.AddWithValue("LicenseCategory", LicenseCategory1);
                        cmd.Parameters.AddWithValue("Identification1", Identification1);
                        cmd.Parameters.AddWithValue("LicenceIssueDate", IssueDate1);
                        cmd.Parameters.AddWithValue("DriverLicenceNumber", DriverLicenceNumber1);
                        //cmd.Parameters.AddWithValue("Company", Company);
                        cmd.Parameters.AddWithValue("Phone", Phone);
                        cmd.Parameters.AddWithValue("Mobile", Mobile);
                        cmd.Parameters.AddWithValue("Fax", Fax);
                        cmd.Parameters.AddWithValue("Email", Email);
                        cmd.Parameters.AddWithValue("DOB", DOB);
                        cmd.Parameters.AddWithValue("NINO", NINumber);
                        cmd.Parameters.AddWithValue("DriverPolicyNo", DriverPolicyNo);
                        cmd.Parameters.AddWithValue("DriverInsurers", DriverInsurers);
                        cmd.Parameters.AddWithValue("ContactTypeID", "7");
                        cmd.Parameters.AddWithValue("Company", Company);
                        cmd.Parameters.AddWithValue("ContactImage", "Images/" + strFileName + extension);

                        cmd.CommandText = "INSERT into Contact (FirstName, Surname, Company, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, DOB, NINo, ContactTypeID,DriverPolicyNo, DriverInsurers, ContactImage, Title,LicenceExpiryDate,LicenceIssueDate, LicenseCategory,Identification1,DriverLicenceNumber) values (@FirstName, @Surname, @Company, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @DOB, @NINo, @ContactTypeID, @DriverPolicyNo, @DriverInsurers, @ContactImage, @Title,@LicenceExpiryDate,@LicenceIssueDate, @LicenseCategory,@Identification1,@DriverLicenceNumber)";
                        //cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo ) values (@PFirstName, @PSurname, @PAddress1, @PAddress2, @PCity , @PPostCode, @PCountry, @PPhone, @PMobile, @PFax, @PEmail, @PNINo )";


                        if (cmd.ExecuteNonQuery() > 0)
                        {

                            msg.InnerHtml = cmd.CommandText.ToString();
                            cmd.Parameters.Clear();
                            cmd.CommandText = "SELECT @@IDENTITY";

                            // Get the last inserted id.
                            ClientIDvalue = Convert.ToInt32(cmd.ExecuteScalar());


                        }

                        if (OwnerDetailsDropDown.SelectedItem.Value == "Yes")
                        {
                            cmd.Parameters.Clear();
                            cmd.CommandType = CommandType.Text;
                            cmd.Parameters.AddWithValue("Title", Title);
                            cmd.Parameters.AddWithValue("FirstName", FirstName);
                            cmd.Parameters.AddWithValue("Surname", SurName);
                            cmd.Parameters.AddWithValue("Address1", Address1);
                            cmd.Parameters.AddWithValue("Address2", Address2);
                            cmd.Parameters.AddWithValue("City", City);
                            cmd.Parameters.AddWithValue("PostCode", PostCode);
                            cmd.Parameters.AddWithValue("Country", Country);
                            //cmd.Parameters.AddWithValue("Company", Company);
                            cmd.Parameters.AddWithValue("Phone", Phone);
                            cmd.Parameters.AddWithValue("Mobile", Mobile);
                            cmd.Parameters.AddWithValue("Fax", Fax);
                            cmd.Parameters.AddWithValue("Email", Email);

                            //cmd.Parameters.AddWithValue("DriverPolicyNo",OwnerDriverPolicyNo22.Text);
                            //cmd.Parameters.AddWithValue("DriverInsurers", OwnerInsuranceCover.Text);

                            cmd.Parameters.AddWithValue("ContactTypeID", "9");

                            cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email,ContactTypeID,Title) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @ContactTypeID,@Title)";
                            //cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo ) values (@PFirstName, @PSurname, @PAddress1, @PAddress2, @PCity , @PPostCode, @PCountry, @PPhone, @PMobile, @PFax, @PEmail, @PNINo )";


                            if (cmd.ExecuteNonQuery() > 0)
                            {

                                msg.InnerHtml = cmd.CommandText.ToString();



                            }

                            cmd.Parameters.Clear();
                            cmd.CommandText = "SELECT @@IDENTITY";

                            // Get the last inserted id.
                            VehicleOwnerID = Convert.ToInt32(cmd.ExecuteScalar());

                            //Response.Write(insertID);



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

            #endregion

            // int Claimid= Convert.ToInt32(e.NewValues[0]);

            //add party at fault
            #region

            try
            {


                using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("Title", PTitle.Text);
                        cmd.Parameters.AddWithValue("FirstName", PFirstName.Text);
                        cmd.Parameters.AddWithValue("Surname", PSurname.Text);
                        cmd.Parameters.AddWithValue("Address1", PAddress1.Text);
                        cmd.Parameters.AddWithValue("Address2", PAddress2.Text);
                        cmd.Parameters.AddWithValue("City", PCity.Text);
                        cmd.Parameters.AddWithValue("PostCode", PPostCode.Text);
                        cmd.Parameters.AddWithValue("Country", "");
                        cmd.Parameters.AddWithValue("Phone", PPhone.Text);
                        cmd.Parameters.AddWithValue("Mobile", PMobile.Text);
                        cmd.Parameters.AddWithValue("DriverPolicyNo", PDriverPolicyNo.Text);
                        cmd.Parameters.AddWithValue("DriverInsurers", PInsuranceReferenceNo.Text);
                        cmd.Parameters.AddWithValue("InsuranceReferenceNo", PInsuranceReferenceNo.Text);
                        cmd.Parameters.AddWithValue("DOB", "");
                        cmd.Parameters.AddWithValue("NINO", "");
                        cmd.Parameters.AddWithValue("ContactTypeID", "8");
                        cmd.Parameters.AddWithValue("Fax", "");
                        cmd.Parameters.AddWithValue("Email", "");




                        //int ClaimID = -1;

                        //using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                        //{
                        //    if (dataReader.RecordsAffected > 0 && dataReader.Read())
                        //        ClaimID = Convert.ToInt32(dataReader["Id"]);
                        //    dataReader.Close();
                        //}


                        cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, DriverInsurers, InsuranceReferenceNo, DriverPolicyNo, Fax, Email, NINo, ContactTypeID, Title) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @DriverInsurers, @InsuranceReferenceNo, @DriverPolicyNo, @Fax, @Email, @NINo, @ContactTypeID, @Title)";
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            msg.InnerHtml = cmd.CommandText.ToString();

                        }

                        cmd.Parameters.Clear();
                        cmd.CommandText = "SELECT @@IDENTITY";

                        // Get the last inserted id.
                        PartyatFaultValue = Convert.ToInt32(cmd.ExecuteScalar());

                        //Response.Write(insertID);

                    }



                }

            #endregion


                //add GP details
                #region


                using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("Title", GPTitle.Text);
                        cmd.Parameters.AddWithValue("FirstName", GPFirstName.Text);
                        cmd.Parameters.AddWithValue("Surname", GPSurname.Text);
                        cmd.Parameters.AddWithValue("Address1", GPAddress1.Text);
                        cmd.Parameters.AddWithValue("Address2", GPAddress2.Text);
                        cmd.Parameters.AddWithValue("City", GPCityName.Text);
                        cmd.Parameters.AddWithValue("PostCode", GPPostCode.Text);
                        cmd.Parameters.AddWithValue("Country", "");
                        cmd.Parameters.AddWithValue("Phone", GPPhone.Text);
                        cmd.Parameters.AddWithValue("Mobile", "");
                        cmd.Parameters.AddWithValue("DOB", "");
                        cmd.Parameters.AddWithValue("NINO", "");
                        cmd.Parameters.AddWithValue("ContactTypeID", "10");
                        cmd.Parameters.AddWithValue("Fax", "");
                        cmd.Parameters.AddWithValue("Email", "");




                        //int ClaimID = -1;

                        //using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                        //{
                        //    if (dataReader.RecordsAffected > 0 && dataReader.Read())
                        //        ClaimID = Convert.ToInt32(dataReader["Id"]);
                        //    dataReader.Close();
                        //}


                        cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo, ContactTypeID, Title) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @NINo, @ContactTypeID, @Title)";
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            msg.InnerHtml = cmd.CommandText.ToString();

                        }

                        cmd.Parameters.Clear();
                        cmd.CommandText = "SELECT @@IDENTITY";

                        // Get the last inserted id.
                        GPID = Convert.ToInt32(cmd.ExecuteScalar());

                        //Response.Write(insertID);

                    }
                }

                #endregion


                //add Hosptial details
                #region

                using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        //cmd.Parameters.AddWithValue("Title", HospitalTitle.Text);
                        cmd.Parameters.AddWithValue("FirstName", HospitalName.Text);
                        cmd.Parameters.AddWithValue("Surname", Department.Text);
                        cmd.Parameters.AddWithValue("Address1", HospitalAddress1.Text);
                        cmd.Parameters.AddWithValue("Address2", HospitalAddress2.Text);
                        cmd.Parameters.AddWithValue("City", HospitalCity.Text);
                        cmd.Parameters.AddWithValue("PostCode", HospitalPostCode.Text);
                        cmd.Parameters.AddWithValue("Country", "");
                        cmd.Parameters.AddWithValue("Phone", HospitalPhone.Text);
                        cmd.Parameters.AddWithValue("Mobile", "");
                        cmd.Parameters.AddWithValue("DOB", "");
                        cmd.Parameters.AddWithValue("NINO", "");
                        cmd.Parameters.AddWithValue("ContactTypeID", "11");
                        cmd.Parameters.AddWithValue("Fax", "");
                        cmd.Parameters.AddWithValue("Email", "");




                        //int ClaimID = -1;

                        //using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                        //{
                        //    if (dataReader.RecordsAffected > 0 && dataReader.Read())
                        //        ClaimID = Convert.ToInt32(dataReader["Id"]);
                        //    dataReader.Close();
                        //}


                        cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo, ContactTypeID) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @NINo, @ContactTypeID)";
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            msg.InnerHtml = cmd.CommandText.ToString();

                        }

                        cmd.Parameters.Clear();
                        cmd.CommandText = "SELECT @@IDENTITY";

                        // Get the last inserted id.
                        HospitalID = Convert.ToInt32(cmd.ExecuteScalar());

                        //Response.Write(insertID);

                    }
                }
                #endregion

                //add witness details
                #region

                using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {


                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("Title", W1Title.Text);
                        cmd.Parameters.AddWithValue("FirstName", W1FirstName.Text);
                        cmd.Parameters.AddWithValue("Surname", W1Surname.Text);
                        cmd.Parameters.AddWithValue("Address1", W1Address1.Text);
                        cmd.Parameters.AddWithValue("Address2", W1Address2.Text);
                        cmd.Parameters.AddWithValue("City", W1CityTitle.Text);
                        cmd.Parameters.AddWithValue("Country", " ");
                        cmd.Parameters.AddWithValue("PostCode", W1Postcode.Text);
                        cmd.Parameters.AddWithValue("Phone", W1Phone.Text);
                        cmd.Parameters.AddWithValue("Mobile", W1Mobile.Text);
                        cmd.Parameters.AddWithValue("ContactTypeID", "6");
                        cmd.Parameters.AddWithValue("Fax", "");
                        cmd.Parameters.AddWithValue("Email", "");
                        cmd.Parameters.AddWithValue("DOB", "");
                        cmd.Parameters.AddWithValue("NINO", "");
                        cmd.Parameters.AddWithValue("WitnessSequence", "1");





                        //int ClaimID = -1;

                        //using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                        //{
                        //    if (dataReader.RecordsAffected > 0 && dataReader.Read())
                        //        ClaimID = Convert.ToInt32(dataReader["Id"]);
                        //    dataReader.Close();
                        //}


                        cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo, ContactTypeID, WitnessSequence, Title) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @NINo, @ContactTypeID, @WitnessSequence, @Title)";

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            msg.InnerHtml = cmd.CommandText.ToString();

                        }

                        cmd.Parameters.Clear();
                        cmd.CommandText = "SELECT @@IDENTITY";

                        // Get the last inserted id.
                        WitnessIDvalue1 = Convert.ToInt32(cmd.ExecuteScalar());

                        //Response.Write(insertID);
                    }

                }
                #endregion

                //add witness 2 details
                #region

                using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("Title", W2Title.Text);
                        cmd.Parameters.AddWithValue("FirstName", W2FirstName.Text);
                        cmd.Parameters.AddWithValue("Surname", W2Surname.Text);
                        cmd.Parameters.AddWithValue("Address1", W2Address1.Text);
                        cmd.Parameters.AddWithValue("Address2", W2Address2.Text);
                        cmd.Parameters.AddWithValue("City", W2City.Text);
                        cmd.Parameters.AddWithValue("Country", " ");
                        cmd.Parameters.AddWithValue("PostCode", W2Postcode.Text);
                        cmd.Parameters.AddWithValue("Phone", W2Phone.Text);
                        cmd.Parameters.AddWithValue("Mobile", W2Mobile.Text);
                        cmd.Parameters.AddWithValue("ContactTypeID", "6");
                        cmd.Parameters.AddWithValue("Fax", "");
                        cmd.Parameters.AddWithValue("Email", "");
                        cmd.Parameters.AddWithValue("DOB", "");
                        cmd.Parameters.AddWithValue("NINO", "");
                        cmd.Parameters.AddWithValue("WitnessSequence", "2");






                        //int ClaimID = -1;

                        //using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                        //{
                        //    if (dataReader.RecordsAffected > 0 && dataReader.Read())
                        //        ClaimID = Convert.ToInt32(dataReader["Id"]);
                        //    dataReader.Close();
                        //}


                        cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo, ContactTypeID,WitnessSequence,Title) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @NINo, @ContactTypeID, @WitnessSequence, @Title)";

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            msg.InnerHtml = cmd.CommandText.ToString();

                        }

                        cmd.Parameters.Clear();
                        cmd.CommandText = "SELECT @@IDENTITY";

                        // Get the last inserted id.
                        WitnessIDvalue2 = Convert.ToInt32(cmd.ExecuteScalar());

                        //Response.Write(insertID);
                    }

                }

                #endregion


                //for  PI & RTA owner details

                #region


                if (ClaimType.SelectedItem.Text == "PI and RTA" || ClaimType.SelectedItem.Text == "RTA Claims")
                {
                    //ContactDetails1

                    //   this.ContactDetails1.DrivingLicencePanel = true;
                    if (OwnerDetailsDropDown.SelectedItem.Value == "No")
                    {

                        using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                        {
                            conn.Open();
                            using (SqlCommand cmd = conn.CreateCommand())
                            {


                                cmd.CommandType = CommandType.Text;
                                cmd.Parameters.AddWithValue("Title", OwnerTitle.Text);
                                cmd.Parameters.AddWithValue("FirstName", OwnerFirstName.Text);
                                cmd.Parameters.AddWithValue("Surname", OwnerSurname.Text);
                                cmd.Parameters.AddWithValue("Address1", OwnerAddress111.Text);
                                cmd.Parameters.AddWithValue("Address2", OwnerAddress2.Text);
                                cmd.Parameters.AddWithValue("City", OwnerCity.Text);
                                cmd.Parameters.AddWithValue("Country", " ");
                                cmd.Parameters.AddWithValue("PostCode", OwnerPostCode.Text);
                                cmd.Parameters.AddWithValue("Phone", OwnerPhoneNo.Text);
                                cmd.Parameters.AddWithValue("Mobile", "");
                                cmd.Parameters.AddWithValue("ContactTypeID", "9");
                                cmd.Parameters.AddWithValue("Fax", "");
                                cmd.Parameters.AddWithValue("Email", "");
                                cmd.Parameters.AddWithValue("DOB", "");
                                cmd.Parameters.AddWithValue("NINO", "");

                                cmd.Parameters.AddWithValue("DriverPolicyNo", "");
                                //cmd.Parameters.AddWithValue("DriverInsurers", OwnerInsuranceCover.Text);




                                //int ClaimID = -1;

                                //using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                                //{
                                //    if (dataReader.RecordsAffected > 0 && dataReader.Read())
                                //        ClaimID = Convert.ToInt32(dataReader["Id"]);
                                //    dataReader.Close();
                                //}


                                cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo, ContactTypeID,DriverPolicyNo,DriverInsurers, Title) values (@FirstName, @Surname, @Address1, @Address2, @City , @PostCode, @Country, @Phone, @Mobile, @Fax, @Email, @NINo, @ContactTypeID,@DriverPolicyNo,@DriverInsurers, @Title)";

                                if (cmd.ExecuteNonQuery() > 0)
                                {
                                    msg.InnerHtml = cmd.CommandText.ToString();

                                }

                                cmd.Parameters.Clear();
                                cmd.CommandText = "SELECT @@IDENTITY";

                                // Get the last inserted id.
                                VehicleOwnerID = Convert.ToInt32(cmd.ExecuteScalar());

                                //Response.Write(insertID);
                            }
                        }

                    }

                }

                #endregion

                // add claim

                #region

                using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        if (RadDateTimePicker1 != null)
                        {
                            cmd.Parameters.AddWithValue("AccidentDate", Convert.ToDateTime(RadDateTimePicker1).ToString("yyyy/MM/dd"));
                            AccidentDateValue = Convert.ToDateTime(RadDateTimePicker1).ToString("dd/MM/yyyy");
                        }

                        else
                        {
                            cmd.Parameters.AddWithValue("AccidentDate", Convert.ToDateTime(DateTime.MaxValue).ToString("yyyy/MM/dd"));

                        }

                        if (GPDateAttended.Text != "")
                        {
                            cmd.Parameters.AddWithValue("DateGPAttended", Convert.ToDateTime(GPDateAttended.Text).ToString("yyyy/MM/dd"));

                        }

                        else
                        {
                            cmd.Parameters.AddWithValue("DateGPAttended", Convert.ToDateTime(DateTime.MaxValue).ToString("yyyy/MM/dd"));

                        }

                        if (HospitalDateAttended.Text != "")
                        {
                            cmd.Parameters.AddWithValue("DateHospitalAttended", Convert.ToDateTime(HospitalDateAttended.Text).ToString("yyyy/MM/dd"));

                        }

                        else
                        {
                            cmd.Parameters.AddWithValue("DateHospitalAttended", Convert.ToDateTime(DateTime.MaxValue).ToString("yyyy/MM/dd"));

                        }




                        cmd.CommandType = CommandType.Text;

                        cmd.Parameters.AddWithValue("ClaimTitle", ClaimTitle.Text);

                        cmd.Parameters.AddWithValue("DateCreated", Convert.ToDateTime(DateTime.Now).ToString("yyyy/MM/dd HH:mm:ss"));
                        cmd.Parameters.AddWithValue("DateUpdated", Convert.ToDateTime(DateTime.Now).ToString("yyyy/MM/dd HH:mm:ss"));

                        cmd.Parameters.AddWithValue("AccidentLocation", AccidentLocation.Text);
                        cmd.Parameters.AddWithValue("AccidentInfo", AccidentInfo.Text);
                        cmd.Parameters.AddWithValue("RoadCondition", RoadConditionDropdown.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("WhotoBlame", WhotoBlame.Text);
                        cmd.Parameters.AddWithValue("PoliceAttended", PoliceAttended.Text);
                        cmd.Parameters.AddWithValue("PoliceOfficerName", PoliceOfficerName.Text);
                        cmd.Parameters.AddWithValue("PoliceLogNo", PoliceLogNo.Text);
                        cmd.Parameters.AddWithValue("PoliceAddress", PoliceAddress.Text);
                        cmd.Parameters.AddWithValue("VehicleRoadworthy", VehicleRoadworthy.Text);
                        cmd.Parameters.AddWithValue("DamageToVehcle", DamageToVehcle.Text);
                        cmd.Parameters.AddWithValue("ExistingCFA", ExistingCFA.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("AdditionalInfo", AdditionalInfo.Text);
                        cmd.Parameters.AddWithValue("AnyoneInjured", AnyoneInjured.Text);
                        cmd.Parameters.AddWithValue("PassengerClaims", PassengerClaims.Text);
                        cmd.Parameters.AddWithValue("RefferedBy", RefferedBy.Text);
                        cmd.Parameters.AddWithValue("AnyWitnesses", AnyWitnesses.Text);
                        cmd.Parameters.AddWithValue("PreviousAccidents", PreviousAccidents.Text);

                        cmd.Parameters.AddWithValue("ClaimTypeID", ClaimType.SelectedItem.Value);
                        cmd.Parameters.AddWithValue("ClaimStatusID", "1");

                        cmd.Parameters.AddWithValue("InjuriesSustained", InjurySustained.Text);
                        cmd.Parameters.AddWithValue("OtherLosses", GPOtherlosses.Text);
                        cmd.Parameters.AddWithValue("FirstPartyDealing", DropDownFirstPartyDealing.SelectedItem.Value);

                        cmd.Parameters.AddWithValue("ClaimUserValue", Page.User.Identity.Name);

                        if (this.Page.User.IsInRole("Administrator"))
                        {
                            cmd.Parameters.AddWithValue("ClaimUserRole", "Administrator");
                        }


                        else if (this.Page.User.IsInRole("Agent"))
                        {
                            cmd.Parameters.AddWithValue("ClaimUserRole", "Agent");
                        }


                        else if (this.Page.User.IsInRole("Branch"))
                        {
                            cmd.Parameters.AddWithValue("ClaimUserRole", "Branch");
                        }


                        else if (this.Page.User.IsInRole("Staff"))
                        {
                            cmd.Parameters.AddWithValue("ClaimUserRole", "Staff");
                        }

                        else if (this.Page.User.IsInRole("Guest"))
                        {
                            cmd.Parameters.AddWithValue("ClaimUserRole", "Guest");
                        }
                        //Date Hostpital Attended
                        //Date GP Attended
                        //InjurySustained
                        //Other Losses
                        //Driver Inurer
                        //Driver Policy

                        //int ClaimID = -1;

                        //using (System.Data.IDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                        //{
                        //    if (dataReader.RecordsAffected > 0 && dataReader.Read())
                        //        ClaimID = Convert.ToInt32(dataReader["Id"]);
                        //    dataReader.Close();
                        //}

                        cmd.CommandText = "INSERT into Claim (ClaimTitle ,DateCreated ,DateUpdated ,RefferedBy ,AccidentLocation ,AccidentDate ,AccidentInfo ,RoadCondition ,WhotoBlame ,PoliceAttended ,PoliceOfficerName ,PoliceLogNo ,PoliceAddress  ,vehicleRoadworthy ,DamageToVehcle,AdditionalInfo,AnyoneInjured,PassengerClaims ,ExistingCFA, AnyWitnesses,PreviousAccidents,ClaimTypeID ,ClaimStatusID,InjuriesSustained ,OtherLosses,FirstPartyDealing, DateGPAttended, DateHospitalAttended, ClaimUserValue, ClaimUserRole) values(@ClaimTitle ,@DateCreated ,@DateUpdated ,@RefferedBy ,@AccidentLocation ,@AccidentDate ,@AccidentInfo ,@RoadCondition ,@WhotoBlame ,@PoliceAttended ,@PoliceOfficerName ,@PoliceLogNo ,@PoliceAddress ,@vehicleRoadworthy ,@DamageToVehcle,@AdditionalInfo,@AnyoneInjured,@PassengerClaims ,@ExistingCFA, @AnyWitnesses,@PreviousAccidents,@ClaimTypeID ,@ClaimStatusID,@InjuriesSustained ,@OtherLosses,@FirstPartyDealing, @DateGPAttended, @DateHospitalAttended, @ClaimUserValue, @ClaimUserRole)";


                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            msg.InnerHtml = cmd.CommandText.ToString();

                        }

                        cmd.Parameters.Clear();
                        cmd.CommandText = "SELECT @@IDENTITY";

                        // Get the last inserted id.
                        ClaimIDvalue = Convert.ToInt32(cmd.ExecuteScalar());

                        //Response.Write(insertID);
                    }

                }
                #endregion

                // add Vehicle 

                #region

                using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {
                    conn.Open();


                    using (SqlCommand cmd = conn.CreateCommand())
                    {

                        cmd.Parameters.AddWithValue("VehicleMake", VehicleMake.Text);
                        cmd.Parameters.AddWithValue("VehicleModel", VehicleModel.Text);
                        cmd.Parameters.AddWithValue("VehicleReg", VehicleReg.Text);
                        cmd.Parameters.AddWithValue("VehicleOwnerId", VehicleOwnerID);
                        cmd.Parameters.AddWithValue("ClaimId", ClaimIDvalue);
                        cmd.Parameters.AddWithValue("VehicleType", "ClientCar");

                        cmd.CommandText = "INSERT into Vehicle (VehicleMake,VehicleModel,VehicleReg,VehicleOwnerId, ClaimId,VehicleType) values(@VehicleMake,@VehicleModel,@VehicleReg,@VehicleOwnerId,@ClaimId,@VehicleType)";


                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            cmd.Parameters.Clear();

                        }
                        cmd.Parameters.Clear();
                        cmd.CommandText = "SELECT @@IDENTITY";

                        // Get the last inserted id.
                        VehicleID = Convert.ToInt32(cmd.ExecuteScalar());

                        //Response.Write(insertID);

                        cmd.Parameters.AddWithValue("VehicleMake", PVehicleMake.Text);
                        cmd.Parameters.AddWithValue("VehicleModel", PVehileModel.Text);
                        cmd.Parameters.AddWithValue("VehicleReg", PVehicleReg.Text);
                        cmd.Parameters.AddWithValue("VehicleRoadWorthy", PVehicleRoadworthy.Text);
                        cmd.Parameters.AddWithValue("VehicleOwnerId", PartyatFaultValue);
                        cmd.Parameters.AddWithValue("ClaimId", ClaimIDvalue);
                        cmd.Parameters.AddWithValue("VehicleType", "PartyatFaultCar");


                        cmd.CommandText = "INSERT into Vehicle (VehicleMake,VehicleModel,VehicleReg,VehicleOwnerId, ClaimId,VehicleRoadWorthy,VehicleType) values(@VehicleMake,@VehicleModel,@VehicleReg,@VehicleOwnerId,@ClaimId,@VehicleRoadWorthy,@VehicleType)";


                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            cmd.Parameters.Clear();

                        }
                        cmd.Parameters.Clear();
                        cmd.CommandText = "SELECT @@IDENTITY";

                        // Get the last inserted id.
                        VehicleID = Convert.ToInt32(cmd.ExecuteScalar());

                        //Response.Write(insertID);


                    }



                }

                #endregion


                // Join all contacts with claim
                #region

                using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = conn.CreateCommand())
                    {


                        cmd.Parameters.AddWithValue("ClaimID", ClaimIDvalue);
                        cmd.Parameters.AddWithValue("ContactID", ClientIDvalue);
                        cmd.Parameters.AddWithValue("ContactTypeID", "7");
                        cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";


                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            msg.InnerHtml = cmd.CommandText.ToString();
                            cmd.Parameters.Clear();
                        }

                        cmd.Parameters.AddWithValue("ClaimID", ClaimIDvalue);
                        cmd.Parameters.AddWithValue("ContactID", WitnessIDvalue1);
                        cmd.Parameters.AddWithValue("ContactTypeID", "6");
                        cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";


                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            msg.InnerHtml = cmd.CommandText.ToString();
                            cmd.Parameters.Clear();
                        }

                        cmd.Parameters.AddWithValue("ClaimID", ClaimIDvalue);
                        cmd.Parameters.AddWithValue("ContactID", WitnessIDvalue2);
                        cmd.Parameters.AddWithValue("ContactTypeID", "6");
                        cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";


                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            msg.InnerHtml = cmd.CommandText.ToString();
                            cmd.Parameters.Clear();
                        }

                        cmd.Parameters.AddWithValue("ClaimID", ClaimIDvalue);
                        cmd.Parameters.AddWithValue("ContactID", PartyatFaultValue);
                        cmd.Parameters.AddWithValue("ContactTypeID", "8");
                        cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            msg.InnerHtml = cmd.CommandText.ToString();
                            cmd.Parameters.Clear();
                        }

                        cmd.Parameters.AddWithValue("ClaimID", ClaimIDvalue);
                        cmd.Parameters.AddWithValue("ContactID", GPID);
                        cmd.Parameters.AddWithValue("ContactTypeID", "10");
                        cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            msg.InnerHtml = cmd.CommandText.ToString();
                            cmd.Parameters.Clear();
                        }

                        cmd.Parameters.AddWithValue("ClaimID", ClaimIDvalue);
                        cmd.Parameters.AddWithValue("ContactID", HospitalID);
                        cmd.Parameters.AddWithValue("ContactTypeID", "11");
                        cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            msg.InnerHtml = cmd.CommandText.ToString();
                            cmd.Parameters.Clear();
                        }


                        cmd.Parameters.AddWithValue("ClaimID", ClaimIDvalue);
                        cmd.Parameters.AddWithValue("ContactID", VehicleOwnerID);
                        cmd.Parameters.AddWithValue("ContactTypeID", "9");
                        cmd.CommandText = "INSERT into ClaimContact (ClaimID,ContactID,ContactTypeID) values(@ClaimID,@ContactID,@ContactTypeID)";


                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            msg.InnerHtml = cmd.CommandText.ToString();
                            cmd.Parameters.Clear();
                        }

                        cmd.Parameters.AddWithValue("ClaimID", ClaimIDvalue);

                        cmd.CommandText = "INSERT into LossOfUseDate (ClaimID) Values(@ClaimID)";
                        //cmd.CommandText = "INSERT into Contact (FirstName, Surname, Address1, Address2, City , PostCode, Country, Phone, Mobile, Fax, Email, NINo ) values (@PFirstName, @PSurname, @PAddress1, @PAddress2, @PCity , @PPostCode, @PCountry, @PPhone, @PMobile, @PFax, @PEmail, @PNINo )";


                        if (cmd.ExecuteNonQuery() > 0)
                        {

                            msg.InnerHtml = cmd.CommandText.ToString();
                            cmd.Parameters.Clear();

                           

                        }


                    }

                    try
                    {
                        
             
					using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                    {


                        using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("select Email from aspnet_Membership , aspnet_Users where aspnet_Membership.UserId = aspnet_Users.UserId and aspnet_Users.UserName=@UserName", sqlConnection))
                    {

                        sqlCommand.Connection.Open();

                        sqlCommand.Parameters.AddWithValue("UserName", User.Identity.Name);

                        using (SqlDataReader dataReader = sqlCommand.ExecuteReader())
                            while (dataReader.Read())
                            {

                                UserEmail = Convert.ToString(dataReader["Email"]);
                            }


                    }

                    }
                          

                        string ToEmailValue = "info@uclive.co.uk";
                        System.Text.StringBuilder stringBuilder = new System.Text.StringBuilder();




                        // Send the email to Custoemr for booking details. Put the booking information in message one you completed the booking.

                        System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient("mail.uclive.co.uk");

                        smtpClient.Credentials = new System.Net.NetworkCredential("info@uclive.co.uk", "password123");
                        //System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient("92.48.110.7");

                        System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();



                        //mailMessage.Attachments.Add(new System.Net.Mail.Attachment(string.Concat(System.IO.Directory.GetCurrentDirectory(),strFileName)));

                        mailMessage.From = new System.Net.Mail.MailAddress("info@uclive.co.uk");

                        mailMessage.Subject = "New Claim Referral - " + User.Identity.Name;

               

                        string MessageValue = "<br/>" +


                           "<table border='0' cellspacing='0' cellpadding='0' width='836'><tr><td><img src='http://www.uclive.co.uk/admin/Images/Eshot1.png' width='832' height='159' /></td></tr><tr><td width='836'><table width='900' border='0' cellspacing='0' cellpadding='0'><tr><td valign='top'><p><br />Thank you for submitting the claim, your claim reference no and client details are given below" + 
                           "<br/><br/>Claim Reference No: " + ClaimIDvalue +
                           "<br/><br/>Claim Submitted by: " + User.Identity.Name +
                           "<br/><br/>Accident Date: " + AccidentDateValue +
                           "<br/><br/>Client Name: " + FirstName + " " + SurName +
                           "<br/><br/>Client Phone: " + Phone +
                           "<br/><br/>Client Mobile: " + Mobile +
                           "<br/><br/>Client Email: " + ClientEmail + "<br/><br/><br/><br/>" + 
                          "<p><img src='http://www.uclive.co.uk/admin/Images/Eshot3.png' width='459' height='255' /></p></td><td><img src='http://www.uclive.co.uk/admin/Images/Eshot2.png' width='365' height='624' /></td> </tr></table><p>&nbsp;</p></td></tr></table>";
                                                
                        stringBuilder.Append(string.Format(MessageValue));

                        mailMessage.Body = stringBuilder.ToString();
                        
                        mailMessage.IsBodyHtml = true;
                        
                        ToEmailValue = "info@uclive.co.uk";


#if DEBUG
                        mailMessage.To.Add("info@uclive.co.uk");
#else
				
                mailMessage.To.Add(ToEmailValue);
                mailMessage.CC.Add(UserEmail);
#endif

                        smtpClient.Send(mailMessage);
                        
                        //TxtNameCV.Text = string.Empty;




                #endregion
                    }
                    catch (Exception EXC)
                    {
                        Console.Write(EXC.ToString());
                    }
                    finally
                    {



                        Response.Redirect("UserClaimLists.aspx");


                    }

                }
            }
            finally

            { }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {


            if (OwnerDetailsDropDown.SelectedItem.Value == "No")
            {
                VehicleOwner.Visible = true;
                //OwnerFirstName.Visible = false;
                //OwnerSurname.Visible = false;
                //OwnerCity.Visible = false;
                //OwnerAddress111.Visible = false;
                //OwnerAddress2.Visible = false;
                //OwnerCity.Visible = false;
                //OwnerPostCode.Visible = false;
                //OwnerFirstNameLabel.Visible = false;
                //OwnerSurnameLabel.Visible = false;
                //OwnerCityLabel.Visible = false;
                //OwnerOwnerAddress1Label.Visible = false;
                //OwnerOwnerAddress2Label.Visible = false;
                //OwnerPostCodeLabel.Visible = false;
                //OwnerPhoneLabel.Visible = false;
                //OwnerPhoneNo.Visible = false;


            }

            if (OwnerDetailsDropDown.SelectedItem.Value == "Yes")
            {
                VehicleOwner.Visible = false;


            }
        }

            
        protected void PolicePanleVisibility(object sender, EventArgs e)
        {

            if (this.PoliceAttended.SelectedItem.Text == "No")
            {
                this.PolicePanel.Visible = false;
            }
            if (this.PoliceAttended.SelectedItem.Text == "Yes")
            {
                this.PolicePanel.Visible = true;
            }

        }

        protected void WitnessVisiblityTab(object sender, EventArgs e)
        {

            if (this.AnyWitnesses.SelectedItem.Text == "No")
            {
                this.ViewWitnesses.Visible = false;
                this.WitnessTabText.Visible = true;
            }
            if (this.AnyWitnesses.SelectedItem.Text == "Yes")
            {
                this.WitnessTabText.Visible = false;
                this.ViewWitnesses.Visible = true;
            }

        }
				
		protected void Logout_Click(object sender, EventArgs e)
		{
			System.Web.Security.FormsAuthentication.SignOut();
			Response.Redirect("~/login.aspx");
		}

		protected void RedirectClaim_Click(object sender, EventArgs e)
		{
			if (Request.QueryString["ClaimId"] != null)
			{

			//	ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);

			} Response.Redirect("~/AddClaim.aspx");
		}

		protected void ClaimTitle_TextChanged(object sender, EventArgs e)
		{

		}
       
        protected void ClaimType_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (this.ClaimType.SelectedItem.Text == "PI Claims")
            {
                this.Panel1.Visible = false;
                this.DriveLicencePanel.Visible = false;
                this.Panel1.Visible = false;
                this.DriveLicencePanel.Visible = false;
                // this.VehicleDetailsTitle.Visible = false;
                // this.VehicleDetailstable.Visible = false;
                this.PassengerClaimsDropDown.Visible = false;
                this.PassengerClaims.Visible = false;
                this.VehicleRoadWorthTD.Visible = false;
                this.VehicleRoadWorthyTd.Visible = false;
                this.VehicleRoadworthy.Visible = false;
                this.RoadConditionsTd.Visible = false;

                this.PVehicleModel1.Visible = false;
                this.PVehicleMake1.Visible = false;
                this.PVehicleReg1.Visible = false;
                this.PVehicleRoadworthy1.Visible = false;

                this.Td1.Visible = true;



            }

            if (this.ClaimType.SelectedItem.Text == "PI and RTA")
            {
                this.Panel1.Visible = true;
                this.DriveLicencePanel.Visible = true;
                //this.VehicleDetailsTitle.Visible = true;
                //this.VehicleDetailstable.Visible = true;
                this.PassengerClaimsDropDown.Visible = true;
                this.PassengerClaims.Visible = true;
                this.VehicleRoadWorthTD.Visible = true;
                this.VehicleRoadWorthyTd.Visible = true;
                this.VehicleRoadworthy.Visible = true;
                this.RoadConditionsTd.Visible = true;
                this.PassengerClaimsDropDown.Visible = true;

                this.PVehicleModel1.Visible = true;
                this.PVehicleMake1.Visible = true;
                this.PVehicleReg1.Visible = true;

                this.PVehicleRoadworthy1.Visible = true;
                this.Td1.Visible = false;


            }

            if (this.ClaimType.SelectedItem.Text == "RTA Claims")
            {
                this.Panel1.Visible = true;
                this.DriveLicencePanel.Visible = true;
                //this.ContactDetails1.DrivingLicencePanel = true;
                this.Panel1.Visible = true;
                this.DriveLicencePanel.Visible = true;
                //this.VehicleDetailsTitle.Visible = true;
                //  this.VehicleDetailstable.Visible = true;
                this.PassengerClaimsDropDown.Visible = true;
                this.PassengerClaims.Visible = true;
                this.VehicleRoadWorthTD.Visible = true;
                this.VehicleRoadWorthyTd.Visible = true;
                this.VehicleRoadworthy.Visible = true;
                this.RoadConditionsTd.Visible = true;

                this.PVehicleModel1.Visible = true;
                this.PVehicleMake1.Visible = true;
                this.PVehicleReg1.Visible = true;
                this.PVehicleRoadworthy1.Visible = true;


                this.Td1.Visible = false;
            }

        }

    }
}
