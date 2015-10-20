using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;

namespace UC_LIVE.Controls
{
    public partial class ViewClaims : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {
        
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

                    this.GridView1.Columns[12].Visible = false;
                    this.GridView2.Columns[12].Visible = false;
                    this.GridView3.Columns[12].Visible = false;
                    this.GridView4.Columns[12].Visible = false;
                    this.GridView5.Columns[12].Visible = false;
                   

                }



            }
 
        }

        protected void GridView2_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
           
            this.GridView1.DataBind();
            this.GridView2.DataBind();
            this.GridView3.DataBind();
            this.GridView4.DataBind();
        
          
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            this.GridView2.DataBind();
            this.GridView3.DataBind();
            this.GridView4.DataBind();
            this.GridView5.DataBind();

        }

        protected void GridView3_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            this.GridView1.DataBind();
            this.GridView2.DataBind();
            this.GridView4.DataBind();
            this.GridView5.DataBind();
        }

        protected void GridView4_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            this.GridView1.DataBind();
            this.GridView2.DataBind();
            this.GridView3.DataBind();
            this.GridView5.DataBind();
        }


        protected void GridView5_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            this.GridView1.DataBind();
            this.GridView2.DataBind();
            this.GridView3.DataBind();
            this.GridView4.DataBind();
        }

		protected void Button1_Click(object sender, EventArgs e)
		{

		}






    }
}