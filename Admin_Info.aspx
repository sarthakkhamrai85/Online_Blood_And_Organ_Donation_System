<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Info.aspx.cs" Inherits="Admin_Admin_Info" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="CSS/Admin_Info.css" rel="stylesheet" type="text/css" />
    <script src="JS/Admin_Info.js" type="text/javascript"></script>
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
    <asp:UpdateProgress ID="progressUpdate" AssociatedUpdatePanelID="pageUpdate" runat="server">
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
                    <asp:Label ID="Label2" runat="server" Text="Control Panel / Company Information"></asp:Label>
                </div>
                <div id="content">
                    <div id="btnContainer">
                        <asp:LinkButton ID="linkInfo" CssClass="button" runat="server" 
                            onclick="linkInfo_Click"><i class="fas fa-building"></i>Company Information</asp:LinkButton>
                        <asp:LinkButton ID="linkAdmin" CssClass="button" runat="server" 
                            onclick="linkAdmin_Click"><i class="fas fa-user-shield"></i>Admin List</asp:LinkButton>
                    </div>
                    <asp:Panel CssClass="tabPanel" ID="panelInfo" runat="server">
                        <div class="intro">
                            <h>Detailed information about Company</h>
                            <ul>
                                <li><i class="fas fa-exclamation-triangle"></i>Warning! Sensitive zone, be carefull.</li>
                            </ul>
                        </div>
                        <div class="form">
                            <div class="input-box">
                                <asp:TextBox ID="txtCompanyName" CssClass="input" type="text" autocomplete="off"
                                    runat="server" MaxLength="20" required Enabled="false"></asp:TextBox>
                                <label for="txtCompanyName" class="label-name">
                                    <div class="icon">
                                        <i class="fas fa-building"></i>
                                    </div>
                                    <span class="content-name">Company Name</span>
                                </label>
                            </div>
                            <div class="input-box">
                                <asp:TextBox ID="txtMobile" CssClass="input" type="text" autocomplete="off" runat="server"
                                    required onkeypress='validate(event)' MaxLength="10" Enabled="false"></asp:TextBox>
                                <label for="txtMobile" class="label-name">
                                    <div class="icon">
                                        <i class="fas fa-mobile-alt"></i>
                                    </div>
                                    <span class="content-name">Mobile</span>
                                </label>
                            </div>
                            <div class="input-box">
                                <asp:TextBox ID="txtEmail" CssClass="input" type="text" autocomplete="off" runat="server"
                                    required MaxLength="50" Enabled="false"></asp:TextBox>
                                <label for="txtEmail" class="label-name">
                                    <div class="icon">
                                        <i class="fas fa-envelope"></i>
                                    </div>
                                    <span class="content-name">Email</span>
                                </label>
                            </div>
                            <div class="input-box">
                                <asp:TextBox ID="txtOwner" CssClass="input" type="text" autocomplete="off" runat="server"
                                    required MaxLength="20" Enabled="false"></asp:TextBox>
                                <label for="txtOwner" class="label-name">
                                    <div class="icon">
                                        <i class="fas fa-user-tie"></i>
                                    </div>
                                    <span class="content-name">Owner</span>
                                </label>
                            </div>
                            <div class="input-box">
                                <asp:TextBox ID="txtInfo" CssClass="input" type="text" autocomplete="off" runat="server"
                                    TextMode="MultiLine" Rows="4" MaxLength="50" Enabled="false"></asp:TextBox>
                                <label for="txtInfo" class="label">
                                    <span class="content">Information</span>
                                </label>
                            </div>
                            <div class="input-box">
                                <asp:TextBox ID="txtAddress" CssClass="input" type="text" autocomplete="off" runat="server"
                                    TextMode="MultiLine" Rows="4" MaxLength="50" Enabled="false"></asp:TextBox>
                                <label for="txtAddress" class="label">
                                    <span class="content">Address</span>
                                </label>
                            </div>
                            <div class="input-box">
                                <asp:Label ID="Label3" runat="server" Text="Last updated on : "></asp:Label>
                                <asp:Label ID="lblDate" runat="server" Text="N/A"></asp:Label>
                            </div>
                            <div class="btnContainer">
                                <asp:Button ID="btnUpdate" CssClass="btn" runat="server" Text="Edit" 
                                    onclick="btnUpdate_Click" />
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel CssClass="tabPanel" ID="panelAdmin" runat="server" Visible="false">
                        <div class="gvContainer">
                            <asp:GridView ID="gvAdmin" CssClass="gv" runat="server" AutoGenerateColumns="False"
                                ShowHeaderWhenEmpty="True" ShowFooter="True" DataKeyNames="Email"  OnRowCancelingEdit="gvAdmin_RowCancelingEdit" OnRowDeleting="gvAdmin_RowDeleting" OnRowEditing="gvAdmin_RowEditing" OnRowUpdating="gvAdmin_RowUpdating">
                                <Columns>
                                    <asp:TemplateField HeaderText="Email" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader"
                                        FooterStyle-CssClass="gvitem">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                        <FooterStyle CssClass="gvitem"></FooterStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Password" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader"
                                        FooterStyle-CssClass="gvitem">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Password") %>' type="password"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Password") %>' type="password"></asp:Label>
                                        </EditItemTemplate>
                                      
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                        <FooterStyle CssClass="gvitem"></FooterStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="First Name" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader"
                                        FooterStyle-CssClass="gvitem">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("First_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditFName" CssClass="gvTextbox" runat="server" MaxLength="20"
                                                Text='<%# Bind("First_Name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                        <FooterStyle CssClass="gvitem"></FooterStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Last Name" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader"
                                        FooterStyle-CssClass="gvitem">
                                        <ItemTemplate>s
                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Last_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditLName" CssClass="gvTextbox" runat="server" Text='<%# Bind("Last_Name") %>'
                                               ></asp:TextBox>
                                        </EditItemTemplate>
                                        
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                        <FooterStyle CssClass="gvitem"></FooterStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mobile" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader"
                                        FooterStyle-CssClass="gvitem">
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("Phone_no") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditMobile" CssClass="gvTextbox" runat="server" MaxLength="50"
                                                Text='<%# Bind("Phone_no") %>'></asp:TextBox>
                                        </EditItemTemplate>

                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvitem"></ItemStyle>
                                        <FooterStyle CssClass="gvitem"></FooterStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="gvaction" HeaderStyle-CssClass="gvheader"
                                        FooterStyle-CssClass="gvaction">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" CssClass="gvbtn" runat="server" CommandName="Edit"
                                                OnClientClick="return confirm('Do you want to edit the selected row?')" ToolTip="Edit"><i class="fas fa-user-edit"></i>Edit</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton2" CssClass="gvbtn delete" runat="server" CommandName="Delete"
                                                OnClientClick="return confirm('Do you want to delete the selected admin? It can not be undone!')"
                                                ToolTip="Delete the entire row"><i class="fas fa-trash-alt delete"></i>Delete</asp:LinkButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton3" CssClass="gvbtn" runat="server" CommandName="Update"
                                                OnClientClick="return confirm('Do you want to update?')" ToolTip="Update row"><i class="fas fa-save"></i>Update</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton4" CssClass="gvbtn" runat="server" CommandName="Cancel"
                                                OnClientClick="return confirm('All unsaved data will be lost!')" ToolTip="Cancel editing"><i class="fas fa-window-close"></i>Cancel</asp:LinkButton>
                                        </EditItemTemplate>
                                       
                                        <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                        <ItemStyle CssClass="gvaction"></ItemStyle>
                                        <FooterStyle CssClass="gvaction"></FooterStyle>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:Panel>
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
