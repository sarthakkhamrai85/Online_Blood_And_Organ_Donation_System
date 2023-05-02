<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Registration.aspx.cs"
    Inherits="Admin_Admin_Registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%
        string path = HttpContext.Current.Server.MapPath("Link.txt");
        string content = System.IO.File.ReadAllText(path);
        Response.Write(content);
    %>
    <link href="CSS/Admin_Registration.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="scriptPage" runat="server">
    </asp:ScriptManager>
    <asp:UpdateProgress ID="updateProgress" AssociatedUpdatePanelID="pageUpdate" runat="server">
        <ProgressTemplate>
            <div id="loadingPanel">
                <div id="loader">
                    <svg class="circular" viewbox="25 25 50 50">
                            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3"></circle>
                        </svg>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <%
        string headerpath = HttpContext.Current.Server.MapPath("HTML/Header.htm");
        string headercontent = System.IO.File.ReadAllText(headerpath);
        Response.Write(headercontent);
    %>
    <asp:UpdatePanel ID="pageUpdate" runat="server">
        <ContentTemplate>
            <asp:Panel ID="passwordUpdatePanel" class="overlay" runat="server" Visible="false">
                <div class="content">
                </div>
            </asp:Panel>
            <div id="body">
                <div class="status top">
                    <i class="fas fa-user-shield"></i>
                    <asp:Label ID="Label7" class="lbl" runat="server" Text="Admin"></asp:Label>
                    <span class="info">
                        <asp:Label ID="lblAdminId" class="lbl" runat="server" Text="Id"></asp:Label>
                        -
                        <asp:Label ID="lblAdminName" class="lbl" runat="server" Text="Name"></asp:Label>
                    </span>
                </div>
                <div class="status bottom">
                    <i class="fas fa-angle-double-right"></i>
                    <asp:Label ID="Label8" runat="server" Text="Control Panel / Admin Regsitration"></asp:Label>
                </div>
                <form>
                <asp:Label ID="Label1" runat="server" Text="First Name:" Font-Bold="True"></asp:Label><br />
                <asp:TextBox ID="txtFirstname" runat="server" placeholder="Enter Your First Name"
                    Width="464px"></asp:TextBox><br />
                <asp:Label ID="Label2" runat="server" Text="Last Name:" Font-Bold="True"></asp:Label><br />
                <asp:TextBox ID="txtLastname" runat="server" placeholder="Enter Your Last Name" Width="464px"></asp:TextBox><br />
                <asp:Label ID="Label3" runat="server" Text="Email:" Font-Bold="True"></asp:Label><br />
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Your Email" Width="464px"
                    TextMode="Email"></asp:TextBox><br /><asp:Button ID="btnVaryfy" runat="server" Text="Veryfiy"
                        type="submit" class="Submit" OnClick="btnVaryfy_Click" /><br />
                <asp:Label ID="Label5" runat="server" Text="Phone No:" Font-Bold="True"></asp:Label><br />
                <asp:TextBox ID="txtPhoneNo" runat="server" placeholder="Enter Phone Number" Width="464px"
                    TextMode="Phone"></asp:TextBox><br />
                <asp:Label ID="Label4" runat="server" Text="Password:" Font-Bold="True"></asp:Label><br />
                <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter Your Password" Width="464px"
                    TextMode="Password"></asp:TextBox><br />
                <asp:Label ID="Label6" runat="server" Text="Confurm Password:" Font-Bold="True"></asp:Label><br />
                <asp:TextBox ID="txtConpassword" runat="server" placeholder="Enter Your Confurm Password"
                    Width="464px" TextMode="Password"></asp:TextBox><br />
                <asp:Button ID="btnSubmit" runat="server" Text="Registrerd" type="submit" class="Submit"
                    OnClick="btnSubmit_Click" />
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                <asp:Label ID="lblema" runat="server" Text=""></asp:Label>
                </form>
            </div>
            </div> </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <%
        string footerpath = HttpContext.Current.Server.MapPath("HTML/Footer.htm");
        string footercontent = System.IO.File.ReadAllText(footerpath);
        Response.Write(footercontent);
    %>
    </form>
</body>
</html>
