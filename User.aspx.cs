using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_User : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    public string Confirm(string message)
    {
        System.Text.StringBuilder str = new System.Text.StringBuilder();
        str.Append("return confirm('");
        str.Append(message);
        str.Append("')");
        return (str.ToString());
    }
    private void ShowAdminInfo()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS18"].ConnectionString;

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
        lblId.Text = dt.Rows[0]["Email"].ToString().Trim();
        lblName.Text = dt.Rows[0]["First_Name"].ToString().Trim();
    }
    public void gvShow()
    {
        DataTable dt = new DataTable();
        gvUser.DataSource = dt;
        gvUser.DataBind();
        Label lbl = gvUser.Controls[0].Controls[0].FindControl("lblError") as Label;
        lbl.Text = "Search user.";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
           
            gvShow();
        }
        ShowAdminInfo();
    }
    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCategory.Items.Remove("Select a option");
        lblKey.InnerText = "Enter " + ddlCategory.SelectedItem.ToString();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string ddl = ddlCategory.SelectedValue.ToString();
        if (ddl != "Select a option")
        {
            string key = txtKey.Text.Trim();
            if (key != "")
            {
                string cs = ConfigurationManager.ConnectionStrings["DBCS18"].ConnectionString;

                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlDataAdapter da = new SqlDataAdapter();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "select * from tblUser_Registration where " + ddl + " like @Key";
                    cmd.Parameters.AddWithValue("@Key", "%" + key + "%");
                    da.SelectCommand = cmd;
                    con.Open();
                    da.Fill(dt);
                }
                gvUser.DataSource = dt;
                gvUser.DataBind();
                if (dt.Rows.Count == 0)
                {
                    Label lbl = gvUser.Controls[0].Controls[0].FindControl("lblError") as Label;
                    lbl.Text = "No data found.";
                }
            }
            else
                Alert("Please enter search keyword.");
        }
        else
            Alert("Please select a category.");
    }
    protected void gvUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvUser.EditIndex = -1;
        btnSearch_Click(sender, e);
    }
    protected void gvUser_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvUser.EditIndex = e.NewEditIndex;
        btnSearch_Click(sender, e);
        gvUser.EditRowStyle.BackColor = System.Drawing.Color.LightPink;
    }
    protected void gvUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string Fname = (gvUser.Rows[e.RowIndex].FindControl("txtEditFName") as TextBox).Text.Trim();
        string Lname = (gvUser.Rows[e.RowIndex].FindControl("txtEditLName") as TextBox).Text.Trim();
        string mobile = (gvUser.Rows[e.RowIndex].FindControl("txtEditMobile") as TextBox).Text.Trim();
        string Address = (gvUser.Rows[e.RowIndex].FindControl("txtEditAddress") as TextBox).Text.Trim();
        string Email = gvUser.DataKeys[e.RowIndex].Value.ToString();
        if (Fname != "" && mobile != "" && Lname != "" && Address != "")
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS18"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlTransaction transaction = con.BeginTransaction();
                try
                {
                    SqlCommand cmdUpdateUser = new SqlCommand();
                    cmdUpdateUser.Connection = con;
                    cmdUpdateUser.Transaction = transaction;
                    cmdUpdateUser.CommandText = "update tblUser set First_Name = @First_Name, Last_Name=@Last_Name, Mobile_No = @Mobile_No, Address = @Address where Email = @Email";
                    cmdUpdateUser.Parameters.AddWithValue("@First_Name", Fname);
                    cmdUpdateUser.Parameters.AddWithValue("@Last_Name", Lname);
                    cmdUpdateUser.Parameters.AddWithValue("@Mobile_No", mobile);
                    cmdUpdateUser.Parameters.AddWithValue("@Address", Address);
                    cmdUpdateUser.Parameters.AddWithValue("@Email", Email);
                    cmdUpdateUser.ExecuteNonQuery();

                    transaction.Commit();
                    gvUser.EditIndex = -1;
                    btnSearch_Click(sender, e);
                    string message = "User updated successfully.";
                    Alert(message);
                    gvUser.Rows[e.RowIndex].BackColor = System.Drawing.Color.LightGreen;
                }
                catch
                {
                    transaction.Rollback();
                }
            }

        }
        else
            Alert("Please fill all fields.");
    }
}