<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=7" />
    <title>Jump Page</title>
    <style type="text/css" media="screen">
    *{margin:0;padding:0;font-family:arial,sans-serif;font-size:14px;}
    body,html{height:100%;}
    body{background:#e9eaef;}
    .wrapper{margin: 0 auto;background:#fff url(images/bg.png) top center;width:587px;height:196px; padding:80px 0 0 80px; top:50%; margin-top:-150px;position:relative;}
    h3{font-weight:700;font-size:16px;}
    .tm{padding-top:24px;}
    .tm span{color:#e10602;padding:0 5px;font-weight:700;}
    .btn{padding-top:14px;}
    .btn a{display:block;width:150px;height:0;padding-top:30px;color:#0000ff;}
    </style>
  </head>
  <body>
  <% String id = request.getParameter("jumpID");
      String user = (String)session.getAttribute("username");
      int i = Integer.parseInt(id);
      if(i == 0){
   %>
      <div class="wrapper">
          <h3>Welcome back <%=user %>!</h3>
          <p class="tm">The page will automatically jump after<span id="time">5</span>seconds...</p>
          <p class="btn"><a id="Btn" href="index.jsp">Home Page</a></p>
      </div>
      <script type="text/javascript">
 
      function sendStats(url){
        var n = "log_"+ (new Date()).getTime();
        var c = window[n] = new Image();
    	c.onload = (c.onerror=function(){window[n] = null;});
    	c.src = 'index.jsp' + url;
    	c = null;  
	  }

	  var time = document.getElementById('time');
      var btn = document.getElementById('Btn');
      function count(){
      if( +time.innerHTML > 0 ){
        time.innerHTML = time.innerHTML - 1;
      }else{
        sendStats('gotobaidu');
        location.href = btn.href;
      }
      }
      setInterval(count , 1000);

      btn.onclick = function(){
      sendStats('gotobaidu');
      };
      </script>
    <%  } 
        if(i == 1){ 
    %>
      <div class="wrapper">
          <h3>You have successfully logout!</h3>
          <p class="tm">The page will automatically jump after<span id="time">5</span>seconds...</p>
          <p class="btn"><a id="Btn" href="index.jsp">Home Page</a></p>
      </div>
      <script type="text/javascript">
	  function sendStats(url){
    	var n = "log_"+ (new Date()).getTime();
    	var c = window[n] = new Image();
    	c.onload = (c.onerror=function(){window[n] = null;});
    	c.src = 'index.jsp' + url;
    	c = null;  
	  }

	  var time = document.getElementById('time');
	  var btn = document.getElementById('Btn');
	  function count(){
      if( +time.innerHTML > 0 ){
          time.innerHTML = time.innerHTML - 1;
      }else{
          sendStats('gotobaidu');
          location.href = btn.href;
      }
      }
      setInterval(count , 1000);

      btn.onclick = function(){
      sendStats('gotobaidu');
      };

      </script>
      <%  } 
		  if(i == 2){
      %>
      <div class="wrapper">
          <h3>Modify personal information successfully!</h3>
          <p class="tm">The page will automatically jump after<span id="time">5</span>seconds...</p>
          <p class="btn"><a id="Btn" href="ShowInfo.jsp">Back</a></p>
      </div>
      <script type="text/javascript">

       function sendStats(url){
       var n = "log_"+ (new Date()).getTime();
       var c = window[n] = new Image();
       c.onload = (c.onerror=function(){window[n] = null;});
       c.src = 'ShowInfo.jsp' + url;
       c = null;  
       }

       var time = document.getElementById('time');
       var btn = document.getElementById('Btn');
       function count(){
          if( +time.innerHTML > 0 ){
          time.innerHTML = time.innerHTML - 1;
       }else{
          sendStats('gotobaidu');
          location.href = btn.href;
       }
       }
       setInterval(count , 1000);

       btn.onclick = function(){
       sendStats('gotobaidu');
       };
      </script>
    <%  } 
   if(i == 3){
   
   %>
      <div class="wrapper">
          <h3>Well done, you have successfully paid!</h3>
          <p class="tm">The page will automatically jump after<span id="time">5</span>seconds...</p>
          <p class="btn"><a id="Btn" href="myorder.jsp">Order Page</a></p>
      </div>
      <script type="text/javascript">

      function sendStats(url){
    	var n = "log_"+ (new Date()).getTime();
    	var c = window[n] = new Image();
    	c.onload = (c.onerror=function(){window[n] = null;});
    	c.src = 'myorder.jsp' + url;
    	c = null;  
	  }

	  var time = document.getElementById('time');
      var btn = document.getElementById('Btn');
      function count(){
         if( +time.innerHTML > 0 ){
        	time.innerHTML = time.innerHTML - 1;
   		 }else{
            sendStats('gotobaidu');
            location.href = btn.href;
         }
       }
       setInterval(count , 1000);

	   btn.onclick = function(){
       sendStats('gotobaidu');
       };

      </script>
      <%  } 
   if(i == 4){
   
   %>
      <div class="wrapper">
          <h3>You have successfully registered as our member!</h3>
          <p class="tm">The page will automatically jump after<span id="time">5</span>seconds...</p>
          <p class="btn"><a id="Btn" href="login.jsp">Log in</a></p>
      </div>
      <script type="text/javascript">

		function sendStats(url){
    	var n = "log_"+ (new Date()).getTime();
    	var c = window[n] = new Image();
    	c.onload = (c.onerror=function(){window[n] = null;});
    	c.src = 'login.jsp' + url;
    	c = null;  
	    }

	var time = document.getElementById('time');
	var btn = document.getElementById('Btn');
	function count(){
    	if( +time.innerHTML > 0 ){
        	time.innerHTML = time.innerHTML - 1;
    	}else{
        	sendStats('gotobaidu');
        	location.href = btn.href;
    	}
	}
	setInterval(count , 1000);

btn.onclick = function(){
    sendStats('gotobaidu');
};

      </script>
      <%  } 
if(i == 5){
   
   %>
      <div class="wrapper">
          <h3>Modify personal information successfully!</h3>
          <p class="tm">The page will automatically jump after<span id="time">5</span>seconds...</p>
          <p class="btn"><a id="Btn" href="login.jsp">Re-login</a></p>
      </div>
      <script type="text/javascript">

	function sendStats(url){
    	var n = "log_"+ (new Date()).getTime();
    	var c = window[n] = new Image();
    	c.onload = (c.onerror=function(){window[n] = null;});
    	c.src = 'login.jsp' + url;
    	c = null;  
	}

	var time = document.getElementById('time');
	var btn = document.getElementById('Btn');
	function count(){
    	if( +time.innerHTML > 0 ){
        	time.innerHTML = time.innerHTML - 1;
    	}else{
        	sendStats('gotobaidu');
        	location.href = btn.href;
    	}
	}
	setInterval(count , 1000);

	btn.onclick = function(){
    	sendStats('gotobaidu');
	};

      </script>
      <%} %>
  </body>
</html>                                                                          