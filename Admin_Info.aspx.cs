using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Admin_Info : System.Web.UI.Page
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
    public string Confirm(string message)
    {
        System.Text.StringBuilder str = new System.Text.StringBuilder();
        str.Append("return confirm('");
        str.Append(message);
        str.Append("')");
        return (str.ToString());
    }
    private void ShowCompanyInfo()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS20"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tblAdminInfo";
            con.Open();
            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                if (rdr.Read())
                {
                    txtCompanyName.Text = rdr["CompanyName"].ToString();
                    txtMobile.Text = rdr["Mobile"].ToString();
                    txtEmail.Text = rdr["Email"].ToString();
                    txtOwner.Text = rdr["Owner"].ToString();
                    txtInfo.Text = rdr["Info"].ToString();
                    txtAddress.Text = rdr["Address"].ToString();
                    lblDate.Text = rdr["LastUpdate"].ToString();
                }
            }
        }
        string message = "Do you want to edit the information?";
        btnUpdate.Attributes.Add("onclick", Confirm(message));
    }
    private void VerifyAdmin(string adminId)
    {
        if (!GlobalClass.IsAdminPermanent(adminId))
        {
            var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize("Access denied!");
            var script = string.Format("alert({0});window.location.replace('Dashboard.aspx');", m);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
        }
    }
    private void gvAdminLoad()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS20"].ConnectionString;
        DataTable dtAdmin = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from tblregistration", con);
            da.Fill(dtAdmin);
        }
        if (dtAdmin.Rows.Count > 0)
        {
            gvAdmin.DataSource = dtAdmin;
            gvAdmin.DataBind();
        }
        else
        {
            dtAdmin.Rows.Add(dtAdmin.NewRow());
            gvAdmin.DataSource = dtAdmin;
            gvAdmin.DataBind();
            gvAdmin.Rows[0].Cells.Clear();
            gvAdmin.Rows[0].Cells.Add(new TableCell());
            gvAdmin.Rows[0].Cells[0].ColumnSpan = dtAdmin.Columns.Count;
            gvAdmin.Rows[0].Cells[0].Text = "No data found.";
            gvAdmin.Rows[0].Cells[0].Attributes.Add("style", "padding: 8px 10px; background-color: #FF9999");
        }
    }
    public void ToggleTab(int state)
    {
        switch (state)
        {
            default:
                linkInfo.CssClass = "button active";
                linkAdmin.CssClass = "button";
                panelInfo.Visible = true;
                panelAdmin.Visible = false;
                ShowCompanyInfo();
                Session["ypst59"] = "0";
                break;
            case 1:
                linkInfo.CssClass = "button";
                linkAdmin.CssClass = "button active";
                panelInfo.Visible = false;
                panelAdmin.Visible = true;
                gvAdminLoad();
                Session["ypst59"] = "1";
                break;
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
        lblId.Text = dt.Rows[0]["Email"].ToString().Trim();
        lblName.Text = dt.Rows[0]["First_Name"].ToString().Trim();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
        ShowCompanyInfo();
        gvAdminLoad();
        ShowAdminInfo();
       
    }
    protected void linkInfo_Click(object sender, EventArgs e)
    {
        ToggleTab(0);
    }

    protected void linkAdmin_Click(object sender, EventArgs e)
    {
        ToggleTab(1);
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (btnUpdate.Text == "Edit")
        {
            txtCompanyName.Enabled = txtMobile.Enabled = txtMobile.Enabled = txtEmail.Enabled = txtOwner.Enabled = txtInfo.Enabled = txtAddress.Enabled = true;
            btnUpdate.Text = "Update";
            string message = "Are you sure to update the information?";
            btnUpdate.Attributes.Add("onclick", Confirm(message));
        }
        else if (btnUpdate.Text == "Update")
        {
            string name = txtCompanyName.Text.Trim();
            string mobile = txtMobile.Text.Trim();
            string email = txtEmail.Text.Trim();
            string owner = txtOwner.Text.Trim();
            string info = txtInfo.Text.Trim();
            string address = txtAddress.Text.Trim();
            if (name != "" && mobile != "" && email != "" && owner != "" && info != "" && address != "")
            {
                try
                {
                    string cs = ConfigurationManager.ConnectionStrings["DBCS20"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        string query = "update tblAdminInfo set CompanyName = @CompanyName, Mobile = @Mobile, Email = @Email, Owner = @Owner, Info = @Info, Address = @Address, LastUpdate = @LastUpdate";
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = query;
                        cmd.Parameters.AddWithValue("@CompanyName",name);
                        cmd.Parameters.AddWithValue("@Mobile",mobile);
                        cmd.Parameters.AddWithValue("@Email",email);
                        cmd.Parameters.AddWithValue("@Owner",owner);
                        cmd.Parameters.AddWithValue("@Info",info);
                        cmd.Parameters.AddWithValue("@Address",address);
                        cmd.Parameters.AddWithValue("@LastUpdate",DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss"));
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                    string message = "Updated successfully.";
                    Reload(message);
                }
                catch
                {
                    Alert(GlobalClass.DatabaseError);
                }
            }
            else
                Alert("Please fill all fields.");
        }
    }
    protected void gvAdmin_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvAdmin.EditIndex = e.NewEditIndex;
        gvAdminLoad();
    }

    protected void gvAdmin_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvAdmin.EditIndex = -1;
        gvAdminLoad();
    }

    protected void gvAdmin_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string Email = gvAdmin.DataKeys[e.RowIndex].Value.ToString();
        string Fname = (gvAdmin.Rows[e.RowIndex].FindControl("txtEditFName") as TextBox).Text.Trim();
        string Lname = (gvAdmin.Rows[e.RowIndex].FindControl("txtEditLName") as TextBox).Text.Trim();
        string Phone = (gvAdmin.Rows[e.RowIndex].FindControl("txtEditMobile") as TextBox).Text.Trim();

        string cs = ConfigurationManager.ConnectionStrings["DBCS20"].ConnectionString;

        using(SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmdUpdate = new SqlCommand();
            cmdUpdate.Connection = con;
            cmdUpdate.CommandText = "update tblregistration set First_Name = @First_Name, Last_Name = @Last_Name, Phone_no = @Phone_no where Email = @Email";
            cmdUpdate.Parameters.AddWithValue("@First_Name",Fname);
            cmdUpdate.Parameters.AddWithValue("@Last_Name",Lname);
            cmdUpdate.Parameters.AddWithValue("@Phone_no",Phone);
            cmdUpdate.Parameters.AddWithValue("@Email",Email);
            cmdUpdate.ExecuteNonQuery();


            gvAdmin.EditIndex = -1;
            gvAdminLoad();
            string message = "Update Sucessfully!!!";
            Alert(message);
            gvAdmin.Rows[e.RowIndex].BackColor = System.Drawing.Color.LightGreen;
        }

    }
    protected void gvAdmin_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS20"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string adminId = gvAdmin.DataKeys[e.RowIndex].Value.ToString();
               
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "delete from tblregistration where Email = @Email";
                    cmd.Parameters.AddWithValue("@Email", adminId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    gvAdminLoad();
                    string message = "Admin deleted successfully.";
                    Alert(message);
            }
        }
        catch
        {
            Alert(GlobalClass.DatabaseError);
        }
    }
}