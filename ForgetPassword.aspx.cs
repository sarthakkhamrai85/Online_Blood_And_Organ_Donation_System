using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;

public partial class User_ForgetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        String password;
        String mycon = @"Data Source=.\MYSQL2016;Initial Catalog=Online_Blood_Donation_System;User ID=sa;Password=admin1234";
        String myquery = "Select * from tblUser_Registration where First_Name='" + txtName.Text + "'and Last_Name='" + txtLast.Text + "' and Email='" + txtEmail.Text + "'";
        SqlConnection con = new SqlConnection(mycon);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            //Label3.Text = "Data Found";

            password = ds.Tables[0].Rows[0]["Password"].ToString();
            sendpassword(password, txtEmail.Text);
            lblError.Text = "Your Password Has Been Sent to Registered Email Address. Check Your Mail Inbox";
            Response.Redirect("User_Login.aspx");

        }
        else
        {
            lblError.Text = "Your Username is Not Valid or Email Not Registered";

        }
        con.Close();
        //   Response.Redirect("Login1.aspx");

    }
    private void sendpassword(String password, String email)
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587; //25 487
        smtp.Credentials = new System.Net.NetworkCredential("khamraisarthak7866@gmail.com", "rxnvsiinadgsrdps");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Forgot Password (Online Blood And Organ Donation System)";
        msg.Body = "Dear " + txtName.Text + " " + txtLast.Text + ", Your Password is  " + password + "\n\n\nThanks & Regards\naOnline Blood And Organ Donation System";
        string toaddress = txtEmail.Text;
        msg.To.Add(toaddress);
        string fromaddress = "Online Blood And Organ Donation System <khamraisarthak7866@gmail.com>";
        msg.From = new MailAddress(fromaddress);
        try
        {
            smtp.Send(msg);


        }
        catch
        {
            throw;
        }
    }
}