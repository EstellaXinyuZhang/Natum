<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    
    <title>PAYMENT</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" type="text/css" href="css/pay.css" />

	
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Shop &mdash; VIEW our perfect product</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by gettemplates.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="gettemplates.co" />
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Shop &mdash; VIEW our perfect product</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by gettemplates.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="gettemplates.co" />

	

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> -->
	<!-- <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i" rel="stylesheet"> -->
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="css/flexslider.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
    <style>
		*{ margin:0; padding:0;}
		button, input{ outline:none;}
		button, .login{ width:120px; height:42px; background:#f40; color:#fff; border:none; border-radius:6px; display: block; margin:20px auto; cursor: pointer;}
		.popOutBg{ width:100%; height:100%; position: fixed; left:0; top:0; background:rgba(0,0,0,.6); display: none;}
		.popOut{ position:fixed; width:600px; height:300px; top:50%; left:50%; margin-top:-150px; margin-left:-300px; background:#fff; border-radius:8px; overflow: hidden; display: none;}
		.popOut > span{ position: absolute; right:10px; top:0; height:42px; line-height:42px; color:#000; font-size:30px; cursor: pointer;}
		.popOut table{ display: block; margin:42px auto 0; width:520px;}
		.popOut caption{ width:520px; text-align: center; color:#f40; font-size:18px; line-height:42px;}
		.popOut table tr td{ color:#666; padding:6px; font-size:14px;}
		.popOut table tr td:first-child{ text-align: right;}
		.inp{ width:280px; height:30px; line-height:30px; border:1px solid #999; padding:5px 10px; color:#000; font-size:14px; border-radius:6px;}
		.inp:focus{ border-color:#f40;}
		@keyframes ani{
			from{
				transform:translateX(-100%) rotate(-60deg) scale(.5);
			}
			50%{
				transform:translateX(0) rotate(0) scale(1);
			}
			90%{
				transform:translateX(20px) rotate(0) scale(.8);
			}
			to{
				transform:translateX(0) rotate(0) scale(1);
			}
		}
		.ani{ animation:ani .5s ease-in-out;}
	</style>
    
	</head>
	<body>
	
		
	<div class="fh5co-loader"></div>
	
	<div id="page">
	<nav class="fh5co-nav" role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-xs-2">
					<div id="fh5co-logo"><a href="list.jsp">Shop.</a></div>
				</div>
				<div class="col-md-6 col-xs-6 text-center menu-1">
					<ul>
						<li>
							<a href="index.jsp">Natum</a>
							
						</li>
						<li>
							<a href="list.jsp">Products</a>
							
						</li>
						
						<li>
							<a href="service.jsp">Services</a>
							
						</li>
						<li><a href="community.jsp">Community</a></li>
					</ul>
				</div>
				
			</div>
			
		</div>
	</nav>

    <%
    String orderID=(String)request.getSession().getAttribute("orderID");
    System.out.println("in jsp the orderid:"+orderID);
     %>

	<div id="fh5co-started" style="z-index: -1">
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>Method of Payment</h2>
						<p>There are multiple choices</p>
					</div>
				</div>
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2">
						<form class="form-inline" method="post" action="./buy" style="text-align: center">
							
									<div  style="margin:0px 15px; display: inline-block">
										<input class="btn btn-primary btn-outline btn-lg" style="padding:18px" type="button" value="Wechat" style="height:50px; width:150px;" onClick="javascript: this.form.payment.value='Wechat';">
							
									</div>
								
									<div  style="margin:0px 15px; display: inline-block">
									<input class="btn btn-primary btn-outline btn-lg" style="padding:18px" type="button" value="Alipay" style="height:50px; width:150px;" onClick="javascript: this.form.payment.value='Alipay';">
									</div>
								
							
									<div  style="margin:0px 15px; display: inline-block">
										<input class="btn btn-primary btn-outline btn-lg" style="padding:18px" type="button" value="Bank Card" style="height:50px; width:150px;" onClick="javascript: this.form.payment.value='Bank Card';">
									</div>
								     <input type="hidden" name="payment" id="payment" value="Wechat">

                                    <button id="skip" type="button">Next Step</button>
        
            <div class="popOutBg"></div>
	        <div class="popOut">
		       <span title="关闭"> x </span>
		
		         <table>
			          <caption>Please input the password</caption>
			
			    <tr>
				<td>Password:</td>
				<td><input class="inp" name="password" type="password" placeholder="The payment password" /></td>
				<input type="hidden" name="orderID" value="<%=orderID %>">
			    </tr>
			    <tr>
				<td colspan="2"><input type="submit" class="login" value="OK" /></td>	
			    </tr>
			
		        </table>
		            
		      
	          </div>
	          </form>
					</div>
				</div>
			</div>
		</div>
    <script type="text/javascript">
        var popOut = document.getElementsByClassName("popOut");
        var popOutBg = document.getElementsByClassName("popOutBg");
		function $(param){
			if(arguments[1] == true){
				return document.querySelectorAll(param);
			}else{
				return document.querySelector(param);
			}
		}
		function ani(){
			popOut[0].className = "popOut ani";
		}
		var button = document.getElementById("skip");
		$("button").onclick = function(){
			popOut[0].style.display = "block";
			ani();
			popOutBg[0].style.display = "block";
		};
		$(".popOut > span").onclick = function(){
			popOut[0].style.display = "none";
			popOutBg.style.display = "none";
		};
		$(".popOutBg").onclick = function(){
			popOut[0].style.display = "none";
			popOutBg[0].style.display = "none";
		};
	</script>
	<footer id="fh5co-footer" role="contentinfo">
		<div class="container">
			<div class="row row-pb-md">
				<div class="col-md-4 fh5co-widget">
					<h3>Shop.</h3>
					<p>You could completely trust our product and services.</p>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
					<ul class="fh5co-footer-links">
						<li><a href="#">About</a></li>
						<li><a href="#">Help</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">Terms</a></li>
						<li><a href="#">Meetups</a></li>
					</ul>
				</div>

				<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
					<ul class="fh5co-footer-links">
						<li><a href="#">Shop</a></li>
						<li><a href="#">Privacy</a></li>
						<li><a href="#">Testimonials</a></li>
						<li><a href="#">Handbook</a></li>
						<li><a href="#">Held Desk</a></li>
					</ul>
				</div>

				<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
					<ul class="fh5co-footer-links">
						<li><a href="#">Find Designers</a></li>
						<li><a href="#">Find Developers</a></li>
						<li><a href="#">Teams</a></li>
						<li><a href="#">Advertise</a></li>
						<li><a href="#">API</a></li>
					</ul>
				</div>
			</div>

			<div class="row copyright">
				<div class="col-md-12 text-center">
					<p>
						<small class="block">&copy; 2015 Natum. All Rights Reserved.</small> 
					</p>
					<p>
						<ul class="fh5co-social-icons">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
					</p>
				</div>
			</div>

		</div>
	</footer>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="js/jquery.countTo.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

	</body>
</html>

