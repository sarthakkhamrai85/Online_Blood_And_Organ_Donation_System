using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Blood_Bank_Status : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    public void gvLeaderLoad()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS15"].ConnectionString;

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from tblBlood_Bank_Status", con);
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
        if(!IsPostBack)
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

    }
    protected void gvLeader_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string Blood_Group_Name = gvLeader.DataKeys[e.RowIndex].Value.ToString();
        string Incomig_Blood = (gvLeader.Rows[e.RowIndex].FindControl("txtIncoming_BLood") as TextBox).Text.Trim();
        string Outgoing_Blood = (gvLeader.Rows[e.RowIndex].FindControl("txtOutgoingBlood") as TextBox).Text.Trim();
        //string Total = (gvLeader.Rows[e.RowIndex].FindControl("txtTotal") as TextBox).Text.Trim();

        int T = Convert.ToInt32(Incomig_Blood) - Convert.ToInt32(Outgoing_Blood);
        string Total = T.ToString();
        string cs = ConfigurationManager.ConnectionStrings["DBCS15"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmdUpdateUser = new SqlCommand();
            cmdUpdateUser.Connection = con;
            cmdUpdateUser.CommandText = "update tblBlood_Bank_Status set Incomeing_Blood=@Incomeing_Blood, Outgoing_Blood=@Outgoing_Blood,Total= @Total, Blood_Group_Name=@Blood_Group_Name  where Blood_Group_Name = @Blood_Group_Name";
            cmdUpdateUser.Parameters.AddWithValue("@Incomeing_Blood", Incomig_Blood);
            cmdUpdateUser.Parameters.AddWithValue("@Outgoing_Blood", Outgoing_Blood);
            cmdUpdateUser.Parameters.AddWithValue("@Total", Total);
            cmdUpdateUser.Parameters.AddWithValue("@Blood_Group_Name", Blood_Group_Name);
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