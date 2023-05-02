using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Notice : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    private string GenerateNoticeNo()
    {
        const String alpha = "0123456789";
        string id = "N";
        int exist = 1;
        do
        {
            Random ran = new Random();
            for (int i = 0; i < 4; i++)
            {
                int a = ran.Next(10);
                id = id + alpha.ElementAt(a);
            }
            string cs = ConfigurationManager.ConnectionStrings["DBCS12"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select count(Id) from tblNotice where Id = @Id";
                cmd.Parameters.AddWithValue("@Id", id);
                con.Open();
                exist = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
        while (exist != 0);
        return id;
    }
    public void gvUpdatesLoad()
    {
        DataTable dt = new DataTable();
        string cs = ConfigurationManager.ConnectionStrings["DBCS12"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from tblNotice", con);
            da.Fill(dt);
        }
        gvUpdates.DataSource = dt;
        gvUpdates.DataBind();
        if (dt.Rows.Count == 0)
        {
            dt.Rows.Add(dt.NewRow());
            gvUpdates.DataSource = dt;
            gvUpdates.DataBind();
            gvUpdates.Rows[0].Visible = false;
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
            gvUpdatesLoad();
        }
        ShowAdminInfo();
    }
    protected void gvUpdates_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvUpdates.EditIndex = -1;
        gvUpdatesLoad();
    }
    protected void gvUpdates_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("New"))
        {
            string datetime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd-MM-yyyy HH:mm:ss");
            string msg = (gvUpdates.FooterRow.FindControl("txtMessage") as TextBox).Text.Trim();
            if (msg != "")
            {
                string id = GenerateNoticeNo();
                string cs = ConfigurationManager.ConnectionStrings["DBCS12"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    try
                    {
                        SqlCommand cmd = new SqlCommand();
                        cmd.Connection = con;
                        cmd.CommandText = "insert into tblNotice values(@Id, @Date, @Message, @LastUpdate)";
                        cmd.Parameters.AddWithValue("@Id", id);
                        cmd.Parameters.AddWithValue("@Date", datetime);
                        cmd.Parameters.AddWithValue("@Message", msg);
                        cmd.Parameters.AddWithValue("@LastUpdate", datetime);
                        con.Open();
                        cmd.ExecuteNonQuery();

                        gvUpdatesLoad();
                        Alert("New notice published successfully.");
                    }
                    catch
                    {
                    
                    }
                }
            }
            else
                Alert("Please fill all fields.");
        }
    }
    protected void gvUpdates_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvUpdates.DataKeys[e.RowIndex].Value.ToString();
        string cs = ConfigurationManager.ConnectionStrings["DBCS12"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "delete from tblNotice where Id = @Id";
                cmd.Parameters.AddWithValue("@Id", id);
                con.Open();
                cmd.ExecuteNonQuery();

                gvUpdatesLoad();
                Alert("Notice deleted successfully.");
            }
            catch
            {
              
            }
        }
    }
    protected void gvUpdates_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string id = gvUpdates.DataKeys[e.RowIndex].Value.ToString();
        string datetime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("dd-MM-yyyy HH:mm:ss");
        string msg = (gvUpdates.Rows[e.RowIndex].FindControl("txtMessage") as TextBox).Text.Trim();
        if (msg != "")
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS12"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "update tblNotice set Date = @Date, Message = @Message where Id = @Id";
                    cmd.Parameters.AddWithValue("@Date", datetime);
                    cmd.Parameters.AddWithValue("@Message", msg);
                    cmd.Parameters.AddWithValue("@Id", id);
                    con.Open();
                    cmd.ExecuteNonQuery();

                    gvUpdates.EditIndex = -1;
                    gvUpdatesLoad();
                    Alert("Notice updated successfully.");
                    gvUpdates.Rows[e.RowIndex].BackColor = System.Drawing.Color.LightGreen;
                }
                catch
                {
                 
                }
            }
        }
        else
            Alert("Please fill all fields.");
    }
    protected void gvUpdates_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvUpdates.EditIndex = e.NewEditIndex;
        gvUpdatesLoad();
        gvUpdates.EditRowStyle.BackColor = System.Drawing.Color.LightPink;
    }
}