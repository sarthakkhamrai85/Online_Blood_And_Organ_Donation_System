<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Notice.aspx.cs" Inherits="Admin_Notice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%
        string path = HttpContext.Current.Server.MapPath("Link.txt");
        string content = System.IO.File.ReadAllText(path);
        Response.Write(content);
    %>
    <link href="CSS/Notice.css" rel="stylesheet" type="text/css" />
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
                    <asp:Label ID="Label1" class="lbl" runat="server" Text="Admin"></asp:Label>
                    <span class="info">
                        <asp:Label ID="lblAdminId" class="lbl" runat="server" Text="Id"></asp:Label>
                        -
                        <asp:Label ID="lblAdminName" class="lbl" runat="server" Text="Name"></asp:Label>
                    </span>
                </div>
                <div class="status bottom">
                    <i class="fas fa-angle-double-right"></i>
                    <asp:Label ID="Label2" runat="server" Text="Control Panel / Notice Bord"></asp:Label>
                </div>
                <div class="gvContainer">
                    <asp:GridView ID="gvUpdates" CssClass="gv" runat="server" AutoGenerateColumns="False"
                        ShowFooter="True" DataKeyNames="Id" OnRowCancelingEdit="gvUpdates_RowCancelingEdit"
                        OnRowCommand="gvUpdates_RowCommand" OnRowDeleting="gvUpdates_RowDeleting" OnRowEditing="gvUpdates_RowEditing"
                        OnRowUpdating="gvUpdates_RowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="Update" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                                </EditItemTemplate>
                                <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                <ItemStyle CssClass="gvitem"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Message" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Message") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtMessage" CssClass="gvTextbox" runat="server" Text='<%# Bind("Message") %>'
                                        TextMode="MultiLine" Rows="10" MaxLength="500"></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtMessage" CssClass="gvTextbox" placeholder="Message" autocomplete="off"
                                        runat="server" TextMode="MultiLine" Rows="10" MaxLength="500"></asp:TextBox>
                                </FooterTemplate>
                                <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                <ItemStyle CssClass="gvitem"></ItemStyle>
                                <FooterStyle CssClass="gvitem"></FooterStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="gvaction" HeaderStyle-CssClass="gvheader">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" CssClass="gvbtn" runat="server" CommandName="Edit"
                                        OnClientClick="return confirm('Do you want to edit the selected row?')" ToolTip="Edit"><i class="fas fa-user-edit"></i>Edit</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" CssClass="gvbtn delete" runat="server" CommandName="Delete"
                                        OnClientClick="return confirm('Do you want to delete the selected notice? It cannot be undone!')"
                                        ToolTip="Delete the entire row"><i class="fas fa-trash-alt delete"></i>Delete</asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton3" CssClass="gvbtn" runat="server" CommandName="Update"
                                        OnClientClick="return confirm('Do you want to update?')" ToolTip="Update row"><i class="fas fa-save"></i>Update</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton4" CssClass="gvbtn" runat="server" CommandName="Cancel"
                                        OnClientClick="return confirm('All unsaved data will be lost!')" ToolTip="Cancel editing"><i class="fas fa-window-close"></i>Cancel</asp:LinkButton>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:LinkButton ID="LinkButton5" CssClass="gvbtn" runat="server" CommandName="New"
                                        ToolTip="Add notice" OnClientClick="return confirm('Do you want to publish new notice?')"><i class="fa fa-user-plus"></i>Publish</asp:LinkButton>
                                </FooterTemplate>
                                <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                <ItemStyle CssClass="gvaction"></ItemStyle>
                                <FooterStyle CssClass="gvaction"></FooterStyle>
                            </asp:TemplateField>
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
