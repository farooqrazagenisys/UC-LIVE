using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IntelliSoftware;
using System.Collections.Specialized;
namespace UC_LIVE
{
    public partial class SendSMS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {

                ToTextBox.Text = Request.QueryString["ID"];


            }
        }

        protected void SendMessage_Click(object sender, EventArgs e)
        {


            IntelliSMS objIntelliSMS = new IntelliSMS();

            objIntelliSMS.Username = "universal";
            objIntelliSMS.Password = "universal1";

            string phone = Convert.ToString(ToTextBox.Text);
   

            String MessageId = objIntelliSMS.SendMsg(phone,SMSText.Text, From.Text);

            messageid.InnerHtml = "Message Sent Succesfully";
            
            
            
            //MMSMessage NewMMSMessage = new MMSMessage();
            //NewMMSMessage.Subject = "MMS Message Subject";
            ////MessagePart MessagePart1 = new MessagePart();
            ////MessagePart1.SourceFilename = "C:\Image1.gif";
            ////NewMMSMessage.MessageParts.Add ( MessagePart1 );
            //MessagePart MessagePart2 = new MessagePart();
            //MessagePart2.Filename = "Text1.txt";
            //MessagePart2.Text = Text.Text;
            //NewMMSMessage.MessageParts.Add ( MessagePart2 );
            //IntelliSMS objIntelliSMS = new IntelliSMS();
            //objIntelliSMS.Username = "Claims";
            //objIntelliSMS.Password = "ambi2627x";
            //StringCollection ToList = new StringCollection();
            //ToList.Add (To.Text);    
            //SendStatusCollection SendStatusList;
            //SendStatusList = objIntelliSMS.SendMMSMessage
            //( ToList, NewMMSMessage );
        }


        protected void Button1_Click(object sender, EventArgs e)
        {

          //  string ClaimID1 = Convert.ToString(Request.QueryString["ClaimID"]);
            Response.Redirect("~/home1.aspx");
        }

    }
     
}
