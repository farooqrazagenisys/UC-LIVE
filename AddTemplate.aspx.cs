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
	public partial class AddTemplate : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
           

		
		}

		protected void AddTemplateButton_Click(object sender, EventArgs e)
		{
			try
			{


				int TemplateTypeID = Convert.ToInt32(this.TemplateTypeID.SelectedValue);

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
							sqlCommand.Parameters.AddWithValue("TemplateTitle", TemplateTitle.Text);
                            sqlCommand.Parameters.AddWithValue("TemplateBody", RadEditor1.Content);



							//sqlCommand.Parameters.AddWithValue("TemplateFooter", TemplateFooter);
							//	sqlCommand.Parameters.AddWithValue("ImageType", (i + 1));
							sqlCommand.Parameters.AddWithValue("TemplateHeader", "Images/" + strFileName + extension);
							sqlCommand.Parameters.AddWithValue("TemplateTypeID", TemplateTypeID);


							//sqlCommand.CommandText = "Select TemplateHeader From Template where TemplateTypeID=@TemplateTypeID And TemplateHeader=@TemplateHeader";


							//int count = (int)sqlCommand.ExecuteScalar();

							//if (count > 0)
							//    sqlCommand.CommandText = "Update TemplateHeader set TemplateHeader=@TemplateHeader Where TemplateTypeID=@TemplateTypeID";
							//else

							sqlCommand.CommandText = "Insert into DocumentTemplate (TemplateTitle,TemplateBody,TemplateHeader,TemplateTypeID ) Values (@TemplateTitle,@TemplateBody,@TemplateHeader,@TemplateTypeID)";

							sqlCommand.ExecuteNonQuery();
                            Response.Redirect("EditTemplate.aspx");

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
				Msg.InnerHtml = string.Format("<span style=\"color:Red;font-weight:bold;margin-left:20px;font-size:14px;\">{0}</span>", "Template Uploaded Successfully!");
			}


		}

        protected void CancelButton1_Click(object sender, EventArgs e)
        {
            string ClaimID1 = Convert.ToString(Request.QueryString["ClaimID"]);
            Response.Redirect("~/home1.aspx");
        }



	}
}
