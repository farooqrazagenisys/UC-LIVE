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
	public partial class UpdateDocuments22 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

			if (!this.IsPostBack)
			{

				try
				{

					using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))

					using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("select DocID, DocTitle, DocBody from Documents where DocID=@DocID", sqlConnection))
					{

						sqlCommand.Connection.Open();

						sqlCommand.Parameters.AddWithValue("DocID", Request.QueryString["DocID"]);

						using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection))

							if (dataReader.Read())
							{

								TemplateTitle.Text = Convert.ToString(dataReader["DocTitle"]);
                                RadEditor1.Content = Convert.ToString(dataReader["DocBody"]);
								TemplateIDHidden.Value = Convert.ToString(dataReader["DocID"]);
								//.Text = Convert.ToString(dataReader["TemplateHeader"]);

								//ViewTitle.InnerHtml = string.Format("<img src=\"{0}\" />", dataReader["DocHeader"]);


								//ViewContactInfo.InnerHtml = string.Concat(Convert.ToString(dataReader["FirstName"]), Convert.ToString(dataReader["Surname"]),"<br/>" , 
								//	Convert.ToString(dataReader["Company"]),"<Br/>" ,  Convert.ToString(dataReader["Address1"]), "<br/>", Convert.ToString(dataReader["Address2"]),
								//	"<Br/>" , Convert.ToString(dataReader["Postcode"]) , "<br/>", Convert.ToString(dataReader["City"]));
								//ViewDescription.InnerHtml = Convert.ToString(dataReader["DocBody"]);


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
		}

		protected void AddTemplateButton_Click(object sender, EventArgs e)
		{
			try
			{


				//int TemplateTypeID = Convert.ToInt32(this.TemplateTypeID.SelectedValue);

				//bool isChecked = false;

				using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{
					sqlConnection.Open();

					using (SqlCommand sqlCommand = sqlConnection.CreateCommand())
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

							sqlCommand.Parameters.Clear();
						}
						sqlCommand.Parameters.AddWithValue("DocTitle", TemplateTitle.Text);
                        sqlCommand.Parameters.AddWithValue("DocBody", RadEditor1.Content);
						//sqlCommand.Parameters.AddWithValue("TemplateFooter", TemplateFooter);
						//	sqlCommand.Parameters.AddWithValue("ImageType", (i + 1));
						sqlCommand.Parameters.AddWithValue("DocHeader", "Images/" + strFileName + extension);
					
						sqlCommand.Parameters.AddWithValue("DocID", TemplateIDHidden.Value);



						//sqlCommand.CommandText = "Select TemplateHeader From Template where TemplateTypeID=@TemplateTypeID And TemplateHeader=@TemplateHeader";


						//int count = (int)sqlCommand.ExecuteScalar();

						//if (count > 0)
						//    sqlCommand.CommandText = "Update TemplateHeader set TemplateHeader=@TemplateHeader Where TemplateTypeID=@TemplateTypeID";
						//else

						sqlCommand.CommandText = "Update Documents SET DocTitle = @DocTitle, DocBody = @DocBody , DocHeader = @DocHeader where DocID=@DocID";


						sqlCommand.ExecuteNonQuery();


						//isChecked = true;

					}
				}

				//if (isChecked == true)
				//{
				//    Msg.InnerHtml = string.Format("<span style=\"color:Red;font-weight:bold;font-size:14px;\">{0}</span>", "Please Select Image to Upload");
				//}

				//else {

				//    Msg.InnerHtml = string.Format("<span style=\"color:Red;font-weight:bold;font-size:14px;\">{0}</span>", "Please Select Image to Upload");
				//}

			}
			catch (Exception EXC)
			{

#if DEBUG
				Console.WriteLine(EXC.ToString());
#endif

			}
			finally
			{
				//Msg.InnerHtml = string.Format("<br/><span style=\"color:Red;font-weight:bold;font-size:14px;\">{0}</span>", "Document Updated Successfully!");

                string ClaimID = Convert.ToString(Request.QueryString["ClaimID"]);

                Response.Redirect("AddClaim.aspx?ClaimId=" + ClaimID);
            }

		}

        protected void CancelButton1_Click(object sender, EventArgs e)
        {
            string ClaimID1 = Convert.ToString(Request.QueryString["ClaimID"]);
            Response.Redirect("~/AddClaim.aspx?ClaimId=" + ClaimID1);
        }
	}
}
		


