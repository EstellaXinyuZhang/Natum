<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="" />
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
    <link rel="stylesheet" href="css/bootstrap_home.css">
    <link rel="stylesheet" href="css/style_home.css" type="text/css" media="all" />
    <link href="css/font-awesome_home.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800" rel="stylesheet">
  </head>
  
  <body>
  <!-- mian-content -->
    <div class="main-content" id="home">
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
        <%String username =(String)session.getAttribute("username"); %>
        <header class="header" style="position: fixed; background-color: rgba(240, 248, 255, 0.699)">
            <div class="container">
                <!-- nav -->
                <nav class="pb-3">
                    <div id="logo">
                        <h1> <a class="navbar-brand" href="index.jsp"><span>N</span>atum</a>
                        </h1>
                    </div>

                    <label for="drop" class="toggle">Menu</label>
                    <input type="checkbox" id="drop" />
                    <ul class="menu mt-2">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="about.jsp">About</a></li>
                        <li><a href="community.jsp">Community</a></li>
                        <% if(username!=null) {%>
                        <li><a href="ShowInfo.jsp">Your Info</a></li>
                        <%} %>
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
	                    if(username==null) {%>
	                         <a href="login.jsp" class="contact"> <span class="fa fa-user"></span> Log In</a>
						<% }else{ %>
						     <form method="post" action="./logout" id="form">
						     <input class="contact" type="submit" type="text" value="Log Out" onclick="java:window.close()" />
						     </form>
						<%} %>                            
                        </li>
                    </ul>
                </nav>
                <!-- //nav -->
            </div>
        </header>
        <!-- //header -->
        <!-- banner -->
        <section class="banner">
            <div class="container">
                <div class="row banner-grids">
                    <div class="col-lg-6 banner-info-w3ls">
                        <h2>A Vision For Your Life
                        </h2>
                        <h3 class="mb-3">Let technology lead you to a brand new life</h3>
                        <p class="mb-4"> Natum--a technology company.</p>
                             <p>We devote ourselves 100% into the research and development,</p> 
                             <p>just for giving you a better experience in using our product.</p>
                        <a href="about.jsp" class="btn">Read More</a>
                    </div>
                    <div class="col-lg-6 banner-image">
                        <div class="img-effect"><!--
                            <img src="images/img.jpg" alt="" class="img-fluid image1">
                                -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- //banner -->
    </div>
    <!--/ab -->
    <section class="about py-lg-5 py-md-5 py-5">
        <div class="container">
            <div class="inner-sec-w3pvt py-lg-5 py-3">
                <h3 class="tittle text-center mb-lg-5 mb-3 px-lg-5"><span class="sub-tittle">About.</span> Our Vision Statment.</h3>
                <div class="feature-grids row mt-3 mb-lg-5 mb-3 text-center">
                    <div class="col-lg-4" data-aos="fade-up">
                        <div class="bottom-gd px-3">
                            <span class="fa fa-building-o" aria-hidden="true"></span>
                            <h3 class="my-4"> Who are we</h3>
                            <p>Natum is a technology based, continuous development company, it provides intelligent devices as well as humanize services.</p>
                        </div>
                    </div>
                    <div class="col-lg-4" data-aos="fade-up">
                        <div class="bottom-gd2-active px-3">
                            <span class="fa fa-cogs" aria-hidden="true"></span>
                            <h3 class="my-4"> What we persue</h3>
                            <p> Be the creator of excellence.</p>
                        </div>
                    </div>
                    <div class="col-lg-4" data-aos="fade-up">
                        <div class="bottom-gd px-3">
                            <span class="fa fa-cogs" aria-hidden="true"></span>
                            <h3 class="my-4"> What we believe</h3>
                            <p> Technology is the key to a easier life, we will devote 150% of our passion and creativity to benefit all of our customers.</p>
                        </div>
                    </div>
                </div>
                <!-- services -->
                <div class="fetured-info pt-lg-5">
                    <h3 class="tittle  text-center my-lg-5 my-3"><span class="sub-tittle">What we care</span> From every aspect, to every thing around us</h3>
                    <div class="row fetured-sec mt-lg-5 mt-3">
                        <div class="col-lg-6 p-0">
                            <div class="img-effect">
                                <img src="images/img1.jpg" alt="" class="img-fluid image1">
                            </div>

                        </div>
                        <div class="col-lg-6 serv_bottom feature-grids pl-lg-5">
                            <div class="featured-left text-left">
                                <div class="bottom-gd px-3">
                                    <span class="fa fa-hospital-o" aria-hidden="true"></span>
                                    <h3 class="my-4"> For our Clients</h3>
                                    <p> We are people-oriented, wholeheartedly to provide quality services for consumers, to give consumers with humanistic care, so as to effectively improve consumer service satisfaction, and thus increase the customer satisfaction of enterprises</p>
                                </div>
                                <div class="bottom-gd fea active p-4" data-aos="fade-left">
                                    <span class="fa fa-key" aria-hidden="true"></span>
                                    <h3 class="my-3 ">For our Employee</h3>
                                    <p>Enhance employees' sense of identity and sense of belonging to the company, so as to maintain a better working attitude and grow and develop together with the company</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <h3 class="tittle text-center my-lg-5 mb-3"><span class="sub-tittle">View Our Product</span>What we do</h3>
                    <div class="row mid-slide">
                        <div class="col-lg-4 featured-content">
                            <img src="images/n10.jpg" alt="" class="img-fluid image1">
                            <span class="money">$25,00</span>
                            <!--/Property_info-->
                            <div class="property-info-list">
                                <div class="detail">
                                    <h4 class="title">
                                        <a href="searchlist.jsp?searchName=Dog">Dog series</a>
                                    </h4>
                                    <div class="location mt-2">
                                        <a href="single.html">
                                   <span class="fa fa-map-marker"></span> Main functions
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
                                <span class="fa fa-user"></span> Designer:John
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
                                        <a href="searchlist.jsp?searchName=glass">Glass series</a>
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
                                        <a href="searchlist.jsp?searchName=watch"> Watch series</a>
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
                                <span class="fa fa-user"></span> Designer: Tracy
                            </a>
                                    <span class="year text-right"> <span class="fa fa-calendar"></span> Latest: 2019 Mar</span>
                                </div>
                                <!--//Property_info-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //services -->
    </section>
    <!-- //ab -->
    <!--/counter-->
    <section class="stats py-lg-5 py-4">
        <div class="container">
            <div class="row text-center">
                <div class="col">
                    <div class="counter">
                        <h3 class="timer count-title count-number">1100</h3>
                        <p class="count-text">Support</p>
                    </div>
                </div>
                <div class="col">
                    <div class="counter">
                        <h3 class="timer count-title count-number">1700</h3>
                        <p class="count-text">Happy Hours</p>
                    </div>
                </div>
                <div class="col">
                    <div class="counter">
                        <h3 class="timer count-title count-number">11900</h3>
                        <p class="count-text">Product Sold</p>
                    </div>
                </div>
                <div class="col">
                    <div class="counter">
                        <h3 class="timer count-title count-number">5100</h3>
                        <p class="count-text">Trusted Clients</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//counter-->
    <!--//team -->
    <section class="banner-bottom py-lg-5 py-4">
        <div class="container">
            <div class="inner-sec-w3pvt speak">
                <h3 class="tittle  text-center my-lg-5 my-3"><span class="sub-tittle">Amazing People</span> Professional Designers</h3>
                <div class="row mt-lg-5 mt-4">
                    <div class="col-md-4 team-gd text-center">
                        <div class="team-img mb-4">
                            <img src="images/team.jpg" class="img-fluid" alt="user-image">
                        </div>
                        <div class="team-info">
                            <h3 class="mt-md-4 mt-3"><span class="sub-tittle-team">engineer</span> Jason Donoghue</h3>
                            <p>Chief designer for the dog series.</p>
                            <ul class="social_section_1info mt-md-4 mt-3">
                                <li class="mb-2 facebook"><a href="#"><i class="fa fa-facebook mr-1"></i>facebook</a></li>
                                <li class="mb-2 twitter"><a href="#"><i class="fa fa-twitter mr-1"></i>twitter</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-4 team-gd second text-center">
                        <div class="team-img mb-4">
                            <img src="images/team1.jpg" class="img-fluid" alt="user-image">
                        </div>
                        <div class="team-info">
                            <h3 class="mt-md-4 mt-3"><span class="sub-tittle-team">engineer</span> Mariana Noe</h3>
                            <p>Chief designer for the glass series.</p>
                            <ul class="social_section_1info mt-md-4 mt-3">
                                <li class="google"><a href="#"><i class="fa fa-google-plus mr-1"></i>google</a></li>
                                <li class="linkedin"><a href="#"><i class="fa fa-linkedin mr-1"></i>linkedin</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 team-gd text-center">
                        <div class="team-img mb-4">
                            <img src="images/team2.jpg" class="img-fluid" alt="user-image">
                        </div>
                        <div class="team-info">
                            <h3 class="mt-md-4 mt-3"><span class="sub-tittle-team">designer</span> Daniel Doe</h3>
                            <p>Chief designer for the appearence.</p>
                            <ul class="social_section_1info mt-md-4 mt-3">
                                <li class="mb-2 facebook"><a href="#"><i class="fa fa-facebook mr-1"></i>facebook</a></li>
                                <li class="mb-2 twitter"><a href="#"><i class="fa fa-twitter mr-1"></i>twitter</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//team -->
    <!-- middle section -->
    <div class="middle-tem-insidel pt-lg-5">
        <div class="progress-info">
            <!-- slides images -->
            <div class="slide-img" id="masthead">
            </div>
            <!-- //slides images -->
            <div class="left-build-main-temps">
                <h3 class="tittle  text-left my-lg-5 my-3"><span class="sub-tittle">What We Do</span> Our Services</h3>
                <ul class="tic-info list-unstyled">
                    <li class="progress-tittle">
                        <span class="fa fa-bell-o"></span> Investment Consulting
                    </li>
                    <li class="progress-tittle">
                        <span class="fa fa-database"></span> Construction Services
                    </li>
                    <li class="progress-tittle">
                        <span class="fa fa-bullhorn"></span> Maintenance
                    </li>
                    <li class="progress-tittle">
                        <span class="fa fa-diamond"></span> Good Previews
                    </li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div style="height: 3em;">       
    </div>   
    
    <!-- //popup -->

    <!--//portfolio-->
    <!-- /hand-crafted -->
    <section class="hand-crafted py-5">
        <div class="container py-lg-5">
            <div class="row accord-info">
                <div class="col-lg-6 pl-md-5">

                    <h3 class="mb-md-5 tittle">This is Our Responsibility to Give Good Property</h3>

                    <p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla mollis dapibus nunc, ut rhoncus turpis sodales quis.Integer sit amet mattis quam, sit amet ultricies velit. Praesent ullamcorper dui turpis.</p>
                    <p class="mt-3">Integer sit amet mattis quam, sit amet ultricies velit. Praesent ullamcorper dui turpis.
                        <p>
                </div>
                <div class="col-lg-6 banner-image">
                    <div class="img-effect">
                        <img src="images/img3.jpg" alt="" class="img-fluid image1">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //hand-crafted -->

    <!-- testimonials -->
    <div class="testimonials py-md-5 py-5">
        <div class="container py-xl-5 py-lg-3">
            <h3 class="tittle  text-center mb-lg-5 mb-3"><span class="sub-tittle">Clients Reviews</span> What Our Clients Say</h3>

            <div class="testimonials_grid_w3ls mt-lg-0 mt-4">
                <div class="p-md-5 p-4">
                    <p class="sub-test"><span class="fa fa-quote-left" aria-hidden="true"></span> Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod possimus, omnis voluptas.Integer sit amet mattis quam, sit amet ultricies velit.
                    </p>
                    <div class="row mt-4">
                        <div class="col-3 testi-img-res">
                            <img src="images/te2.jpg" alt="" class="img-fluid" />
                        </div>
                        <div class="col-9 testi_grid mt-xl-3 mt-lg-2 mt-md-4 mt-2">
                            <h5 class="mb-2">Adam Ster</h5>
                            <p>Company Name</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- //testimonials -->
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
                <!--
                <div class="footer-grid_section my-lg-5 text-center">
                    <div class="footer-title-w3pvt mb-4">
                        <h3>Recent Properties</h3>
                    </div>
                    <ul class="d-flex list-unstyled foot-bottom-last">
                        <li class="mr-2">
                            <a href="single.html"> <img src="images/1.jpg" alt="" class="img-fluid image1"></a></li>
                        <li class="mr-2">
                            <a href="single.html"> <img src="images/2.jpg" alt="" class="img-fluid image1"></a></li>
                        <li class="mr-2">
                            <a href="single.html"> <img src="images/3.jpg" alt="" class="img-fluid image1"></a></li>
                        <li class="mr-2">
                            <a href="single.html"> <img src="images/4.jpg" alt="" class="img-fluid image1"></a></li>
                        <li>
                            <a href="single.html"> <img src="images/5.jpg" alt="" class="img-fluid image1"></a></li>

                    </ul>
                </div>
                -->
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
