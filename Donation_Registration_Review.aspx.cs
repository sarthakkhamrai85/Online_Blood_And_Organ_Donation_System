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
public partial class Admin_Donation_Registration_Review : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    public void gvLeaderLoad()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS5"].ConnectionString;

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from tblDonationFrom", con);
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
        if (!IsPostBack)
        {
            gvLeaderLoad();
        }
        ShowAdminInfo();
    }
    protected void gvLeader_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvLeader.EditIndex = e.NewEditIndex;
        gvLeaderLoad();
        gvLeader.EditRowStyle.BackColor = System.Drawing.Color.LightPink;
    }
    protected void gvLeader_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string Email = gvLeader.DataKeys[e.RowIndex].Value.ToString();
        string Lname = (gvLeader.Rows[e.RowIndex].FindControl("txtEditLname") as TextBox).Text.Trim();
        string Phone = (gvLeader.Rows[e.RowIndex].FindControl("txtEditPhone") as TextBox).Text.Trim();
        string Fname = (gvLeader.Rows[e.RowIndex].FindControl("txtEditFname") as TextBox).Text.Trim();
        string Gender = (gvLeader.Rows[e.RowIndex].FindControl("txtEditGender") as TextBox).Text.Trim();
        string BloodGroup = (gvLeader.Rows[e.RowIndex].FindControl("txtEditBlood") as TextBox).Text.Trim();
        string Organname = (gvLeader.Rows[e.RowIndex].FindControl("txtEditOrgan") as TextBox).Text.Trim();
        string date = (gvLeader.Rows[e.RowIndex].FindControl("txtEditDate") as TextBox).Text.Trim();



        string cs = ConfigurationManager.ConnectionStrings["DBCS5"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmdUpdateUser = new SqlCommand();
            cmdUpdateUser.Connection = con;
            cmdUpdateUser.CommandText = "update tblDonationFrom set First_name=@First_name,  Last_name=@Last_name, Phone_No=@Phone_No, Gender= @Gender,  Blood_Group= @Blood_Group, Organ_name= @Organ_name, Date_Of_Birth=@Date_Of_Birth, Email=@Email  where Email = @Email";
            cmdUpdateUser.Parameters.AddWithValue("@First_name", Fname);
            cmdUpdateUser.Parameters.AddWithValue("@Last_name", Lname);
            cmdUpdateUser.Parameters.AddWithValue("@Phone_No", Phone);
            cmdUpdateUser.Parameters.AddWithValue("@Gender", Gender);
            cmdUpdateUser.Parameters.AddWithValue("@Blood_Group", BloodGroup);
            cmdUpdateUser.Parameters.AddWithValue("@Organ_name", Organname);
            cmdUpdateUser.Parameters.AddWithValue("@Date_Of_Birth", date);
            cmdUpdateUser.Parameters.AddWithValue("@Email", Email);
            cmdUpdateUser.ExecuteNonQuery();


            gvLeader.EditIndex = -1;
            gvLeaderLoad();
            string message = "Leader updated successfully.";
            Alert(message);
            gvLeader.Rows[e.RowIndex].BackColor = System.Drawing.Color.LightGreen;
        }
    }
    protected void gvLeader_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string Email = gvLeader.DataKeys[e.RowIndex].Value.ToString();

        string cs = ConfigurationManager.ConnectionStrings["DBCS5"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from tblDonationFrom where Email=@Email ";
            cmd.Parameters.AddWithValue("@Email", Email);
            con.Open();
            cmd.ExecuteNonQuery();


            gvLeader.EditIndex = -1;
            gvLeaderLoad();
            string message = " Delete successfully.";
            Alert(message);
        }
    }
    protected void gvLeader_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvLeader.EditIndex = -1;
        gvLeaderLoad();
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        MailMessage mail = new MailMessage();
        mail.To.Add(txtEmail.Text.ToString().Trim());
        mail.From = new MailAddress("khamraisarthak7866@gmail.com");
        mail.Subject = "Online Blood And Organ Donation System";
        mail.Body = "Sir " + txtContent.Text + " ";
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