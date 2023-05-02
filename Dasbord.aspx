<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dasbord.aspx.cs" Inherits="User_Dasbord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%
        string path = HttpContext.Current.Server.MapPath("Link.txt");
        string content = System.IO.File.ReadAllText(path);
        Response.Write(content);
    %>
    <link href="CSS/Dasbord2.css" rel="stylesheet" type="text/css" />
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
                <div class="home-content">
                    <div class="overview-boxes">
                        <div class="box">
                            <div class="right-side">
                                <div class="box-topic"><br /><br />
                                    Total Blood Donate</div><br /><br />
                                <div class="number" runat="server" id="lblBlood">
                                    40,876</div>
                                <div class="indicator">
                                    <i class='bx bx-up-arrow-alt'></i><span class="text">Up from yesterday</span>
                                </div>
                            </div>
                            <i class='bx bx-cart-alt cart'></i>
                        </div>
                        <div class="box">
                            <div class="right-side">
                                <div class="box-topic"><br /><br />
                                    Total Organ Donate</div><br /><br />
                                <div class="number" runat="server" id="lblOrgan">
                                    38,876</div>
                                <div class="indicator">
                                    <asp:GridView ID="GridView2" runat="server">
                                    </asp:GridView>
                                    <i class='bx bx-up-arrow-alt'></i><span class="text">Up from yesterday</span>
                                </div>
                            </div>
                            <i class='bx bxs-cart-add cart two'></i>
                        </div>
                        <div class="box">
                            <div class="right-side">
                                <div class="box-topic"><br /><br />
                                    Total Blood Camp</div><br /><br />
                                <div class="number" runat="server" id="lblBloodCamp">
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
                                    Total Blood Avalible</div>
                                <div class="indicator">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        DataKeyNames="Blood_Group_Name" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="Blood_Group_Name" HeaderText="Blood" ReadOnly="True" 
                                                SortExpression="Blood_Group_Name" />
                                            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:Online_Blood_Donation_SystemConnectionString7 %>" 
                                        SelectCommand="SELECT [Blood_Group_Name], [Total] FROM [tblBlood_Bank_Status]">
                                    </asp:SqlDataSource>
                                    <i class='bx bx-down-arrow-alt down'></i><span class="text">Down From Today</span>
                                </div>
                            </div>
                            <i class='bx bxs-cart-download cart four'></i>
                        </div>
                        <br />
                        <br />
                        <div id="content">
                            <div id="holi">
                                <div>
                                    <h1>
                                        WELCOME</h1>
                                </div>
                                <ul>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                </ul>
                            </div>
                            <div id="update" class="window" runat="server">
                                <p>
                                    New Update</p>
                            </div>
                            <asp:Panel ID="task" class="window" runat="server" Visible="false">
                                <p>
                                    Daily Task</p>
                                <div class="lbl">
                                    <asp:Label ID="lblDailyTask" runat="server" Text="Daily task Pending."></asp:Label>
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
