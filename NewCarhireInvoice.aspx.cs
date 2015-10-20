using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace UC_LIVE
{
    public partial class NewCarhireInvoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          

            if (Convert.ToString(Request.QueryString["action"]) == "NewInvoice")
            {

                if (!this.IsPostBack)
                {

                    ShowInvoiceDetails.Visible = true;
                    InvoiceIDUpdate.Value = "";

                    if (Convert.ToString(Request.QueryString["ClaimID"]) != null)
                    {

                        string ClaimID = Convert.ToString(Request.QueryString["ClaimID"]);
                        this.ClaimIDHiddenField.Value = ClaimID;

                    }
                    UpdateInvoice.Visible = false;

                    using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                    {
                        using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT [FirstName], [Surname], [Company],[Address1],[Address2], [City] , [PostCode] FROM [Contact], [ClaimContact] WHERE ([ClaimContact].[ContactTypeID] = '9' and [Contact].[ContactID]=[ClaimContact].[ContactID] and [ClaimContact].[ClaimID]=@ClaimID)", sqlConnection))
                        {


                            sqlCommand.Connection.Open();
                            sqlCommand.Parameters.AddWithValue("ClaimID", Request.QueryString["ClaimID"]);

                            using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())
                            {
                                if (dataReader.Read())
                                {

                                    string FirstName = Convert.ToString(dataReader["FirstName"]);
                                    string Surname = Convert.ToString(dataReader["Surname"]);
                                    string Company = Convert.ToString(dataReader["Company"]);
                                    string Address1 = Convert.ToString(dataReader["Address1"]);
                                    string Address2 = Convert.ToString(dataReader["Address2"]);
                                    string City = Convert.ToString(dataReader["City"]);
                                    string PostCode = Convert.ToString(dataReader["PostCode"]);
                                    ////this.ContactDetails.Text = Convert.ToString(dataReader["Country"]);
                                    this.ContactDetails.Text = string.Format(FirstName + " " + Surname + "\n" + Company
                                    + Address1 + "\n" + Address2 + "\n" + City + "  " + PostCode);



                                }

                            }




                        }
                    }


                    using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                    {
                        //using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Contact, ClaimContact WHERE Contact.ContactTypeID = 4 and Contact.ContactID=ClaimContact.ContactID and ClaimContact.ClaimID=@ClaimID", sqlConnection))

                        using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Contact WHERE Contact.ContactTypeID = 12", sqlConnection))
                        {


                            sqlCommand.Connection.Open();
                            sqlCommand.Parameters.AddWithValue("ClaimID", Request.QueryString["ClaimID"]);

                            using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())
                            {
                                if (dataReader.Read())
                                {

                                    string InvoiceHeadertext = Convert.ToString(dataReader["InvoiceHeadertext"]);
                                    string InvoiceFootertext = Convert.ToString(dataReader["CompanyInfo"]);
                                    string BankDetails = Convert.ToString(dataReader["BankDetails"]);
                                    string Company = Convert.ToString(dataReader["Company"]);
                                    string Address1 = Convert.ToString(dataReader["Address1"]);
                                    string Address2 = Convert.ToString(dataReader["Address2"]);
                                    string PostCode = Convert.ToString(dataReader["PostCode"]);
                                    string City = Convert.ToString(dataReader["City"]);
                                    string ContactImage = Convert.ToString(dataReader["ContactImage"]);
                                    this.AdditoinalInstrucitonTextBox.Text = string.Format(BankDetails);
                                    this.TextBoxInvoiceFooter.Text = string.Format(InvoiceFootertext);
                                    this.TextBoxInvoiceHeader.Text = string.Format(InvoiceHeadertext);
                                    this.CompanyAddress.Text = string.Format(Company + "\n" + Address1 + "\n" + Address2 + "\n" + City + "\n" + PostCode + "\n");
                                    this.CompanyLogo.ImageUrl = ContactImage;
                                    string todayvalue = DateTime.Today.ToString("dd/M/yyyy");
                                    this.InvoiceDate.Text = todayvalue;
                                    this.InvoiceTitleTextBox.Text = "Hire & Additional Charges";

                                }

                            }
                        }
                    }

                    using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                    {
                        using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Contact WHERE ContactTypeID = 12", sqlConnection))
                        {


                            sqlCommand.Connection.Open();


                            using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())
                            {
                                if (dataReader.Read())
                                {

                                    string InvoiceHeadertext = Convert.ToString(dataReader["InvoiceHeadertext"]);
                                    string InvoiceFootertext = Convert.ToString(dataReader["CompanyInfo"]);
                                    string BankDetails = Convert.ToString(dataReader["BankDetails"]);
                                  //  string Company = Convert.ToString(dataReader["Company"]);
                                   // string Address1 = Convert.ToString(dataReader["Address1"]);
                                   // string Address2 = Convert.ToString(dataReader["Address2"]);
                                   // string PostCode = Convert.ToString(dataReader["PostCode"]);
                                   // string City = Convert.ToString(dataReader["City"]);
                                    string ContactImage = Convert.ToString(dataReader["ContactImage"]);
                                    this.AdditoinalInstrucitonTextBox.Text = string.Format(BankDetails);
                                    this.TextBoxInvoiceFooter.Text = string.Format(InvoiceFootertext);
                                    this.TextBoxInvoiceHeader.Text = string.Format(InvoiceHeadertext);
                                   // this.CompanyAddress.Text = string.Format(Company + "\n" + Address1 + "\n" + Address2 + "\n" + City + "\n" + PostCode + "\n");
                                    this.CompanyLogo.ImageUrl = ContactImage;

                                    string todayvalue = DateTime.Today.ToString("dd/M/yyyy");
                                    this.InvoiceDate.Text = todayvalue;
                                    this.InvoiceTitleTextBox.Text = "Hire & Additional Charges";

                                }

                            }




                        }
                    }
                }
            }

      
            if (Convert.ToString(Request.QueryString["InvoiceID"]) != null)
            {
                PanelInvoiceDetials.Visible = true;
                AddDocument.Visible = false;
                ShowInvoiceDetails.Visible = false;
                //AddTable.Visible = false;
                //ClaimTypeDropDown.Visible = false;
                //InvoiceTypeDropdown.Visible = false;
                //ContactDropDown.Visible = false;
                //TemplateTypeID.Visible = false;
                //ClaimtTypeLabel.Visible = false;
                //ClaimLabel.Visible = false;
                //ContactLabel.Visible = false;
                //InvoiceLabel.Visible = false;
                //ChooseClaim.Visible = false;
                //ContactLabel.Visible = false;
                //ContactTypeLabel.Visible = false;

                string InvoiceID = Convert.ToString(Request.QueryString["InvoiceID"]);
                InvoiceIDUpdate.Value = InvoiceID;
                if (!this.IsPostBack)
                {


                    try
                    {

                        using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                        {

                            cnn.Open();

                            using (SqlCommand Cmd = cnn.CreateCommand())
                            {

                                Cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

                                //string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
                                string sSQL = string.Format("Select * from Invoice where InvoiceID=@InvoiceID");
                                Cmd.CommandText = sSQL;



                                using (SqlDataReader Reader = Cmd.ExecuteReader())
                                {

                                    if (Reader.Read())
                                    {



                                        InvoiceTitleTextBox.Text = Convert.ToString(Reader["InvoiceTitle"]);
                                        TextBoxInvoiceHeader.Text = Convert.ToString(Reader["InvoiceHeader"]);
                                        AdditoinalInstrucitonTextBox.Text = Convert.ToString(Reader["AdditionalInstructions"]);
                                        ContactDetails.Text = Convert.ToString(Reader["ContactAddress"]);
                                        CompanyAddress.Text = Convert.ToString(Reader["CompanyAddressDetails"]);
                                        CompanyLogo.ImageUrl = Convert.ToString(Reader["Companylogo"]);
                                        InvoiceDate.Text = Convert.ToString(Reader["InvoiceDate"]);


                                      //  DropdownContact.Visible = false;
                                        //DropdownContactType.Visible = false;



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
        protected void AddInvoiceClick(object sender, EventArgs e)
        {
            ShowInvoiceDetails.Visible = false;

            double vatadminvalue = ((Site1)this.Master).VATVALUE;

            int ClaimID = Convert.ToInt32(Request.QueryString["ClaimID"]);

            string DriverLicenseNo = "";
            string LicenseIsseDate = "";
            string LicenseExpiryDate = "";
            string Category = "";
            string Identification = "";
            string PaymentRequestLetterStatus = "";


            int CareHireFormUpdateID = 0;
            string InvoiceIDValue = "";
            string FilePath = string.Empty;
            using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {

                conn.Open();
                using (SqlCommand cmd = conn.CreateCommand())
                {

                    cmd.Parameters.Clear();

                    cmd.CommandText = "delete from Invoice where ClaimID=@ClaimID and InvoiceType='HIRE INVOICE'";
                    cmd.Parameters.AddWithValue("ClaimID", ClaimID);

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        cmd.Parameters.Clear();
                    }



                    string extension = string.Empty;
                    string strFileName = string.Empty;

                    if (FileUpload1.HasFile)
                    {

                        HttpPostedFile PostedFile = FileUpload1.PostedFile;

                        int FileSizeKB = PostedFile.ContentLength / 1024;

                        extension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                        strFileName = System.IO.Path.GetFileNameWithoutExtension(FileUpload1.FileName).ToLower();

                        if ((extension != ".jpg" && extension != ".jpeg" && extension != ".gif" && extension != ".png") || (FileSizeKB > 500))
                        {
                            System.Text.StringBuilder stringBuilder = new System.Text.StringBuilder();

                            stringBuilder.Append("<span style=\"color:Red;font-weight:bold;font-size:14px;\">Invalid image format. Only jpeg,jpg,gif,png images are permited not more than 1024 KB</span>");
                            stringBuilder.Append(string.Format("<br/> <span style=\"color:Black;font-weight:bold;font-size:14px;\">File Extension : {0}", extension));
                            stringBuilder.Append(string.Format(" File Size:  {0}(KB):", FileSizeKB) + "</span><br/>");

                            Msg.InnerHtml = stringBuilder.ToString();

                            return;
                        }

                        FileUpload1.SaveAs(Server.MapPath("~/Images") + "/" + strFileName + extension);
                        FilePath = "Images" + "/" + strFileName + extension;

                    }

                    if (FilePath == "")
                    {

                        using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                        {

                            using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Contact WHERE ContactTypeID=12", sqlConnection))
                            {
                                sqlCommand.Connection.Open();


                                using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                                    if (dataReader.Read())
                                    {


                                        FilePath = Convert.ToString(dataReader["ContactImage"]);


                                    }


                                sqlCommand.Parameters.Clear();

                            }
                        }

                    }

                    int ContactID = 0;

                                 try
                {

                    using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                    {

                        using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * from PaymentRequstLetter where ClaimID=@ClaimID", sqlConnection))
                        {
                            sqlCommand.Connection.Open();

                            sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

                            using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                                if (dataReader.Read())
                                {
                                    PaymentRequestLetterStatus = Convert.ToString(dataReader["PaymentRequestLetterID"]);
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

                    try
                    {

                        using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                        {

                            using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Contact, ClaimContact WHERE ClaimContact.ClaimID=@ClaimID and ClaimContact.ContactTypeID=9 and Contact.ContactID=ClaimContact.ContactID", sqlConnection))
                            {
                                sqlCommand.Connection.Open();

                                sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

                                using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                                    if (dataReader.Read())
                                    {
                                        ContactID = Convert.ToInt32(dataReader["ContactID"]);
                                        ContactIDupdate.Value = Convert.ToString(dataReader["ContactID"]);
                                        DriverLicenseNo = Convert.ToString(dataReader["DriverLicenceNumber"]);
                                        LicenseIsseDate = Convert.ToString(dataReader["LicenceIssueDate"]);
                                        LicenseExpiryDate = Convert.ToString(dataReader["LicenceExpiryDate"]);
                                        Category = Convert.ToString(dataReader["LicenseCategory"]);
                                        Identification = Convert.ToString(dataReader["Identification1"]);
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
                    try
                    { 
                         cmd.CommandText = "delete from CarHireFormTable where ClaimID = @ClaimID";
                         cmd.Parameters.Clear();
                         cmd.Parameters.AddWithValue("ClaimID", ClaimID);

                    if (cmd.ExecuteNonQuery() > 0)
                    {
       
                        
                    }
                    
                    }

                    catch (Exception EXC1)

                        {
                            Console.WriteLine(EXC1.ToString());
                        }



                    string InvoiceTitle = Convert.ToString(InvoiceTitleTextBox.Text);
                    string InvoiceHeader = Convert.ToString(TextBoxInvoiceHeader.Text);
                    string AdditionalInstructions = Convert.ToString(AdditoinalInstrucitonTextBox.Text);

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("ContactID", ContactID);
                    cmd.Parameters.AddWithValue("ClaimID", ClaimID);
                    cmd.Parameters.AddWithValue("InvoiceTitle", InvoiceTitleTextBox.Text);
                    cmd.Parameters.AddWithValue("AdditionalInstructions", AdditionalInstructions);
                    cmd.Parameters.AddWithValue("InvoiceHeader", InvoiceHeader);
                    cmd.Parameters.AddWithValue("InvoiceType", "HIRE INVOICE");
                    cmd.Parameters.AddWithValue("InvoiceFootertext", TextBoxInvoiceFooter.Text);                    
                    cmd.Parameters.AddWithValue("InvoiceStatus", "Pending");
                    cmd.Parameters.AddWithValue("AmountPaid", 0);
                    cmd.Parameters.AddWithValue("GrandTotal", 0);
                    cmd.Parameters.AddWithValue("CompanyAddress", CompanyAddress.Text);
                    cmd.Parameters.AddWithValue("CompanyLogo", FilePath);
                    cmd.Parameters.AddWithValue("ContactAddress", ContactDetails.Text);


         
                    cmd.Parameters.AddWithValue("CompanyAddressDetails", CompanyAddress.Text);

                    //cmd.Parameters.AddWithValue("InvoiceHeaderImage", "Images/" + strFileName + extension);

                    cmd.CommandText = "INSERT into Invoice (InvoiceTitle,AdditionalInstructions,InvoiceHeader,InvoiceFootertext,ContactID,ClaimID,InvoiceType,InvoiceStatus, AmountPaid, GrandTotal,ContactAddress,CompanyAddressDetails,CompanyLogo) values(@InvoiceTitle,@AdditionalInstructions,@InvoiceHeader,@InvoiceFootertext,@ContactID,@ClaimID,@InvoiceType,@InvoiceStatus, @AmountPaid, @GrandTotal,@ContactAddress, @CompanyAddressDetails,@CompanyLogo)";


                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        //msg.InnerHtml = cmd.CommandText.ToString();
                        cmd.Parameters.Clear();
                        cmd.CommandText = "SELECT @@IDENTITY";

                        //// Get the last inserted id.
                        InvoiceIDUpdate.Value = Convert.ToString(cmd.ExecuteScalar());
                        InvoiceIDValue = Convert.ToString(cmd.ExecuteScalar());
                        PanelInvoiceDetials.Visible = true;
                        
                    }
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("ContactID", ContactID);
                    cmd.Parameters.AddWithValue("ClaimID", ClaimID);              
                    cmd.Parameters.AddWithValue("CompanyAddressDetails", CompanyAddress.Text);
                    cmd.Parameters.AddWithValue("CompanyLogo", FilePath);
                    cmd.Parameters.AddWithValue("ContactAddress", ContactDetails.Text);
                    cmd.Parameters.AddWithValue("DriverLicenseNo", DriverLicenseNo);
                    cmd.Parameters.AddWithValue("LicenseIsseDate", LicenseIsseDate);
                    cmd.Parameters.AddWithValue("LicenseExpiryDate", LicenseExpiryDate);
                    cmd.Parameters.AddWithValue("Category", Category);
                    cmd.Parameters.AddWithValue("Identification", Identification);

                    cmd.CommandText = "INSERT into CarHireFormTable (DriverLicenseNo,LicenseIsseDate,LicenseExpiryDate,Category,Identification,ClaimID,ContactAddress,ContactID,CompanyAddressDetails,CompanyLogo) values(@DriverLicenseNo,@LicenseIsseDate,@LicenseExpiryDate,@Category,@Identification,@ClaimID,@ContactAddress,@ContactID,@CompanyAddressDetails,@CompanyLogo)";

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        //msg.InnerHtml = cmd.CommandText.ToString();
                        cmd.Parameters.Clear();
                        cmd.CommandText = "SELECT @@IDENTITY";

                        //// Get the last inserted id.
                        CareHireFormUpdateHidden.Value = Convert.ToString(cmd.ExecuteScalar());
                        CareHireFormUpdateID = Convert.ToInt32(cmd.ExecuteScalar());

                        //Response.Redirect("NewCarhireInvoice.aspx?InvoiceID=" + InvoiceIDValue + "&ClaimID=" + ClaimID);
                        //Response.Redirect("NewCarhireInvoice.aspx?InvoiceID=" + InvoiceIDValue + "&ClaimID=" + ClaimID);
                    }               
             

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("ContactID", ContactID);
                    cmd.Parameters.AddWithValue("ClaimID", ClaimID);
               
                    if (PaymentRequestLetterStatus != "")
                    {
                        cmd.CommandText = "Update PaymentRequstLetter SET ContactID = @ContactID where ClaimID=@ClaimID";


                        if (cmd.ExecuteNonQuery() > 0)
                        {

                        
                            CareHireFormUpdateHidden.Value = PaymentRequestLetterStatus;
                            CareHireFormUpdateID = Convert.ToInt16(PaymentRequestLetterStatus);

                            Response.Redirect("NewCarhireInvoice.aspx?InvoiceID=" + InvoiceIDValue + "&ClaimID=" + ClaimID);



                        }

                    }
                    else
                    {

                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("ContactID", ContactID);
                        cmd.Parameters.AddWithValue("ClaimID", ClaimID);
                        cmd.Parameters.AddWithValue("EngineerFees", "0");


                        cmd.CommandText = "INSERT into PaymentRequstLetter(ContactID,ClaimID,EngineerFees) values(@ContactID,@ClaimID,@EngineerFees)";


                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            //msg.InnerHtml = cmd.CommandText.ToString();
                            cmd.Parameters.Clear();
                            cmd.CommandText = "SELECT @@IDENTITY";

                            //// Get the last inserted id.
                            CareHireFormUpdateHidden.Value = Convert.ToString(cmd.ExecuteScalar());
                            CareHireFormUpdateID = Convert.ToInt32(cmd.ExecuteScalar());

                            Response.Redirect("NewCarhireInvoice.aspx?InvoiceID=" + InvoiceIDValue + "&ClaimID=" + ClaimID);

                        }
                    
                    
                    }
                   
                   

            



                }
            }

        }

        protected void UpdateInvoice_Click(object sender, EventArgs e)
        {
            double TotalAdminFeesValue = 0.00;
            int InvoiceID = Convert.ToInt32(InvoiceIDUpdate.Value);

            string CarhireUpdateID = Convert.ToString(CareHireFormUpdateHidden.Value);

            string ClaimID = Convert.ToString(Request.QueryString["ClaimID"]);
            //if (InvoiceIDUpdate.Value != "")
            //{
            //    int InvoiceID = Convert.ToInt32(InvoiceIDUpdate.Value);
            //}
            //else
            //{
            //    Server.Transfer("ErrorHandler.aspx?Error=emptystring");

            //}
            //System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US"); 




            DateTime CarhireStartDateValue = new DateTime();

            CarhireStartDateValue = System.DateTime.ParseExact(CarhireStartDate.Text, @"dd/MM/yyyy", null);

            DateTime CarhireEndDateValue = new DateTime();

            CarhireEndDateValue = System.DateTime.ParseExact(CarhireEndDate.Text, @"dd/MM/yyyy", null);

            if (CarhireEndDateValue > CarhireStartDateValue)
            {


                TimeSpan dateDifference = CarhireEndDateValue.Subtract(CarhireStartDateValue);
                int NoOfDays = dateDifference.Days;


                //  string StorageCompanyValue = Convert.ToString(StorageCompany.SelectedItem.Text);


                // double GroupDailyRate = Convert.ToDouble(StorageDailyRate.Text);
                string VATRegistered = "";
                string VehicleID = "";
                string VehicleMake = "";
                string VehicleModel = "";
                string VehicleReg = "";
                string VehicleGroupTitle = "";
                string VehicleEngine = "";
                string Bodyshape = "";
                string VehicleTransmission = "";
                double HireCharges = 0.00;

                double AutomaticCharges = 0.00;
                double ControlVehiclesCharges = 0.00;
                double EstateVehiclesCharges = 0.00;
                double DeliveryChargesValue = 0.00;
                double AddtionalDriverCharges = 0.00;
                double BayseatCharges = 0.00;

                double GroupDailyRate = 0.00;
                double Amount = 0.00;
                double TotalAmount = 0.00;

                double GroupDailyRateContractual = 0.00;

                double VAT = 0.00;
                double vatadminvalue = ((Site1)this.Master).VATVALUE;



                // int VehicleId = 0;


  
                
                
                using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {


                    using (SqlCommand Cmd = cnn.CreateCommand())
                    {


                        //using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                        //{

                        //    using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Vehicle WHERE VehicleId=@VehicleId", sqlConnection))
                        //    {
                        //        sqlCommand.Connection.Open();

                        //        sqlCommand.Parameters.AddWithValue("Vehicle", VehicleDropDown.SelectedItem.Value);

                        //        using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                        //            if (dataReader.Read())
                        //            {


                        //                VehicleId = Convert.ToInt32(dataReader["VehicleId"]);


                        //            }


                        //        sqlCommand.Parameters.Clear();

                        //    }
                        //}





                        Cmd.Connection.Open();
                        Cmd.Parameters.AddWithValue("VehicleId", VehicleDropDown.SelectedItem.Value);

                        //string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
                        string sSQL = string.Format("Select * from Vehicle, VehicleGroup where Vehicle.VehicleId=@VehicleId and VehicleGroup.VehicleGroupId = Vehicle.VehicleGroupId");
                        Cmd.CommandText = sSQL;
                        using (SqlDataReader Reader = Cmd.ExecuteReader())
                        {


                            if (Reader.Read())
                            {

                                //	GroupDailyRate = Convert.ToInt32(Reader["GroupDailyRate"]);
                                VehicleMake = Convert.ToString(Reader["VehicleMake"]);
                                VehicleID = Convert.ToString(Reader["VehicleId"]);
                                VehicleModel = Convert.ToString(Reader["VehicleModel"]);
                                VehicleReg = Convert.ToString(Reader["VehicleReg"]);
                                VehicleReg = Convert.ToString(Reader["VehicleReg"]);
                                GroupDailyRate = Convert.ToDouble(Reader["GroupDailyRate"]);
                                VehicleGroupTitle = Convert.ToString(Reader["VehicleGroupTitle"]);
                                                               

                                VehicleEngine = Convert.ToString(Reader["VehicleEngine"]);

                                Bodyshape = Convert.ToString(Reader["Bodyshape"]);

                                VehicleTransmission = Convert.ToString(Reader["VehicleTransmission"]);

                                Amount = GroupDailyRate * NoOfDays;

                                double twenty2percent = Amount / 100 * 22.5;

                                TotalAmount = Amount + twenty2percent;

                                HireCharges = TotalAmount;

                                GroupDailyRateContractual = GroupDailyRate + GroupDailyRate / 100 * 22.5;

                                //VehicleAbiRate = Convert.ToInt32(Reader["AbiRate"]);
                                //Amount = GroupDailyRate * NoOfDays;
                                // Amount = Amount + Convert.ToDouble(RecoverChargesTextBox.Text);
                                //double Total = (Amount / 100) * vatadminvalue;

                                //ControlVehiclesDropDown

                                //DeliveryCharges

                                //AdminFees




                            }

                        }


                        using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                        {
                            using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT VATRegistered, Company, FirstName from Contact, ClaimContact, Claim where Contact.ContactID = ClaimContact.ContactID and ClaimContact.ClaimID = Claim.ClaimId and Claim.ClaimId= @ClaimID and Contact.ContactTypeID=4", sqlConnection))
                            {


                                sqlCommand.Connection.Open();
                                sqlCommand.Parameters.AddWithValue("ClaimID", Request.QueryString["ClaimId"]);

                                using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())
                                {
                                    if (dataReader.Read())
                                    {
                                        VATRegistered = Convert.ToString(dataReader["VATRegistered"]);

                                    }

                                }




                            }
                        }



                        using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                        {

                            conn.Open();
                            using (SqlCommand cmd = conn.CreateCommand())
                            {


                                System.Text.StringBuilder Details = new System.Text.StringBuilder();

                                Details.Append("Ref No: ");
                                Details.Append(ClaimID);
                                Details.Append("  ");
                                Details.Append("Rental of:");
                                Details.Append(" ");
                                Details.Append(VehicleMake);
                                Details.Append(" ");
                                Details.Append(VehicleModel);
                                Details.Append(", Reg No: ");
                                Details.Append(VehicleReg);
                                Details.Append(" from ");
                                Details.Append(CarhireStartDate.Text);
                                Details.Append(" - ");
                                Details.Append(CarhireEndDate.Text);
                                Details.Append(".");
                                //Details.Append(") Storage Location of Vehicle ");
                                //Details.Append(StorageCompanyValue);
                                Details.Append("ABI Group: ");
                                Details.Append(VehicleGroupTitle);

                                string Details1 = Convert.ToString(Details);

                                cmd.Parameters.AddWithValue("Details", Details1);
                                cmd.Parameters.AddWithValue("Rate", GroupDailyRateContractual);
                                cmd.Parameters.AddWithValue("Amount", TotalAmount);
                                cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);
                                cmd.Parameters.AddWithValue("NoOfDays", NoOfDays);
                                cmd.Parameters.AddWithValue("VehicleReg", VehicleReg);
                                cmd.Parameters.AddWithValue("VehicleID", VehicleID);

                                

                                //   EstateVehiclesDropDown = Convert.ToString(EstateVehiclesDropDown.SelectedItem.Value);

                                cmd.CommandText = "INSERT into InvoiceDetails (Details,Rate,NoOfDays,Amount,VehicleReg, InvoiceID,VehicleID) values(@Details,@Rate,@NoOfDays, @Amount,@VehicleReg,@InvoiceID,@VehicleID)";

                                if (cmd.ExecuteNonQuery() > 0)
                                {
                                    //msg.InnerHtml = cmd.CommandText.ToString();
                                    cmd.Parameters.Clear();

                                }
                                cmd.Parameters.AddWithValue("HireStartDate", Convert.ToDateTime(CarhireStartDate.Text));
                                cmd.Parameters.AddWithValue("HireEndDate", Convert.ToDateTime(CarhireEndDate.Text));
                                cmd.Parameters.AddWithValue("HireNoOfDays", Convert.ToString(NoOfDays));
                                cmd.Parameters.AddWithValue("ClaimID", ClaimID);

                                cmd.CommandText = "Update LossOfUseDate SET HireStartDate=@HireStartDate,HireEndDate=@HireEndDate,HireNoOfDays=@HireNoOfDays where ClaimID=@ClaimID";

                                if (cmd.ExecuteNonQuery() > 0)
                                {
                                    //msg.InnerHtml = cmd.CommandText.ToString();
                                    cmd.Parameters.Clear();

                                }


                                if (BabySeatsDropDown.SelectedItem.Value == "Yes")
                                {


                                    string Details3 = "Baby Seat or Tow Bar ";



                                    double Amount3 = NoOfDays * 5.00;


                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("Details", Details3);
                                    cmd.Parameters.AddWithValue("NoOfDays", NoOfDays);
                                    cmd.Parameters.AddWithValue("Rate", "5");
                                    cmd.Parameters.AddWithValue("Amount", Amount3);
                                    cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);


                                    BayseatCharges = Amount3;

                                    TotalAmount = TotalAmount + BayseatCharges;

                                    //ControlVehiclesDropDown


                                    cmd.CommandText = "INSERT into InvoiceDetails (Details,NoOfDays,Rate,Amount,InvoiceID) values(@Details,@NoOfDays,@Rate,@Amount,@InvoiceID)";

                                    PanelInvoiceDetials.Visible = true;

                                    if (cmd.ExecuteNonQuery() > 0)
                                    {

                                    }


                                }
                                if (AutomaticDropDown1.SelectedItem.Value == "Yes")
                                {


                                    string Details3 = "Automatic";



                                    double Amount3 = NoOfDays * 5.00;


                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("Details", Details3);
                                    cmd.Parameters.AddWithValue("NoOfDays", NoOfDays);
                                    cmd.Parameters.AddWithValue("Rate", "5");
                                    cmd.Parameters.AddWithValue("Amount", Amount3);
                                    cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);


                                    AutomaticCharges = Amount3;

                                    TotalAmount = TotalAmount + AutomaticCharges;

                                    //ControlVehiclesDropDown


                                    cmd.CommandText = "INSERT into InvoiceDetails (Details,NoOfDays,Rate,Amount,InvoiceID) values(@Details,@NoOfDays,@Rate,@Amount,@InvoiceID)";

                                    PanelInvoiceDetials.Visible = true;

                                    if (cmd.ExecuteNonQuery() > 0)
                                    {

                                    }


                                }

                                if (EstateVehiclesDropDown.SelectedItem.Value == "Yes")
                                {


                                    string Details3 = "Estate Vehicle Charge ";



                                    double Amount3 = NoOfDays * 5.00;


                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("Details", Details3);
                                    cmd.Parameters.AddWithValue("NoOfDays", NoOfDays);
                                    cmd.Parameters.AddWithValue("Rate", "5");
                                    cmd.Parameters.AddWithValue("Amount", Amount3);
                                    cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

                                    EstateVehiclesCharges = Amount3;

                                    TotalAmount = TotalAmount + EstateVehiclesCharges;
                                    cmd.CommandText = "INSERT into InvoiceDetails (Details,NoOfDays,Rate,Amount,InvoiceID) values(@Details,@NoOfDays,@Rate,@Amount,@InvoiceID)";

                                    PanelInvoiceDetials.Visible = true;

                                    if (cmd.ExecuteNonQuery() > 0)
                                    {

                                    }


                                }


                                if (ControlVehiclesDropDown.SelectedItem.Value == "Yes")
                                {


                                    string Details3 = "Control Vehile Charge ";



                                    double Amount3 = NoOfDays * 5.00;


                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("Details", Details3);
                                    cmd.Parameters.AddWithValue("NoOfDays", NoOfDays);
                                    cmd.Parameters.AddWithValue("Rate", "5");
                                    cmd.Parameters.AddWithValue("Amount", Amount3);
                                    cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

                                    ControlVehiclesCharges = Amount3;

                                    TotalAmount = TotalAmount + ControlVehiclesCharges;

                                    cmd.CommandText = "INSERT into InvoiceDetails (Details,NoOfDays,Rate,Amount,InvoiceID) values(@Details,@NoOfDays,@Rate,@Amount,@InvoiceID)";

                                    PanelInvoiceDetials.Visible = true;

                                    if (cmd.ExecuteNonQuery() > 0)
                                    {

                                    }


                                }



                                if (DeliveryCharges.Text != null)
                                {


                                    string Details3 = "Delivery & Collection Charges ";



                                    double Amount4 = Convert.ToDouble(DeliveryCharges.Text);


                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("Details", Details3);
                                    cmd.Parameters.AddWithValue("NoOfDays", "");
                                    cmd.Parameters.AddWithValue("Rate", "");
                                    cmd.Parameters.AddWithValue("Amount", Amount4);
                                    cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

                                    DeliveryChargesValue = Amount4;

                                    TotalAmount = TotalAmount + DeliveryChargesValue;
                                    cmd.CommandText = "INSERT into InvoiceDetails (Details,NoOfDays,Rate,Amount,InvoiceID) values(@Details,@NoOfDays,@Rate,@Amount,@InvoiceID)";

                                    PanelInvoiceDetials.Visible = true;

                                    if (cmd.ExecuteNonQuery() > 0)
                                    {

                                    }


                                }

                                if (AdditionalDriverDropDown.SelectedItem.Value == "Yes")
                                {


                                    string Details3 = "Additonal Driver Charges ";



                                    double Amount3 = NoOfDays * 5.00;


                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("Details", Details3);
                                    cmd.Parameters.AddWithValue("NoOfDays", NoOfDays);
                                    cmd.Parameters.AddWithValue("Rate", "5");
                                    cmd.Parameters.AddWithValue("Amount", Amount3);
                                    cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

                                    AddtionalDriverCharges = Amount3;

                                    TotalAmount = TotalAmount + AddtionalDriverCharges;

                                    cmd.CommandText = "INSERT into InvoiceDetails (Details,NoOfDays,Rate,Amount,InvoiceID) values(@Details,@NoOfDays,@Rate,@Amount,@InvoiceID)";

                                    PanelInvoiceDetials.Visible = true;

                                    if (cmd.ExecuteNonQuery() > 0)
                                    {

                                    }




                                }


                                string Details5 = "Admin Fee";

                                TotalAdminFeesValue = Convert.ToDouble(AdminFees.Text);
                                TotalAmount = TotalAmount + TotalAdminFeesValue;


                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("Details", Details5);
                                cmd.Parameters.AddWithValue("NoOfDays", "");
                                cmd.Parameters.AddWithValue("Rate", "");
                                cmd.Parameters.AddWithValue("Amount", TotalAdminFeesValue);
                                cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);


                                cmd.CommandText = "INSERT into InvoiceDetails (Details,NoOfDays,Rate,Amount,InvoiceID) values(@Details,@NoOfDays,@Rate,@Amount,@InvoiceID)";

                                PanelInvoiceDetials.Visible = true;

                                if (cmd.ExecuteNonQuery() > 0)
                                {

                                }


                                if (VATRegistered == "Yes")
                                {

                                    VAT = (TotalAmount / 100) * vatadminvalue;

                                }
                                else
                                {

                                    VAT = 0;

                                }

                                cmd.Parameters.Clear();

                                cmd.Parameters.AddWithValue("ClaimID", ClaimID);
                                cmd.Parameters.AddWithValue("VehicleReg", VehicleReg);
                                cmd.Parameters.AddWithValue("VehicleMake", VehicleMake);
                                cmd.Parameters.AddWithValue("VehicleModel", VehicleModel);
                                cmd.Parameters.AddWithValue("VehicleEngine", VehicleEngine);
                                cmd.Parameters.AddWithValue("VehicleTransmission", VehicleTransmission);
                                cmd.Parameters.AddWithValue("Bodyshape", Bodyshape);
                                cmd.Parameters.AddWithValue("DateTimeOut", CarhireStartDateValue);
                                cmd.Parameters.AddWithValue("DateTimeBack", CarhireEndDateValue);
                                cmd.Parameters.AddWithValue("VehicleRate", GroupDailyRate);
                                cmd.Parameters.AddWithValue("NumberOfDays", NoOfDays);
                                cmd.Parameters.AddWithValue("DeliveryCollectionCharges", DeliveryCharges.Text);
                                cmd.Parameters.AddWithValue("EstateVehicle", EstateVehiclesCharges);
                                cmd.Parameters.AddWithValue("ControlVehicle", ControlVehiclesCharges);

                                cmd.Parameters.AddWithValue("TowBarsBabySeats", BayseatCharges);

                                cmd.Parameters.AddWithValue("AddtionalDriver", AddtionalDriverCharges);
                                cmd.Parameters.AddWithValue("Automatic", AutomaticCharges);
                                cmd.Parameters.AddWithValue("AdminFees", AdminFees.Text);
                                cmd.Parameters.AddWithValue("Total", TotalAmount);
                                cmd.Parameters.AddWithValue("TotalVAt", VAT);
                                cmd.Parameters.AddWithValue("HireCharges", HireCharges);

                                TotalAdminFeesValue = Convert.ToDouble(AdminFees.Text);

                                cmd.CommandText = "update CarHireFormTable SET Automatic=@Automatic, VehicleReg = @VehicleReg,VehicleMake=@VehicleMake,VehicleModel=@VehicleModel,VehicleEngine=@VehicleEngine,VehicleTransmission=@VehicleTransmission,Bodyshape=@Bodyshape,DateTimeOut=@DateTimeOut,DateTimeBack=@DateTimeBack,VehicleRate=@VehicleRate,NumberOfDays=@NumberOfDays,DeliveryCollectionCharges=@DeliveryCollectionCharges,EstateVehicle=@EstateVehicle,ControlVehicle=@ControlVehicle,TowBarsBabySeats=@TowBarsBabySeats,AddtionalDriver=@AddtionalDriver,AdminFees=@AdminFees,Total=@Total,TotalVAt=@TotalVAt,HireCharges=@HireCharges where ClaimID=@ClaimID";
                                //cmd.CommandText ="INSERT into CarHireFormTable (ClaimID,ContactID,CompanyAddressDetails,CompanyLogo,ContactAddress,ContactDateofBirth,ContactCompanyName,PermanantLicenseAddress,DriverLicenseNo,LicenseIsseDate,LicenseExpiryDate,Category,Identification,VehicleReg,VehicleMake,VehicleModel,VehicleEngine,VehicleTransmission,Bodyshape,DateTimeBack,VehicleRate,NumberOfDays,DeliveryCollectionCharges,EstateVehicle,ControlVehicle,TowBarsBabySeats,AddtionalDriver,AdminFees,Total,TotalVAt,HireCharges,SignatureImage,ExtraImage)values(@ClaimID,@ContactID,@CompanyAddressDetails,@CompanyLogo,@ContactAddress,@ContactDateofBirth,@ContactCompanyName,@PermanantLicenseAddress,@DriverLicenseNo,@LicenseIsseDate,@LicenseExpiryDate,@Category,@Identification,@VehicleReg,@VehicleMake,@VehicleModel,@VehicleEngine,@VehicleTransmission,@Bodyshape,@DateTimeBack,@VehicleRate,@NumberOfDays,@DeliveryCollectionCharges,@EstateVehicle,@ControlVehicle,@TowBarsBabySeats,@AddtionalDriver,@AdminFees,@Total,@TotalVAt,@HireCharges,@SignatureImage,@ExtraImage)";

                                if (cmd.ExecuteNonQuery() > 0)
                                {
                                    //msg.InnerHtml = cmd.CommandText.ToString();
                                    // cmd.Parameters.Clear();


                                }



                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("AdditonalDriverCost", AddtionalDriverCharges);

                                cmd.Parameters.AddWithValue("Automatic", AutomaticCharges);

                                cmd.Parameters.AddWithValue("TowBars", BayseatCharges);
                                cmd.Parameters.AddWithValue("ClaimID", ClaimID);

                                cmd.Parameters.AddWithValue("EstateVehicle", EstateVehiclesCharges);
                                cmd.Parameters.AddWithValue("ControlVehicles", ControlVehiclesCharges);
                                cmd.Parameters.AddWithValue("HireCost", HireCharges);
                                cmd.Parameters.AddWithValue("ABIHandleingFees", AdminFees.Text);
                                cmd.Parameters.AddWithValue("Total", TotalAmount);
                                cmd.Parameters.AddWithValue("TotalVAT", VAT);
                                cmd.Parameters.AddWithValue("GrandTotal", TotalAmount);

                                cmd.Parameters.AddWithValue("CarhireStartDateValue", CarhireStartDateValue);
                                cmd.Parameters.AddWithValue("CarhireEndDateValue", CarhireEndDateValue);
                                cmd.Parameters.AddWithValue("NoOfDays", NoOfDays);
                                cmd.Parameters.AddWithValue("GroupDailyRate", GroupDailyRate);
                                cmd.Parameters.AddWithValue("DeliveryCharges", DeliveryCharges.Text);
                                //cmd.Parameters.AddWithValue("EngineerFees", 0);
                                //cmd.Parameters.AddWithValue("StorageRecoveryCharges", 0);
                                cmd.Parameters.AddWithValue("AdminFees", 0);
                                cmd.Parameters.AddWithValue("HireCharges", 0);



                                cmd.CommandText = "Update PaymentRequstLetter SET AdditonalDriverCost=@AdditonalDriverCost,Automatic=@Automatic,TowBars=@TowBars,EstateVehicle=@EstateVehicle,HireCost=@HireCost,ABIHandleingFees=@ABIHandleingFees,Total=@Total,TotalVAT=@TotalVAT,ControlVehicles=@ControlVehicles,GrandTotal=@GrandTotal,CarhireStartDateValue=@CarhireStartDateValue,CarhireEndDateValue=@CarhireEndDateValue,NoOfDays=@NoOfDays,GroupDailyRate=@GroupDailyRate,AdminFees=@AdminFees, HireCharges=@HireCharges, DeliveryCharges=@DeliveryCharges where ClaimID=@ClaimID";

                                //cmd.CommandText ="INSERT into CarHireFormTable (ClaimID,ContactID,CompanyAddressDetails,CompanyLogo,ContactAddress,ContactDateofBirth,ContactCompanyName,PermanantLicenseAddress,DriverLicenseNo,LicenseIsseDate,LicenseExpiryDate,Category,Identification,VehicleReg,VehicleMake,VehicleModel,VehicleEngine,VehicleTransmission,Bodyshape,DateTimeBack,VehicleRate,NumberOfDays,DeliveryCollectionCharges,EstateVehicle,ControlVehicle,TowBarsBabySeats,AddtionalDriver,AdminFees,Total,TotalVAt,HireCharges,SignatureImage,ExtraImage)values(@ClaimID,@ContactID,@CompanyAddressDetails,@CompanyLogo,@ContactAddress,@ContactDateofBirth,@ContactCompanyName,@PermanantLicenseAddress,@DriverLicenseNo,@LicenseIsseDate,@LicenseExpiryDate,@Category,@Identification,@VehicleReg,@VehicleMake,@VehicleModel,@VehicleEngine,@VehicleTransmission,@Bodyshape,@DateTimeBack,@VehicleRate,@NumberOfDays,@DeliveryCollectionCharges,@EstateVehicle,@ControlVehicle,@TowBarsBabySeats,@AddtionalDriver,@AdminFees,@Total,@TotalVAt,@HireCharges,@SignatureImage,@ExtraImage)";

                                if (cmd.ExecuteNonQuery() > 0)
                                {
                                    //msg.InnerHtml = cmd.CommandText.ToString();
                                    // cmd.Parameters.Clear();
                                    
                                }
                            }


                        }

                        InvoiceIDUpdate.Value = Convert.ToString(InvoiceID);
                        //  GridView1.EditIndex = 0;
                        // GridView1.DataBind();
                        //double TotalAmount = 0;
                        //double VAT = 0;
                        //double AmountDue = 0;
                        //double GrandTotal = 0;
                        //  int InvoiceID = Convert.ToInt32(InvoiceIDUpdate.Value);



                        //cmd.Connection.Open();
                        //cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);
                        //using (System.Data.IDataReader dataReader = cmd.ExecuteReader())
                        //{
                        //    while (dataReader.Read())
                        //    {
                        //        TotalAmount = TotalAmount + Convert.ToInt32(dataReader["Amount"]);
                        //    }
                        //    VAT = (TotalAmount / 100) * vatadminvalue;
                        //    AmountDue = TotalAmount + VAT;
                        //    GrandTotal = TotalAmount + VAT;


                        //}

                        //vatadminvalue = ((Site1)this.Master).VATVALUE;

                    
                        double AmountDue = TotalAmount + VAT;
                        double GrandTotal = TotalAmount + VAT;


                        using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                        {
                            conn.Open();
                            using (SqlCommand cmd = conn.CreateCommand())
                            {

                                cmd.CommandType = CommandType.Text;
                                cmd.Parameters.Clear();

                                cmd.Parameters.AddWithValue("TotalAmount", TotalAmount);
                                cmd.Parameters.AddWithValue("TotalVAt", VAT);
                                cmd.Parameters.AddWithValue("AmountDue", AmountDue);
                                cmd.Parameters.AddWithValue("GrandTotal", GrandTotal);
                                cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);
                                cmd.Parameters.AddWithValue("InvoiceDate", CarhireEndDateValue);
                                cmd.Parameters.AddWithValue("VATRATE", vatadminvalue);



                                cmd.CommandText = "Update Invoice SET TotalAmount=@TotalAmount ,InvoiceDate=@InvoiceDate, AmountDue=@AmountDue, TotalVAt=@TotalVAt, GrandTotal = @GrandTotal, VATRATE=@VATRATE where InvoiceID=@InvoiceID";

                                if (cmd.ExecuteNonQuery() > 0)
                                {


                                }



                                cmd.Parameters.Clear();

                                cmd.Parameters.AddWithValue("HireCharges", TotalAmount);
                                cmd.Parameters.AddWithValue("TotalVAt", VAT);
                                cmd.Parameters.AddWithValue("Total", GrandTotal);
                                cmd.Parameters.AddWithValue("ClaimID", ClaimID);


                                cmd.CommandText = "Update CarhireFormTable SET  TotalVAt=@TotalVAt, Total = @Total, HireCharges=@HireCharges where ClaimID=@ClaimID";

                                if (cmd.ExecuteNonQuery() > 0)
                                {
                                    Response.Redirect("~/AddClaim.aspx?ClaimId=" + ClaimID);

                                }




                            }





                        }








                    }
                }

            }
            else

            {


                Msg.InnerHtml = "Error : End date must me after than start date";
                    
            
            
            }
        }
        protected void DropdownContactType_SelectedIndexChanged(object sender, EventArgs e)
        {




        }

        protected void DropdownContact_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {
                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Contact WHERE ContactID = @ContactID", sqlConnection))
                {


                    sqlCommand.Connection.Open();
                    //sqlCommand.Parameters.AddWithValue("ContactID", this.DropdownContact.SelectedValue);

                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())
                    {
                        if (dataReader.Read())
                        {

                            string FirstName = Convert.ToString(dataReader["FirstName"]);
                            string Surname = Convert.ToString(dataReader["Surname"]);
                            string Company = Convert.ToString(dataReader["Company"]);
                            string Address1 = Convert.ToString(dataReader["Address1"]);
                            string Address2 = Convert.ToString(dataReader["Address2"]);
                            string City = Convert.ToString(dataReader["City"]);
                            string PostCode = Convert.ToString(dataReader["PostCode"]);
                            ////this.ContactDetails.Text = Convert.ToString(dataReader["Country"]);

                            this.ContactDetails.Text = string.Format(FirstName + "  " + Surname + "\n" + Company
                                                                      + Address1 + "\n" + Address2 + "\n" + City + "  " + PostCode);



                        }

                    }




                }
            }


        }

        protected void SqlDataSourceContacts_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            // DropdownContact.Items.Insert(0, new ListItem("Select ", "0"));    
        }

        protected void SqlsourceDropdown_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {

        }

        protected void SqlsourceDropdown_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void DropdownCar_DataBound(object sender, EventArgs e)
        {

            VehicleDropDown.Items.Insert(0, new ListItem("Choose Vehicle ", "-1"));

        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NewCarhireInvoice.aspx?action=NewInvoice&ClaimId=" + Request.QueryString["ClaimID"]);
        }
   
        protected void CancelButton_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/AddClaim.aspx?ClaimId=" + Request.QueryString["ClaimID"]);
        }

        protected void SqlDataSourceContacts_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            //DropdownContact.Items.Insert(0, new ListItem("Select ", "0")); 
        }

        //protected void DropdownContact_DataBound(object sender, EventArgs e)
        //{

        //    /DropdownContact.Items.Insert(0, new ListItem("Select Contact ", "0"));

        //}

        //protected void DropdownContactType_DataBound(object sender, EventArgs e)
        //{

        //    DropdownContactType.Items.Insert(0, new ListItem("Select Contact Type ", "0"));

        //}

        protected void VehicleDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowVhicleDetails.Visible = true;

            string VehicleMake = "";
            string VehicleModel = "";
            string VehicleReg = "";
            string VehicleGroupTitle = "";

           string VehicleId =  VehicleDropDown.SelectedItem.Value;
            string Vehicle = VehicleDropDown.SelectedItem.Value;
           
            using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {
                cnn.Open();
                using (SqlCommand Cmd = cnn.CreateCommand())
                {

                    using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                    {
                        Cmd.Parameters.AddWithValue("VehicleID", VehicleId);
                        string sSQL = string.Format("Select * from Vehicle, VehicleGroup  where VehicleGroup.VehicleGroupID = Vehicle.VehicleGroupID and vehicleId=@VehicleId");
                        Cmd.CommandText = sSQL;

                        using (SqlDataReader Reader = Cmd.ExecuteReader())
                        {

                            if (Reader.Read())
                            {

                               
                                VehicleMake = Convert.ToString(Reader["VehicleMake"]);
                                VehicleModel = Convert.ToString(Reader["VehicleModel"]);
                                VehicleReg = Convert.ToString(Reader["VehicleReg"]);

                                VehicleGroupTitle = Convert.ToString(Reader["VehicleGroupTitle"]);



                                ShowVhicleDetails.InnerHtml = string.Format("<br/>" + "Vehicle Make: " + VehicleMake + " - Vehicle Model: " + VehicleModel + " - Vehicle Reg: " + VehicleReg + " - Vehicle Group  " + VehicleGroupTitle);


                            }

                        }




                    }
                }
            }
           
        }
    }
}
