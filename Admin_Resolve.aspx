﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Resolve.aspx.cs" Inherits="Admin_Admin_Resolve" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%
        string path = HttpContext.Current.Server.MapPath("Link.txt");
        string content = System.IO.File.ReadAllText(path);
        Response.Write(content);
    %>
    <link href="CSS/Admin_resove.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#993333">
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
                    <asp:Label ID="Label2" runat="server" Text="Control Panel / Donation Resolve"></asp:Label>
                </div>
                <div id="content">
                    <div class="window">
                        <div class="gvContainer">
                            <asp:TextBox ID="txtName" runat="server" class="feedback-input" placeholder="Name"></asp:TextBox><br />
                            <asp:TextBox ID="txtEmail" runat="server" class="feedback-input" placeholder="Email"></asp:TextBox><br />
                            <asp:TextBox ID="txtComentBox" runat="server" class="feedback-input" placeholder="Comment"
                                TextMode="MultiLine" Visible="false"></asp:TextBox><br />
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" ForeColor="Black" AutoPostBack="True"
                                OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                <asp:ListItem Value="Approve">Aprove For Medical Test</asp:ListItem>
                                <asp:ListItem Value="Deny">Deny For Medical Test</asp:ListItem>
                                <asp:ListItem Value="Wait">Wait List</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                    <div class="gvContainer">
                        <asp:GridView ID="gvLeader" CssClass="gv" runat="server" AutoGenerateColumns="False"
                            Width="1454px" DataKeyNames="Email">
                            <Columns>
                            <asp:TemplateField HeaderText="Name" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label16" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditUname" CssClass="gvTextbox" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>

                             <asp:TemplateField HeaderText="Email" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="disease" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("DieasesYes") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditname" CssClass="gvTextbox" runat="server" Text='<%# Bind("DieasesYes") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                               
                                <asp:TemplateField HeaderText="Disease Name" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("DiseaseName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditPhone" CssClass="gvTextbox" runat="server" Text='<%# Bind("DiseaseName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Recently Donate Blood" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("DonateBlood") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditCity" CssClass="gvTextbox" runat="server" Text='<%# Bind("DonateBlood") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Donate Date" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("BloodDate") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditStatus" CssClass="gvTextbox" runat="server" Text='<%# Bind("BloodDate") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                                <%--<asp:TemplateField HeaderText="Action" ItemStyle-CssClass="gvaction" HeaderStyle-CssClass="gvheader">
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
