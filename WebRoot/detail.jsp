<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="betago.dao.ItemsDAO" %>
<%@ page import="betago.dao.impl.ItemsDAOImpl" %>
<%@ page import="betago.dao.impl.CartDAOImpl" %>
<%@ page import="betago.dao.impl.CommentDAOImpl" %>
<%@ page import="betago.entity.Comment" %>
<%@ page import="betago.entity.Items" %>
<%@ page import="betago.entity.ACart" %>
<%@ page import="betago.entity.Type" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Product Detail</title>
    <meta http-equiv="Page-Enter"content="revealTrans(Duration=2.0,Transition=5)">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,600,700|Roboto:300,100" rel="stylesheet">
    <link href="css/detail-style.css" rel="stylesheet" type="text/css">
    <link href="css/footer.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="css/iosOverlay.css">
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <script type="text/javascript" src="js/roll-detail.js"></script>
    <script type="text/javascript" src="js/jquery.min2.js"></script>
    <script type="text/javascript" src="js/iosOverlay.js"></script>
    <script type="text/javascript" src="js/spin.min.js"></script>
	<script type="text/javascript">
     function enable()
     {
          document.getElementById("cart-box").removeAttribute("disabled");
          document.getElementById("tobuy").removeAttribute("disabled");
     }

     function changeColor(num){
         for(var i=1;i<=10;i++){
              if(i==num){
                   document.getElementById("type_"+i).style.color="#d46a07";
              }else{
                   document.getElementById("type_"+i).style.color="#f1c573e1";
              }
          }
      }
