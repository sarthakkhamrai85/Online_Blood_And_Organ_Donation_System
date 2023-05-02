using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Ambulence_Registration : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    SqlDataAdapter adp1 = new SqlDataAdapter("select * from tblAmbullence", @"Data Source=.\MYSQL2016;Initial Catalog=Online_Blood_Donation_System;User ID=sa;Password=admin1234");
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
    protected void btnVaryfy_Click(object sender, EventArgs e)
    {
        DataRow[] dr1 = dt1.Select("Email='" + txtEmail.Text + "'");
        try
        {
            Alert("Hi......" + dr1[0]["Email"].ToString() + "  Email is Exit");
        }
        catch
        {
            Alert("Hi...    " + txtEmail.Text + "   is Veryfiy");
            btnSubmit.Visible = true;
            btnVaryfy.Visible = false;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtFirstname.Text != "" && txtEmail.Text != "" && txtPhoneNo.Text != "" && txtCity.Text != "" && DropDownList1.Text != "")
            {
                string name = txtFirstname.Text.Trim();
                string Email = txtEmail.Text.Trim();
                string Phone = txtPhoneNo.Text.Trim();
                string city = txtCity.Text.Trim();
                string status = DropDownList1.Text.Trim();

                string cs = ConfigurationManager.ConnectionStrings["DBCS12"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmdInsert = new SqlCommand();
                    cmdInsert.Connection = con;
                    cmdInsert.CommandText = "insert into tblAmbullence values(@Name,@Email,@Phone_no,@City,@Status)";
                    cmdInsert.Parameters.AddWithValue("@Name", name);
                    cmdInsert.Parameters.AddWithValue("@Email", Email);
                    cmdInsert.Parameters.AddWithValue("@Phone_No", Phone);
                    cmdInsert.Parameters.AddWithValue("@City", city);
                    cmdInsert.Parameters.AddWithValue("@Status", status);
                    cmdInsert.ExecuteNonQuery();
                    Response.Redirect(Request.RawUrl);
                    Alert("Data Insert Sucessfully");

                }
            }
            else
                Alert("Fill in the Information Carefully!!");
        }
        catch
        {

        }
    }
}