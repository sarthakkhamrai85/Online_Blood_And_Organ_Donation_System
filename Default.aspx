<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="User_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Application_ID" DataSourceID="SqlDataSource1" 
            EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Phone_No" HeaderText="Phone_No" 
                    SortExpression="Phone_No" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Status" HeaderText="Status" 
                    SortExpression="Status" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
            DeleteCommand="DELETE FROM [tblAmbulence] WHERE [Application_ID] = @Application_ID" 
            InsertCommand="INSERT INTO [tblAmbulence] ([Name], [Email], [Phone_No], [City], [Status], [Application_ID]) VALUES (@Name, @Email, @Phone_No, @City, @Status, @Application_ID)" 
            ProviderName="<%$ ConnectionStrings:DatabaseConnectionString1.ProviderName %>" 
            SelectCommand="SELECT [Name], [Email], [Phone_No], [City], [Status], [Application_ID] FROM [tblAmbulence]" 
            UpdateCommand="UPDATE [tblAmbulence] SET [Name] = @Name, [Email] = @Email, [Phone_No] = @Phone_No, [City] = @City, [Status] = @Status WHERE [Application_ID] = @Application_ID">
            <DeleteParameters>
                <asp:Parameter Name="Application_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone_No" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Application_ID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone_No" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Application_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Email" DataSourceID="SqlDataSource2" 
            EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="First_Name" HeaderText="First_Name" 
                    SortExpression="First_Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" 
                    SortExpression="Last_Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" 
                    SortExpression="Email" />
                <asp:BoundField DataField="Mobile_No" HeaderText="Mobile_No" 
                    SortExpression="Mobile_No" />
                <asp:BoundField DataField="Date_Of_Birth" HeaderText="Date_Of_Birth" 
                    SortExpression="Date_Of_Birth" />
                <asp:BoundField DataField="Address" HeaderText="Address" 
                    SortExpression="Address" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" 
                    SortExpression="Gender" />
                <asp:BoundField DataField="Donation" HeaderText="Donation" 
                    SortExpression="Donation" />
                <asp:BoundField DataField="Blood" HeaderText="Blood" SortExpression="Blood" />
                <asp:BoundField DataField="Organ" HeaderText="Organ" SortExpression="Organ" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
            DeleteCommand="DELETE FROM [tblDonation] WHERE [Email] = @Email" 
            InsertCommand="INSERT INTO [tblDonation] ([First_Name], [Last_Name], [Email], [Mobile_No], [Date_Of_Birth], [Address], [Gender], [Donation], [Blood], [Organ]) VALUES (@First_Name, @Last_Name, @Email, @Mobile_No, @Date_Of_Birth, @Address, @Gender, @Donation, @Blood, @Organ)" 
            SelectCommand="SELECT [First_Name], [Last_Name], [Email], [Mobile_No], [Date_Of_Birth], [Address], [Gender], [Donation], [Blood], [Organ] FROM [tblDonation] WHERE (([Blood] = @Blood) AND ([Organ] = @Organ))" 
            UpdateCommand="UPDATE [tblDonation] SET [First_Name] = @First_Name, [Last_Name] = @Last_Name, [Mobile_No] = @Mobile_No, [Date_Of_Birth] = @Date_Of_Birth, [Address] = @Address, [Gender] = @Gender, [Donation] = @Donation, [Blood] = @Blood, [Organ] = @Organ WHERE [Email] = @Email">
            <DeleteParameters>
                <asp:Parameter Name="Email" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="First_Name" Type="String" />
                <asp:Parameter Name="Last_Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Mobile_No" Type="String" />
                <asp:Parameter Name="Date_Of_Birth" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Donation" Type="String" />
                <asp:Parameter Name="Blood" Type="String" />
                <asp:Parameter Name="Organ" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Blood" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DropDownList2" Name="Organ" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="First_Name" Type="String" />
                <asp:Parameter Name="Last_Name" Type="String" />
                <asp:Parameter Name="Mobile_No" Type="String" />
                <asp:Parameter Name="Date_Of_Birth" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Donation" Type="String" />
                <asp:Parameter Name="Blood" Type="String" />
                <asp:Parameter Name="Organ" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource3" DataTextField="Blood" DataValueField="Blood">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
            SelectCommand="SELECT DISTINCT [Blood] FROM [tblDonation]">
        </asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource4" DataTextField="Organ" DataValueField="Organ">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
            SelectCommand="SELECT DISTINCT [Organ] FROM [tblDonation]">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Application_ID" DataSourceID="SqlDataSource5" 
            EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Phone_No" HeaderText="Phone_No" 
                    SortExpression="Phone_No" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Status" HeaderText="Status" 
                    SortExpression="Status" />
                <asp:BoundField DataField="Application_ID" HeaderText="Application_ID" 
                    ReadOnly="True" SortExpression="Application_ID" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
            SelectCommand="SELECT DISTINCT [Name], [Email], [Phone_No], [City], [Status], [Application_ID] FROM [tblAmbulence]">
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource6">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Desease" HeaderText="Desease" 
                    SortExpression="Desease" />
                <asp:BoundField DataField="DeasesName" HeaderText="DeasesName" 
                    SortExpression="DeasesName" />
                <asp:BoundField DataField="Blood_Date" HeaderText="Blood_Date" 
                    SortExpression="Blood_Date" />
                <asp:BoundField DataField="Donate_Date" HeaderText="Donate_Date" 
                    SortExpression="Donate_Date" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
            SelectCommand="SELECT [Name], [Email], [Desease], [DeasesName], [Blood_Date], [Donate_Date] FROM [tblDeases]">
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Label ID="lblError" runat="server"></asp:Label>
        <asp:Label ID="lbMessage" runat="server"></asp:Label>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Application_ID" DataSourceID="SqlDataSource7" 
            EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Phone_No" HeaderText="Phone_No" 
                    SortExpression="Phone_No" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Status" HeaderText="Status" 
                    SortExpression="Status" />
                <asp:BoundField DataField="Application_ID" HeaderText="Application_ID" 
                    ReadOnly="True" SortExpression="Application_ID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
            DeleteCommand="DELETE FROM [tblAmbulence] WHERE [Application_ID] = @Application_ID" 
            InsertCommand="INSERT INTO [tblAmbulence] ([Name], [Email], [Phone_No], [City], [Status], [Application_ID]) VALUES (@Name, @Email, @Phone_No, @City, @Status, @Application_ID)" 
            ProviderName="<%$ ConnectionStrings:DatabaseConnectionString1.ProviderName %>" 
            SelectCommand="SELECT [Name], [Email], [Phone_No], [City], [Status], [Application_ID] FROM [tblAmbulence]" 
            UpdateCommand="UPDATE [tblAmbulence] SET [Name] = @Name, [Email] = @Email, [Phone_No] = @Phone_No, [City] = @City, [Status] = @Status WHERE [Application_ID] = @Application_ID">
            <DeleteParameters>
                <asp:Parameter Name="Application_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone_No" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Application_ID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone_No" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="Application_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
