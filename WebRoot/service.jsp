<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Service</title>
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
    <link rel="stylesheet" href="css/portfolio.css">
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
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="about.jsp">About</a></li>
                        <li><a href="community.jsp">Community</a>
                        </li>
                        <li>
                            <!-- First Tier Drop Down -->
                            <label for="drop-2" class="toggle">Products <span class="fa fa-angle-down" aria-hidden="true"></span> </label>
                            <a href="list.html">Products <span class="fa fa-angle-down" aria-hidden="true"></span></a>
                            <input type="checkbox" id="drop-2" />
                            <ul>
                                <li><a href="searchlist.jsp?searchName=Dog">Dog series</a>
                                </li>
                                <li><a href="searchlist.jsp?searchName=watch">Watch series</a>
                                </li>
                                <li><a href="searchlist.jsp?searchName=glass">Glass series</a>
                                </li>
                            </ul>
                        </li>
                        
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
    <!-- portfolio -->
    <section class="portfolio-flyer py-5">
        <div class="container py-lg-4 py-4">
            <h3 class="tittle  text-center my-lg-5 my-3"><span class="sub-tittle"> Series Product </span>Star Product</h3>
            <div class="row mid-slide">
                <div class="col-lg-4 featured-content">
                    <img src="images/n10.jpg" alt="" class="img-fluid image1">
                    <span class="money">$25,00</span>
                    <!--/Property_info-->
                    <div class="property-info-list">
                        <div class="detail">
                            <h4 class="title">
                                <a href="detail.html">Dog series</a>
                            </h4>
                            <div class="location mt-2">
                                <a href="single.html">
                           <span class="fa fa-map-marker"></span> Mian functions,
                        </a>
                            </div>
                            <ul class="facilities-list clearfix">
                                <li>
                                    <span class="fa fa"></span> fast GPS guide
                                </li>
                                <li>
                                    <span class="fa fa"></span> flexible speed control
                                </li>
                                <li>
                                    <span class="fa fa"></span> AI functions
                                </li>
                                <li>
                                    <span class="fa fa"></span> call back immidiately
                                </li>
                            </ul>
                        </div>
                        <div class="footer-properties">
                            <a class="admin" href="#">
                        <span class="fa fa-user"></span> designer:John
                    </a>
                            <span class="year text-right"> <span class="fa fa-calendar"></span>Latest: 2019 Apr</span>

                        </div>
                    </div>
                    <!--//Property_info-->
                </div>
                <div class="col-lg-4 featured-content">
                    <img src="images/n11.jpg" alt="" class="img-fluid image1">
                    <span class="money">$18,00</span>
                    <!--/Property_info-->
                    <div class="property-info-list">
                        <div class="detail">
                            <h4 class="title">
                                <a href="detail.html">Glass series</a>
                            </h4>
                            <div class="location mt-2">
                                <a href="single.html">
                           <span class="fa fa-map-marker"></span> Main functions
                        </a>
                            </div>
                            <ul class="facilities-list clearfix">
                                <li>
                                    <span class="fa fa"></span> multiple degree
                                </li>
                                <li>
                                    <span class="fa fa"></span> blink to photo/video
                                </li>
                                <li>
                                    <span class="fa fa"></span> waterproof
                                </li>
                                <li>
                                    <span class="fa fa"></span> high resolution
                                </li>
                            </ul>
                        </div>
                        <div class="footer-properties">
                            <a class="admin" href="#">
                        <span class="fa fa-user"></span> Designer: Theresa
                    </a>
                            <span class="year text-right"> <span class="fa fa-calendar"></span> Latest: 2019 Sept</span>

                        </div>
                    </div>
                    <!--//Property_info-->
                </div>
                <div class="col-lg-4 featured-content">
                    <img src="images/n12.jpg" alt="" class="img-fluid image1">
                    <span class="money">$100</span>
                    <!--/Property_info-->
                    <div class="property-info-list">
                        <div class="detail">
                            <h4 class="title">
                                <a href="detail.html"> Watch series</a>
                            </h4>
                            <div class="location mt-2">
                                <a href="single.html">
                           <span class="fa fa-map-marker"></span> Main functions
                        </a>
                            </div>
                            <ul class="facilities-list clearfix">
                                <li>
                                    <span class="fa fa"></span> phone connected
                                </li>
                                <li>
                                    <span class="fa fa"></span> answer & make calls
                                </li>
                                <li>
                                    <span class="fa fa"></span> sports monitor
                                </li>
                                <li>
                                    <span class="fa fa"></span> high intensity
                                </li>
                            </ul>
                        </div>
                        <div class="footer-properties">
                            <a class="admin" href="#">
                        <span class="fa fa-user"></span> designer: Tracy
                    </a>
                            <span class="year text-right"> <span class="fa fa-calendar"></span> Latest: 2019 Mar</span>
                        </div>
                        <!--//Property_info-->
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- //portfolio -->
    <!-- popup-->
    <div id="gal1" class="pop-overlay animate">
        <div class="popup">
            <img src="images/1.jpg" alt="Popup Image" class="img-fluid" />
            <div class="property-info-list mode-info">
                <div class="detail">
                    <h4 class="title">
                        <a href="single.html">Tittle goes here</a>
                    </h4>
                    <div class="location mt-2">
                        <a href="single.html">
                                   <span class="fa fa-map-marker"></span> 123 Location. Example City,
                                </a>
                    </div>
                    <ul class="facilities-list clearfix">
                        <li>
                            <span class="fa fa-bed"></span> 3 Bedrooms
                        </li>
                        <li>
                            <span class="fa fa-shower"></span> 2 Bathrooms
                        </li>
                        <li>
                            <span class="fa fa-building-o"></span> Sq Ft:3400
                        </li>
                        <li>
                            <span class="fa fa-building-o"></span> 1 Garage
                        </li>
                    </ul>
                </div>
                <div class="footer-properties">
                    <a class="admin" href="#">
                                <span class="fa fa-user"></span> Jhon Doe
                            </a>
                    <span class="year text-right"> <span class="fa fa-calendar"></span> 6 years ago</span>

                </div>
            </div>
            <a class="close" href="#gallery">&times;</a>
        </div>
    </div>
    <!-- //popup -->

    <!-- popup-->
    <div id="gal2" class="pop-overlay animate">
        <div class="popup">
            <img src="images/2.jpg" alt="Popup Image" class="img-fluid" />
            <div class="property-info-list mode-info">
                <div class="detail">
                    <h4 class="title">
                        <a href="single.html">Tittle goes here</a>
                    </h4>
                    <div class="location mt-2">
                        <a href="single.html">
                                   <span class="fa fa-map-marker"></span> 123 Location. Example City,
                                </a>
                    </div>
                    <ul class="facilities-list clearfix">
                        <li>
                            <span class="fa fa-bed"></span> 2 Bedrooms
                        </li>
                        <li>
                            <span class="fa fa-shower"></span> 3 Bathrooms
                        </li>
                        <li>
                            <span class="fa fa-building-o"></span> Sq Ft:3400
                        </li>
                        <li>
                            <span class="fa fa-building-o"></span> 1 Garage
                        </li>
                    </ul>
                </div>
                <div class="footer-properties">
                    <a class="admin" href="#">
                                <span class="fa fa-user"></span> Jhon Doe
                            </a>
                    <span class="year text-right"> <span class="fa fa-calendar"></span> 4 years ago</span>

                </div>
            </div>
            <a class="close" href="#gallery">&times;</a>
        </div>
    </div>
    <!-- //popup -->
    <!-- popup-->
    <div id="gal3" class="pop-overlay animate">
        <div class="popup">
            <img src="images/3.jpg" alt="Popup Image" class="img-fluid" />
            <div class="property-info-list mode-info">
                <div class="detail">
                    <h4 class="title">
                        <a href="single.html">Tittle goes here</a>
                    </h4>
                    <div class="location mt-2">
                        <a href="single.html">
                                   <span class="fa fa-map-marker"></span> 123 Location. Example City,
                                </a>
                    </div>
                    <ul class="facilities-list clearfix">
                        <li>
                            <span class="fa fa-bed"></span> 4 Bedrooms
                        </li>
                        <li>
                            <span class="fa fa-shower"></span> 4 Bathrooms
                        </li>
                        <li>
                            <span class="fa fa-building-o"></span> Sq Ft:3400
                        </li>
                        <li>
                            <span class="fa fa-building-o"></span> 1 Garage
                        </li>
                    </ul>
                </div>
                <div class="footer-properties">
                    <a class="admin" href="#">
                                <span class="fa fa-user"></span> Jhon Doe
                            </a>
                    <span class="year text-right"> <span class="fa fa-calendar"></span> 6 years ago</span>

                </div>
            </div>
            <a class="close" href="#gallery">&times;</a>
        </div>
    </div>
    <!-- //popup3 -->
    <!-- popup-->
    <div id="gal4" class="pop-overlay animate">
        <div class="popup">
            <img src="images/4.jpg" alt="Popup Image" class="img-fluid" />
            <div class="property-info-list mode-info">
                <div class="detail">
                    <h4 class="title">
                        <a href="single.html">Tittle goes here</a>
                    </h4>
                    <div class="location mt-2">
                        <a href="single.html">
                                   <span class="fa fa-map-marker"></span> 123 Location. Example City,
                                </a>
                    </div>
                    <ul class="facilities-list clearfix">
                        <li>
                            <span class="fa fa-bed"></span> 2 Bedrooms
                        </li>
                        <li>
                            <span class="fa fa-shower"></span> 3 Bathrooms
                        </li>
                        <li>
                            <span class="fa fa-building-o"></span> Sq Ft:3400
                        </li>
                        <li>
                            <span class="fa fa-building-o"></span> 1 Garage
                        </li>
                    </ul>
                </div>
                <div class="footer-properties">
                    <a class="admin" href="#">
                                <span class="fa fa-user"></span> Jhon Doe
                            </a>
                    <span class="year text-right"> <span class="fa fa-calendar"></span> 4 years ago</span>

                </div>
            </div>
            <a class="close" href="#gallery">&times;</a>
        </div>
    </div>
    <!-- //popup -->
    <!-- popup-->
    <div id="gal5" class="pop-overlay animate">
        <div class="popup">
            <img src="images/5.jpg" alt="Popup Image" class="img-fluid" />
            <div class="property-info-list mode-info">
                <div class="detail">
                    <h4 class="title">
                        <a href="single.html">Tittle goes here</a>
                    </h4>
                    <div class="location mt-2">
                        <a href="single.html">
                                   <span class="fa fa-map-marker"></span> 123 Location. Example City,
                                </a>
                    </div>
                    <ul class="facilities-list clearfix">
                        <li>
                            <span class="fa fa-bed"></span> 4 Bedrooms
                        </li>
                        <li>
                            <span class="fa fa-shower"></span> 5 Bathrooms
                        </li>
                        <li>
                            <span class="fa fa-building-o"></span> Sq Ft:3400
                        </li>
                        <li>
                            <span class="fa fa-building-o"></span> 1 Garage
                        </li>
                    </ul>
                </div>
                <div class="footer-properties">
                    <a class="admin" href="#">
                                <span class="fa fa-user"></span> Jhon Doe
                            </a>
                    <span class="year text-right"> <span class="fa fa-calendar"></span> 2 years ago</span>

                </div>
            </div>
            <a class="close" href="#gallery">&times;</a>
        </div>
    </div>
    <!-- //popup -->
    <!-- popup-->
    <div id="gal6" class="pop-overlay animate">
        <div class="popup">
            <img src="images/6.jpg" alt="Popup Image" class="img-fluid" />
            <div class="property-info-list mode-info">
                <div class="detail">
                    <h4 class="title">
                        <a href="single.html">Tittle goes here</a>
                    </h4>
                    <div class="location mt-2">
                        <a href="single.html">
                                   <span class="fa fa-map-marker"></span> 123 Location. Example City,
                                </a>
                    </div>
                    <ul class="facilities-list clearfix">
                        <li>
                            <span class="fa fa-bed"></span> 3 Bedrooms
                        </li>
                        <li>
                            <span class="fa fa-shower"></span> 2 Bathrooms
                        </li>
                        <li>
                            <span class="fa fa-building-o"></span> Sq Ft:3400
                        </li>
                        <li>
                            <span class="fa fa-building-o"></span> 1 Garage
                        </li>
                    </ul>
                </div>
                <div class="footer-properties">
                    <a class="admin" href="#">
                                <span class="fa fa-user"></span> Jhon Doe
                            </a>
                    <span class="year text-right"> <span class="fa fa-calendar"></span> 6 years ago</span>

                </div>
            </div>
            <a class="close" href="#gallery">&times;</a>
        </div>
    </div>
    <!-- //popup -->
    <!--//model-->

    <!--//portfolio-->
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
