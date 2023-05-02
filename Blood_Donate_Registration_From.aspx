<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Blood_Donate_Registration_From.aspx.cs"
    Inherits="User_Blood_Donate_Registration_From" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%
        string path = HttpContext.Current.Server.MapPath("Link.txt");
        string content = System.IO.File.ReadAllText(path);
        Response.Write(content);
    %>
    <link href="CSS/Blood_Donate_Registration_From.css" rel="stylesheet" type="text/css" />
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
                    <asp:Label ID="Label11" class="lbl" runat="server" Text="Admin"></asp:Label>
                    <span class="info">
                        <asp:Label ID="lblAdminId" class="lbl" runat="server" Text="Id"></asp:Label>
                        -
                        <asp:Label ID="lblAdminName" class="lbl" runat="server" Text="Name"></asp:Label>
                    </span>
                </div>
                <div class="status bottom">
                    <i class="fas fa-angle-double-right"></i>
                    <asp:Label ID="Label12" runat="server" Text="Control Panel / Doner Registration"></asp:Label>
                </div>
                <div class="container">
                    <h1>
                        Blood And Organ Donation From</h1>
                    <p>
                        Please fill out the following information to register as a blood And Organ donor:</p>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="First Name:"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtFirstname" runat="server" 
                        placeholder="Enter Your First Name" Width="464px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Last Name:"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtLastname" runat="server" placeholder="Enter Your Last Name" 
                        Width="464px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Email:"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Your Last Name" 
                        TextMode="Email" Width="464px"></asp:TextBox>
                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Mobile No:"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtMobile" runat="server" placeholder="Enter Your MObile No" 
                        Width="464px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text=" Date Of Birth:"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date" Width="464px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text=" City:"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtCity" runat="server" placeholder="Enter The City" 
                        Width="464px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Gender:"></asp:Label>
                    <br />
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Outher</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Donation:"></asp:Label>
                    <br />
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" 
                        Font-Size="10pt" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                        <asp:ListItem Value="BloodDonate">Blood</asp:ListItem>
                        <asp:ListItem Value="Organdonate">Organ</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Blood Group:"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownList1" runat="server" Font-Bold="True">
                        <asp:ListItem disabled="" hidden="" Selected="" Value="Select Package">Enter your Blood Group</asp:ListItem>
                        <asp:ListItem>A+</asp:ListItem>
                        <asp:ListItem>O+</asp:ListItem>
                        <asp:ListItem>B+</asp:ListItem>
                        <asp:ListItem>AB+</asp:ListItem>
                        <asp:ListItem>A-</asp:ListItem>
                        <asp:ListItem>O-</asp:ListItem>
                        <asp:ListItem>B-</asp:ListItem>
                        <asp:ListItem>AB-</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Organ Name:"></asp:Label>
                    <br />
                    <asp:DropDownList ID="DropDownList2" runat="server" Font-Bold="True">
                        <asp:ListItem>Enter your Organ name</asp:ListItem>
                        <asp:ListItem>Eye</asp:ListItem>
                        <asp:ListItem>kidneys</asp:ListItem>
                        <asp:ListItem>stomach</asp:ListItem>
                        <asp:ListItem>heart</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:LinkButton ID="btnNext" runat="server" onclick="btnNext_Click1"  class="Submit">Next</asp:LinkButton>
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
