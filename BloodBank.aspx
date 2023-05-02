<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BloodBank.aspx.cs" Inherits="User_BloodBank" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <link href="CSS/BloodBank.css" rel="stylesheet" type="text/css" />
    <%
        string path = HttpContext.Current.Server.MapPath("Link.txt");
        string content = System.IO.File.ReadAllText(path);
        Response.Write(content);
    %>
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
            <div id="body">
                <div class="status top">
                    <i class="fas fa-user-shield"></i>
                    <asp:Label ID="Label1" class="lbl" runat="server" Text="Admin"></asp:Label>
                    <span class="info">
                        <asp:Label ID="lblId" class="lbl" runat="server" Text="Id"></asp:Label>
                        -
                        <asp:Label ID="lblName" class="lbl" runat="server" Text="Name"></asp:Label>
                    </span>
                </div>
                <div class="status bottom">
                    <i class="fas fa-angle-double-right"></i>
                    <asp:Label ID="Label2" runat="server" Text="Control Panel / Blood Bank Status"></asp:Label>
                </div>
                <div id="content">
                    <div class="intro">
                        <ul>
                            <li>Manage all users here.</li>
                        </ul>
                    </div>
                    <div class="input-box ddl">
                        <asp:DropDownList ID="DropDownList1" CssClass="input ddl" runat="server" required
                            AutoPostBack="True">
                            <asp:ListItem Value="Select a option">Select a option</asp:ListItem>
                            <asp:ListItem>A+</asp:ListItem>
                            <asp:ListItem>B+</asp:ListItem>
                            <asp:ListItem>O+</asp:ListItem>
                            <asp:ListItem>AB+</asp:ListItem>
                            <asp:ListItem>A-</asp:ListItem>
                            <asp:ListItem>B-</asp:ListItem>
                            <asp:ListItem>AB-</asp:ListItem>
                            <asp:ListItem>O-</asp:ListItem>
                        </asp:DropDownList>
                        <label for="ddlRequestCategory" class="label-name">
                            <div class="icon">
                                <i class="fas fa-list-ul"></i>
                            </div>
                            <span class="content-name">Enter The Blood</span>
                        </label>
                    </div>
                    <div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnSearch" CssClass="btn" runat="server" Text="Search" OnClick="btnSearch_Click" />
                    </div>
                    <div class="gvContainer">
                        <asp:GridView ID="gvLeader" CssClass="gv" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="Blood_Group_Name" Width="935px">
                            <Columns>
                                <asp:TemplateField HeaderText="Blood Group Name" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Blood_Group_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Blood_Group_Name") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Avalible Total Blood" ItemStyle-CssClass="gvitem"
                                    HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Total") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Total") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                                <%--<asp:TemplateField HeaderText="Action" ItemStyle-CssClass="gvaction" HeaderStyle-CssClass="gvheader">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton2" CssClass="gvbtn" runat="server" CommandName="Edit" OnClientClick="return confirm('Do you want to edit the selected row?')"
                                                    ToolTip="Edit"><i class="fas fa-user-edit"></i>Edit</asp:LinkButton>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="LinkButton3" CssClass="gvbtn" runat="server" CommandName="Update" OnClientClick="return confirm('Do you want to update?')"
                                                    ToolTip="Update row"><i class="fas fa-save"></i>Update</asp:LinkButton>
                                                <asp:LinkButton ID="LinkButton4" CssClass="gvbtn" runat="server" CommandName="Cancel" OnClientClick="return confirm('All unsaved data will be lost!')"
                                                    ToolTip="Cancel editing"><i class="fas fa-window-close"></i>Cancel</asp:LinkButton>
                                            </EditItemTemplate>
                                            <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                            <ItemStyle CssClass="gvaction"></ItemStyle>
                                        </asp:TemplateField>--%>
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="error">
                                    <asp:Label ID="lblError" runat="server" Text="No data found."></asp:Label>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
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
