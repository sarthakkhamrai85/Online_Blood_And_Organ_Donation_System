using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

public partial class User_Dasbord : System.Web.UI.Page
{
    public void toatalOrgan()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS13"].ConnectionString;
        
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
        string cs = ConfigurationManager.ConnectionStrings["DBCS13"].ConnectionString;


        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "select count(Email) from tblDonationFrom where Type = 'BloodDonate'";
            int Count = Convert.ToInt32(cmd.ExecuteScalar().ToString().Trim());
            lblBlood.InnerText = Count.ToString();

        }
    }

    public void totalBloodCapm()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS13"].ConnectionString;


        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "select count(Email) from tblBlood_Camp";
            int Count = Convert.ToInt32(cmd.ExecuteScalar().ToString().Trim());
          lblBloodCamp.InnerText = Count.ToString();

        }
    }
    public void totalBloodBank()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS13"].ConnectionString;


        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            con.Open();
            cmd.CommandText = "select count(Blood_Group_Name) from tblBlood_Bank_Status";
            int Count = Convert.ToInt32(cmd.ExecuteScalar().ToString().Trim());
           

        }
    }

    private void ShowUpdate()
    {
        DataTable dt = new DataTable();
        string cs = ConfigurationManager.ConnectionStrings["DBCS13"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tblNotice";
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
        }
        StringBuilder updatehtml = new StringBuilder();
        updatehtml.Append("<ul>");
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                updatehtml.Append("<li>");
                updatehtml.Append(row["Message"].ToString().Trim());
                updatehtml.Append("<br>Updated on : ");
                updatehtml.Append(row["Date"].ToString().Trim());
                updatehtml.Append("</li>");
            }
        }
        else
        {
            updatehtml.Append("<li style='color: green;'>There is no new update.</li>");
        }
        updatehtml.Append("</ul>");
        update.InnerHtml += updatehtml.ToString();
    }
    private void ShowUSerInfo()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS4"].ConnectionString;

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand Cmd = new SqlCommand();
            Cmd.Connection = con;
            Cmd.CommandText = "select * from tblUser_Registration where Email = @Email";
            Cmd.Parameters.AddWithValue("@Email", Session["Email"].ToString().Trim());

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = Cmd;
            da.Fill(dt);
        }
        lblAdminId.Text = dt.Rows[0]["Email"].ToString().Trim();
        lblAdminName.Text = dt.Rows[0]["First_Name"].ToString().Trim() + " " + dt.Rows[0]["Last_Name"].ToString().Trim();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            ShowUpdate();
            toatalOrgan();
            totalBlood();
            totalBloodCapm();
            ShowUSerInfo();
        }
    }

}