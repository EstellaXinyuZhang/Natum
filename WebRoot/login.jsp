<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content="" />
    <title>Login </title>
    <script language="javascript" type="text/javascript"  src="js/login_check.js"></script>
    <script>
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }

    </script>
    <!--groupdown-->
    <style>
            .plat{
                
                position:-webkit-sticky; 
                top:22px;
            }
            
           .modified-dropdown{
               background-color: rgba(68, 0, 255, 0);
               position:relative;
               display: inline-block;
           }
           .modified-dropdown:hover .plat{
               background-color: rgba(240, 248, 255, 0.781);
                display: block;
                clear: both;
           }
       
        </style>
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
     
  </head>
  
  <body>
    <!-- mian-content -->
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
                        String username =(String)session.getAttribute("username");
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
                <h3 class="tittle text-center mb-lg-5 mb-3 inner-tittle">Log in</h3>
                <p class="text-center px-lg-5" data-aos="fade-up">Thank you for your trust, we will keep going</p>
                <div class="contact-form mt-md-5">
                    <div class="contact-form-inner mx-auto text-left">
                        <form name="contactform " id="contactform" method="post" action="./login" onsubmit="return checkAll()">
                            <div class="row">
                                <div class="col-lg-6 con-gd">
                                    <div class="form-group">
                                        <label>AccountID</label>
                                        <input type="text" class="form-control" id="username" name="username"  onblur="checkUser()" placeholder="Enter AccountID or Tel">
                                        <span id="usernamespan"></span>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>If you don't have an account</label>
                                    </div>
                                    <div class="form-group">
                                        <a href="register.jsp" id="signin">Please register now</a>
                                    </div>
                                    
                                </div>
                                <div class="col-lg-6 con-gd">

                                    <div class="form-group">
                                        <label>Password</label>                                        
                                        <input type="password" maxlength="30" class="form-control" id="password" name="password" onblur="checkPassword()" placeholder="Enter Password.">
                                        <span id="passwordspan"></span>
                                    </div>
                                    
                                    <div style="padding: 32px 70px">
                                        <button type="submit" name="submit" class="btn btn-default" style="width:220px"  value="Submit" >Submit</button>
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