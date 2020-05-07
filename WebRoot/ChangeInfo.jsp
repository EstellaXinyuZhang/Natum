<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="betago.dao.impl.UserDAOImpl" %>
<%@ page import="betago.entity.User" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Change Personal Information</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content="" />
    <script>
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }

    </script>
    <!-- //Meta tag Keywords -->
    <!-- Custom-Files -->
    <link rel="stylesheet" href="css/bootstrap_home.css">
    <!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="css/style_home.css" type="text/css" media="all" />
    <!-- Style-CSS -->
    <!-- font-awesome-icons -->
    <link href="css/font-awesome_home.css" rel="stylesheet">
    <!-- //font-awesome-icons -->
    <!-- /Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800" rel="stylesheet">
    <!-- //Fonts -->
    <script language="javascript" type="text/javascript"  src="js/My97DatePicker/WdatePicker.js"></script>
    <script language="javascript" type="text/javascript"  src="js/register_check.js"></script>
    
    
  </head>
  
    
  <body>
    <%
    String username=(String)session.getAttribute("username");
    String password=(String)session.getAttribute("password");
    UserDAOImpl dao=new UserDAOImpl();
    User user=dao.getUserInfo(username);
    %>
   
    <div class="main-content inner" id="home">
        <!--/Top-Header-->
        <div class="top-bar-w3layouts pt-4">
            <div class="container">
                <div class="row">
                    <div class="offset-xl-5">
                    </div>
                    <div class="col-xl-7 top-social-lavi text-md-right text-center mt-md-0 mt-2">
                        <div class="row right-top-info">
                            <div class="col-md-6 header-top text-xl-right text-center">
                                <p class="mr-2">
                                    <span class="fa fa-map-marker mr-2"></span> BUPT, Beijing
                                </p>
                                <p>
                                    <i class="fa fa-phone mr-2"></i> +1 000263676
                                </p>
                            </div>
                            <!-- social icons -->
                            <ul class="col-md-6 top-right-info text-md-right text-center">
                                <li>
                                    <p style="color: aliceblue">Follow Us :</p>
                                </li>
                                <li class="ml-3 mr-1">
                                    <a href="#">
											<span class="fa fa-facebook-f"></span>
										</a>
                                </li>
                                <li>
                                    <a href="#">
											<span class="fa fa-twitter"></span>
										</a>
                                </li>
                                <li class="mx-1">
                                    <a href="#">
											<span class="fa fa-google-plus"></span>
										</a>
                                </li>
                                <li>
                                    <a href="#">
											<span class="fa fa-dribbble"></span>
										</a>
                                </li>
                            </ul>
                            <!-- //social icons -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--//Top-Header-->
        <!-- header -->
        <header class="header">
            <div class="container">
                <!-- nav -->
                <nav class="pb-3">
                    <div id="logo">
                        <h1> <a class="navbar-brand" href="index.html"><span>N</span>atum</a>
                        </h1>
                    </div>
                    <label for="drop" class="toggle">Menu</label>
                    <input type="checkbox" id="drop" />
                    <ul class="menu mt-2">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="about.jsp">About</a></li>
                        <li><a href="community.jsp">Community</a></li>
                        <div class="modified-dropdown">
                            <li><a href="list.jsp">Product <span class="fa fa-angle-down" aria-hidden="true"></span></a></li>
                            <div class="out"  style="background-color: brown">
                                <ul class="plat">
                                <li><a href="searchlist.jsp?searchName=Dog">Dog series</a>
                                </li>
                                <li><a href="searchlist.jsp?searchName=watch">Watch series</a>
                                </li>
                                <li><a href="searchlist.jsp?searchName=glass">Glass series</a>
                                </li>
                                </ul>
                                </div>
                          </div>
                        
                        <li class="header-right">
                        <%
                        
	                    String sign="";
	                    if(username==null) {
	                         sign="Log In";
						}else{ 
						     sign="Change Acount";
						} %>
                            <a href="login.jsp" class="contact"> <span class="fa fa-user"></span> <%=sign%></a>
                        </li>
                    </ul>


                </nav>
                <!-- //nav -->

            </div>
        </header>
        <!-- //header -->
    </div>
    <!-- //main-content -->
    <!--/contact -->
    <section class="ab-info-main py-md-5 py-5">
        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5">
                <h3 class="tittle text-center mb-lg-5 mb-3 inner-tittle"><span class="sub-tittle"></span>Change Your Information</h3>
                <p class="text-center px-lg-5" data-aos="fade-up">We are here for you</p>
                <div class="contact-form mt-md-5">
                    <div class="contact-form-inner mx-auto text-left">
                        <form name="contactform " id="contactform" action="./register" method="post" onsubmit="return checkAll_change()">
                            <div class="row">
                                <div class="col-lg-6 con-gd">
                                    <div class="form-group">
                                        <label>AccountID</label>
                                        <input readonly="readonly" class="form-control" type="text" name="userID" id="userID" margin="10" value="<%=user.getUsername() %>" onblur="checkId()" >
                                        <span id="userIDspan" style="display: block"></span>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>Your first name</label>
                                        <input type="text" class="form-control" value="<%=user.getFname()%>" width="20%"  maxlength="15" id="fName" name="fName" onblur="checkFname()"/>
                                        <span id="fNamespan"style="display: block"></span>
                                    </div>
                                     <div class="form-group">
                                        <label>Your last name</label>
                                        <input type="text" class="form-control" value="<%=user.getLname()%>" width="20%" maxlength="15" id="lName" name="lName" onblur="checkLname()"/>
                                        <span id="lNamespan"style="display: block"></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Set your Tel</label>
                                        <input type="text" class="form-control" value="<%=user.getPhonenumber()%>" maxlength="30" name="userTel" id="userTel" name="userTel" onblur="checkTel()" />
                                        <span id="userTelspan"style="display: block" ></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Set your Address</label>
                                        <input type="text" class="form-control" value="<%=user.getAddress()%>" maxlength="30" id="address" name="address"  />
                                        <span id="addressspan"style="display: block" ></span>
                                    </div>
                                   
                                </div>
                                <div class="col-lg-6 con-gd">

                                    <div style="height: 96.7px">
                                        <label>Gender</label>
                                        <table>
                                                <th><div><img src="next.png" width="3%" height="5%"style="opacity: 0"></div></th>
                                                <th><input type="radio" name="sex" value="male"/> </th>
                                                <th><p>Male</p></th>
                                                <th><div><img src="gaokeji.png" width="5%" height="5%"style="opacity: 0"></div></th>
                                                <th><input type="radio" name="sex" value="female"/> </th>
                                                <th><p>Female</p></th>
                                        </table>
                                        </div>
                                    <div class="form-group">
                                        <label>Date of birth</label>
                                        <input type="text" class="form-control" value="<%=user.getDob()%>" class="Wdate" name="DoB" onFocus="WdatePicker({lang:'en',dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d',readOnly:true})"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Input your old password</label>
                                        <input type="password" class="form-control" id="password" name="password" onfocus="javascript:if(this.value == '6 characters or letters at least')this.value=''" maxlength="30" name="Password" onblur="var n=<%=password%>;checkAgain(n)" >
                                        <span id="passwordspan"></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Set your new password</label>
                                        <input type="password" class="form-control" id="newpassword" name="newpassword" onfocus="javascript:if(this.value == '6 characters or letters at least')this.value=''" maxlength="30" name="Password" onblur="checkNewPassword()" >
                                        <span id="newpasswordspan"></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Confirm your new password</label>
                                        <input type="password" class="form-control" id="confirmnewpassword" name="confirmnewpassword" onblur="checkNewSame()"/>
                                        <span id="confirmnewpasswordspan"style="display: block"></span>
                                    </div>
                                    <div style="padding: 32px 70px">
                                    <button type="submit" class="btn btn-default" id="register" name="regisOrChange" value="Change" style="width:220px">Change</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                </div>

            </div>
        </div>
    </section>
    <!--//contact -->
    <!--footer -->
    <footer>
        <div class="footer_1its py-5">
            <div class="container py-md-4">
                <div class="row footer-top mb-md-5 mb-4">
                    <div class="col-lg-4 col-md-6 footer-grid_section_1its" data-aos="fade-right">
                        <div class="footer-title-w3pvt">
                            <h3>Address</h3>
                        </div>
                        <div class="footer-text">
                            <p>Address : 1234 lock, Charlotte, North Carolina, United States</p>
                            <p>Phone : +12 534894364</p>
                            <p>Email : <a href="mailto:info@example.com">info@example.com</a></p>
                            <p>Fax : +12 534894364</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-md-0 mt-4 footer-grid_section_1its">
                        <div class="footer-title-w3pvt">
                            <h3>Quick Links</h3>
                        </div>
                        <div class="row">
                            <ul class="col-6 links">
                                <li><a href="about.html">Why Choose Us </a></li>
                                <li><a href="about.html">Overview </a></li>
                                <li><a href="features.html">Services</a></li>

                                <li><a href="gallery.html">Gallery</a></li>
                                <li><a href="contact.html">Contact </a></li>
                            </ul>
                            <ul class="col-6 links">
                                <li><a href="#">Privacy Policy </a></li>
                                <li><a href="#">General Terms </a></li>
                                <li><a href="#">Faq's </a></li>
                                <li><a href="#">Knowledge </a></li>
                                <li><a href="#">Forum </a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 mt-lg-0 mt-4 col-sm-12 footer-grid_section_1its" data-aos="fade-left">
                        <div class="footer-title-w3pvt">
                            <h3>Newsletter</h3>
                        </div>
                        <div class="footer-text">
                            <p>By subscribing to our mailing list you will always get latest news and updates from us.</p>
                            <form action="#" method="post">
                                <input type="email" name="Email" placeholder="Enter your email..." required="">
                                <button class="btn1"><span class="fa fa-paper-plane-o" aria-hidden="true"></span></button>
                                <div class="clearfix"> </div>
                            </form>
                        </div>
                    </div>
                </div>
                
                <div class="footer-grid_section text-center">
                    <div class="footer-title-w3pvt mb-4">
                        <h3>Follow with us</h3>
                    </div>
                    <ul class="social_section_1info">
                        <li class="mb-2 facebook"><a href="#"><span class="fa fa-facebook mr-1"></span>facebook</a></li>
                        <li class="mb-2 twitter"><a href="#"><span class="fa fa-twitter mr-1"></span>twitter</a></li>
                        <li class="google"><a href="#"><span class="fa fa-google-plus mr-1"></span>google</a></li>
                        <li class="linkedin"><a href="#"><span class="fa fa-linkedin mr-1"></span>linkedin</a></li>
                    </ul>
                </div>

            </div>
        </div>
    </footer>
    <!-- //footer -->
    
  </body>
  
</html>
