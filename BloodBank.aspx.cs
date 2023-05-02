using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_BloodBank : System.Web.UI.Page
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
        lblId.Text = dt.Rows[0]["Email"].ToString().Trim();
        lblName.Text = dt.Rows[0]["First_Name"].ToString().Trim() + " " + dt.Rows[0]["Last_Name"].ToString().Trim();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ShowUSerInfo();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            string key = DropDownList1.SelectedValue.Trim();
            string cs = ConfigurationManager.ConnectionStrings["DBCS7"].ConnectionString;


            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select Blood_Group_Name,Total from tblBlood_Bank_Status where Blood_Group_Name = @Blood_Group_Name";
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@Blood_Group_Name", key);
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.SelectCommand = cmd;
                da.Fill(dt);
                gvLeader.DataSource = dt;
                gvLeader.DataBind();
            }
        }
        catch
        {

        }
    }
}