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
	public partial class SendEmail1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{


            ToEmail.Text = Request.QueryString["ID"];
            FromEmail.Text = "info@uclive.co.uk";
		

			
		}
	protected void SendEmail_Click1(object sender, EventArgs e)
		{


			try
			{


				string ToEmailValue;
				System.Text.StringBuilder stringBuilder = new System.Text.StringBuilder();


				if (FileUpload2.HasFile)
				{
					HttpPostedFile PostedFile = FileUpload2.PostedFile;

					int FileSizeKB = PostedFile.ContentLength / 1024;

					string extension = System.IO.Path.GetExtension(FileUpload2.FileName).ToLower();
					string strFileName = System.IO.Path.GetFileNameWithoutExtension(FileUpload2.FileName).ToLower();
					stringBuilder.Remove(0, stringBuilder.Length);

					// Send the email to Custoemr for booking details. Put the booking information in message one you completed the booking.

					System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient("mail.uclive.co.uk");

                    smtpClient.Credentials = new System.Net.NetworkCredential("info@uclive.co.uk", "password123");
					//System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient("92.48.110.7");

					System.Net.Mail.MailMessage mailMessage = new System.Net.Mail.MailMessage();


					mailMessage.Attachments.Add(new System.Net.Mail.Attachment(PostedFile.FileName));
					//mailMessage.Attachments.Add(new System.Net.Mail.Attachment(string.Concat(System.IO.Directory.GetCurrentDirectory(),strFileName)));

					mailMessage.From = new System.Net.Mail.MailAddress("info@uclive.co.uk");

					mailMessage.Subject = SubjectTextbox.Text;

                    string MessageValue = RadEditor1.Content;

					stringBuilder.Append(string.Format(MessageValue));

					mailMessage.Body = stringBuilder.ToString();

					mailMessage.IsBodyHtml = true;

					if (ToEmail.Text != "")
					{
						ToEmailValue = ToEmail.Text;
					}

					else
					{

						ToEmailValue = "info@uclive.co.uk";

					}

#if DEBUG
                    mailMessage.To.Add("info@uclive.co.uk");
#else
				
                mailMessage.To.Add(ToEmailValue);
#endif
					smtpClient.Send(mailMessage);

					//TxtNameCV.Text = string.Empty;




					Msg2.InnerHtml = "<span style='font-weight:bold;font-size:12px;'> Email sent successfully!</span><br/>";
				}
			}
			catch (Exception EXC)
			{
				Msg2.InnerHtml = "Error Message: Email Message was not in correct format. Please only use text or typed HTML";
				
			}
			finally
			{

			}
		}
	}
}
