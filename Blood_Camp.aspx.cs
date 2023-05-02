using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Blood_Camp : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    SqlDataAdapter adp1 = new SqlDataAdapter("select * from tblBlood_Camp", @"Data Source=.\MYSQL2016;Initial Catalog=Online_Blood_Donation_System;User ID=sa;Password=admin1234");
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
        try
        {
            if (txtFirstname.Text != "" && txtEmail.Text != "" && txtCity.Text != "" && txtPhoneNo.Text != "" && txtUnit.Text != "" && DropDownList1.Text != "")
            {
                string name = txtFirstname.Text.Trim();
                string emial = txtEmail.Text.Trim();
                string phone = txtPhoneNo.Text.Trim();
                string city = txtCity.Text.Trim();
                string unit = txtUnit.Text.Trim();
                string Blood_Group = DropDownList1.Text.Trim();

                string cs = ConfigurationManager.ConnectionStrings["DBCS14"].ConnectionString;


                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand CmdInsert = new SqlCommand();
                    CmdInsert.Connection = con;
                    CmdInsert.CommandText = "insert into tblBlood_Camp values(@Name,@Email,@Phone_No,@City,@Blood_Type,@Unit,)";
                    CmdInsert.Parameters.AddWithValue("@Name", name);
                    CmdInsert.Parameters.AddWithValue("@Email", emial);
                    CmdInsert.Parameters.AddWithValue("@Phone_No", phone);
                    CmdInsert.Parameters.AddWithValue("@City", city);
                    CmdInsert.Parameters.AddWithValue("@Blood_Type", Blood_Group);
                    CmdInsert.Parameters.AddWithValue("@Unit", unit);
                    CmdInsert.ExecuteNonQuery();
                    Alert("Sucessfully registerred");
                    Response.Redirect(Request.RawUrl);
                }
            }
            else
                Alert("Fill in the Carefully!!!");
        }
        catch
        {

        }
        
    }
    protected void btnVaryfy_Click(object sender, EventArgs e)
    {
        DataRow[] dr1 = dt1.Select("Email='" + txtEmail.Text + "'");
        try
        {
            if (txtEmail.Text != "")
            {
                Alert("Hi......" + dr1[0]["Email"].ToString() + "  Email is Exit");
            }
            else
                Alert("Enter the email");
        }
        catch
        {
            Alert("Hi...    " + txtEmail.Text + "   is Veryfiy");
            btnVaryfy.Visible = false;
            btnSubmit.Visible = true;
        }
    }
}