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
	public partial class AddNewDoc : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			
		}

		protected void AddDocument_Click(object sender, EventArgs e)
		{


            int ClaimId = 0;

            try
			{
				string DocBody = "";
				using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{


					using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM Contact, ClaimContact, Claim WHERE Contact.ContactID = ClaimContact.ContactID and ClaimContact.ClaimID=Claim.ClaimID and Contact.ContactID = @ContactID", sqlConnection))
					{
						sqlCommand.Connection.Open();
                        string ContactID = Convert.ToString(DropDownList1.SelectedItem.Value);

						sqlCommand.Parameters.AddWithValue("ContactID", ContactID);

						using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())
						{
							if (dataReader.Read())
							{
                                string OldString = RadEditor1.Content;  //FCKeditor1.Value;
									DocBody = OldString.Replace("[FirstName]", Convert.ToString(dataReader["FirstName"]));
									DocBody = DocBody.Replace("[Company]", Convert.ToString(dataReader["Company"]));
									DocBody = DocBody.Replace("[Surname]", Convert.ToString(dataReader["Surname"]));
									DocBody = DocBody.Replace("[Phone]", Convert.ToString(dataReader["Phone"]));
									DocBody = DocBody.Replace("[Email]", Convert.ToString(dataReader["Email"]));
									DocBody = DocBody.Replace("[Address1]", Convert.ToString(dataReader["Address1"]));
									DocBody = DocBody.Replace("[Address2]", Convert.ToString(dataReader["Address2"]));
									DocBody = DocBody.Replace("[City]", Convert.ToString(dataReader["City"]));
									DocBody = DocBody.Replace("[Postcode]", Convert.ToString(dataReader["PostCode"]));
									DocBody = DocBody.Replace("[Country]", Convert.ToString(dataReader["Country"]));
									DocBody = DocBody.Replace("[Dob]", Convert.ToString(dataReader["DOB"]));
									DocBody = DocBody.Replace("[Nino]", Convert.ToString(dataReader["NINo"]));
									DocBody = DocBody.Replace("[Country]", Convert.ToString(dataReader["Country"]));
									DocBody = DocBody.Replace("[Dob]", Convert.ToString(dataReader["DOB"]));
									DocBody = DocBody.Replace("[Nino]", Convert.ToString(dataReader["NINo"]));
									DocBody = DocBody.Replace("[ClaimID]", Convert.ToString(dataReader["ClaimId"]));
									DocBody = DocBody.Replace("[AccidentDate]", Convert.ToString(dataReader["AccidentDate"]));
									DocBody = DocBody.Replace("[AccidentLocation]", Convert.ToString(dataReader["AccidentLocation"]));
								
                              }
						}

					}


					using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM DocumentTemplate WHERE TemplateID = @TemplateID", sqlConnection))
					{

						

						sqlCommand.Parameters.AddWithValue("TemplateID", this.TemplateIDDropdown.SelectedValue);

						using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())
						{
							if (dataReader.Read())
							{
								sqlCommand.Parameters.AddWithValue("DocTitle", Convert.ToString(dataReader["TemplateTitle"]));
								sqlCommand.Parameters.AddWithValue("DocStatus", "1");
								sqlCommand.Parameters.AddWithValue("DateCreated", DateTime.Now);
								sqlCommand.Parameters.AddWithValue("DateUpdated", DateTime.Now);
                                //sqlCommand.Parameters.AddWithValue("DocHeader", Convert.ToString(dataReader["TemplateHeader"]));
								sqlCommand.Parameters.AddWithValue("DocBody", DocBody);
								sqlCommand.Parameters.AddWithValue("DocType", "HTML");
							}
						}
				
						

				
						sqlCommand.CommandText = "Insert into Documents (DocTitle, DocStatus ,DateCreated , DateUpdated, DocBody, DocType) Values(@DocTitle, @DocStatus , @DateCreated , @DateUpdated , @DocBody, @DocType  );SELECT SCOPE_IDENTITY() AS Id";

						int DocID = 0;

						using (System.Data.IDataReader dataReader1 = sqlCommand.ExecuteReader())
						{
							if (dataReader1.RecordsAffected == 0) throw new Exception();

							if (dataReader1.Read())
								DocID = Convert.ToInt16(dataReader1["Id"]);
						}

                        if (Request.QueryString["ClaimId"] != null)
                        {
                          
                            ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);
                        

                        }

                        sqlCommand.Parameters.AddWithValue("ClaimID", ClaimId);





                        sqlCommand.Parameters.AddWithValue("ContactID", ContactDropDownMain.SelectedValue);
						sqlCommand.Parameters.AddWithValue("ContactTypeID", TemplateTypeID.SelectedValue);
						sqlCommand.Parameters.AddWithValue("DocID", DocID);

						sqlCommand.CommandText = "Insert into ClaimDoc (ClaimID, ContactID, DocID, ContactTypeID) Values(@ClaimID, @ContactID, @DocID , @ContactTypeID)";

						if (sqlCommand.ExecuteNonQuery() == 0) throw new Exception();

							Msg.InnerHtml = string.Format("<span style=\"color:Red;font-weight:bold; margin-left:30px; font-size:14px;\">{0}</span>", "Document Added Successfully!");
                            Response.Redirect("AddClaim.aspx?ClaimID=" + ClaimId);
                    
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

			}
		}

		protected void TemplateIDDropdown_SelectedIndexChanged(object sender, EventArgs e)
		{

			try
			{

				using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
				{

					using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM DocumentTemplate WHERE TemplateID = @TemplateID", sqlConnection))
					{

						sqlCommand.Connection.Open();

						sqlCommand.Parameters.AddWithValue("TemplateID", this.TemplateIDDropdown.SelectedValue);

						using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection))

							if (dataReader.Read())
							{


							//	FCKeditor1.Value = Convert.ToString(dataReader["TemplateBody"]);
                                RadEditor1.Content = Convert.ToString(dataReader["TemplateBody"]);
                                //RadEditor1 = Convert.ToString(dataReader["TemplateBody"]);

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
				//Msg.InnerHtml = string.Format("<span style=\"color:Red;font-weight:bold;font-size:14px;\">{0}</span>", "");
			}

		}

		protected void TemplateTypeID_SelectedIndexChanged(object sender, EventArgs e)
		{


            try
            {

                using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
                {

                    using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM DocumentTemplate WHERE TemplateID = @TemplateID", sqlConnection))
                    {

                        sqlCommand.Connection.Open();

                        sqlCommand.Parameters.AddWithValue("TemplateID", this.TemplateIDDropdown.SelectedValue);

                        using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection))

                            if (dataReader.Read())
                            {


                                //FCKeditor1.Value = Convert.ToString(dataReader["TemplateBody"]);

                                RadEditor1.Content = Convert.ToString(dataReader["TemplateBody"]);

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
                //Msg.InnerHtml = string.Format("<span style=\"color:Red;font-weight:bold;font-size:14px;\">{0}</span>", "");
            }

		}

		protected void TemplateTypeID_Load(object sender, EventArgs e)
		{



//            try
//            {

//                using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
//                {

//                    using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("SELECT * FROM DocumentTemplate", sqlConnection))
//                    {

//                        sqlCommand.Connection.Open();

//                        sqlCommand.Parameters.AddWithValue("TemplateID", this.TemplateIDDropdown.SelectedValue);

//                        using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection))

//                            if (dataReader.Read())
//                            {


//                                TemplateBodyTextBox.Text = Convert.ToString(dataReader["TemplateBody"]);


//                            }


//                    }
//                }
//            }



//            catch (Exception EXC)
//            {

//#if DEBUG
//                Console.WriteLine(EXC.ToString());
//#endif

//            }
//            finally
//            {
//                Msg.InnerHtml = string.Format("<span style=\"color:Red;font-weight:bold;font-size:14px;\">{0}</span>", "");
//            }

		}

		protected void TemplateIDDropdown_Load(object sender, EventArgs e)
		{
			
		}

		protected void AddNewTemplate_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/AddTemplate.aspx");
		}

        protected void CancelButton1_Click(object sender, EventArgs e)
        {
            string ClaimID1 = Convert.ToString(Request.QueryString["ClaimID"]);
            Response.Redirect("~/AddClaim.aspx?ClaimId=" + ClaimID1);
        }


	
	}
}
