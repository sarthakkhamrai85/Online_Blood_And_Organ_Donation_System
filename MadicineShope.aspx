<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MadicineShope.aspx.cs" Inherits="Admin_MadicineShope" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%
        string path = HttpContext.Current.Server.MapPath("Link.txt");
        string content = System.IO.File.ReadAllText(path);
        Response.Write(content);
    %>
    <link href="CSS/MedicineShop.css" rel="stylesheet" type="text/css" />
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
                    <asp:Label ID="Label2" runat="server" Text="Control Panel / Dashboard"></asp:Label>
                </div>
                <div class="gvContainer">
                    <asp:GridView ID="gvLeader" CssClass="gv" runat="server" AutoGenerateColumns="False"
                        Width="1454px" DataKeyNames="Medicine_Shop_Email" OnRowCancelingEdit="gvLeader_RowCancelingEdit1"
                        OnRowDeleting="gvLeader_RowDeleting1" OnRowEditing="gvLeader_RowEditing1" OnRowUpdating="gvLeader_RowUpdating1">
                        <Columns>
                            <asp:TemplateField HeaderText="Name" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Medicine_Shop_Name") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditMname" CssClass="gvTextbox" runat="server" Text='<%# Bind("Medicine_Shop_Name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                <ItemStyle CssClass="gvitem"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Medicine_Shop_Email") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Medicine_Shop_Email") %>'></asp:Label>
                                </EditItemTemplate>
                                <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                <ItemStyle CssClass="gvitem"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Phone No" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Medicine_Shop_Owner") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditOwner" CssClass="gvTextbox" runat="server" Text='<%# Bind("Medicine_Shop_Owner") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                <ItemStyle CssClass="gvitem"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Medicine_Phone_No") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditPhoneNO" CssClass="gvTextbox" runat="server" Text='<%# Bind("Medicine_Phone_No") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                <ItemStyle CssClass="gvitem"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Medicine_Shop_Address") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditAddress" CssClass="gvTextbox" runat="server" Text='<%# Bind("Medicine_Shop_Address") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                <ItemStyle CssClass="gvitem"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="gvaction" HeaderStyle-CssClass="gvheader">
                                <ItemTemplate>
                                    <asp:LinkButton ID="txtEdit" CssClass="gvbtn" runat="server" CommandName="Edit" OnClientClick="return confirm('Do you want to edit the selected row?')"
                                        ToolTip="Edit"><i class="fas fa-user-edit"></i>Edit</asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="txtUpdate" CssClass="gvbtn" runat="server" CommandName="Update"
                                        OnClientClick="return confirm('Do you want to update?')" ToolTip="Update row"><i class="fas fa-save"></i>Update</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton4" CssClass="gvbtn" runat="server" CommandName="Delete"
                                        OnClientClick="return confirm('Do you want to Delete?')" ToolTip="Delete row"><i class="fas fa-save"></i>Delete</asp:LinkButton>
                                    <asp:LinkButton ID="txtCancel" CssClass="gvbtn" runat="server" CommandName="Cancel"
                                        OnClientClick="return confirm('All unsaved data will be lost!')" ToolTip="Cancel editing"><i class="fas fa-window-close"></i>Cancel</asp:LinkButton>
                                </EditItemTemplate>
                                <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                <ItemStyle CssClass="gvaction"></ItemStyle>
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
