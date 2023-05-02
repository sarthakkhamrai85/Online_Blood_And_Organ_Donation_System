using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Admin_Dasbord : System.Web.UI.Page
{
    public void toatalOrgan()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS8"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "select count (Email) from tblDonationFrom where Type = 'OrganDonate'";
            int Count = Convert.ToInt32(cmd.ExecuteScalar().ToString().Trim());
            lblOrgan.InnerText = Count.ToString();
        }
    }
    public void totalBlood()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS8"].ConnectionString;


        using(SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "select count(Email) from tblDonationFrom where Type = 'BloodDonate'";
            int Count = Convert.ToInt32(cmd.ExecuteScalar().ToString().Trim());
            lblBlood.InnerText = Count.ToString();

        }
    }
    public void totalRegistration()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS8"].ConnectionString;


        using(SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "select count(Email) from tblUser_Registration";
            int Count = Convert.ToInt32(cmd.ExecuteScalar().ToString().Trim());
            lblRegistration.InnerText = Count.ToString();
        }
    }
    public void totalAmbulence()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS8"].ConnectionString;

        using(SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "select count(Phone_No) from tblAmbullence";
            int Count = Convert.ToInt32(cmd.ExecuteScalar().ToString().Trim());
            lblAmbulence.InnerText = Count.ToString();
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
        toatalOrgan();
        totalBlood();
        totalRegistration();
        totalAmbulence();
        ShowAdminInfo();
        
            if (Session["ywivreqi"] == null || Session["rcuuyqtf"] == null)
            {
                string prevPage = Request.Url.AbsoluteUri;
                Response.Redirect("Admin_Login.aspx?Mode=Redirect&Url=" + prevPage);
            }
    }
    protected void btnLocal_Click(object sender, EventArgs e)
    {
        string today = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
        lblLocal.Text = today;
    }
    protected void btnServer_Click(object sender, EventArgs e)
    {
        string today = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd-MM-yyyy HH:mm:ss");
        lblServer.Text = today;
    }
    protected void btnDay_Click(object sender, EventArgs e)
    {
        string today = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dddd");
        lblDay.Text = today;
    }
}