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


    public partial class AddInvoice : System.Web.UI.Page
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
                                this.InvoiceDate.Text = Convert.ToString(DateTime.Today.ToString("dd/MM/yyyy"));
                                this.InvoiceTitleTextBox.Text = "Referral Invoice";

                            }

                        }




                    }
                }

                using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {
                    using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT [FirstName], [Surname], [Company],[Address1],[Address2], [City] , [PostCode] FROM [Contact], [ClaimContact] WHERE ([ClaimContact].[ContactTypeID] = '2' and [Contact].[ContactID]=[ClaimContact].[ContactID] and [ClaimContact].[ClaimID]=@ClaimID)", sqlConnection))
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

}
            }

        
            if (Convert.ToString(Request.QueryString["InvoiceID"]) != null)
            {
                PanelInvoiceDetials.Visible = true;
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

                                       // DropdownContact.Visible = false;
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

            string ClaimIDValue = Convert.ToString(Request.QueryString["ClaimID"]);
            ClaimIDHiddenField.Value = ClaimIDValue;

            string FilePath = string.Empty;
            using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {



                conn.Open();
                using (SqlCommand cmd = conn.CreateCommand())
                {

                    
                    cmd.Parameters.Clear();

                    cmd.CommandText = "delete from Invoice where ClaimID=@ClaimID and InvoiceType='INVOICE'";
                    cmd.Parameters.AddWithValue("ClaimID", ClaimIDValue);

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

                            using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM ClaimContact WHERE ClaimID=@ClaimID and ContactTypeID=7", sqlConnection))
                            {
                                sqlCommand.Connection.Open();

                                sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

                                using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                                    if (dataReader.Read())
                                    {


                                        ContactID = Convert.ToInt32(dataReader["ContactID"]);


                                    }


                                sqlCommand.Parameters.Clear();

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

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("ContactID", ContactID);
                    cmd.Parameters.AddWithValue("ClaimID", ClaimID);
                    cmd.Parameters.AddWithValue("InvoiceTitle", InvoiceTitle);
                    cmd.Parameters.AddWithValue("AdditionalInstructions", AdditionalInstructions);
                    cmd.Parameters.AddWithValue("InvoiceHeader", InvoiceHeader);
                    cmd.Parameters.AddWithValue("InvoiceType", "Invoice");
                    cmd.Parameters.AddWithValue("InvoiceStatus", "Pending");
                    cmd.Parameters.AddWithValue("AmountPaid", 0);
                    cmd.Parameters.AddWithValue("GrandTotal", 0);
                    cmd.Parameters.AddWithValue("CompanyAddress", CompanyAddress.Text);
                    cmd.Parameters.AddWithValue("CompanyLogo", FilePath);     
                    cmd.Parameters.AddWithValue("ContactAddress", ContactDetails.Text);
               cmd.Parameters.AddWithValue("InvoiceFootertext", TextBoxInvoiceFooter.Text);

          
                    cmd.Parameters.AddWithValue("CompanyAddressDetails", CompanyAddress.Text);                    

                    //cmd.Parameters.AddWithValue("InvoiceHeaderImage", "Images/" + strFileName + extension);

                    cmd.CommandText = "INSERT into Invoice (InvoiceTitle,AdditionalInstructions,InvoiceHeader,ContactID,ClaimID,InvoiceType,InvoiceStatus, AmountPaid, GrandTotal,ContactAddress,CompanyAddressDetails,InvoiceFootertext,CompanyLogo) values(@InvoiceTitle,@AdditionalInstructions,@InvoiceHeader,@ContactID,@ClaimID,@InvoiceType,@InvoiceStatus, @AmountPaid, @GrandTotal,@ContactAddress, @CompanyAddressDetails,@InvoiceFootertext,@CompanyLogo)";


                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        //msg.InnerHtml = cmd.CommandText.ToString();
                        cmd.Parameters.Clear();
                        cmd.CommandText = "SELECT @@IDENTITY";

                        //// Get the last inserted id.
                        InvoiceIDUpdate.Value = Convert.ToString(cmd.ExecuteScalar());
                        string InvoiceIDValue = Convert.ToString(cmd.ExecuteScalar());
                        PanelInvoiceDetials.Visible = true;
                        Response.Redirect("AddInvoice.aspx?InvoiceID=" + InvoiceIDValue + "&ClaimID=" + ClaimID);

                    }

                }
            }

        }

        protected void AddNewItem_Click(object sender, EventArgs e)
        {
            int InvoiceID = Convert.ToInt32(InvoiceIDUpdate.Value);


            //if (InvoiceIDUpdate.Value != "")
            //{
            //    int InvoiceID = Convert.ToInt32(InvoiceIDUpdate.Value);
            //}
            //else
            //{
            //    Server.Transfer("ErrorHandler.aspx?Error=emptystring");

            //}

            string AccidentDate = "";
            string FirstName = "";
            string Surname = "";
            string Title = "";

            string ClaimID = Convert.ToString(Request.QueryString["ClaimID"]);

            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {
                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID=7", sqlConnection))
                {
                   

                    sqlCommand.Connection.Open();
              sqlCommand.Parameters.AddWithValue("ClaimId", ClaimID);

                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())
                    {
                        if (dataReader.Read())
                        {



                            if (Convert.IsDBNull(dataReader["AccidentDate"]))
                            {

                                AccidentDate = "Not Provided";
                           
                            
                            }

                            else
                            {

                                AccidentDate = Convert.ToDateTime(dataReader["AccidentDate"]).ToString("dd-MM-yyyy");
                            
                            }




                            FirstName = Convert.ToString(dataReader["FirstName"]);
                            Surname = Convert.ToString(dataReader["Surname"]);
                            Title = Convert.ToString(dataReader["Title"]);
                        }

                    }




                }
            }

            using (SqlConnection conn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {

                conn.Open();
                using (SqlCommand cmd = conn.CreateCommand())
                {

                  

                    System.Text.StringBuilder DetailsValue = new System.Text.StringBuilder();


                    DetailsValue.Append("Client Name: ");
                    DetailsValue.Append(Title);
                    DetailsValue.Append(" ");
                    DetailsValue.Append(FirstName);
                    DetailsValue.Append(" ");
                    DetailsValue.Append(Surname);
                    DetailsValue.Append(", ");
                    DetailsValue.Append("Accident Date: ");
                    DetailsValue.Append(AccidentDate);
                    DetailsValue.Append(" ");

                    string Details1 = Convert.ToString(DetailsValue);


                    cmd.Parameters.AddWithValue("Details", Details1);
                    cmd.Parameters.AddWithValue("Rate", "");
                    cmd.Parameters.AddWithValue("Amount", "");
                    cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

                    cmd.CommandText = "INSERT into InvoiceDetails (Details,Rate,Amount,InvoiceID) values(@Details,@Rate,@Amount,@InvoiceID)";


                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        //msg.InnerHtml = cmd.CommandText.ToString();
                        cmd.Parameters.Clear();


                    }


                    //cmd.Parameters.AddWithValue("Details", "");
                    //cmd.Parameters.AddWithValue("Rate", "");
                    //cmd.Parameters.AddWithValue("Amount", "");
                    //cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

                    //cmd.CommandText = "INSERT into InvoiceDetails (Details,Rate,Amount,InvoiceID) values(@Details,@Rate,@Amount,@InvoiceID)";


                    //if (cmd.ExecuteNonQuery() > 0)
                    //{
                    //   // msg.InnerHtml = cmd.CommandText.ToString();
                    //    cmd.Parameters.Clear();


                    //}


                }


            }

            InvoiceIDUpdate.Value = Convert.ToString(InvoiceID);
            GridView1.EditIndex = 0;
            GridView1.DataBind();


        }

        protected void UpdateInvoice_Click(object sender, EventArgs e)
        {

            double TotalAmount = 0;
            double VAT = 0;
            double AmountDue = 0;
            double GrandTotal = 0;
            string VATRegistered = "";

            double vatadminvalue = ((Site1)this.Master).VATVALUE;
            int InvoiceID = Convert.ToInt32(InvoiceIDUpdate.Value);
            try
            {


                using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {

                    using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT VATRegistered, Company, FirstName from Contact, ClaimContact, Claim where Contact.ContactID = ClaimContact.ContactID and ClaimContact.ClaimID = Claim.ClaimId and Claim.ClaimId= @ClaimID and Contact.ContactTypeID=2", sqlConnection))
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

                using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {



                    using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT * FROM InvoiceDetails WHERE InvoiceID=@InvoiceID", sqlConnection))
                    {
                        cmd.Connection.Open();

                        cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

                        using (System.Data.IDataReader dataReader = cmd.ExecuteReader())
                        {
                            while (dataReader.Read())
                            {

                                TotalAmount = TotalAmount + Convert.ToInt32(dataReader["Amount"]);

                            }


                            vatadminvalue = ((Site1)this.Master).VATVALUE;

                        }



                        //using (System.Data.SqlClient.SqlCommand sqlcommand1 = new System.Data.SqlClient.SqlCommand("SELECT * FROM InvoiceDetails WHERE InvoiceID=@InvoiceID", sqlConnection))
                        //{

                        //    cmd.Parameters.Clear();
                        //    cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

                        //    using (System.Data.IDataReader dataReader = cmd.ExecuteReader())
                        //    {
                        //        while (dataReader.Read())
                        //        {

                        //            TotalAmount = TotalAmount + Convert.ToInt32(dataReader["Amount"]);

                        //        }
                            


                            




                        //    }

                        //}

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


                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("TotalAmount", TotalAmount);          
                        cmd.Parameters.AddWithValue("InvoiceDate", DateTime.Today.ToString("yyyy-MM-dd"));
                        cmd.Parameters.AddWithValue("TotalVAT", VAT);
                        cmd.Parameters.AddWithValue("AmountDue", AmountDue);
                        cmd.Parameters.AddWithValue("GrandTotal", GrandTotal);
                        cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);
                        cmd.Parameters.AddWithValue("VATRATE", vatadminvalue);
                        
                        cmd.Parameters.AddWithValue("AdditionalInstructions", AdditoinalInstrucitonTextBox.Text);

                        cmd.CommandText = "Update Invoice SET InvoiceDate=@InvoiceDate, TotalAmount=@TotalAmount , AmountDue=@AmountDue, TotalVAT=@TotalVAT, GrandTotal = @GrandTotal,VATRATE=@VATRATE where InvoiceID=@InvoiceID";

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            //msg.InnerHtml = cmd.CommandText.ToString();
                            cmd.Parameters.Clear();

                            cmd.Parameters.AddWithValue("InvoiceID", InvoiceID);

                            //string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
                            string sSQL = string.Format("Select * from Invoice where InvoiceID=@InvoiceID");
                            cmd.CommandText = sSQL;

                            using (SqlDataReader Reader = cmd.ExecuteReader())
                            {

                                if (Reader.Read())
                                {
                                    string ClaimIDValue = Convert.ToString(Reader["ClaimID"]);

                                    Response.Redirect("AddClaim.aspx?ClaimID=" + ClaimIDValue);

                                }



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


        }

        protected void DropdownContactType_SelectedIndexChanged(object sender, EventArgs e)
        {

         

       
        }

     
        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddInvoice.aspx?action=NewInvoice&ClaimId=" + Request.QueryString["ClaimID"]);
        }
        
     
      protected void CancelButton_Click2(object sender, EventArgs e)
        
        {
            Response.Redirect("~/AddClaim.aspx?ClaimId=" + Request.QueryString["ClaimID"]);
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

        protected void SqlDataSourceContacts_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
              //DropdownContact.Items.Insert(0, new ListItem("Select ", "0")); 
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