<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="betago.dao.impl.CartDAOImpl" %>
<%@ page import="betago.entity.ACart" %>
<%@ page import="betago.entity.Recipient" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Check Your Order</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" type="text/css" href="css/base.css" />
    <link rel="stylesheet" type="text/css" href="css/checkOut.css" />
    <link rel="stylesheet" href="css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Modernizr JS -->
    <script src="js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <script src="js/jquery-1.12.0.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery_cart.js"></script>
    <script type="text/javascript" src="js/base.min.js"></script>
    <script type="text/javascript" src="js/address_all.js"></script>
    <script type="text/javascript" src="js/checkout.min.js"></script>
    <script type="text/javascript">
	var checkoutConfig = {
		addressMatch : 'common',
		addressMatchVarName : 'data',
		hasPresales : false,
		hasBigTv : false,
		hasAir : false,
		hasScales : false,
		hasGiftcard : false,
		totalPrice : 244.00,
		postage : 10, //运费
		postFree : true, //活动是否免邮了
		bcPrice : 150, //计算界值
		activityDiscountMoney : 0.00, //活动优惠
		showCouponBox : 0,
		invoice : {
			NA : "0",
			personal : "1",
			company : "2",
			electronic : "4"
		}
	};
	var miniCartDisable = true;
	
</script>
  </head>
  
  <body>
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
        String username =(String)session.getAttribute("username");
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
					    
						<li class="search">
							<div class="input-group">
							  
						      <form  method="post" action="searchlist.jsp" >
					          <input type="text" name="searchName" class="search" placeholder="Search.." />					          						     					      
				              </form>
						      
						    </div>
						</li>
						<% if(username != null) {%>
						<li class="shopping-cart"><a href="cartlist.jsp" class="cart"><span><i class="icon-shopping-cart"></i></span></a></li>
						<%} %>
					</ul>
				</div>
			</div>
		</div>
	</nav>
    <div class="border_top_cart">
		<div class="container">
			<div class="checkout-box">
				<div class="checkout-box-bd">

					<input type="hidden" name="Checkout[addressState]" id="addrState"
						value="0">
					<!-- 收货地址 -->
					<div class="xm-box">
						<div class="box-hd ">
							<h1 class="title">Choose your receipt information</h1>

						</div>
						<form method="post" action="./detail">
							<div class="box-bd">
								<div class="clearfix xm-address-list" id="checkoutAddrList">
    <%
   
    CartDAOImpl dao2=new CartDAOImpl();
    ArrayList<Recipient> list=dao2.getAllRecipient(username);
    if(list!= null && list.size() > 0)
    {
        for(int i=0;i<list.size();i++)
        {
              Recipient re=list.get(i);
              String info="Name:"+re.getName()+"\n\nAddress:"+re.getAddress()+"\n\nTelephone:"+re.getTel();
     %>
     
    
                              <input id="recipient_<%=re.getId()%>" class="item" value="<%=info%>" type="button" onClick="javascript:var n='<%=re.getId()%>';this.form.recipientID.value=n;">
    <%}} %>
                              <input type="hidden" id="recipientID" value="" name="recipientID">
    
                              </div>
						</div>
					</div>
				<div class="xm-box">
							<div class="box-hd ">
								<h1 class="title">Or add a new recipient information:</h1>
							</div>
							<div class="box-bd">
							    Name: <br> <input type="text" value=""
									maxlength="200" name="newname"
									style="text-align:center;border-radius: 60px 60px;width:800;
            background:transparent;border:2px solid #4"><br>
								<br>Address:<br> <input type="text" value=""
									maxlength="200" name="newaddress"
									style="text-align:center;border-radius: 60px 60px;width:800;
            background:transparent;border:2px solid #4"><br>
								
								<br>Telephone: <br> <input type="text"
									value="" maxlength="200" name="newtel"
									style="text-align:center;border-radius: 60px 60px;width:800;
            background:transparent;border:2px solid #4">
							</div>
						</div>	
						
				<div class="checkout-count clearfix">
				   <div class="checkout-count-extend xm-add-buy">
						<h3 class="title">
						Additional Requirement:
						</h2>
						</br> <input type="text" name="requirement" />
						</div>
    <!-- checkout-count-extend -->
    <input type="hidden" name="del" value="10">
    <input type="hidden" name="choose" value="10">
    </div>
     </div>
    <input type="SUBMIT" id="buyicon" name="action"  value="Buy it now" type="button">
    </form>
      <br><br>  
    </body>
</html>
