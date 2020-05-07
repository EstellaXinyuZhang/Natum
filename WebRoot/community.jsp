<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@ page import="betago.dao.impl.CommunityDAOImpl"%>
<%@ page import="betago.entity.Post"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Community</title>

<!-- css include -->
<link rel="stylesheet" type="text/css" href="css/materialize.css">
<link rel="stylesheet" type="text/css" href="css/icofont.css">
<link rel="stylesheet" type="text/css"
	href="css/owl.carousel.min_community.css">
<link rel="stylesheet" type="text/css"
	href="css/owl.theme.default.min_community.css">

<!-- my css include -->
<link rel="stylesheet" type="text/css" href="css/custom-menu.css">
<link rel="stylesheet" type="text/css" href="css/style_community.css">
<link rel="stylesheet" type="text/css" href="css/responsive.css">

<link rel="stylesheet" type="text/scssc"
	href=".sass-cache/f1e188c428651dd610e70c56ed6c90a353e80a63/_normalize.scssc">

<!-- Custom-Files -->
<link rel="stylesheet" href="css/bootstrap_heading.css">
<!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="css/style_home.css" type="text/css"
	media="all" />
<!-- Style-CSS -->
<!-- font-awesome-icons -->
<link href="css/font-awesome_home.css" rel="stylesheet">
<!-- //font-awesome-icons -->
<!-- /Fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900"
	rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800"
	rel="stylesheet">
<!-- //Fonts -->

</head>

<body>
	
		<div class="main-content inner" id="home" style="-webkit-background-size: cover;min-height: 16em;    position: relative;background-image:url(images/path1.png)">
			<!--/Top-Header-->
			<div class="top-bar-w3layouts pt-4" style="height: 66.8px;width: 100%">
				<div class="container">
					<div class="row">
						<div class="offset-xl-5">
	
						</div>
						<div class="col-xl-7 top-social-lavi text-md-right text-center mt-md-0 mt-2">
							<div class="row right-top-info">
								<div class="col-md-6 header-top text-xl-right text-center">
									
								</div>
								
								<!-- //social icons -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--//Top-Header-->
			<!-- header -->
			<header class="header1">
				<div class="container" style="height:66.8px; padding:8px 0px 16px 0px">
					<!-- nav -->
					<nav class="pb-3">
						<div id="logo">
							<h1> <a class="navbar-brand" href="index.jsp"><span>N</span>atum</a>
							</h1>
						</div>
	
						<label for="drop" class="toggle">Menu</label>
						<input type="checkbox" id="drop" />
						<ul class="menu mt-2" style="text-align: center">
							<li><a href="index.jsp" onmouseover="this.style.cssText='color:#17C0EB;padding:8px 14px;font-size: 1rem;'" onmouseout="this.style.cssText='color:rgb(59, 58, 58);padding:8px 14px;font-size: 1rem;'" style="padding:8px 14px;font-size: 1rem;color:rgb(59, 58, 58);">
								Home</a></li>
							<li><a href="about.jsp" class="toblue" onmouseover="this.style.cssText='color:#17C0EB;padding:8px 14px;font-size: 1rem;'" onmouseout="this.style.cssText='color:rgb(59, 58, 58);padding:8px 14px;font-size: 1rem;'" style="padding:8px 14px;font-size: 1rem;color:rgb(59, 58, 58);">About</a></li>
							<li><a href="community.jsp" style="padding:8px 14px;font-size: 1rem;
								color: #17C0EB;
                                display: block;">Community</a>
                                </li>
                                <li>
                                <li>
								<!-- First Tier Drop Down -->
								<label for="drop-2" class="toggle">Drop Down <span class="fa fa-angle-down" aria-hidden="true"></span> </label>
								<a href="list.jsp" onmouseover="this.style.cssText='color:#17C0EB;padding:8px 14px;font-size: 1rem;'" onmouseout="this.style.cssText='color:rgb(59, 58, 58);padding:8px 14px;font-size: 1rem;'" style="padding:8px 14px;font-size: 1rem;color:rgb(59, 58, 58);">Product <span class="fa fa-angle-down" aria-hidden="true"></span></a>
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
							<%
                       String username=(String)session.getAttribute("username");
	                    String sign="";
	                    if(username==null) {
	                         sign="Log In";
						}else{ 
						     sign="Change Acount";
						} %>
							
								<a href="login.jsp" class="contact" style="display: inline-block;"> <span class="fa fa-user"></span><%=sign%></a>
							</li>
						</ul>
	
	
					</nav>
					<!-- //nav -->
	
				</div>
			</header>
			<!-- //header -->
		</div>
		<!-- //main-content -->
		
<div style="height:80px; width: 20em; ">

		</div>

		<!-- ==================== blog-section start ==================== -->
		<section id="blog-section" class="blog-section w100dt mb-50">
			<div class="container">
				<div class="row">

					<div class="col s12 m8 l8" >
