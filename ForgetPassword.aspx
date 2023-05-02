<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="User_ForgetPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body
        {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        .container
        {
            width: 400px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.5);
            padding: 20px;
            box-sizing: border-box;
        }
        h2
        {
            text-align: center;
            color: #555;
        }
        input[type=text], input[type=password]
        {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        btnLogin
        {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        button:hover
        {
            background-color: #45a049;
        }
        .cancelbtn
        {
            width: auto;
            padding: 10px 18px;
            background-color: #f44336;
        }
        .imgcontainer
        {
            text-align: center;
            margin: 24px 0 12px 0;
            position: relative;
        }
        img.avatar
        {
            width: 30%;
            border-radius: 50%;
        }
        .overlay
        {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: rgba(0, 0, 0, 0.6);
            pointer-events: none;
            opacity: 0;
            transition: opacity 0.5s;
        }
        .imgcontainer:hover .overlay
        {
            pointer-events: auto;
            opacity: 1;
        }
        .overlay-text
        {
            color: white;
            font-size: 20px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
        }
        .btnLogin
        {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        #logo
        {
            min-height: 80px;
            width: 100%;
            background-image: linear-gradient(#4CAF50, #4CAF50,#00A3F8);
            color: #fff;
            font-size: 40px;
            text-transform: uppercase;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            letter-spacing: 4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="logo" runat="server">
        ONLINE BLOOD &amp; ORGAN DONATION SYSTEM</div>
    <div class="container">
        <h2>
            Forget Password</h2>
        <form>
        <div class="imgcontainer">
            <img src="avatar.png" alt="Avatar" class="avatar">
            <div class="overlay">
                <div class="overlay-text">
                    Change Avatar</div>
            </div>
        </div>
        <asp:Label ID="Label1" runat="server" Text=" First Name"></asp:Label><br />
        <asp:TextBox ID="txtName" placeholder="Enter First Name" runat="server" required Height="35px"
            Width="350px"></asp:TextBox><br />
        <asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label><br />
        <asp:TextBox ID="txtLast" placeholder="Enter Last Name" runat="server" required Height="35px"
            Width="350px"></asp:TextBox><br />
        <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="txtEmail" placeholder="Enter Email" runat="server" required Height="35px"
            TextMode="Email" Width="350px"></asp:TextBox>
        <asp:Button ID="btnSend" runat="server" Text="Send" class="btnLogin" OnClick="btnSend_Click" />
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
        </form>
        <div class="imgcontainer">
    </form>
</body>
</html>
