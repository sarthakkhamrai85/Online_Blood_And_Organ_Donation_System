using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Admin_Login : System.Web.UI.Page
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
    protected void Page_Load(object sender, EventArgs e)
    {
        string text = (Guid.NewGuid().ToString()).Substring(0, 5);
        Response.Cookies["Captcha"]["value"] = text;
        Image1.ImageUrl = "Capture.aspx";
        lblCaptch.Visible = false;
       
            if(!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Mode"]))
                {
                    if (Request.QueryString["Mode"].ToString() == "Redirect")
                    {
                        Alert("Login to continue.");
                    }
                }
                Session.Abandon();
            }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string Email = txtUserName.Text.Trim();
        string password = txtPassword.Text.Trim();


        string cs = ConfigurationManager.ConnectionStrings["DBCS1"].ConnectionString;
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand CmdInsert = new SqlCommand();
            CmdInsert.Connection = con;
            CmdInsert.CommandText = "select * from tblregistration where Password=@Password and Email=@Email";
            CmdInsert.Parameters.AddWithValue("@Password", password);
            CmdInsert.Parameters.AddWithValue("@Email", Email);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = CmdInsert;
            da.Fill(dt);
        }
         DataRow[] dr = dt.Select("Email='"+ txtUserName.Text + "'");
         try
         {
             Session.Add("ywivreqi", dt.Rows[0]["Email"].ToString().Trim());
             Session.Add("rcuuyqtf", dt.Rows[0]["Password"].ToString().Trim());
             if (dt.Rows.Count == 1 && txtCapture.Text.ToString() == Request.Cookies["Captcha"]["value"])
             {
                 Session["First_Name"] = dt.Rows[0]["First_Name"].ToString();
                 Session["Last_Name"] = dt.Rows[0]["Last_Name"].ToString();
                 Session["Email"] = dt.Rows[0]["Email"].ToString();
                 Session["Phone_no"] = dt.Rows[0]["Phone_no"].ToString();
                 Session["Password"] = dt.Rows[0]["Password"].ToString();
                 Response.Redirect("Admin_Dasbord.aspx");
             }
             else
             {
                 Alert( "Hi...." + dr[0]["Email"].ToString() + "Password is Worng!!");
             }
         }
         catch
         {
             Alert( "Hi..." + txtUserName.Text + "Your are not registered yet!!!");
         }


    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ForgetPassword.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost:1466/Online_Blood_And_Organ_Donation_System/Default.aspx");
    }
}