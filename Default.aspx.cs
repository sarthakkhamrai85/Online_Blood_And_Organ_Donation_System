using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = GridView1.Rows.Count.ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if(FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(@"E:\asp.net project\Online_Blood_And_Organ_Donation_System\Global" + FileUpload1.FileName);
            lblError.Text = "your" + FileUpload1.FileName + "Sucesfully";
            lbMessage.Text = "~/Global/" + FileUpload1.FileName;
        }
    }
}