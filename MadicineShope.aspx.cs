using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Admin_MadicineShope : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    public void Medicine()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        DataTable dt = new DataTable();
        using(SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from tblMedicine",con);
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
            Medicine();
            ShowAdminInfo();
        }
    }
    protected void gvLeader_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        string Email = gvLeader.DataKeys[e.RowIndex].Value.ToString();
        string MedicineShopName = (gvLeader.Rows[e.RowIndex].FindControl("txtEditMname") as TextBox).Text.Trim();
        string ShopOwner = (gvLeader.Rows[e.RowIndex].FindControl("txtEditOwner") as TextBox).Text.Trim();
        string PhoneNO = (gvLeader.Rows[e.RowIndex].FindControl("txtEditPhoneNO") as TextBox).Text.Trim();
        string Address = (gvLeader.Rows[e.RowIndex].FindControl("txtEditAddress") as TextBox).Text.Trim();



        string cs = ConfigurationManager.ConnectionStrings["DBCS5"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmdUpdateUser = new SqlCommand();
            cmdUpdateUser.Connection = con;
            cmdUpdateUser.CommandText = "update tblMedicine set Medicine_Shop_Name=@Medicine_Shop_Name,  Medicine_Shop_Owner=@Medicine_Shop_Owner, Medicine_Phone_No=@Medicine_Phone_No, Medicine_Shop_Address= @Medicine_Shop_Address, Medicine_Shop_Email=@Medicine_Shop_Email  where Medicine_Shop_Email = @Medicine_Shop_Email";
            cmdUpdateUser.Parameters.AddWithValue("@Medicine_Shop_Name",MedicineShopName);
            cmdUpdateUser.Parameters.AddWithValue("@Medicine_Shop_Owner", ShopOwner);
            cmdUpdateUser.Parameters.AddWithValue("@Medicine_Phone_No", PhoneNO);
            cmdUpdateUser.Parameters.AddWithValue("@Medicine_Shop_Address", Address);
            cmdUpdateUser.Parameters.AddWithValue("@Medicine_Shop_Email", Email);
            cmdUpdateUser.ExecuteNonQuery();


            gvLeader.EditIndex = -1;
            Medicine();
            string message = "Leader updated successfully.";
            Alert(message);
            gvLeader.Rows[e.RowIndex].BackColor = System.Drawing.Color.LightGreen;
        }
    }
    protected void gvLeader_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        gvLeader.EditIndex = e.NewEditIndex;
        Medicine();
        gvLeader.EditRowStyle.BackColor = System.Drawing.Color.LightPink;

    }
    protected void gvLeader_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        string Email = gvLeader.DataKeys[e.RowIndex].Value.ToString();

        string cs = ConfigurationManager.ConnectionStrings["DBCS5"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from tblMedicine where Medicine_Shop_Email=@Medicine_Shop_Email ";
            cmd.Parameters.AddWithValue("@Medicine_Shop_Email", Email);
            cmd.ExecuteNonQuery();


            gvLeader.EditIndex = -1;
            Medicine();
            string message = " Delete successfully.";
            Alert(message);
        }
    }
    protected void gvLeader_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
    {

        gvLeader.EditIndex = -1;
        Medicine();
    }
}