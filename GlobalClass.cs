using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Collections.Specialized;
public class GlobalClass
{
    public readonly static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
    public readonly static string DatabaseError = "Unable to process your request. Please try again.";
    public readonly static string CustomError = "Something went wrong!";


    public static DataTable LoadAdmin(string adminId)
    {
        DataTable dtAdmin = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tblregistration where Email = @Email COLLATE SQL_Latin1_General_CP1_CS_AS";
            cmd.Parameters.AddWithValue("@Email", adminId);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dtAdmin);
        }
        return dtAdmin;
    }
    public static bool IsAdminPermanent(string adminId)
    {
        bool permanent;
        DataTable dtAdmin = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tblAdmin where AdminId = @AdminId COLLATE SQL_Latin1_General_CP1_CS_AS";
            cmd.Parameters.AddWithValue("@AdminId", adminId);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dtAdmin);
        }
        if (dtAdmin.Rows[0]["Type"].ToString().Trim() == "Permanent")
            permanent = true;
        else
            permanent = false;
        return permanent;
    }

}