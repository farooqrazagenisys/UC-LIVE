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
    public partial class NewStorageInvoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string VehicleMake = "";
            string VehicleModel = "";
            string VehileReg = "";
            
            if (Convert.ToString(Request.QueryString["action"]) == "NewInvoice")
            {
                if (!this.IsPostBack)
                {

                    if (Convert.ToString(Request.QueryString["ClaimID"]) != null)
                    {

                        string ClaimID = Convert.ToString(Request.QueryString["ClaimID"]);
                        this.ClaimIDHiddenField.Value = ClaimID;

                    }
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
                        //using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Contact WHERE ContactTypeID = 12", sqlConnection))
                        //{
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
                                    this.InvoiceTitleTextBox.Text = "Storage & Recovery Charges";

                                }

                            }




                        }
                    }
                }
            }

            ShowInvoiceDetails.Visible = true;
            InvoiceIDUpdate.Value = "";

            if (Convert.ToString(Request.QueryString["InvoiceID"]) != null)
            {
                PanelInvoiceDetials.Visible = true;

                ///////////////////////

            int VehicleId = 0;

            using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {


                using (SqlCommand Cmd = cnn.CreateCommand())
                {


                    using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                    {

                        using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Vehicle WHERE ClaimID=@ClaimID", sqlConnection))
                        {
                            sqlCommand.Connection.Open();

                            sqlCommand.Parameters.AddWithValue("ClaimID", Request.QueryString["ClaimID"]);

                            using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                                if (dataReader.Read())
                                {


                                    VehicleId = Convert.ToInt32(dataReader["VehicleId"]);
                                    VehicleMakeTextBox.Text = Convert.ToString(dataReader["VehicleMake"]);
                                    VehicleModelTextBox.Text = Convert.ToString(dataReader["VehicleModel"]);
                                    VehcileRegTextBox.Text = Convert.ToString(dataReader["VehicleReg"]);
                     

                                }


                            sqlCommand.Parameters.Clear();

                        }
                    }
                }
            }

                /////////////




                ShowInvoiceDetails.Visible = false;
       





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
                                      //  DropdownContactType.Visible = false;

                    

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

            string FilePath = string.Empty;
            using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {

                conn.Open();
                using (SqlCommand cmd = conn.CreateCommand())
                {
             
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

                    if(FilePath == "")

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

                    int ClaimID = Convert.ToInt32(Request.QueryString["ClaimID"]);
                    int ContactID = 0;

                    try
                    {

                        using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                        {

                            using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM ClaimContact WHERE ClaimID=@ClaimID and ContactTypeID=9", sqlConnection))
                            {
                                sqlCommand.Connection.Open();

                                sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

                                using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                                    if (dataReader.Read())
                                    {


                                        ContactID = Convert.ToInt32(dataReader["ContactID"]);


                                    }


                                sqlCommand.Parameters.Clear();

                                sqlCommand.CommandText = "delete from Invoice where ClaimID=@ClaimID and InvoiceType='STORAGE INVOICE'";
                    sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

                    if (sqlCommand.ExecuteNonQuery() > 0)
                    {
                        sqlCommand.Parameters.Clear();
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



            
                    string InvoiceTitle = Convert.ToString(InvoiceTitleTextBox.Text);
                    string InvoiceHeader = Convert.ToString(TextBoxInvoiceHeader.Text);
                    string AdditionalInstructions = Convert.ToString(AdditoinalInstrucitonTextBox.Text);
                    
                    cmd.Parameters.AddWithValue("ContactID", ContactID);
                    cmd.Parameters.AddWithValue("ClaimID", ClaimID);
                    cmd.Parameters.AddWithValue("InvoiceTitle", InvoiceTitleTextBox.Text);
                    cmd.Parameters.AddWithValue("AdditionalInstructions", AdditionalInstructions);
                    cmd.Parameters.AddWithValue("InvoiceHeader", InvoiceHeader);
                    cmd.Parameters.AddWithValue("InvoiceType", "STORAGE INVOICE");
                    cmd.Parameters.AddWithValue("InvoiceStatus", "Pending");
                    cmd.Parameters.AddWithValue("AmountPaid", 0);
                    cmd.Parameters.AddWithValue("GrandTotal", 0);
                    cmd.Parameters.AddWithValue("CompanyAddress", CompanyAddress.Text);
                    cmd.Parameters.AddWithValue("CompanyLogo", FilePath);     
                    cmd.Parameters.AddWithValue("ContactAddress", ContactDetails.Text);
                    cmd.Parameters.AddWithValue("InvoiceDate", ContactDetails.Text);

                    cmd.Parameters.AddWithValue("CompanyAddressDetails", CompanyAddress.Text);

                    cmd.Parameters.AddWithValue("InvoiceFootertext", TextBoxInvoiceFooter.Text);      

                    //cmd.Parameters.AddWithValue("InvoiceHeaderImage", "Images/" + strFileName + extension);

                    cmd.CommandText = "INSERT into Invoice (InvoiceTitle,AdditionalInstructions,InvoiceHeader,InvoiceFootertext,ContactID,ClaimID,InvoiceType,InvoiceStatus, AmountPaid, GrandTotal,ContactAddress,CompanyAddressDetails,CompanyLogo) values(@InvoiceTitle,@AdditionalInstructions,@InvoiceHeader,@InvoiceFootertext,@ContactID,@ClaimID,@InvoiceType,@InvoiceStatus, @AmountPaid, @GrandTotal,@ContactAddress, @CompanyAddressDetails,@CompanyLogo)";


                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        //msg.InnerHtml = cmd.CommandText.ToString();
                        cmd.Parameters.Clear();
                        cmd.CommandText = "SELECT @@IDENTITY";

                        //// Get the last inserted id.
                        InvoiceIDUpdate.Value = Convert.ToString(cmd.ExecuteScalar());
                        string InvoiceIDValue = Convert.ToString(cmd.ExecuteScalar());
                        PanelInvoiceDetials.Visible = true;
                        Response.Redirect("NewStorageInvoice.aspx?InvoiceID=" + InvoiceIDValue + "&ClaimID=" + ClaimID);

                    }

                }
            }

        }

        protected void UpdateInvoice_Click(object sender, EventArgs e)
        {

            int InvoiceID = Convert.ToInt32(InvoiceIDUpdate.Value);

            double vatadminvalue = ((Site1)this.Master).VATVALUE;

            int ClaimID = Convert.ToInt32(Request.QueryString["ClaimID"]);





            //if (InvoiceIDUpdate.Value != "")
            //{
            //    int InvoiceID = Convert.ToInt32(InvoiceIDUpdate.Value);
            //}
            //else
            //{
            //    Server.Transfer("ErrorHandler.aspx?Error=emptystring");

            //}
            //System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US"); 

            DateTime StorageStartDateValue = new DateTime();

            StorageStartDateValue = System.DateTime.ParseExact(StorageStartDate.Text, @"dd/MM/yyyy", null);

            DateTime StorageEndDateValue = new DateTime();

            StorageEndDateValue = System.DateTime.ParseExact(StorageEndDate.Text, @"dd/MM/yyyy", null);

            if (Convert.ToString(VehcileRegTextBox.Text) == "")
            {
                Msg.InnerHtml = "Error : Cannot generate invoice due to insufficient information";

            }

            else
            {

                if (StorageEndDateValue > StorageStartDateValue)
                {


                    TimeSpan dateDifference = StorageEndDateValue.Subtract(StorageStartDateValue);
                    int NoOfDays = dateDifference.Days;






                    //  string StorageCompanyValue = Convert.ToString(StorageCompany.SelectedItem.Text);


                    double GroupDailyRate = Convert.ToDouble(StorageDailyRate.Text);
                    string VehicleMake = "";
                    string VehicleModel = "";
                    string VehicleReg = "";
                    double Amount = 0;
                    int VehicleId = 0;

                    using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                    {


                        using (SqlCommand Cmd = cnn.CreateCommand())
                        {


                            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                            {

                                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Vehicle WHERE ClaimID=@ClaimID", sqlConnection))
                                {
                                    sqlCommand.Connection.Open();

                                    sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

                                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                                        if (dataReader.Read())
                                        {


                                            VehicleId = Convert.ToInt32(dataReader["VehicleId"]);


                                        }


                                    sqlCommand.Parameters.Clear();

                                }
                            }

                            Amount = Convert.ToDouble(StorageDailyRate.Text) * NoOfDays;
                            double StorageCharges = Amount;
                            Amount = Amount + Convert.ToDouble(RecoverChargesTextBox.Text);




                            // double Total = (Amount / 100) * vatadminvalue;



                            using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                            {

                                conn.Open();
                                using (SqlCommand cmd = conn.CreateCommand())
                                {


                                    System.Text.StringBuilder Details = new System.Text.StringBuilder();

                                    Details.Append("Storage of ");
                                    Details.Append(VehicleMakeTextBox.Text);
                                    Details.Append(" ");
                                    Details.Append(VehicleModelTextBox.Text);
                                    Details.Append(", Reg: ");
                                    Details.Append(VehcileRegTextBox.Text);
                                    Details.Append(" from ");
                                    Details.Append(StorageStartDate.Text);
                                    Details.Append(" - ");
                                    Details.Append(StorageEndDate.Text);
                                    Details.Append(". ");
                                    Details.Append("Storage Location: ");
                                    Details.Append(StorageLocation.Text);



                                    //Details.Append(")                 Storage Location of Vehicle ");
                                    //Details.Append(StorageCompanyValue);


                                    string Details1 = Convert.ToString(Details);

                                    cmd.Parameters.AddWithValue("Details", Details1);
                                    cmd.Parameters.AddWithValue("Rate", StorageDailyRate.Text);
                                    cmd.Parameters.AddWithValue("Amount", StorageCharges);
                                    cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);
                                    cmd.Parameters.AddWithValue("NoOfDays", NoOfDays);

                                    cmd.CommandText = "INSERT into InvoiceDetails (Details,Rate,NoOfDays,Amount,InvoiceID) values(@Details,@Rate,@NoOfDays,@Amount,@InvoiceID)";

                                    if (cmd.ExecuteNonQuery() > 0)
                                    {
                                        //msg.InnerHtml = cmd.CommandText.ToString();
                                        cmd.Parameters.Clear();


                                    }


                                    System.Text.StringBuilder RecoveryDetails = new System.Text.StringBuilder();

                                    RecoveryDetails.Append("Recovery of Vehicle: ");
                                    RecoveryDetails.Append(RecoveryFrom.Text);
                                 

                                    string Details2 = Convert.ToString(RecoveryDetails);
                                    cmd.Parameters.AddWithValue("Details", Details2);
                                    cmd.Parameters.AddWithValue("Rate", " ");
                                    cmd.Parameters.AddWithValue("Amount", RecoverChargesTextBox.Text);
                                    cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);
                                    cmd.Parameters.AddWithValue("NoOfDays", " ");



                                    cmd.CommandText = "INSERT into InvoiceDetails (Details,Rate,NoOfDays,Amount,InvoiceID) values(@Details,@Rate,@NoOfDays,@Amount,@InvoiceID)";


                                    if (cmd.ExecuteNonQuery() > 0)
                                    {
                                        //msg.InnerHtml = cmd.CommandText.ToString();
                                        cmd.Parameters.Clear();


                                    }

                                    cmd.Parameters.AddWithValue("StorageStartDate", Convert.ToDateTime(StorageStartDate.Text));
                                    cmd.Parameters.AddWithValue("StorageEndDate", Convert.ToDateTime(StorageEndDate.Text));
                                    cmd.Parameters.AddWithValue("StorageNoOfDays", Convert.ToString(NoOfDays));
                                    cmd.Parameters.AddWithValue("ClaimID", ClaimID);

                                    cmd.CommandText = "update LossOfUseDate SET StorageStartDate=@StorageStartDate,StorageEndDate=@StorageEndDate,StorageNoOfDays=@StorageNoOfDays where ClaimID=@ClaimID";

                                    if (cmd.ExecuteNonQuery() > 0)
                                    {
                                        //msg.InnerHtml = cmd.CommandText.ToString();
                                        cmd.Parameters.Clear();

                                    }


                                }


                            }

                            InvoiceIDUpdate.Value = Convert.ToString(InvoiceID);
                            //  GridView1.EditIndex = 0;
                            // GridView1.DataBind();




                            double TotalAmount = 0;
                            double VAT = 0;
                            double AmountDue = 0;
                            double GrandTotal = 0;
                            string VATRegistered = "";
                            //  int InvoiceID = Convert.ToInt32(InvoiceIDUpdate.Value);
                            try
                            {

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




                                    using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT * FROM InvoiceDetails WHERE InvoiceID=@InvoiceID", sqlConnection))
                                    {


                                        cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

                                        using (System.Data.IDataReader dataReader = cmd.ExecuteReader())
                                        {
                                            while (dataReader.Read())
                                            {

                                                TotalAmount = TotalAmount + Convert.ToInt32(dataReader["Amount"]);

                                            }
                                            vatadminvalue = ((Site1)this.Master).VATVALUE;


                                            if (VATRegistered == "Yes")
                                            {

                                                VAT = (TotalAmount / 100) * vatadminvalue;

                                            }
                                            else
                                            {

                                                VAT = 0;

                                            }


                                            AmountDue = TotalAmount + VAT;
                                            GrandTotal = TotalAmount + VAT;


                                        }





                                        cmd.Parameters.Clear();

                                        cmd.Parameters.AddWithValue("TotalAmount", TotalAmount);
                                        cmd.Parameters.AddWithValue("TotalVAt", VAT);
                                        cmd.Parameters.AddWithValue("AmountDue", AmountDue);
                                        cmd.Parameters.AddWithValue("GrandTotal", GrandTotal);
                                        cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);
                                        cmd.Parameters.AddWithValue("InvoiceDate", StorageEndDateValue);

                                        cmd.Parameters.AddWithValue("VATRATE", vatadminvalue);




                                        //cmd.Parameters.AddWithValue("TotalAmount", TotalAmount);
                                        //cmd.Parameters.AddWithValue("CompanyExtrainfo", ContactDetails.Text);
                                        //cmd.Parameters.AddWithValue("InvoiceDate", StorageEndDateValue);
                                        //cmd.Parameters.AddWithValue("TotalVAT", VAT);
                                        //cmd.Parameters.AddWithValue("AmountDue", AmountDue);
                                        //cmd.Parameters.AddWithValue("GrandTotal", GrandTotal);
                                        //cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);
                                        //cmd.Parameters.AddWithValue("InvoiceTitle", InvoiceTitleTextBox.Text);
                                        //cmd.Parameters.AddWithValue("InvoiceHeader", TextBoxInvoiceHeader.Text);
                                        //cmd.Parameters.AddWithValue("AdditionalInstructions", AdditoinalInstrucitonTextBox.Text);

                                        cmd.CommandText = "Update Invoice SET TotalAmount=@TotalAmount ,InvoiceDate=@InvoiceDate, AmountDue=@AmountDue, TotalVAt=@TotalVAt, GrandTotal = @GrandTotal, VATRATE=@VATRATE where InvoiceID=@InvoiceID";


                                        if (cmd.ExecuteNonQuery() > 0)
                                        {
                                            //msg.InnerHtml = cmd.CommandText.ToString();
                                            cmd.Parameters.Clear();

                                            cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

                                            //string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
                                            string sSQL1 = string.Format("Select * from Invoice where InvoiceID=@InvoiceID");
                                            cmd.CommandText = sSQL1;

                                            using (SqlDataReader Reader = cmd.ExecuteReader())
                                            {

                                                if (Reader.Read())
                                                {
                                                    string ClaimIDValue = Convert.ToString(Reader["ClaimID"]);

                                                    //Response.Redirect("AddClaim.aspx?ClaimID=" + ClaimIDValue);

                                                }



                                            }
                                        }



                                        
                                        
                                        cmd.Parameters.Clear();

                                        try
                                        {

                                            cmd.Parameters.AddWithValue("StorageRecoveryCharges", TotalAmount);
                                            cmd.Parameters.AddWithValue("ClaimID", ClaimID);

                                            cmd.CommandText = "Update PaymentRequstLetter SET StorageRecoveryCharges=@StorageRecoveryCharges where ClaimID=@ClaimID";

                                            //cmd.CommandText ="INSERT into CarHireFormTable (ClaimID,ContactID,CompanyAddressDetails,CompanyLogo,ContactAddress,ContactDateofBirth,ContactCompanyName,PermanantLicenseAddress,DriverLicenseNo,LicenseIsseDate,LicenseExpiryDate,Category,Identification,VehicleReg,VehicleMake,VehicleModel,VehicleEngine,VehicleTransmission,Bodyshape,DateTimeBack,VehicleRate,NumberOfDays,DeliveryCollectionCharges,EstateVehicle,ControlVehicle,TowBarsBabySeats,AddtionalDriver,AdminFees,Total,TotalVAt,HireCharges,SignatureImage,ExtraImage)values(@ClaimID,@ContactID,@CompanyAddressDetails,@CompanyLogo,@ContactAddress,@ContactDateofBirth,@ContactCompanyName,@PermanantLicenseAddress,@DriverLicenseNo,@LicenseIsseDate,@LicenseExpiryDate,@Category,@Identification,@VehicleReg,@VehicleMake,@VehicleModel,@VehicleEngine,@VehicleTransmission,@Bodyshape,@DateTimeBack,@VehicleRate,@NumberOfDays,@DeliveryCollectionCharges,@EstateVehicle,@ControlVehicle,@TowBarsBabySeats,@AddtionalDriver,@AdminFees,@Total,@TotalVAt,@HireCharges,@SignatureImage,@ExtraImage)";

                                            if (cmd.ExecuteNonQuery() > 0)
                                            {
                                                //msg.InnerHtml = cmd.CommandText.ToString();
                                                // cmd.Parameters.Clear();

                                              
                                               // Response.Redirect("~/AddClaim.aspx?ClaimId=" + ClaimID);


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

                            catch (Exception EXC)
                            {

#if DEBUG
                                Console.WriteLine(EXC.ToString());
#endif

                            }

                            Response.Redirect("~/AddClaim.aspx?ClaimId=" + ClaimID);
                        }


                    }
                }
                else
                {


                    Msg.InnerHtml = "Error : End date must me after than start date";

                  


                }

            }

        }
  
        protected void DropdownContactType_SelectedIndexChanged(object sender, EventArgs e)
        {


           

       
        }

        //protected void DropdownContact_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
        //    {
        //        using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Contact WHERE ContactID = @ContactID", sqlConnection))
        //        {


        //            sqlCommand.Connection.Open();
        //           // sqlCommand.Parameters.AddWithValue("ContactID", this.DropdownContact.SelectedValue);

        //            using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())
        //            {
        //                if (dataReader.Read())
        //                {

        //                    string FirstName = Convert.ToString(dataReader["FirstName"]);
        //                    string Surname = Convert.ToString(dataReader["Surname"]);
        //                    string Company = Convert.ToString(dataReader["Company"]);
        //                    string Address1 = Convert.ToString(dataReader["Address1"]);
        //                    string Address2 = Convert.ToString(dataReader["Address2"]);
        //                    string City = Convert.ToString(dataReader["City"]);
        //                    string PostCode = Convert.ToString(dataReader["PostCode"]);
        //                    ////this.ContactDetails.Text = Convert.ToString(dataReader["Country"]);

        //                    this.ContactDetails.Text = string.Format(FirstName + "  " + Surname + "\n" + Company
        //                                                              + Address1 + "\n" + Address2 + "\n" + City + "  " + PostCode);



        //                }

        //            }




        //        }
        //    }

 
        //}

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

        protected void SqlDataSourceContacts_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
              //DropdownContact.Items.Insert(0, new ListItem("Select ", "0")); 
        }
        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NewStorageInvoice.aspx?action=NewInvoice&ClaimId=" + Request.QueryString["ClaimID"]);
        }
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddClaim.aspx?ClaimId=" + Request.QueryString["ClaimID"]);
        }

        //protected void DropdownContact_DataBound(object sender, EventArgs e)
        //{
     
        //      DropdownContact.Items.Insert(0, new ListItem("Select Contact ", "0")); 
         
        // }

        //protected void DropdownContactType_DataBound(object sender, EventArgs e)
        //{
            
        //    DropdownContactType.Items.Insert(0, new ListItem("Select Contact Type ", "0"));

        //}
    }
        }
    
