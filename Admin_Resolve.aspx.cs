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

public partial class Admin_Admin_Resolve : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
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
        lblAdminName.Text = dt.Rows[0]["First_Name"].ToString().Trim() + " " + dt.Rows[0]["Last_Name"].ToString().Trim();
    }
    public void gvLederLoad()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS4"].ConnectionString;

        DataTable dt = new DataTable();
        using(SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from tblMedical",con);
            da.Fill(dt);
        }
        gvLeader.DataSource = dt;
        gvLeader.DataBind();
        if (dt.Rows.Count == 0)
        {
            Label lbl = gvLeader.Controls[0].Controls[0].FindControl("lblError") as Label;
            lbl.Text = "No data found.";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            ShowAdminInfo();
            gvLederLoad();
        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "Approve")
        {
            txtComentBox.Visible = false;
        }
        else
            txtComentBox.Visible = true;

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "Approve")
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(txtEmail.Text.ToString().Trim());
            mail.From = new MailAddress("khamraisarthak7866@gmail.com");
            mail.Subject = "Online Blood And Organ Donation System";
            mail.Body = "<p>sir <br/>You are approved for the medical test</p>";
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Host = "smtp.gmail.com";
            smtp.Credentials = new System.Net.NetworkCredential("khamraisarthak7866@gmail.com", "rxnvsiinadgsrdps");
            smtp.Send(mail);
        }
        else if (RadioButtonList1.SelectedValue == "Deny")
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(txtEmail.Text.ToString().Trim());
            mail.From = new MailAddress("khamraisarthak7866@gmail.com");
            mail.Subject = "Online Blood And Organ Donation System";
            mail.Body = "Sir.." + txtComentBox.Text + " ";
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
            MailMessage mail = new MailMessage();
            mail.To.Add(txtEmail.Text.ToString().Trim());
            mail.From = new MailAddress("khamraisarthak7866@gmail.com");
            mail.Subject = "Online Blood And Organ Donation System";
            mail.Body = "sir.." + txtComentBox.Text + " ";
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Host = "smtp.gmail.com";
            smtp.Credentials = new System.Net.NetworkCredential("khamraisarthak7866@gmail.com", "rxnvsiinadgsrdps");
            smtp.Send(mail);
        }

    }
}