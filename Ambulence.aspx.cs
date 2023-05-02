using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Ambulence : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    public void gvLeaderLoad()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS8"].ConnectionString;

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from tblAmbullence", con);
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
        if (!IsPostBack)
        {
            gvLeaderLoad();
        }
        ShowAdminInfo();
    }
    protected void gvLeader_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvLeader.EditIndex = -1;
        gvLeaderLoad();
    }
    protected void gvLeader_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string Email = gvLeader.DataKeys[e.RowIndex].Value.ToString();

        string cs = ConfigurationManager.ConnectionStrings["DBCS5"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from tblAmbullence where Email=@Email ";
            cmd.Parameters.AddWithValue("@Email", Email);
            con.Open();
            cmd.ExecuteNonQuery();


            gvLeader.EditIndex = -1;
            gvLeaderLoad();
            string message = " Delete successfully.";
            Alert(message);
        }
    }
    protected void gvLeader_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string Email = gvLeader.DataKeys[e.RowIndex].Value.ToString();
        string Name = (gvLeader.Rows[e.RowIndex].FindControl("txtEditname") as TextBox).Text.Trim();
        string Phone = (gvLeader.Rows[e.RowIndex].FindControl("txtEditPhone") as TextBox).Text.Trim();
        string city = (gvLeader.Rows[e.RowIndex].FindControl("txtEditCity") as TextBox).Text.Trim();
        string Status = (gvLeader.Rows[e.RowIndex].FindControl("txtEditStatus") as TextBox).Text.Trim();
        



        string cs = ConfigurationManager.ConnectionStrings["DBCS8"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmdUpdateUser = new SqlCommand();
            cmdUpdateUser.Connection = con;
            cmdUpdateUser.CommandText = "update tblAmbullence set Name=@Name,  Phone_No=@Phone_No, City=@City, Status= @Status,  Email= @Email where Email = @Email";
            cmdUpdateUser.Parameters.AddWithValue("@Name", Name);
            cmdUpdateUser.Parameters.AddWithValue("@Phone_No", Phone);
            cmdUpdateUser.Parameters.AddWithValue("@City", city);
            cmdUpdateUser.Parameters.AddWithValue("@Status", Status);
            cmdUpdateUser.Parameters.AddWithValue("@Email", Email);
            cmdUpdateUser.ExecuteNonQuery();


            gvLeader.EditIndex = -1;
            gvLeaderLoad();
            string message = "Leader updated successfully.";
            Alert(message);
            gvLeader.Rows[e.RowIndex].BackColor = System.Drawing.Color.LightGreen;
        }
    }
    protected void gvLeader_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvLeader.EditIndex = e.NewEditIndex;
        gvLeaderLoad();
        gvLeader.EditRowStyle.BackColor = System.Drawing.Color.LightPink;
    }
}