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
	public partial class UploadDocument : System.Web.UI.Page
	{
	
		protected void Page_Load(object sender, EventArgs e)
		{


			string ClaimID = Convert.ToString(Request.QueryString["ClaimID"]);

			using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
			{
				using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Claim where ClaimID = @ClaimID", sqlConnection))
				{
					sqlCommand.Connection.Open();

					sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

					using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())
					{
						if (dataReader.Read())
						{
							//ClaimTitle.InnerHtml = Convert.ToString(dataReader["ClaimTitle"]);

						}
					}
				}
			}
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			string ClaimID = Convert.ToString(Request.QueryString["ClaimID"]);
			try
			{
				//string DocBody = "";
				using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{

					//using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("Insert into Documents (DocTitle, DocStatus ,DateCreated , DateUpdated, DocHeader, DocBody, DocImages, DocFile, DateRecieved, DocType) Values(@DocTitle, @DocStatus , @DateCreated , @DateUpdated , @DocHeader , @DocBody, @DocFile, @DateRecieved,@DocFile,@DocType);SELECT SCOPE_IDENTITY() AS Id", sqlConnection))
					
	

					using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("Insert into Documents (DocTitle, DocStatus ,DateCreated,DateUpdated, DocHeader, DocBody, DocImages, DocFile, DateRecieved,DocType, DocAmount) Values(@DocTitle, @DocStatus ,@DateCreated,@DateUpdated, @DocHeader, @DocBody, @DocImages, @DocFile, @DateRecieved,@DocType, @DocAmount);SELECT SCOPE_IDENTITY() AS Id", sqlConnection))
		
					{
						string extension = string.Empty;
						string strFileName = string.Empty;			


						if (FileUpload1.HasFile)
						{

							sqlCommand.Connection.Open();
							HttpPostedFile PostedFile = FileUpload1.PostedFile;

							int FileSizeKB = PostedFile.ContentLength / 1024;

							extension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
							strFileName = System.IO.Path.GetFileNameWithoutExtension(FileUpload1.FileName).ToLower();

							if ((extension != ".doc" && extension != ".docx" && extension != ".pdf" && extension != ".xls" && extension != ".xlsx" && extension != ".ppt" && extension != ".pptx"  && extension != ".jpg" && extension != ".jpeg" && extension != ".gif" && extension != ".png"))
							{
								System.Text.StringBuilder stringBuilder = new System.Text.StringBuilder();

								stringBuilder.Append("<span style=\"color:Red;font-weight:bold;font-size:14px;\">Invalid Fiel Format. </span>");
								stringBuilder.Append(string.Format("<br/> <span style=\"color:Black;font-weight:bold;font-size:14px;\">File Extension : {0}", extension));
																Msg.InnerHtml = stringBuilder.ToString();

								return;
							}

							FileUpload1.SaveAs(Server.MapPath("~/Docs") + "/" + strFileName + extension);

							sqlCommand.Parameters.Clear();
						}

						sqlCommand.Parameters.AddWithValue("DocTitle",DocumentUpload.Text);
						sqlCommand.Parameters.AddWithValue("DocStatus", "1");
						sqlCommand.Parameters.AddWithValue("DateCreated", Convert.ToDateTime(DateTime.Now).ToString("yyyy/MM/dd HH:mm:ss"));
						sqlCommand.Parameters.AddWithValue("DateUpdated", Convert.ToDateTime(DateTime.Now).ToString("yyyy/MM/dd HH:mm:ss"));
						sqlCommand.Parameters.AddWithValue("DocHeader", "");
						sqlCommand.Parameters.AddWithValue("DocBody", "");
						sqlCommand.Parameters.AddWithValue("DocImages", "");
						sqlCommand.Parameters.AddWithValue("DateRecieved", Convert.ToDateTime(DateTime.Now).ToString("yyyy/MM/dd HH:mm:ss"));
						sqlCommand.Parameters.AddWithValue("DocFile", strFileName + extension);
						sqlCommand.Parameters.AddWithValue("DocType", "File");
					    sqlCommand.Parameters.AddWithValue("DocAmount", "0");


						int DocID = 0;

						using (System.Data.IDataReader dataReader1 = sqlCommand.ExecuteReader())
						{
							if (dataReader1.RecordsAffected == 0) throw new Exception();

							if (dataReader1.Read())
							
								DocID = Convert.ToInt16(dataReader1["Id"]);
						}


                        //sqlCommand.Parameters.Clear();
                        //sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);
                        //sqlCommand.CommandText = "Delete from ClaimDoc where ClaimID=@ClaimID";


                        //if (sqlCommand.ExecuteNonQuery() > 0)
                        //{
                        //    //msg.InnerHtml = cmd.CommandText.ToString();

                        //}
                        sqlCommand.Parameters.Clear();


						sqlCommand.Parameters.Clear();
						sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);
                        sqlCommand.Parameters.AddWithValue("ContactID", ContactDropDownListList.SelectedItem == null ? "0" : ContactDropDownListList.SelectedItem.Value);
						sqlCommand.Parameters.AddWithValue("ContactTypeID", TemplateTypeID.SelectedItem.Value);
						sqlCommand.Parameters.AddWithValue("DocID", DocID);

						sqlCommand.CommandText = "Insert into ClaimDoc (ClaimID, ContactID, DocID, ContactTypeID) Values(@ClaimID, @ContactID, @DocID , @ContactTypeID)";

						if (sqlCommand.ExecuteNonQuery() == 0) throw new Exception();

						#region 











                        //sqlCommand.Parameters.Clear();
                        //sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);
                        //sqlCommand.CommandText = "Delete from EngineerReport where ClaimID=@ClaimID";


                        //if (sqlCommand.ExecuteNonQuery() > 0)
                        //{
                        //    //msg.InnerHtml = cmd.CommandText.ToString();

                        //}
                        sqlCommand.Parameters.Clear();
                        

     						sqlCommand.Parameters.AddWithValue("ReportTitle", DocumentUpload.Text);
							sqlCommand.Parameters.AddWithValue("ReportFile", strFileName + extension);
							sqlCommand.Parameters.AddWithValue("DateUploaded", Convert.ToDateTime(DateTime.Now).ToString("yyyy/MM/dd HH:mm:ss"));
							//sqlCommand.Parameters.AddWithValue("DateReceived", Convert.ToDateTime(DateReceived.Text).ToString("yyyy/MM/dd HH:mm:ss"));
							//sqlCommand.Parameters.AddWithValue("DateInstructed", Convert.ToDateTime(DateInstructed.Text).ToString("yyyy/MM/dd HH:mm:ss"));
							//sqlCommand.Parameters.AddWithValue("DateInspected", Convert.ToDateTime(DateInspected.Text).ToString("yyyy/MM/dd HH:mm:ss"));
							//sqlCommand.Parameters.AddWithValue("EngineersAmount",DocAmount.Text);
							sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);
                            sqlCommand.Parameters.AddWithValue("ContactID", ContactDropDownListList.SelectedItem == null ? "0" : ContactDropDownListList.SelectedItem.Value);

                                                 
                        
                            sqlCommand.CommandText = "Insert into EngineerReport (ReportTitle, ReportFile, DateUploaded, ClaimID, ContactID) Values(@ReportTitle, @ReportFile, @DateUploaded, @ClaimID, @ContactID)";
							if (sqlCommand.ExecuteNonQuery() == 0) throw new Exception();




                            sqlCommand.Parameters.Clear();
                            sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);


                          //  string EngineerFee = Convert.ToString(DocAmount.Text);

                            sqlCommand.Parameters.Clear();                 

                            sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);
                           // sqlCommand.Parameters.AddWithValue("EngineerFees", EngineerFee);
                          //  sqlCommand.CommandText = "Update PaymentRequstLetter SET EngineerFees=@EngineerFees where ClaimID=@ClaimID";

                            //cmd.CommandText ="INSERT into CarHireFormTable (ClaimID,ContactID,CompanyAddressDetails,CompanyLogo,ContactAddress,ContactDateofBirth,ContactCompanyName,PermanantLicenseAddress,DriverLicenseNo,LicenseIsseDate,LicenseExpiryDate,Category,Identification,VehicleReg,VehicleMake,VehicleModel,VehicleEngine,VehicleTransmission,Bodyshape,DateTimeBack,VehicleRate,NumberOfDays,DeliveryCollectionCharges,EstateVehicle,ControlVehicle,TowBarsBabySeats,AddtionalDriver,AdminFees,Total,TotalVAt,HireCharges,SignatureImage,ExtraImage)values(@ClaimID,@ContactID,@CompanyAddressDetails,@CompanyLogo,@ContactAddress,@ContactDateofBirth,@ContactCompanyName,@PermanantLicenseAddress,@DriverLicenseNo,@LicenseIsseDate,@LicenseExpiryDate,@Category,@Identification,@VehicleReg,@VehicleMake,@VehicleModel,@VehicleEngine,@VehicleTransmission,@Bodyshape,@DateTimeBack,@VehicleRate,@NumberOfDays,@DeliveryCollectionCharges,@EstateVehicle,@ControlVehicle,@TowBarsBabySeats,@AddtionalDriver,@AdminFees,@Total,@TotalVAt,@HireCharges,@SignatureImage,@ExtraImage)";

                          //  if (sqlCommand.ExecuteNonQuery() > 0)
                           // {
                                //msg.InnerHtml = cmd.CommandText.ToString();
                              //  sqlCommand.Parameters.Clear();


                          //  }

                           // sqlCommand.Parameters.AddWithValue("EngineerInstructed", Convert.ToDateTime(DateInstructed.Text).ToString("yyyy/MM/dd HH:mm:ss"));
                       // sqlCommand.Parameters.AddWithValue("ReportReceieved", Convert.ToDateTime(DateReceived.Text).ToString("yyyy/MM/dd HH:mm:ss"));                         
                        //sqlCommand.Parameters.AddWithValue("InspectionDate",Convert.ToDateTime(DateInspected.Text).ToString("yyyy/MM/dd HH:mm:ss"));
                          //  sqlCommand.Parameters.AddWithValue("ClaimID", ClaimID);

                          //  sqlCommand.CommandText = "Update LossOfUseDate SET EngineerInstructed=@EngineerInstructed,ReportReceieved=@ReportReceieved,InspectionDate=@InspectionDate where ClaimID=ClaimID";

                          //  if (sqlCommand.ExecuteNonQuery() > 0)
                          //  {
                                //msg.InnerHtml = cmd.CommandText.ToString();
                           //     sqlCommand.Parameters.Clear();

                         //   }





                          
           

						#endregion 










						Msg.InnerHtml = string.Format("<span style=\"color:Red;font-weight:bold;font-size:14px;\">{0}</span>", "Document Added Successfully!");
					}


				}
			}

			catch (Exception EXC)
			{

				Msg.InnerHtml = string.Format("<span style=\"color:Red;font-weight:bold;font-size:14px;\">{0}</span>", "Unable to add document.!");

#if DEBUG
				Console.WriteLine(EXC.ToString());
#endif

			}
			finally
			{
                if (Request.QueryString["ClaimId"] != null)
                {

                    int ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);
                    Response.Redirect("~/AddClaim.aspx?ClaimId=" + ClaimId);
                }
			}
		}

        protected void CancelButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddClaim.aspx?ClaimId=" + Request.QueryString["ClaimID"]);
        }

      
	}
}






