<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@ page import="betago.dao.impl.CommunityDAOImpl"%>
<%@ page import="betago.entity.Post"%>
<%@ page import="betago.entity.Reply"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Post</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- css include -->
		<link rel="stylesheet" type="text/css" href="css/materialize.css">
		<link rel="stylesheet" type="text/css" href="css/icofont.css">
		<link rel="stylesheet" type="text/css" href="css/owl.carousel.min_community.css">
		<link rel="stylesheet" type="text/css" href="css/owl.theme.default.min_community.css">

		<!-- my css include -->
		<link rel="stylesheet" type="text/css" href="css/custom-menu.css">
		<link rel="stylesheet" type="text/css" href="css/style_community.css">
		<link rel="stylesheet" type="text/css" href="css/responsive.css">

		<link rel="stylesheet" type="text/scssc" href=".sass-cache/f1e188c428651dd610e70c56ed6c90a353e80a63/_normalize.scssc">
		

    <!-- Custom-Files -->
    <link rel="stylesheet" href="css/bootstrap_heading.css">
    <!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="css/style_home.css" type="text/css" media="all" />
    <!-- Style-CSS -->
    <!-- font-awesome-icons -->
    <link href="css/font-awesome_home.css" rel="stylesheet">
    <!-- //font-awesome-icons -->
    <!-- /Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800" rel="stylesheet">
    <!-- //Fonts -->
    <script language="javascript" type="text/javascript">
    function checkReply() {
		var content = document.getElementById("content").value;
		var spanNode = document.getElementById("contentspan");
		var reg = /^([a-zA-Z0-9])+$/i;
		if (reg.test(content)) {
			spanNode.innerHTML = "".fontcolor("green"); 
			return true;
		} else {
			spanNode.innerHTML = "Invalid reply, try again!".fontcolor("red");   
			return false;
		}
	}
	function checkAll() {
		var rep = checkReply();
		if (rep) {
			return true;
		} else {
			return false;
		}

	}
    </script>
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

					<div>
<%
	CommunityDAOImpl CommunityDaoDetail = new CommunityDAOImpl();
	String id = request.getParameter("postID");
	Post post = CommunityDaoDetail.getContentById(id);
	ArrayList<Reply> list = CommunityDaoDetail.getReplyById(id);
	session.setAttribute("repostID", id);
	if (post != null) {
	%>
						<div class="blogs mb-30">
							<div class="card">
								
								<!-- /.card-image -->
								<div class="card-content w100dt">
									<p>
										<a href="#" class="tag left w100dt l-blue mb-30">Post</a>
									</p>
									<a href=""postdetail.jsp?postID=<%=id%>" class="card-title">
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
											<i class="fa fa-calendar"><%=post.getPostTime()%></i>
										</li>
									</ul>

									
								</div>
								<!-- /.card-content -->
							</div>
							<!-- /.card -->
						</div>
                        <!-- /.blogs -->
                        <%
	}
	if (list != null && list.size() > 0){

	for (int i = 0; i < list.size(); i++) {
				Reply reply = list.get(i);
				%>
                                <div class="card">
                                    
                                    <!-- /.card-image -->
                                    <div class="card-content w100dt">
                                        <p>
                                            <a href="#" class="tag left w100dt l-blue mb-30">Reply <%= i+1 %></a>
                                        </p>
                                        
                                        <p class="mb-30">
                                                <%=reply.getContent()%>
                                            </p>
                                        <ul class="post-mate-time left">
                                            <li>
                                                <p class="hero left">
                                                    By - <%=reply.getUsername()%>
                                                </p>
                                            </li>
                                            <li>
                                                    <i class="fa fa-calendar"><%=reply.getReplyTime()%></i>
                                            </li>
                                        </ul>
    
                                        
                                    </div>
                                    <!-- /.card-content -->
                                </div>
                                <!-- /.card -->
                            
                            <!-- /.blogs -->
                            <%
				}
	}

	if(username == null){
	%>
	<div style="text-align: center; ">
								<button  class="btn btn-default" type="button" style="border:0px;margin:20px 0px 10px 0px; padding:0px; width:300px; height:50px; background-color: tomato;"><a href="login.jsp" style="color:white">log in to reply</a>
							
							</div>
	<%
	}
	else{
	%>
                        
                        <div class="contact-form mt-md-5" style="margin:20px 0px 0px 0px;position:relative;">
                                <div class="contact-form-inner mx-auto text-left">
                                    <form name="contactform " id="contactform" action="./reply" method="post" onsubmit="return checkAll()">
                                         <div class="form-group">
                                            
                                            <label>User: <%=username %></label>
                                            <textarea name="content" class="form-control" id="content" onblur="checkReply()" placeholder="Enter Your Reply Here"></textarea>
                                            <span id="contentspan"></span>
                                        </div>
                                        <button type="submit" class="btn btn-default" style="padding:3px 30px"><input type="SUBMIT" name="submit" value="Reply Now" style="background-color: transparent;border:0;color:white;"></button>
                                    </form>
                                    
            
                            </div>
                            <%
	}
	 %>



						

						
					</div>	
					<!-- colm8 -->


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
