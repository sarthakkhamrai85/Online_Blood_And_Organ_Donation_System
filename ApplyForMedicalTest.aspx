<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApplyForMedicalTest.aspx.cs"
    Inherits="User_ApplyForMedicalTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%
        string path = HttpContext.Current.Server.MapPath("Link.txt");
        string content = System.IO.File.ReadAllText(path);
        Response.Write(content);
    %>
    <link href="CSS/ApplyForMedicalTest.css" rel="stylesheet" type="text/css" />
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
                    <asp:Label ID="Label2" class="lbl" runat="server" Text="Admin"></asp:Label>
                    <span class="info">
                        <asp:Label ID="lblAdminId" class="lbl" runat="server" Text="Id"></asp:Label>
                        -
                        <asp:Label ID="lblAdminName" class="lbl" runat="server" Text="Name"></asp:Label>
                    </span>
                </div>
                <div class="status bottom">
                    <i class="fas fa-angle-double-right"></i>
                    <asp:Label ID="Label7" runat="server" Text="Control Panel / Dashboard"></asp:Label>
                </div>
                <div class="container">
                    <h1>
                        Apply For The Medical Test</h1>
                    <p>
                        Please fill out the following information to Apply For A Medical Test:</p>
                        <asp:TextBox ID="txtName" runat="server" placeholder="Enter Youe Name:" 
                        Width="464px"></asp:TextBox>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Your Email:" 
                        Width="464px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" 
                        Text="You are suffering from any disease?:"></asp:Label>
                    <br />
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
                        <asp:ListItem Value="Yes">Yes</asp:ListItem>
                        <asp:ListItem Value="No">No</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="The Name Of Disease:"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtDiseaseName" runat="server" placeholder="Enter the Name Of Disease" 
                         Width="464px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Have You Blood Given Before?:"></asp:Label>
                    <br />
                 <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="RadioButtonList2_SelectedIndexChanged">
                        <asp:ListItem Value="Yes">Yes</asp:ListItem>
                        <asp:ListItem Value="No">No</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="When did you give blood?"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtBlood" runat="server" placeholder="Enter The Date" 
                         Width="464px" TextMode="Date"></asp:TextBox>
                    <br /><br />
                    <asp:Button ID="btnSubmit" runat="server" class="Submit" Text="Submit" 
                        type="submit" onclick="btnSubmit_Click" />
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblema" runat="server" Text=""></asp:Label>
                </div>
            </div>
            </div>
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
