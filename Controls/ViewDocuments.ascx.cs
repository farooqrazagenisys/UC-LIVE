using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;


namespace UC_LIVE.Controls
{
	public partial class ViewDocuments : System.Web.UI.UserControl
	{



        int ClaimId = 0;
		protected void Page_Load(object sender, EventArgs e)
		{



            if (Request.QueryString["ClaimId"] != null)
            {
                
                ClaimId = Convert.ToInt32(Request.QueryString["ClaimId"]);
               

            }


            ////////////Delete true 


            string DeleteAllowed = "";


            using (SqlConnection cnn = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {

                cnn.Open();
                using (SqlCommand Cmd = cnn.CreateCommand())
                {

                    string Username1 = Page.User.Identity.Name;


                    Cmd.Parameters.AddWithValue("Username1", Username1);

                    //string sSQL = string.Format("Select * from Claim,Contact,ClaimContact where Claim.ClaimId=@ClaimId and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=ClaimContact.ClaimId");
                    string sSQL = string.Format("Select * from UserPermission1 where UserName1=@Username1");
                    Cmd.CommandText = sSQL;

                    using (SqlDataReader Reader = Cmd.ExecuteReader())
                    {


                        if (Reader.Read())
                        {

                            DeleteAllowed = Convert.ToString(Reader["DeleteAllowed"]);
                        }
                    }
                }


                if (DeleteAllowed == "No")
                {

                    //this.GridView1.Columns[12].Visible = false;
                    //this.GridView2.Columns[12].Visible = false;
                    //this.GridView3.Columns[12].Visible = false;
                    //this.GridView4.Columns[12].Visible = false;
                    //this.GridView5.Columns[12].Visible = false;



                }



            }











            ////////////////

















		}
		protected void GridView2_RowUpdated(object sender, GridViewUpdatedEventArgs e)
		{

			this.ClientDocuments.DataBind();
			this.EngineerDocs.DataBind();
			this.SolicitorDocs.DataBind();
			this.CarhireDocs.DataBind();


		}


        protected void AddDocument_Click1(object sender, ImageClickEventArgs e)
		{
            Response.Redirect("~/AddNewDoc.aspx?ClaimId=" + ClaimId);
		}

        protected void InsuranceDocs_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

		
	}
}