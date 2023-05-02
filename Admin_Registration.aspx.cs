using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Admin_Registration : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    SqlDataAdapter adp1 = new SqlDataAdapter("select * from tblregistration", @"Data Source=.\MYSQL2016;Initial Catalog=Online_Blood_Donation_System;User ID=sa;Password=admin1234");
    DataTable dt1 = new DataTable();
    private void ShowAdminInfo()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS4"].ConnectionString;

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand Cmd = new SqlCommand();
            Cmd.Connection = con;
            Cmd.CommandText = "select * from tblregistration where Email = @Email";
            Cmd.Parameters.AddWithValue("@Email", Session["Email"].ToString().Trim());

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = Cmd;
            da.Fill(dt);
        }
        lblAdminId.Text = dt.Rows[0]["Email"].ToString().Trim();
        lblAdminName.Text = dt.Rows[0]["First_Name"].ToString().Trim();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        adp1.Fill(dt1);
        SqlCommandBuilder str1 = new SqlCommandBuilder(adp1);
        btnSubmit.Visible = false;
        ShowAdminInfo();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtFirstname.Text != "" && txtEmail.Text != "" && txtLastname.Text != "" && txtPhoneNo.Text != "" && txtPassword.Text != "" && txtConpassword.Text != "")
        {

            if (txtPassword.Text == txtConpassword.Text)
            {

                MailMessage mail = new MailMessage();
                mail.To.Add(txtEmail.Text.ToString().Trim());
                mail.From = new MailAddress("khamraisarthak7866@gmail.com");
                mail.Subject = "Online Blood And Organ Donation System";
                mail.Body = "<p>sir <br/>You have Sucessfully Registered in Donation System</p>";
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Host = "smtp.gmail.com";
                smtp.Credentials = new System.Net.NetworkCredential("khamraisarthak7866@gmail.com", "rxnvsiinadgsrdps");
                smtp.Send(mail);

            }
            else
            {
               Alert("Fill in the Carefully!!!");

            }



            string name = txtFirstname.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhoneNo.Text.Trim();
            string Lname = txtLastname.Text.Trim();
            string password = txtPassword.Text.Trim();


            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmdInsert = new SqlCommand();
                cmdInsert.Connection = con;
                cmdInsert.CommandText = "insert into tblregistration values(@First_Name,@Last_Name,@Email,@Password,@Phone_no)";
                cmdInsert.Parameters.AddWithValue("@First_Name", name);
                cmdInsert.Parameters.AddWithValue("@Last_Name", Lname);
                cmdInsert.Parameters.AddWithValue("@Email", email);
                cmdInsert.Parameters.AddWithValue("@Password", password);
                cmdInsert.Parameters.AddWithValue("@Phone_no", phone);
                cmdInsert.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
                 Alert("Sucessfully Registered");
                con.Close();
            }

        }
        else
        {
            Alert("Please Fill in carefully!!!");
        }
    }
    protected void btnVaryfy_Click(object sender, EventArgs e)
    {
        DataRow[] dr1 = dt1.Select("Email='" + txtEmail.Text + "'");
        try
        {
            Alert("Hi......" + dr1[0]["Email"].ToString() +   "  Email is Exit");
        }
        catch
        {
            Alert( "Hi...    " + txtEmail.Text + "   is Veryfiy");
            btnSubmit.Visible = true;
            btnVaryfy.Visible = false;
        }

    }
}