</script>
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
  </head>
  
  <body>
        <script> 
            function addtocart(t,tnum,pn,p,pnum){
            var typeName=t;
		    var typeNum=tnum;
		    var typeName=pn;
		    var productID=p;
		    var productNum=pnum;
		    var action=$("#cart-box").val();
            $.ajax({
                type:"post",
                url:"./detail",
                data:{typeName:typeName,typeNum:typeNum,typeName:typeName,productNum:productNum,action:action,del:0,productID:productID,choose:9},
                statusCode:{
                404:function(){
                    alert("404");
                },
                500:function(){
                    alert("500");
                }
                },
                    success:function(msg){
                    //console.log("qjbl" +msg);
                    //alert(msg);
                    //$("input[name=msg]").val(msg);
                    //$("#msg").text(msg);
                    
                }
            });
            }
            
            function buynow(t,tnum,pn,p,pnum,price){
            var typeName=t;
		    var typeNum=tnum;
		    var typeName=pn;
		    var productID=p;
		    var productNum=pnum;
		    var action=$("#tobuy").val();
		    var price=price;
            $.ajax({
                type:"post",  
                url:"./detail",
                async:false,
                data:{typeName:typeName,typeNum:typeNum,typeName:typeName,productNum:productNum,action:action,del:0,productID:productID,choose:9,price:price},
                statusCode:{
                404:function(){
                    alert("404");
                },
                500:function(){
                    alert("500");
                }
                },
                    success:function(msg){
                       window.location.href ='checkbuynow.jsp';
                    
                }
            });
            }
            
            function message(){
                var msg;
                msg=document.getElementById("msg");
               
                $(document).on("click", "#cart-box", function(e){      
	                     iosOverlay({  
		                      text:"Success",
		                      duration: 2e3,
		                      icon: "images/check.png"
	                      });
	                     return false;
                 });         
            }
         </script>
  
        <%
        ItemsDAOImpl itemDaoDetail = new ItemsDAOImpl();
	    String ID=request.getParameter("productID");
	    //System.out.println("传过来的usrname: "+session.getAttribute("username"));
        String cID =(String)session.getAttribute("username");
	    Items item2 = itemDaoDetail.getDetailById(request.getParameter("productID"));
       %>
	           <% 
                String username =(String)session.getAttribute("username");
                %>
     <nav class="fh5co-nav" role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-xs-2">
					<div id="fh5co-logo"><a href="index_shop.html">Shop.</a></div>
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
		<%
	    if(username==null) {
	    %>
						<li><a href="login.jsp">Sign In</a></li>
						<%}
						else{ %>
						<li><a href="login.jsp">Change account</a></li>
						<%} %>
					</ul>
				</div>
				<div class="col-md-3 col-xs-4 text-right hidden-xs menu-2">
					<ul>
					    <% if(username != null) {%>
						<li class="shopping-cart"><a href="cartlist.jsp" class="cart"><span><i class="icon-shopping-cart"></i></span></a></li>
						<%}else{ %>
						<li class="shopping-cart"><a href="login.jsp">Log in for shopping</a></li>
						<%} %>
					</ul>
				</div>
			</div>
			
		</div>
	</nav>
	<% 
	if(username!=null) {
	            %>
	            <div class="float-button">
                    <div class="float-container">
                        <ul>
						<li><a href="cartlist.jsp">CART</a></li>
						<li><a href="myorder.jsp">ORDER</a></li>             
                        <li><a href="index.jsp">HOME</a></li>
                        </ul>
                        </div>
                </div><!--end of float-button-->
	            <%}%>
	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(images/parts.jpeg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>Product Details</h1>
							<h2>Learn more about our company  <a href="index.jsp" target="_blank">Natum.com</a></h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
   
    <div id="fh5co-product">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 animate-box">
					<div class="owl-carousel owl-carousel-fullwidth product-carousel">
						<div class="item">
							<div class="active text-center">
								<figure>
									<img src="picture/product/<%=item2.getImg_name()%>_2.png" alt="user">
								</figure>
							</div>
						</div>
						<div class="item">
							<div class="active text-center">
								<figure>
									<img src="images/product-single-2.jpg" alt="user">
								</figure>
							</div>
						</div>
						<div class="item">
							<div class="active text-center">
								<figure>
									<img src="images/product-single-3.jpg" alt="user">
								</figure>
							</div>
						</div>
					</div>
					<div class="row animate-box">
						<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
							<h2><%=item2.getName()%></h2>
							<div class="information3-container">
                                  <table>
                                            <th><h4>PRICE: <h4></th>
                                            <th><h4> $ <%=item2.getPrice()%></h4></th>
                                  </table><br><br> 
                                    </div><!--end of information3-container-->
                                      
                                      <form>
                                        
                                        
                                        <div class="button-container">
                                        <table>
                                        <tr><h4>COLOUR/TYPE</h4><tr>
                                        <tr>
                                        
    <%
    ItemsDAO itemsDao = new ItemsDAOImpl();
    ArrayList<Type> list = itemsDao.getType(ID);
    if(list != null && list.size() > 0)
    {
        for(int i = 0; i < list.size(); i++)
        {
            Type type = list.get(i);
            //int typeNum=type.getTypeNum();
    %>
                                            <tr>
                                                <div class="color-button">
                                                    
                                                    <input id="type_<%=type.getTypeNum()%>" value="<%=type.getTypeName()%>" type="button" onClick="javascript:var n=<%=type.getTypeNum()%>;this.form.typeNum.value=n;enable();changeColor(n);">
                                             
                                                </div>
                                            </tr>
                                            <%
         }
     }
     %>
                                      </tr>  
                                    </table>
                                    </div><!--end of button-container--><br><br>
                                    
                                    <table>
                                        <tr>
                                           <input type="hidden" id="typeName" name="TypeName" value="default">
                                           <input type="hidden" id="typeNum" name="typeNum" value="1">
                                           <input type="button" style="border-radius: 20px; background: no-repeat scroll 0 -600px ;height:32px;width:32px;" value="-" onClick="javascript:if(this.form.productNum.value>1)this.form.productNum.value--;">
                                           <input readonly="readonly" type=text name="productNum" id="productNum" style="border:none;background: no-repeat scroll 0 -600px ;height:35px;width:50px;text-align: center" value=1>
                                           <input type="button" style="border-radius:20px; background: no-repeat scroll 0 -600px ;height:32px;width:32px;" value="+" onClick="javascript:this.form.productNum.value++;">        
                                        </tr id="icon-content">
                                        
                                            <div>
                                            <% if(username != null) {%>
                                            <tr id="icon-cart">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 1028 1024" width="25" height="25" t="1562249739880" p-id="9952" version="1.1"><path fill="#8a8a8a" d="M 332.8 790.528 q 19.456 0 36.864 7.168 t 30.208 19.968 t 20.48 30.208 t 7.68 36.864 t -7.68 36.864 t -20.48 30.208 t -30.208 20.48 t -36.864 7.68 q -20.48 0 -37.888 -7.68 t -30.208 -20.48 t -20.48 -30.208 t -7.68 -36.864 t 7.68 -36.864 t 20.48 -30.208 t 30.208 -19.968 t 37.888 -7.168 Z M 758.784 792.576 q 19.456 0 37.376 7.168 t 30.72 19.968 t 20.48 30.208 t 7.68 36.864 t -7.68 36.864 t -20.48 30.208 t -30.72 20.48 t -37.376 7.68 t -36.864 -7.68 t -30.208 -20.48 t -20.48 -30.208 t -7.68 -36.864 t 7.68 -36.864 t 20.48 -30.208 t 30.208 -19.968 t 36.864 -7.168 Z M 930.816 210.944 q 28.672 0 44.544 7.68 t 22.528 18.944 t 6.144 24.064 t -3.584 22.016 t -13.312 37.888 t -22.016 62.976 t -23.552 68.096 t -18.944 53.248 q -13.312 40.96 -33.28 56.832 t -49.664 15.872 l -35.84 0 l -65.536 0 l -86.016 0 l -96.256 0 l -253.952 0 l 14.336 92.16 l 517.12 0 q 49.152 0 49.152 41.984 q 0 20.48 -9.728 35.84 t -38.4 14.336 l -49.152 0 l -94.208 0 l -118.784 0 l -119.808 0 l -99.328 0 l -55.296 0 q -20.48 0 -34.304 -9.216 t -23.04 -24.064 t -14.848 -32.256 t -8.704 -32.768 q -1.024 -6.144 -5.632 -29.696 t -11.264 -58.88 t -14.848 -78.848 t -16.384 -87.552 q -19.456 -103.424 -44.032 -230.4 l -76.8 0 q -15.36 0 -25.6 -7.68 t -16.896 -18.432 t -9.216 -23.04 t -2.56 -22.528 q 0 -20.48 13.824 -33.792 t 37.376 -12.288 l 103.424 0 q 20.48 0 32.768 6.144 t 19.456 15.36 t 10.24 18.944 t 5.12 16.896 q 2.048 8.192 4.096 23.04 t 4.096 30.208 q 3.072 18.432 6.144 38.912 l 700.416 0 Z M 892.928 302.08 l -641.024 -2.048 l 35.84 185.344 l 535.552 1.024 Z" p-id="9953" /></svg>
                                            
                                            <input type="hidden" id="productID" name="productID" value="<%=ID %>">
                                            <input type="hidden" id="productName" name="productName" value="<%=item2.getName()%>">
                                            <input type="hidden" name="del" value=0>
                                            <input type="hidden" name="choose" value=10>
                                            
						                    <input name="action" id="cart-box" value="Add To My Cart" type="button" onClick="javascript:var t=this.form.typeName.value; var tnum=this.form.typeNum.value; var pn=this.form.productName.value; var p=this.form.productID.value; var pnum=this.form.productNum.value; addtocart(t,tnum,pn,p,pnum);message();">
						                    <% } %>
						                                                               
                                            </tr>                                            
                                            </div>
                                          </table>
                                          <div class="information3-container">
                                         
                                    </div><!--end of information3-container-->
                                    <div class="buy-container">
                                        <div class="buy-color">
											<div class="buy-box" style="text-align: center">
												<ul>
													<li>
														<%if(cID==null){%>	
														</li>
														<li>
														<br>
															<a href="login.jsp" id="logintobuy" style="width:300px;"class="btn btn-primary btn-outline btn-lg">Login To Buy</a>
                                           				 
														</li>
														<li>
                                        				<%}else{%>
													</li>
													<li>
														<input name="price" type="hidden" value=<%=item2.getPrice()%>>
													</li>
													<li>
											            <br>
														<input class="btn btn-primary btn-outline btn-lg" style="width:300px;" id="tobuy" name="action" value="BUY IT NOW" type="button" onClick="javascript:var t=this.form.typeName.value; var tnum=this.form.typeNum.value; var pn=this.form.productName.value; var p=this.form.productID.value; var pnum=this.form.productNum.value; var price=this.form.price.value; price=price*pnum; buynow(t,tnum,pn,p,pnum,price);">
                                            
													</li>
														<li>
                                            			<%} %>
													</li>
												</ul>                                                                                    
                                            </div>
                                           </div>
                                           </div>
                                        </form>                                   
							</div>
						</div>
					</div>
				</div>
			</div>
		    
		    <div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="fh5co-tabs animate-box">
						<ul class="fh5co-tab-nav">
							<li class="active"><a href="#" data-tab="1"><span class="icon visible-xs"><i class="icon-file"></i></span><span class="hidden-xs">Product Details</span></a></li>
							<li><a href="#" data-tab="2"><span class="icon visible-xs"><i class="icon-bar-graph"></i></span><span class="hidden-xs">Specification</span></a></li>
							<li><a href="#" data-tab="3"><span class="icon visible-xs"><i class="icon-star"></i></span><span class="hidden-xs">Feedback &amp; Ratings</span></a></li>
						</ul>
						<!-- Tabs -->
						<div class="fh5co-tab-content-wrap">
							<div class="fh5co-tab-content tab-content active" data-tab-content="1">
								<div class="col-md-10 col-md-offset-1">									
									<h1><%=item2.getName()%></h1>
									<p><%=item2.getIntro()%></p>								
									<p>The excellent automatic navigation function, advanced artificial intelligence chip and flexible mechanical design make this product fit the daily use habits of different people, no matter the elderly or children can play with this robot dog happily.</p>
									<p>Its excellent machine learning ability makes communication between man and machine more convenient. When charging is needed, it will automatically navigate to the charging position for wireless charging.</p>
									<div class="row">
										<div class="col-md-6">
											<h2 class="uppercase">Keep it simple</h2>
											<p>Our design is designed to be easy for you to use naturally. It is the most humanized design after careful consideration by designers.</p>
										</div>									
									</div>
								</div>
							</div>

							<div class="fh5co-tab-content tab-content" data-tab-content="2">
								<div class="col-md-10 col-md-offset-1">
									<h3>Product Specification</h3>
									<ul>
										<li> Automatic Obstacle Avoidance mode</li>
										<li> Infrared Remote Control mode</li>
										<li> Bluetooth Remote Control mode</li>
										<li> Speech-based Remote Control mode</li>
									</ul>
									<ul>
										<li>Long battery life</li>
										<li>The mechanical joints move freely</li>
										</ul>
								</div>
							</div>
         
							<div class="fh5co-tab-content tab-content" data-tab-content="3">
<%
   CommentDAOImpl dao=new CommentDAOImpl();
   ArrayList<Comment> list2=dao.listComment(ID);
   int sum=0;
   int point=0;
   int average=0;
   if(list2 != null && list2.size() > 0)
    {
        for(int i = 0; i < list2.size(); i++)
        {
            Comment comment=new Comment();
            comment=list2.get(i);
            point=comment.getPoint();
            sum+=point;
            
    %>
								<div class="col-md-10 col-md-offset-1">
									<h3>Happy Buyers</h3>
									<div class="feed">
										<div>
											<blockquote>
												<p><%=comment.getCommentOfProduct()%></p>
												<p><%=comment.getDateOfComment()%></p>
											</blockquote>
											<h3>&mdash; <%=comment.getCustomerID() %></h3>
											<span class="rate">
											<%
											for(int s=0;s<comment.getPoint();s++){
											 %>
												<i class="icon-star2"></i>
											<%} %>
											</span>
										</div>
									
    <%
         }
         average=sum/list2.size();
    %>
    <h3>score: <%=average%></h3>
    <%
     }else{
     %>
    <p>(No Comment)</p>
    <% 
    }
    %>	
									</div>
								</div>
							</div> 			
						</div>
					</div>
				</div>
		</div>

	
	
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
