<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Dasbord.aspx.cs" Inherits="Admin_Admin_Dasbord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%
        string path = HttpContext.Current.Server.MapPath("Link.txt");
        string content = System.IO.File.ReadAllText(path);
        Response.Write(content);
    %>
    <link href="CSS/Dasbord.css" rel="stylesheet" type="text/css" />
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
                <div id="content">
                    <div class="window">
                        <div class="home-content">
                            <div class="overview-boxes">
                                <div class="box">
                                    <div class="right-side">
                                        <div class="box-topic">
                                            Total Organ Donate</div>
                                        <div id="lblOrgan" class="number" runat="server">
                                            40,876</div>
                                        <div class="indicator">
                                            <i class='bx bx-up-arrow-alt'></i><span class="text">Up from yesterday</span>
                                        </div>
                                    </div>
                                    <i class='bx bx-cart-alt cart'></i>
                                </div>
                                <div class="box">
                                    <div class="right-side">
                                        <div class="box-topic">
                                            Total Blood Donate</div>
                                        <div id="lblBlood" class="number" runat="server">
                                            38,876</div>
                                        <div class="indicator">
                                            <i class='bx bx-up-arrow-alt'></i><span class="text">Up from yesterday</span>
                                        </div>
                                    </div>
                                    <i class='bx bxs-cart-add cart two'></i>
                                </div>
                                <div class="box">
                                    <div class="right-side">
                                        <div class="box-topic">
                                            Total Registration</div>
                                        <div id="lblRegistration" class="number" runat="server">
                                            $12,876</div>
                                        <div class="indicator">
                                            <i class='bx bx-up-arrow-alt'></i><span class="text">Up from yesterday</span>
                                        </div>
                                    </div>
                                    <i class='bx bx-cart cart three'></i>
                                </div>
                                <div class="box">
                                    <div class="right-side">
                                        <div class="box-topic">
                                            Total Ambulence Serivce
                                        </div>
                                        <div id="lblAmbulence" class="number" runat="server">
                                            11,086</div>
                                        <div class="indicator">
                                            <i class='bx bx-down-arrow-alt down'></i><span class="text">Down From Today</span>
                                        </div>
                                    </div>
                                    <i class='bx bxs-cart-download cart four'></i>
                                </div>
                            </div>
                            <br />
                            <br>
                            <div class="date">
                                <asp:Button ID="btnLocal" runat="server" Text="Get Local Time" OnClick="btnLocal_Click" />
                                <asp:Label ID="lblLocal" runat="server" Text="Local Server Time."></asp:Label>
                                <br />
                                <br />
                                <asp:Button ID="btnServer" runat="server" Text="Get Live Time" OnClick="btnServer_Click" />
                                <asp:Label ID="lblServer" runat="server" Text="Live Server Time."></asp:Label>
                                <br />
                                <br />
                                <asp:Button ID="btnDay" runat="server" Text="Get Live Day" OnClick="btnDay_Click" />
                                <asp:Label ID="lblDay" runat="server" Text="Live Server Day."></asp:Label>
                            </div>
                        </div>
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
