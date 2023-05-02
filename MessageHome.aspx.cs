using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_MessageHome : System.Web.UI.Page
{
    public void gvLederLoad()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        DataTable dt = new DataTable();
        using(SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from tblMessage",con);
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
    public void ShowAdminInfo()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        DataTable dt = new DataTable();
        using(SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tblregistration where Email = @Email";
            cmd.Parameters.AddWithValue("@Email",Session["Email"].ToString().Trim());



            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
        }
        lblAdminId.Text = dt.Rows[0]["Email"].ToString();
        lblAdminName.Text = dt.Rows[0]["Name"].ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            gvLederLoad();
            ShowAdminInfo();
        }
    }
}