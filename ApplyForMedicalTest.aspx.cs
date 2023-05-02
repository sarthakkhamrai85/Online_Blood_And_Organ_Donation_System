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

public partial class User_ApplyForMedicalTest : System.Web.UI.Page
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
    private void ShowUSerInfo()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS22"].ConnectionString;

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
        txtEmail.Text = dt.Rows[0]["Email"].ToString().Trim();
        txtName.Text = dt.Rows[0]["First_Name"].ToString().Trim() + " " + dt.Rows[0]["Last_Name"].ToString().Trim();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowUSerInfo();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.Text != "" && RadioButtonList2.Text != "")
        {
            string radiobutton1 = RadioButtonList1.Text.Trim();
            string radiobutton2 = RadioButtonList2.Text.Trim();
            string disease = txtDiseaseName.Text.Trim();
            string blood = txtBlood.Text.Trim();
            string Email = txtEmail.Text.Trim();
            string name = txtName.Text.Trim();



            string cs = ConfigurationManager.ConnectionStrings["DBCS22"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmdInsert = new SqlCommand();
                cmdInsert.Connection = con;
                cmdInsert.CommandText = "insert into tblMedical values(@Email,@DieasesYes,@DiseaseName,@DonateBlood,@BloodDate,@Name)";
                cmdInsert.Parameters.AddWithValue("@Email", Email);
                cmdInsert.Parameters.AddWithValue("@DieasesYes", radiobutton1);
                cmdInsert.Parameters.AddWithValue("@DiseaseName", disease);
                cmdInsert.Parameters.AddWithValue("@DonateBlood", radiobutton2);
                cmdInsert.Parameters.AddWithValue("@BloodDate", blood);
                cmdInsert.Parameters.AddWithValue("@Name",name);
                cmdInsert.ExecuteNonQuery();
                con.Close();
                Alert("Sucessfully Apply for the medical test");
            }
        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "Yes")
        {
            txtDiseaseName.Enabled = true;
        }
        else
        {
            txtDiseaseName.Enabled = false;
        }
    }
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList2.SelectedValue == "Yes")
        {
            txtBlood.Enabled = true;
        }
        else
        {
            txtBlood.Enabled = false;
        }
    }
}