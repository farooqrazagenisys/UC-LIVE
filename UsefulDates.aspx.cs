﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace UC_LIVE
{
    public partial class UsefulDates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string ClaimID = Convert.ToString(Request.QueryString["ClaimID"]);
            //ClaimRef.InnerHtml = string.Concat("*", ClaimID, "*");



            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {

                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("select * from Claim, ClaimContact, Contact where Claim.ClaimID=@ClaimID and Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Contact.ContactTypeID='9'", sqlConnection))
                {

                    sqlCommand.Connection.Open();

                    sqlCommand.Parameters.Clear();

                    sqlCommand.CommandText = "Select * from Contact where ContactTypeID='12'";


                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                        if (dataReader.Read())
                        {

                            DocumentHeader.InnerHtml = string.Concat("<div style='text-align:center;padding-left:5px;padding-right:5px;  color:black;font-size:10px; width:700px;'><img width='270' src='", Convert.ToString(dataReader["ContactImage"]), "'", "></div>", "<div style='text-align:center;padding-left:5px;padding-right:5px; color:black; padding-top:6px; width:700px; font-style:arial; font-size:12px;'>", (dataReader["Company"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["Address1"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["Address2"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["City"]), "&nbsp;&nbsp;", Convert.ToString(dataReader["Postcode"]), "<br/><span style='font-style:bold;'>T:", Convert.ToString(dataReader["Phone"]), "&nbsp;&nbsp;F:", Convert.ToString(dataReader["Fax"]), "&nbsp;&nbsp;E:", Convert.ToString(dataReader["Email"]), "</span></div>");

                            FooterValue.InnerHtml = string.Concat("<br/><span style='font-size:10px; margin-bottom:5px;'>", Convert.ToString(dataReader["CompanyInfo"]), "</span>");

                        }
                }
            }

            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {

                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("select * from Claim, ClaimContact, Contact where Claim.ClaimID=@ClaimID and Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Contact.ContactTypeID='9'", sqlConnection))
                {

                    sqlCommand.Connection.Open();

                    sqlCommand.Parameters.Clear();

                    sqlCommand.CommandText = "Select * from Claim , ClaimContact, Contact where Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Claim.ClaimId=@ClaimId and ClaimContact.ContactTypeID='1'";

                    sqlCommand.Parameters.AddWithValue("ClaimId", ClaimID);

                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                        if (dataReader.Read())
                        {
                            HireStartDate.InnerHtml = string.Concat("Claim Ref: ", ClaimID, "<br/><br/>", "Date:", Convert.ToDateTime(dataReader["dateupdated"]).ToString("dd-M-yyyy"));
                            insurancecompanydiv.InnerHtml = string.Concat((dataReader["Company"]), "</br>", Convert.ToString(dataReader["Address1"]), "<br/>", Convert.ToString(dataReader["Address2"]), "<br/>", Convert.ToString(dataReader["City"]), "&nbsp;&nbsp;<br/>", Convert.ToString(dataReader["Postcode"]), "<br/>");
                        }
                }
            }
        }




    }
}
