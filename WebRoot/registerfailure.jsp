<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

 <title>My JSP 'error.jsp' starting page</title>
    <script type="text/javascript">
        var count = 5;
        function t1() {
            if (count) {
                document.getElementById('box').innerHTML=count;
                --count;
            } else {
                clearInterval(t2);
                window.history.go(-1);
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
	<%
		if (Integer.parseInt((String.valueOf(session.getAttribute("repeat")))) == 1) {
	%>
	<div id="div1" class="content">
			<div id="close">
				<span id="close-button">×</span>
				<h2>ERROR!</h2>
			</div>
			<div id="div2">
                <h3>ERROR!</h3>
                <div id='jump'>
				<p>This username or phone number has already been used! Please choose another one!</p>
				<p>Will return to the last page after <span id='box'></span>s</p>
	            <button onclick="javascript:history.back(-1);">Go Now</button>
                </div>
            </div>
			<h3 id="foot">底部内容</h3>
		</div>
	
	<%
		}
		//if (Integer.parseInt((String.valueOf(session.getAttribute("passwordcorrect")))) == 1) {
	%>
	
	
	<button onclick="window.location.href = 'register.jsp'">Try
		again!</button>
</body>
</html>
