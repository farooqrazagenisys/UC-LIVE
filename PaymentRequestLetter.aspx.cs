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
    public partial class PaymentRequestLetter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string VehicleIdValue = "";
            int NoOfDaysValue = 0;

            double Automaticvalue = 0;
            double EstatValue=0;
            double CotnrolValue=0;
            double AdditionalDriverCostValue=0; 
            double Towbarsvalue=0;
            double Hirecostvalue=0;
            double StoragechargesValue=0;
            double EngnieerFee=0;
            double AdminFeeVAlue=0;
            double DelveryChargesValue = 0;
            double HireCost30 = 0;
            double HireCost60 = 0;
            double HireCost90 = 0;
            double HireCost90plus = 0;
            double GrandTotalCarhire = 0.00;
            double StorageVatPlusValue = 0.00;
            double GrandTotalStorage = 0.00;
            double GrandTotalEngineer = 0.00;
            //int RentalChargesValue = 0;
            double EngineerFeesValue = 0.00;
            double StoragechargesValueVAT = 0.00;
            double TotalCarhireVAT  = 0.00;
            double EngineerFeesValueVAT = 0.00;
            double VAT = 0.00;
            double VAT1 = 0.00;
            double VAT2= 0.00;
            double VAT3 = 0.00;


            double TotalCarhireVAT1 = 0.00;
            double TotalCarhireVAT2 = 0.00;
            double TotalCarhireVAT3 = 0.00;


            double TotalStorageVAT1 = 0.00;
            double TotalStorageVAT2 = 0.00;
            double TotalStorageVAT3 = 0.00;

            double TotalEngineerVAT1 = 0.00;
            double TotalEngineerVAT2 = 0.00;
            double TotalEngineerVAT3 = 0.00;


            double TotalChargesvalue = 0.00 ;
            double TotalCharges60value = 0.00;
            double TotalCharges90value = 0.00;
            double TotalCharges90Plusvalue = 0.00;

            double vatadminvalue = 0.00;

            string ClaimID = Request.QueryString["ClaimID"];

            ClaimReference.InnerText = ClaimID;

          //  ;





            //VATDiv.InnerHtml = Convert.ToString(((Site1)this.Master).VATVALUE);



            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {

                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("select * from Claim, ClaimContact, Contact where Claim.ClaimID=@ClaimID and Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Contact.ContactTypeID='9'", sqlConnection))
                {


                    sqlCommand.Connection.Open();

                    sqlCommand.Parameters.Clear();

                    sqlCommand.Parameters.AddWithValue("ClaimId", ClaimID);

                    sqlCommand.CommandText = "select * from Invoice  where ClaimID= @ClaimID and InvoiceType='Hire Invoice'";


                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                        if (dataReader.Read())
                        {
                            if (dataReader["VATRATE"] != null)
                            {
                                vatadminvalue = Convert.ToDouble(dataReader["VATRATE"]);
                                VATRATE.InnerHtml = "Total VAT @ " + Convert.ToDouble(dataReader["VATRATE"]) + "%";
                            }
                        }

                }
            }

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

                      

                            FooterValue.InnerHtml = string.Concat("<br/><span style='font-size:10px;'>", Convert.ToString(dataReader["CompanyInfo"]), "</span>");

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

                            insurancecompanydiv.InnerHtml = string.Concat((dataReader["Company"]), "</br>", Convert.ToString(dataReader["Address1"]), "<br/>", Convert.ToString(dataReader["Address2"]), "<br/>", Convert.ToString(dataReader["City"]), "&nbsp;&nbsp;","<br/>", Convert.ToString(dataReader["Postcode"]), "<br/>");
                         //   HireStartDate.InnerHtml = string.Concat("Claim Ref: ", ClaimID, "<br/><br/>", "Date:", Convert.ToDateTime(dataReader["dateupdated"]).ToString("dd-M-yyyy"));
                               
                        }
                }
            }

            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {

                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("select * from Claim, ClaimContact, Contact where Claim.ClaimID=@ClaimID and Claim.ClaimId = ClaimContact.ClaimID and ClaimContact.ContactID = Contact.ContactID and Contact.ContactTypeID='9'", sqlConnection))
                {

                    sqlCommand.Connection.Open();

                    sqlCommand.Parameters.Clear();

                    sqlCommand.CommandText = "Select * from Invoice  where  InvoiceType = 'HIRE INVOICE' and ClaimID=@ClaimID";

                    sqlCommand.Parameters.AddWithValue("ClaimId", ClaimID);

                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                        if (dataReader.Read())
                        {

                            //insurancecompanydiv.InnerHtml = string.Concat((dataReader["Company"]), "</br>", Convert.ToString(dataReader["Address1"]), "<br/>", Convert.ToString(dataReader["Address2"]), "<br/>", Convert.ToString(dataReader["City"]), "&nbsp;&nbsp;", "<br/>", Convert.ToString(dataReader["Postcode"]), "<br/>");
                            HireStartDate.InnerHtml = string.Concat("Claim Ref: ", ClaimID, "<br/><br/>", "Date:", Convert.ToDateTime(dataReader["InvoiceDate"]).ToString("dd-M-yyyy"));

                        }
                }
            }



            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {

                
                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("select * from PaymentRequstLetter where ClaimID=@ClaimID", sqlConnection))
                {

                    sqlCommand.Connection.Open();
                    sqlCommand.Parameters.AddWithValue("ClaimID", Request.QueryString["ClaimID"]);

                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                        if (dataReader.Read())
                        {

                            if (dataReader["DeliveryCharges"] != null)
                            {

                                DelveryChargesValue = Convert.ToDouble(dataReader["DeliveryCharges"]);

                            }

                            DeliverandClollectionCharges.InnerHtml = Convert.ToString(String.Format("{0:C}", DelveryChargesValue));
                            DeliverandClollectionCharges1.InnerHtml = Convert.ToString(String.Format("{0:C}", DelveryChargesValue));
                            DeliverandClollectionCharges2.InnerHtml = Convert.ToString(String.Format("{0:C}", DelveryChargesValue));
                            DeliverandClollectionCharges3.InnerHtml = Convert.ToString(String.Format("{0:C}", DelveryChargesValue));


                            if (dataReader["Automatic"] != null)
                            {


                                //    DeliverandClollectionCharges.InnerHtml = Convert.ToString(dataReader["DeliveryCharges"]);
                                Automaticvalue = Convert.ToDouble(dataReader["Automatic"]);
                            }

                            Automatic.InnerHtml =Convert.ToString(String.Format("{0:C}", Automaticvalue));
                            Automatic1.InnerHtml = Convert.ToString(String.Format("{0:C}", Automaticvalue));
                            Automatic2.InnerHtml = Convert.ToString(String.Format("{0:C}", Automaticvalue));
                            Automatic3.InnerHtml = Convert.ToString(String.Format("{0:C}",Automaticvalue));

                            if (dataReader["TowBars"] != null)
                            {

                                Towbarsvalue = Convert.ToDouble(dataReader["TowBars"]);

                            }
                            BabySeats.InnerHtml = Convert.ToString(String.Format("{0:C}",Towbarsvalue));
                            BabySeats1.InnerHtml = Convert.ToString(String.Format("{0:C}",Towbarsvalue));
                            BabySeats2.InnerHtml = Convert.ToString(String.Format("{0:C}",Towbarsvalue));
                            BabySeats3.InnerHtml = Convert.ToString(String.Format("{0:C}",Towbarsvalue));


                            if (dataReader["EstateVehicle"] != null)
                            {
                                EstatValue = Convert.ToDouble(dataReader["EstateVehicle"]);
                            }

                            Estate.InnerHtml = Convert.ToString(String.Format("{0:C}",EstatValue));
                            Estate1.InnerHtml = Convert.ToString(String.Format("{0:C}",EstatValue));
                            Estate2.InnerHtml = Convert.ToString(String.Format("{0:C}",EstatValue));
                            Estate3.InnerHtml = Convert.ToString(String.Format("{0:C}",EstatValue));

                            if (dataReader["ControlVehicles"] != null)
                            {
                                CotnrolValue = Convert.ToDouble(dataReader["ControlVehicles"]);

                            }


                            Control.InnerHtml = Convert.ToString(String.Format("{0:C}",CotnrolValue));
                            Control1.InnerHtml = Convert.ToString(String.Format("{0:C}",CotnrolValue));
                            Control2.InnerHtml = Convert.ToString(String.Format("{0:C}",CotnrolValue));
                            Control3.InnerHtml = Convert.ToString(String.Format("{0:C}",CotnrolValue));


                            if (dataReader["EngineerFees"]!= null)
                            {
                                EngnieerFee = Convert.ToDouble(dataReader["EngineerFees"]);

                            }
                           
                           EngineerFees.InnerHtml = Convert.ToString(String.Format("{0:C}",EngnieerFee));
                           EngineerFees1.InnerHtml = Convert.ToString(String.Format("{0:C}",EngnieerFee));
                           EngineerFees2.InnerHtml = Convert.ToString(String.Format("{0:C}",EngnieerFee));
                           EngineerFees3.InnerHtml = Convert.ToString(String.Format("{0:C}",EngnieerFee));

                         //  EngineerFeesValue = Convert.ToDouble(dataReader["EngineerFees"]);

                           if (dataReader["StorageRecoveryCharges"] != null)
                           {
                               StoragechargesValue = Convert.ToDouble(dataReader["StorageRecoveryCharges"]);

                           }

                           StorageCharges.InnerHtml = Convert.ToString(String.Format("{0:C}",StoragechargesValue));
                           StorageCharges1.InnerHtml = Convert.ToString(String.Format("{0:C}",StoragechargesValue));
                           StorageCharges2.InnerHtml = Convert.ToString(String.Format("{0:C}",StoragechargesValue));
                           StorageCharges3.InnerHtml = Convert.ToString(String.Format("{0:C}",StoragechargesValue));


                           if (dataReader["ABIHandleingFees"] != null)
                           {
                               AdminFeeVAlue = Convert.ToDouble(dataReader["ABIHandleingFees"]);

                           }
                            AdminFees.InnerHtml = Convert.ToString(String.Format("{0:C}",AdminFeeVAlue));
                            AdminFees1.InnerHtml = Convert.ToString(String.Format("{0:C}",AdminFeeVAlue));
                            AdminFees2.InnerHtml = Convert.ToString(String.Format("{0:C}",AdminFeeVAlue));
                            AdminFees3.InnerHtml = Convert.ToString(String.Format("{0:C}",AdminFeeVAlue));

                            if (dataReader["AdditonalDriverCost"] != null)
                            {
                                AdditionalDriverCostValue = Convert.ToDouble(dataReader["AdditonalDriverCost"]);

                            }
                            AdditionalDriverCost.InnerHtml = Convert.ToString(String.Format("{0:C}",AdditionalDriverCostValue));
                            AdditionalDriverCost1.InnerHtml = Convert.ToString(String.Format("{0:C}",AdditionalDriverCostValue));
                            AdditionalDriverCost2.InnerHtml = Convert.ToString(String.Format("{0:C}",AdditionalDriverCostValue));
                            AdditionalDriverCost3.InnerHtml = Convert.ToString(String.Format("{0:C}",AdditionalDriverCostValue));
                           



                            //DaysHireCharges30.InnerHtml = Convert.ToString(dataReader["ControlVehicles"]);
                            //Automaticvalue = Convert.ToDouble(dataReader["DaysHireCharges30"]);
    
                            string format = "dd-MM-yyyy";

                            if (dataReader["CarhireEndDateValue"] != null)
                            {
                                DateTime HireStartDate = Convert.ToDateTime(dataReader["CarhireEndDateValue"]);
                                DateTime DateHireStartDate30 = HireStartDate.AddDays(30);
                                string DateHireStartDate30Formatted = DateHireStartDate30.ToString(format);

                                DateTime DateHireStartDate60 = HireStartDate.AddDays(60);
                                string DateHireStartDate60Formatted = DateHireStartDate60.ToString(format);

                                DateTime DateHireStartDate90 = HireStartDate.AddDays(90);
                                string DateHireStartDate90Formatted = DateHireStartDate90.ToString(format);


                                DateTime DateHireStartDate90plus = HireStartDate.AddDays(91);
                                string DateHireStartDate90Formattedplus = DateHireStartDate90plus.ToString(format);

                                //dataReader["HireCost"] * dataReader["HireCost"]/100  * 22.5

                                HireStartDate30.InnerHtml = Convert.ToString(DateHireStartDate30Formatted) + "</br> 30 Days";
                                HireStartDate60.InnerHtml = Convert.ToString(DateHireStartDate60Formatted) + "</br> 60 Days";
                                HireStartDate90.InnerHtml = Convert.ToString(DateHireStartDate90Formatted) + "</br> 90 Days";
                                HireStartDate90plus.InnerHtml = Convert.ToString(DateHireStartDate90Formattedplus) + "</br> 90+ Days";
                            }




                           double groupdailrate1 = Convert.ToDouble(dataReader["GroupDailyRate"]);

                           double NoOfDays1 = Convert.ToDouble(dataReader["NoOfDays"]);

                           double HireCost = Convert.ToDouble(dataReader["HireCost"]);



                           double ReducedRate = NoOfDays1 * groupdailrate1;

                          // double TotalValue = HireCost - ReducedRate; 
                         // double ReducedRate = HireCost - HireCost / 100 * 22.5;

                           HireCost30 = ReducedRate;

                           HireCost60 = ReducedRate + (ReducedRate / 100 * 7.5);

                           HireCost90 = ReducedRate + (ReducedRate / 100 * 15);

                           HireCost90plus = ReducedRate + (ReducedRate / 100 * 22.5);

                           //    double HireCost60 = Convert.ToDouble(dataReader["HireCost"]);                        

                          //   double HireCost90 = Convert.ToDouble(dataReader["HireCost"]);

                         //  double HireCost90 = HireCost90 +  HireCost90 / 100 * 15;

                            //double HireCost90plus = Convert.ToDouble(dataReader["HireCost"]);
                         //  HireCost90plus = HireCost90plus +  HireCost90plus / 100 * 22.5;





                            string strHireCost30 = Convert.ToString(String.Format("{0:C}", HireCost30));
                            string strHireStartDate60 = Convert.ToString(String.Format("{0:C}", HireCost60));
                            string strHireStartDate90 = Convert.ToString(String.Format("{0:C}", HireCost90));
                            string strHireStartDate90plus = Convert.ToString(String.Format("{0:C}", HireCost90plus));

                            DaysHireCharges30.InnerHtml = strHireCost30;
                            DaysHireCharges60.InnerHtml = strHireStartDate60;
                            DaysHireCharges90.InnerHtml = strHireStartDate90;
         DaysHireCharges90plus.InnerHtml = strHireStartDate90plus;


      

         TotalChargesvalue = Convert.ToDouble(Automaticvalue + EstatValue + CotnrolValue + AdditionalDriverCostValue + Towbarsvalue
          + StoragechargesValue +  EngnieerFee +  AdminFeeVAlue +  DelveryChargesValue + HireCost30);

        TotalCharges.InnerHtml = String.Format("{0:C}", TotalChargesvalue);
        TotalCharges60value = Convert.ToDouble(Automaticvalue + EstatValue + CotnrolValue + AdditionalDriverCostValue + Towbarsvalue
        + StoragechargesValue + EngnieerFee + AdminFeeVAlue + DelveryChargesValue + HireCost60);
        TotalCharges60.InnerHtml = String.Format("{0:C}", TotalCharges60value);

        TotalCharges90value = Convert.ToDouble(Automaticvalue + EstatValue + CotnrolValue + AdditionalDriverCostValue + Towbarsvalue
        + StoragechargesValue + EngnieerFee + AdminFeeVAlue + DelveryChargesValue + HireCost90);
        TotalCharges90.InnerHtml = String.Format("{0:C}", TotalCharges90value);


         TotalCharges90Plusvalue = Convert.ToDouble(Automaticvalue + EstatValue + CotnrolValue + AdditionalDriverCostValue + Towbarsvalue
        + StoragechargesValue + EngnieerFee + AdminFeeVAlue + DelveryChargesValue + HireCost90plus);
         TotalCharges90Plus.InnerHtml = String.Format("{0:C}", TotalCharges90Plusvalue);
  


//        double TotalCharges90PlusvalueVAT = TotalCharges90Plusvalue + TotalCharges90Plusvalue / 100 * 22.5;



        //double TotalCharges90PlusvalueVAT = TotalCharges90Plusvalue + TotalCharges90Plusvalue / 100 * 22.5;
        //double TotalCharges90PlusvalueVAT = TotalCharges90Plusvalue + TotalCharges90Plusvalue / 100 * 22.5;
        //double TotalCharges90PlusvalueVAT = TotalCharges90Plusvalue + TotalCharges90Plusvalue / 100 * 22.5;
        // ///   double Vatvalue = String.Format("{0:C}", TotalChargesvalue/100 *vatadminvalue);




                           
       
                        
           }

            }




            }




            bool CarHireVATRegistered = false;
            bool StorageHireVatRegistered = false;
            bool EngineerVatRegistered = false;

            using (SqlConnection sqlConnection = new SqlConnection(UC_LIVE.Properties.Settings.Default.ConnectionString))
            {
             

                double CarhireChargesValue = Automaticvalue + EstatValue + CotnrolValue + AdditionalDriverCostValue + Towbarsvalue
                                + AdminFeeVAlue + DelveryChargesValue + HireCost30;

                double CarhireChargesValue1 = Automaticvalue + EstatValue + CotnrolValue + AdditionalDriverCostValue + Towbarsvalue
                              + AdminFeeVAlue + DelveryChargesValue + HireCost60;


                double CarhireChargesValue2 = Automaticvalue + EstatValue + CotnrolValue + AdditionalDriverCostValue + Towbarsvalue
                              + AdminFeeVAlue + DelveryChargesValue + HireCost90;

                double CarhireChargesValue3 = Automaticvalue + EstatValue + CotnrolValue + AdditionalDriverCostValue + Towbarsvalue
                              + AdminFeeVAlue + DelveryChargesValue + HireCost90plus;

                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("select * from Contact,ClaimContact where ClaimContact.ClaimID=@ClaimID and Contact.ContactTypeID=4 and Contact.ContactID=ClaimContact.ContactID and VATRegistered='Yes'", sqlConnection))
                {

                    sqlCommand.Connection.Open();
                    sqlCommand.Parameters.AddWithValue("ClaimID", Request.QueryString["ClaimID"]);

                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                        if (dataReader.Read())
                        {
                             

                            TotalCarhireVAT = CarhireChargesValue / 100 * vatadminvalue;
                            TotalCarhireVAT1 = CarhireChargesValue1 / 100 * vatadminvalue;
                            TotalCarhireVAT2 = CarhireChargesValue2 / 100 * vatadminvalue;
                            TotalCarhireVAT3 = CarhireChargesValue3 / 100 * vatadminvalue;

                            GrandTotalCarhire = TotalCarhireVAT + CarhireChargesValue;

                            VAT = VAT + TotalCarhireVAT;
                            VAT1 = VAT1 + TotalCarhireVAT1;
                            VAT2 = VAT2 + TotalCarhireVAT2;
                            VAT3 = VAT3 + TotalCarhireVAT3;

                        }

                        else
                        {

                            GrandTotalCarhire = CarhireChargesValue;
                        
                        }

                    
                }

                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("select * from Contact,ClaimContact where ClaimContact.ClaimID=@ClaimID and Contact.ContactTypeID=5 and Contact.ContactID=ClaimContact.ContactID and VATRegistered='Yes'", sqlConnection))
                {
                    GrandTotalStorage = StoragechargesValue;
             
                    sqlCommand.Parameters.AddWithValue("ClaimID", Request.QueryString["ClaimID"]);

                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                        if (dataReader.Read())
                        {

                                                       
                            StoragechargesValueVAT = StoragechargesValue / 100 * vatadminvalue;      

                            StorageVatPlusValue = StoragechargesValue + StoragechargesValueVAT;

                            VAT = VAT + StoragechargesValueVAT;
                            VAT1 = VAT1 + StoragechargesValueVAT;
                            VAT2 = VAT2 + StoragechargesValueVAT;
                            VAT3 = VAT3 + StoragechargesValueVAT;

                        }

                        else
                        
                        {

                            GrandTotalStorage = StoragechargesValue;
                        
                        }
                }



                using (System.Data.SqlClient.SqlCommand sqlCommand = new System.Data.SqlClient.SqlCommand("select * from Contact,ClaimContact where ClaimContact.ClaimID=@ClaimID and Contact.ContactTypeID=3 and Contact.ContactID=ClaimContact.ContactID and VATRegistered='Yes'", sqlConnection))
                {


                    sqlCommand.Parameters.AddWithValue("ClaimID", Request.QueryString["ClaimID"]);

                    using (System.Data.IDataReader dataReader = sqlCommand.ExecuteReader())

                        if (dataReader.Read())
                        {
                            EngineerFeesValueVAT = EngnieerFee / 100 * vatadminvalue;


                            GrandTotalEngineer = EngnieerFee + EngineerFeesValueVAT;


                            VAT = VAT + EngineerFeesValueVAT;
                            VAT1 = VAT1 + EngineerFeesValueVAT;
                            VAT2 = VAT2 + EngineerFeesValueVAT;
                            VAT3 = VAT3 + EngineerFeesValueVAT;

                        }
                        else
                        {

                            GrandTotalEngineer = EngnieerFee;
                        }
                }

              

   
                if (CarHireVATRegistered == true)
                {

                    double HireChargesValue = Convert.ToDouble(Automaticvalue + EstatValue + CotnrolValue + AdditionalDriverCostValue + Towbarsvalue
                  + AdminFeeVAlue + DelveryChargesValue + HireCost30);

                 
                    double TotalHireVat = HireChargesValue + HireChargesValue / 100 * vatadminvalue;

                }

                if (StorageHireVatRegistered == true)
                {

                    double StorageVatValue = Convert.ToDouble(StoragechargesValue);
                    double TotalStorageVatValue = StorageVatValue + StorageVatValue / 100 * vatadminvalue;

                }

                if (EngineerVatRegistered == true)
                {

                    double EngineerVatValue = Convert.ToDouble(EngineerFees);
                    double TotalHireVat = EngineerVatValue + EngineerVatValue / 100 * vatadminvalue;

                }



                string formattedVAT = String.Format("{0:C}", VAT);

                string formattedVAT1 = String.Format("{0:C}", VAT1);

                string formattedVAT2 = String.Format("{0:C}", VAT2);

                string formattedVAT3 = String.Format("{0:C}", VAT3);

                VATDiv.InnerHtml = Convert.ToString(formattedVAT);
                VATDiv1.InnerHtml = Convert.ToString(formattedVAT1);
                VATDiv2.InnerHtml = Convert.ToString(formattedVAT2);
                VATDiv3.InnerHtml = Convert.ToString(formattedVAT3);


                 string TotalChargesvalue30 = String.Format("{0:C}", TotalChargesvalue + VAT);
                 string TotalChargesvalue60 = String.Format("{0:C}", TotalCharges60value + VAT1);
                 string TotalChargesvalue90 = String.Format("{0:C}", TotalCharges90value + VAT2);
                 string TotalChargesvalue90plus = String.Format("{0:C}", TotalCharges90Plusvalue + VAT3);

                 ThirtydaysGrandTotal.InnerHtml = Convert.ToString(TotalChargesvalue30);
                 SixetydaysGrandTotal.InnerHtml = Convert.ToString(TotalChargesvalue60);
                 NightydaysGrandTotal.InnerHtml = Convert.ToString(TotalChargesvalue90);
                 NightyPlusdaysGrandTotal.InnerHtml = Convert.ToString(TotalChargesvalue90plus);

             
               

            }

        }
    }
}