using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Admin_Profil : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    public void Reload(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});window.location.replace(window.location.href);", m);
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
        lblAdminName.Text = dt.Rows[0]["First_Name"].ToString().Trim();
        lblId.Text = dt.Rows[0]["Password"].ToString();
        lblFName.InnerText = dt.Rows[0]["First_Name"].ToString();
        lblLanme.InnerText = dt.Rows[0]["Last_Name"].ToString();
        lblMobile.InnerText = dt.Rows[0]["Phone_no"].ToString();
        lblEmail.InnerText = dt.Rows[0]["Email"].ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ShowAdminInfo();
    }
    protected void linkClose_Click(object sender, EventArgs e)
    {
        passwordUpdatePanel.Visible = false;
        txtFisrtName.Text = txtLastName.Text = txtPhoneNo.Text = "";
    }
    protected void btnEditPassword_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        string cs = ConfigurationManager.ConnectionStrings["DBCS11"].ConnectionString;

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
         txtOldPassword.Text = dt.Rows[0]["Password"].ToString().Trim();

    }
    protected void linkEdit_Click1(object sender, EventArgs e)
    {
        passwordUpdatePanel.Visible = true;
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
        txtFisrtName.Text = dt.Rows[0]["First_Name"].ToString().Trim();
        txtLastName.Text = dt.Rows[0]["Last_Name"].ToString().Trim();
        txtPhoneNo.Text = dt.Rows[0]["Phone_no"].ToString().Trim();
        txtEmail.Text = dt.Rows[0]["Email"].ToString().Trim();
        txtEmail.Enabled = false;
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string Fname = txtFisrtName.Text.Trim();
        string Lname = txtLastName.Text.Trim();
        string Phone = txtPhoneNo.Text.Trim();
        string Emial = txtEmail.Text.Trim();


         string cs = ConfigurationManager.ConnectionStrings["DBCS11"].ConnectionString;

         using (SqlConnection con = new SqlConnection(cs))
         {
             con.Open();
             SqlCommand cmdUpdateUser = new SqlCommand();
             cmdUpdateUser.Connection = con;
             cmdUpdateUser.CommandText = "update tblregistration set First_Name=@First_Name,Last_Name=@Last_Name,Phone_no=@Phone_no where Email=@Email";
             cmdUpdateUser.Parameters.AddWithValue("@First_Name",Fname);
             cmdUpdateUser.Parameters.AddWithValue("@Last_Name",Lname);
             cmdUpdateUser.Parameters.AddWithValue("@Phone_no", Phone);
             cmdUpdateUser.Parameters.AddWithValue("@Email", Emial);
             cmdUpdateUser.ExecuteNonQuery();
             Alert("Update Sucessfully!!");
             con.Close();

         }
         Response.Redirect(Request.RawUrl);
    }
    protected void PasswordUpdate_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        txtPassword.Text = txtCPassword.Text = txtOldPassword.Text = "";
    }
    protected void btnUpdatePassword_Click(object sender, EventArgs e)
    {
        
        string cs = ConfigurationManager.ConnectionStrings["DBCS11"].ConnectionString;

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
        string email = Session["Email"].ToString();
        string password = dt.Rows[0]["Password"].ToString().Trim();
        string oldpassword = txtOldPassword.Text.Trim();
        string newpassword = txtPassword.Text.Trim();
        string confirmpassword = txtCPassword.Text.Trim();
        if (oldpassword != "" && newpassword != "" && confirmpassword != "")
        {
            if (newpassword == confirmpassword)
            {
                if (password == oldpassword)
                {
                    try
                    {
                        using (SqlConnection con = new SqlConnection(cs))
                        {
                            SqlCommand cmd = new SqlCommand();
                            cmd.Connection = con;
                            cmd.CommandText = "update tblregistration set Password = @Password where Email = @Email";
                            cmd.Parameters.AddWithValue("@Password", newpassword);
                            cmd.Parameters.AddWithValue("@Email", email);
                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                        Reload("Password changed successfully.");
                    }
                    catch
                    {
                        
                    }
                }
                else
                    Alert("Current password does not match!");
            }
            else
                Alert("New password and confirm password does not match!");
        }
        else
            Alert("Please fill all fields.");
    }
}