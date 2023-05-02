using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            if(txtEmail.Text != "" && txtName.Text != "" && txtWrite.Text != "")
            {
                string name = txtName.Text.Trim();
                string Email = txtEmail.Text.Trim();
                string Write = txtWrite.Text.Trim();


                string cs = ConfigurationManager.ConnectionStrings["DBCS23"].ConnectionString;

                using(SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmdInsert = new SqlCommand();
                    cmdInsert.Connection = con;
                    cmdInsert.CommandText = "insert into tblMessage values(@Name,@Email,@Message)";
                    cmdInsert.Parameters.AddWithValue("@Name",name);
                    cmdInsert.Parameters.AddWithValue("@Email",Email);
                    cmdInsert.Parameters.AddWithValue("@Message",Write);
                    cmdInsert.ExecuteNonQuery();


                    //MailMessage mail = new MailMessage();
                    //mail.To.Add(txtEmail.Text.ToString().Trim());
                    //mail.From = new MailAddress("khamraisarthak7866@gmail.com");
                    //mail.Subject = "Online Blood And Organ Donation System";
                    //mail.Body = "Sir.." + txtWrite.Text + " ";
                    //mail.IsBodyHtml = true;
                    //SmtpClient smtp = new SmtpClient();
                    //smtp.Port = 587;
                    //smtp.EnableSsl = true;
                    //smtp.UseDefaultCredentials = false;
                    //smtp.Host = "smtp.gmail.com";
                    //smtp.Credentials = new System.Net.NetworkCredential("khamraisarthak7866@gmail.com", "rxnvsiinadgsrdps");
                    //smtp.Send(mail);
                }
            }
        }
        catch
        {
        }
    }
}