<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HelpDisk.aspx.cs" Inherits="User_HelpDisk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%
        string path = HttpContext.Current.Server.MapPath("Link.txt");
        string content = System.IO.File.ReadAllText(path);
        Response.Write(content);
    %>
    <link href="CSS/HelpDisk.css" rel="stylesheet" type="text/css" />
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
                    <asp:Label ID="Label2" runat="server" Text="Control Panel / Emerrgency  Consulting"></asp:Label>
                </div>
                <section class="features" id="features">
    <h1 class="heading"> our <span>Respected Doctor</span> </h1>
    <div class="box-container">
         <div class="box">
            <img src="../images/Screenshot_2023-04-03-00-04-01-31.jpg" />
            <h3>Dr.Subhayan Das</h3>
            <h3 style="color: #009933">Senior Doctor</h3>
            <p>Midnapore Medical College & Hospital</p><p>Cardiology Specialist</p><p>Contract No:7866087836</p>
        </div>

        <div class="box">
        <img src="../images/Screenshot_2023-04-03-00-04-21-98.jpg" />
            <h3>Dr.Prashant Chaubey</h3>
             <h3 style="color: #009933">Senior Doctor</h3>
                       <p>Midnapore Medical College & Hospital</p><p>General Physican</p><p>Contract No:7866087836</p>
        </div>
        <div class="box">
           <img src="../images/Screenshot_2023-04-03-00-05-03-94.jpg" />
            <h3 >Dr.Saikat Sheet</h3>
             <h3 style="color: #009933">Senior Doctor</h3>
              <p>Midnapore Medical College & Hospital</p><p>General Physican</p><p>Contract No:7866087836</p>
        </div>
         <div class="box">
            <img src="../images/Screenshot_2023-04-03-00-05-19-38.jpg" />
            <h3>Dr.Sovan Mondal</h3>
            <h3 style="color: #009933">Senior Doctor</h3>
              <p>Midnapore Medical College & Hospital</p><p>General Physican</p><p>Contract No:7866087836</p>
        </div>
    </div>
</section>
                <br />
                <section class="features" id="features">
    <h1 class="heading"> our <span>Respected Nurse</span> </h1>
    <div class="box-container">
         <div class="box">
            <img src="../images/Nurse2.jpg" />
            <h3>Aparna Majhi</h3>
            <h3 style="color: #009933"> Junior Nurse</h3>
            <p>Midnapore Medical College & Hospital</p><p> Contect No : 7866087836</p>
        </div>

        <div class="box">
        
        <img src="../images/Nurse1.jpg" />
            <h3>Subhadipa Maity</h3>
             <h3 style="color: #009933">Senior Nurse</h3>
             <p>Midnapore Medical College & Hospital</p><p> Contect No : 7866087836</p>
        </div>
        <div class="box">
           <img src="../images/Nurse3.jpg" />
            <h3 >Payel Maity</h3>
             <h3 style="color: #009933">Senior Nurse</h3>
             <p>Midnapore Medical College & Hospital</p><p> Contect No : 7866087836</p>
        </div>
         <div class="box">
            <img src="../images/Nurse5.jpg" />
            <h3>Nilufa Das</h3>
            <h3 style="color: #009933">Junior Nurse</h3>
              <p>Midnapore Medical College & Hospital</p><p> Contect No : 7866087836</p>
        </div>
    </div>
</section>
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
