using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_Blood_Donate_Registration_From : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
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
        txtFirstname.Text = dt.Rows[0]["First_Name"].ToString();
        txtLastname.Text = dt.Rows[0]["Last_Name"].ToString();
        txtMobile.Text = dt.Rows[0]["Mobile_No"].ToString();
        txtEmail.Text = dt.Rows[0]["Email"].ToString();
        txtDate.Text = dt.Rows[0]["Date_of_Birth"].ToString();
        ShowUSerInfo();
    }
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList2.SelectedValue == "Organdonate")
        {
            DropDownList2.Visible = true;
            DropDownList1.Visible = false;
        }
        else
        {
            DropDownList1.Visible = true;
            DropDownList2.Visible = false;
        }
    }
    //protected void btnNext_Click(object sender, EventArgs e)
    //{

    //}
    protected void btnNext_Click1(object sender, EventArgs e)
    {
        string Fname = txtFirstname.Text.Trim();
        string Lname = txtLastname.Text.Trim();
        string Email = txtEmail.Text.Trim();
        string Phone = txtMobile.Text.Trim();
        string City = txtCity.Text.Trim();
        string Date = txtDate.Text.Trim();
        string Gender = RadioButtonList1.Text.Trim();
        string Blood = RadioButtonList2.Text.Trim();
        string BloodGropu = DropDownList1.Text.Trim();
        string OrganName = DropDownList2.Text.Trim();


        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmdInsert = new SqlCommand();
            cmdInsert.Connection = con;
            cmdInsert.CommandText = "insert into tblDonationFrom values(@First_name,@Last_name,@Email,@Phone_No,@Gender,@Blood_Group,@Organ_name,@Date_Of_Birth,@City,@Type)";
            cmdInsert.Parameters.AddWithValue("@First_name", Fname);
            cmdInsert.Parameters.AddWithValue("@Last_name", Lname);
            cmdInsert.Parameters.AddWithValue("@Email", Email);
            cmdInsert.Parameters.AddWithValue("@Phone_No", Phone);
            cmdInsert.Parameters.AddWithValue("@Gender", Gender);
            cmdInsert.Parameters.AddWithValue("@Blood_Group", BloodGropu);
            cmdInsert.Parameters.AddWithValue("@Organ_name", OrganName);
            cmdInsert.Parameters.AddWithValue("@Date_Of_Birth", Date);
            cmdInsert.Parameters.AddWithValue("@City", City);
            cmdInsert.Parameters.AddWithValue("@Type", Blood);
            cmdInsert.ExecuteNonQuery();
             Response.Redirect("ApplyForMedicalTest.aspx");
        }
    }
}