<%
		CommunityDAOImpl CommunityDao = new CommunityDAOImpl();
		ArrayList<Post> list = CommunityDao.getAllPosts();
		String[] str = new String[]{"bulb.png","dogavatar.png","sonidog.png","glasses.jpg","smartwatch.jpg"};
		int j = 0;
		if (list != null && list.size() > 0) {
			for (int i = list.size() - 1; i > -1; i--) {
				Post post = list.get(i);
	%>
						<div class="blogs mb-30">
							<div class="card">
								<div class="card-image">
									<img src="picture/pic/<%=str[j] %>" alt="Image">
									
								</div>
								<!-- /.card-image -->
								<div class="card-content w100dt">
				
									<a href="postdetail.jsp?postID=<%=post.getPostID()%>" class="card-title">
										<%=post.getSubject()%>
									</a>
									<p class="mb-30">
										<%=post.getContent()%>
									</p>
									<ul class="post-mate-time left">
										<li>
											<p class="hero left">
												By - <%=post.getUserID() %>
											</p>
										</li>
										<li>
											 <%=post.getPostTime()%>
										</li>
									</ul>
	
								</div>
								<!-- /.card-content -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.blogs -->
						<%
		j++;
		}
		}
		
      %>
					</div>	
					<!-- colm8 -->
					<div class="col s12 m4 l4">

						<div class="sidebar-testimonial mb-30">
							<div class="sidebar-title center-align">
								<h2>Welcome!</h2>
							</div>
							<!-- /.sidebar-title -->

							<div class="carousel carousel-slider center" data-indicators="true">
								
								<div class="carousel-item">
								<%if(username==null){ %>
									<font size="5" color="blue">Please log in</font>
									<%}else{ %>
									<font size="5" color="blue"><%=username %></font>
									<%} %>
									<br></br>
									<h4>You can share interesting experiences with others here, or simply leave your suggestions for us to help us do better.</h4>
								<%if(username==null){ %>
									<button type="button" class="btn btn-default" style="border:0px;margin:20px 0px 10px 0px; padding:0px; width:230px"><a href="login.jsp" style="color: white">click to log!</a></button>
									<%}else{ %>
									<button type="button" class="btn btn-default" style="border:0px;margin:20px 0px 10px 0px; padding:0px; width:230px"><a href="upload.jsp" style="color: white">post your own!</a></button>
									<%} %>									
								</div>								
							</div>
						</div>						
						<!-- /.sidebar-testimonial -->						
						<!-- /.sidebar-followme -->
						<div class="featured-posts w100dt mb-30">
							<div class="sidebar-title center-align">
								<h2>Featured Posts</h2>
							</div>
							<!-- /.sidebar-title -->

							<div class="sidebar-posts">
								<div class="card">
									<div class="card-image mb-10">
										<img src="images/img_bg_1.jpg" alt="Image">
										<span class="effect"></span>
									</div>
									<!-- /.card-image -->
									<div class="card-content w100dt">
										
										<a href="#" class="card-title">
											Fantastic using experience
										</a>
										<ul class="post-mate-time left">
											<li>
												<p class="hero left">
													By - Dan
												</p>
											</li>
										</ul>

									</div>
									<!-- /.card-content -->
								</div>
								<!-- /.card -->

								<div class="card">
									<div class="card-image mb-10">
										<img src="images/img_bg_2.jpg" alt="Image">
										<span class="effect"></span>
									</div>
									<!-- /.card-image -->
									<div class="card-content w100dt">
										
										<a href="#" class="card-title">
											Easy to use!
										</a>
										<ul class="post-mate-time left">
											<li>
												<p class="hero left">
													By - Brenda
												</p>
											</li>
										</ul>
									</div>
									<!-- /.card-content -->
								</div>
								<!-- /.card -->
								<div class="card">
									<div class="card-image mb-10">
										<img src="images/product-single-1.jpg" alt="Image">
										<span class="effect"></span>
									</div>
									<!-- /.card-image -->
									<div class="card-content w100dt">
										
										<a href="#" class="card-title">
											Great helper when traveling
										</a>
										<ul class="post-mate-time left">
											<li>
												<p class="hero left">
													By - Amanda
												</p>
											</li>
										</ul>										
									</div>
									<!-- /.card-content -->
								</div>
								<!-- /.card -->
							</div>
							<!-- /.sidebar-posts -->
						</div>					
						<!-- /.featured-posts -->
						<div class="sidebar-subscribe w100dt">
							<div class="sidebar-title center-align">
								<h2>Subscribe</h2>
							</div>
							<!-- /.sidebar-title -->

							<div class="subscribe">
								<p class="mb-30">
									Learn more about our interesting product and service? Subscribe!!!
								</p>
								<form action="#">
									<div class="input-field">
										<input id="email" type="email" class="validate">
										<label class="left-align" for="email">Enter email address</label>
									</div>
									<a class="waves-effect waves-light">SUBMIT NOW</a>
								</form>
							</div>
							<!-- /.subscribe -->
						</div>
						<!-- /.sidebar-subscribe -->	
					</div>	
					<!-- colm4 -->					
				</div>
				<!-- row -->
			</div>
			<!-- container -->
		</section>
		<!-- /#blog-section -->
		<!-- ==================== blog-section end ==================== -->
		<!-- ==================== instag leftram-section Start ==================== -->
		<section id="instagram-section" class="instagram-section w100dt">

			<div class="instagram-link w100dt">
				<a href="#">
					<span>FIND US ON INSTAGRAM</span>
					@Natum Community
				</a>
			</div>

		</section>
		<!-- /#instag leftram-section -->
		<!-- ==================== instag leftram-section End ==================== -->
		<!-- my custom js -->
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="js/materialize.js"></script>
		<script type="text/javascript" src="js/owl.carousel.min.js"></script>
		<!-- my custom js -->
		<script type="text/javascript" src="js/custom.js"></script>
		<script type="text/javascript">
		</script>
</body>
</html>
