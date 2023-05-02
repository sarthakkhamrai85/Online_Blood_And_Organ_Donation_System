<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="ContactUS.css" rel="stylesheet" type="text/css" />
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
    <div class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="navbar-header">
                        <button class="navbar-toggle" data-target="#mobile_menu" data-toggle="collapse">
                            <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                            </span>
                        </button>
                        <a href="#" class="navbar-brand"><h5> Online Blood And Organ Donation System <i class="fab fa-atlassian"></i> </h5></a>
                    </div>
                    <div class="navbar-collapse collapse" id="mobile_menu">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="Default.aspx">Home</a></li>
                            <li><a href="#" class="dropdown-toggle" data-toggle="dropdown">Service Provider<span class="caret">
                            </span></a>
                                <ul class="dropdown-menu">
                                     <li><a href="User/User_Login.aspx">Blood Donate</a></li>
                                    <li><a href="User/User_Login.aspx">Organ Donate</a></li>
                                    <li><a href="User/User_Login.aspx">Demand OF Blood</a></li>
                                    <li><a href="User/User_Login.aspx">Demand OF Organ</a></li>
                                    <li><a href="User/User_Login.aspx">Ambulence Service</a></li>
                                    <li><a href="User/User_Login.aspx">Near by Medicine Shop</a></li>
                                </ul>
                            </li>
                            <li><a href="AboutUs.aspx">About Us</a></li>
                          <!--  <li><a href="#">Services</a></li> -->
                            <li><a href="#">Gallery</a></li>
                            <li><a href="ContactUs.aspx">Contact Us</a></li>
                        </ul>
                        <ul class="nav navbar-nav">
                            <li>
                                <form action="" class="navbar-form">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="search" name="search" id="" placeholder="Search Anything Here..." class="form-control">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span>
                                        </span>
                                    </div>
                                </div>
                                </form>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                         <!--   <li><a href="#"><span class="glyphicon glyphicon-user"></span>Profile</a></li> -->
                            <li><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-log-in">
                            </span>Login / Sign Up <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="User/User_Login.aspx">Login</a></li>
                                    <li><a href="User/User_Registrtion.aspx">Sign Up</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <div class="container">
    <div class="content">
      <div class="left-side">
        <div class="address details">
          <i class="fas fa-map-marker-alt"></i>
          <div class="topic">Address</div>
          <div class="text-one">Midnapore,West Bengal</div>
          <div class="text-two">Midnapore 06</div>
        </div>
        <div class="phone details">
          <i class="fas fa-phone-alt"></i>
          <div class="topic">Phone</div>
          <div class="text-one">+0098 9893 5647</div>
          <div class="text-two">7866087836</div>
        </div>
        <div class="email details">
          <i class="fas fa-envelope"></i>
          <div class="topic">Email</div>
          <div class="text-one">codinglab@gmail.com</div>
          <div class="text-two">info:sarthakkhamrai5@gmail.com</div>
        </div>
      </div>
      <div class="right-side">
        <div class="topic-text">Send us a message</div>
        <p>If you have any work from me or any types of quries related to my tutorial, you can send me message from here. It's my pleasure to help you.</p>
      <form action="#">
        <div class="input-box">
         
            <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name"></asp:TextBox>
        </div>
        <div class="input-box">
          
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email"></asp:TextBox>
        </div>
        <div class="input-box message-box">
          <asp:TextBox ID="txtWrite" runat="server" placeholder="Write a Message" 
                TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="button">
            <asp:Button ID="btnSend" runat="server" Text="Send Now"  value="Send Now"  
                class="Button" onclick="btnSend_Click"/>
        </div>
      </form>
    </div>
    </div>
  </div>
      <section class="footer">
    <div class="box-container">
        <div class="box">
            <h3> Online Blood And Organ Donation System <i class="fab fa-atlassian"></i> </h3>
            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aliquam, saepe.</p>
            <div class="share">
                <a href="#" class="fab fa-facebook-f"></a>
                <a href="#" class="fab fa-twitter"></a>
                <a href="#" class="fab fa-instagram"></a>
                <a href="#" class="fab fa-linkedin"></a>
            </div>
        </div>
        <div class="box">
            <h3>contact info</h3>
            <a href="#" class="links"> <i class="fas fa-phone"></i> 7866087836 </a>
            <a href="#" class="links"> <i class="fas fa-phone"></i> 7001982895 </a>
            <a href="#" class="links"> <i class="fas fa-envelope"></i> sarthak332@gmail.com </a>
            <a href="#" class="links"> <i class="fas fa-map-marker-alt"></i> Midnapore, West Bengal, India </a>
        </div>
        <div class="box">
            <h3>quick links</h3>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> Home </a>
             <a href="Admin/Admin_Login.aspx" class="links"> <i class="fas fa-arrow-right"></i> Admin Login </a>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> Donate Blood </a>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> Donate Organs </a>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> Need Blood</a>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> Review </a>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> News </a>
        </div>
        <div class="box">
            <h3>Newsletter</h3>
            <p>subscribe for latest updates</p>
            <input type="email" placeholder="your email" class="email">
            <input type="submit" value="subscribe" class="btn">
            <img src="images/payment.png" class="payment-img" alt="" />
        </div>
    </div>
    <div class="credit"> created by |<asp:LinkButton ID="LinkButton3" runat="server" 
          >Developer Team</asp:LinkButton>| All Rights Reserved </div>

</section>
    <!-- footer section ends -->
    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
    <!-- custom js file link  -->
    <script src="js/script.js"></script>
    </form>
</body>
</html>
