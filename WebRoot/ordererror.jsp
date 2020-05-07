<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>order error</title>
    
	<script type="text/javascript">
        var count = 5;
        function t1() {
            if (count) {
                document.getElementById('box').innerHTML=count;
                --count;
            } else {
                clearInterval(t2);
                window.location.href='order.jsp';
            }
        }
        var t2 = setInterval(t1,1000);
    </script>
    <script src="js/tan-js.js"></script>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/tan-style.css">

  </head>
  
  <body>
  
    <div id="div1" class="content">
			<div id="close">
				
				<h2>ERROR!</h2>
			</div>
			<div id="div2">
                <h3>ERROR</h3>
                <div id='jump'>
                <p>Please choose or add a new recipient information!</p>
				<p>Will go bark to the page after <span id='box'></span>s</p>
	            <a href="order.jsp">Go Now</a>
                </div>
            </div>
			<h3 id="foot"></h3>
		</div>
  </body>
</html>
