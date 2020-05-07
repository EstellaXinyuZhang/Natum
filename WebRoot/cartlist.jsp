<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="betago.dao.impl.ItemsDAOImpl"%>
<%@ page import="betago.dao.impl.CartDAOImpl"%>
<%@ page import="betago.entity.Items"%>
<%@ page import="betago.entity.ACart"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My Shopping Cart</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- 
	<link rel="stylesheet" type="text/css" href="style.css">
	 -->
	<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
	<link href="css/footer.css" rel="stylesheet" />
	<link rel="stylesheet" href="css/cart-style2.css"/>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,600,700|Roboto:300,100" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script type="text/javascript" src="js/cart.js"></script>

  </head>
  
  <body>
  <nav class="fh5co-nav" role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-xs-2">
					<div id="fh5co-logo"><a href="index_shop.html">Shopping Cart.</a></div>
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
				
			</div>
		</div>
	</nav>
    <script>
            function changeNum(num,typeNum,ID){
            var num=num;
		    var typeNum=typeNum;
		    var productID=ID;
		    var action=$("#action").val();
		    var del=$("#del").val();
		    var customerID= $("#customerID").val();
            var choose=5;
            $.ajax({
                type:"post",
                url:"./cartlist",
                data:{amount:num,action:action,del:0,productID:productID,typeNum:typeNum,customerID:customerID,choose:5},
                statusCode:{
                404:function(){
                    //alert("404");
                },
                500:function(){
                    //alert("500");
                }
                },
                    success:function(massge,Status){
                    //alert(Status);
                }
            });
            }
           
            function cancel(typeNum,productID){
            var num= $("#num").val();
            var action=$("#action").val();
		    var del=$("#del").val();
		    var productID= productID;
		    var typeNum= typeNum;
		    var customerID= $("#customerID").val();
            var choose=5;
            $.ajax({
                type:"post",
                url:"./cartlist",
                data:{amount:num,action:0,del:del,productID:productID,typeNum:typeNum,customerID:customerID,choose:5},
                statusCode:{
                404:function(){
                    //alert("404");
                },
                500:function(){
                    //alert("500");
                }
                },
                    success:function(massge,Status){
                    //alert(Status);
                }
            });
            }  
            
            function forOrder(typeNum,productID,choose){
		    var productID= productID
		    var typeNum= typeNum
		    var customerID= $("#customerID").val();
		    var choose= choose
            $.ajax({
                type:"post",
                url:"./cartlist",
                data:{action:0,del:0,productID:productID,typeNum:typeNum,customerID:customerID,choose:choose},
                statusCode:{
                404:function(){
                    //alert("404");
                },
                500:function(){
                    //alert("500");
                }
                },
                    success:function(massge,Status){
                    //alert(Status);
                }
            });
            }     
            
            function buyOrNot(checkbox){
                var vals=checkbox.checked;
                if(vals==true){
                   return 1;
                 }
                if(vals==false){
                   return 0;
                 }
            }   
                         
    </script>
   
    <%
    
    if(username!=null){
    %>
    <hr>
    
    <div class="catbox">
    <table id="cartTable" >

    <thead>
			<tr>
				<th></th>
				<th>Product</th>
				<th>Price($)</th>
				<th>Number</th>
				<th>Subtotal($)</th>
				<th>Operation</th>
			</tr>
	</thead>
    <tbody>
    <%
    //System.out.println("!");
	CartDAOImpl dao=new CartDAOImpl();
	LinkedHashMap<Items,Integer> goods=new LinkedHashMap<Items,Integer>();
	goods=dao.listCart(username,0);
	Set<Items> keys=goods.keySet(); 
	Iterator<Items> it=keys.iterator();
	int sum=0;
	int num=0;
	float price=0;
	int typeNum=0;
	float subtotal=0;
	int state=-1;
	String choose="";
	int numOfSelect=0;
	while(it.hasNext()){
		Items i=it.next();
		String productName=i.getName();
		String productID=i.getId();
		String typeName=i.getTypeName();
		typeNum=i.getTypeNum();
		num=goods.get(i);
		price=i.getPrice();
		subtotal=num*price;
		sum+=num*price;
		state=dao.checkState(username, productID, typeNum);
		if(state==1){
		    numOfSelect+=1;
		    choose="checked";
		}else if(state==0){
		    choose="";
		}
	%>
	<tr>
		
	<form>
	<td class="checkbox"><input id="choose" name="choose" <%=choose%> value="0" type="checkbox"  type="button" onClick="javascript:var t=this.form.typeNum.value; var p=this.form.productID.value;var choose=buyOrNot(this); forOrder(t,p,choose);"/></td>
	<td class="goods"><img src="picture/product/<%=i.getImg_name()%>_<%=i.getImg_num()%>.png" alt=""/><span><%=productName%><br>(type:<%=typeName%>)</span></td>
	<td class="price"><%=price%></td>
	<td class="count">
	<input type="button" class="add" name="action" id="action" style="background: no-repeat scroll 0 -600px ;height:23px;width:23px;" value="-" onClick="javascript:if(this.form.amount.value>1)this.form.amount.value--; var n=this.form.amount.value; var t=this.form.typeNum.value; var p=this.form.productID.value;changeNum(n,t,p);">
    <input readonly="readonly" type=text name=amount id="num" style="background: no-repeat scroll 0 -600px ;height:23px;width:23px;" value=<%=num%>>
    <input type="button" class="reduce"  name="action" id="action" style="background: no-repeat scroll 0 -600px ;height:23px;width:23px;" value="+" onClick="javascript:this.form.amount.value++; var n=this.form.amount.value; var t=this.form.typeNum.value; var p=this.form.productID.value;changeNum(n,t,p);"></td>
	<td class="subtotal"><%=subtotal%></td>
	<td class="operation"><input class="delete" type="button" name="del" id="del" value="Delete From My Cart" onClick="javascript:var t=this.form.typeNum.value; var p=this.form.productID.value; cancel(t,p);"></td>
    <input type="hidden" name="productID" id="productID" value=<%=productID%>>
    <input type="hidden" name="typeNum" id="typeNum" value=<%=typeNum%>>
    <input type="hidden" name="customerID" id="customerID" value=<%=username%>>    
    </form>
    
    </tr>
	<%	
	}
    %>
    </tbody>
    </table>
    
    
    <div class="foot" id="foot">		
		<div class="fr closing">
		<form method="post" action="order.jsp">
        <input type="submit" id="buy" value="Buy" type="button">
        </form>
		</div>
		<div class="fr total">Total Price：$<span id="priceTotal">0.00</span></div>
		<div class="fr selected" id="selected">The number of products you choose: <span id="selectedTotal"><%=numOfSelect%></span><span class="arrow up">︽</span><span class="arrow down">︾</span></div>
		<div class="selected-view">
			<div id="selectedViewList" class="clearfix">
				<div><img src=""><span>Cancel</span></div>
			</div>
			<span class="arrow">◆<span>◆</span></span>
		</div>
	</div>
    </div>
    <%}else{%>
     
    <h1>Please Log In</h1>
    <hr>
    <h3><a href="login.jsp">Log In</a></h3>
     <%
     }
     %>
    <br><br>
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
    
  </body>
 
</html>
