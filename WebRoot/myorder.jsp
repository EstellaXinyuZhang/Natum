<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@ page import="betago.dao.impl.OrderDAOImpl"%>
<%@ page import="betago.entity.Order"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>My order</title>
<meta
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"
	name="viewport" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<link href="css/order_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/order_jquery.min.js"></script>
<script type="text/javascript" src="js/tab.js"></script>
</head>

<body>
    <script>
            function deleteMyOrder(orderID){
		    var orderID=orderID;
            $.ajax({
                type:"post",
                url:"./myOrder",
                data:{orderID:orderID,action:"deleteMyOrder"},
                statusCode:{
                404:function(){
                    alert("404");
                },
                500:function(){
                    alert("500");
                }
                },
                    success:function(massge,Status){
                    alert(Status);
                }
            });
            }

			function DeleteDiv(orderID)  
			{    
			    
			   // var my=document.getElementsByClassName(orderID);  
			   // if (my != null){ 
			        //for(var i = 0;i<my.length;i++){
			         //    my[i].parentNode.removeChild(my[i]); 
			        //}
			   //     my[2].parentNode.removeChild(my[2]); 
			   // }  
			    var my = document.getElementsByTagName('li');
                for(var i = 0;i<my.length;i++){
                   if(my[i].getAttribute('class') == orderID){
                    my[i].parentNode.removeChild(my[i]);
                  /*删掉一个总长度变了i--*/
                   i--;
                   }
                }
			} 
     </script>
     
	<%
		String username = (String) session.getAttribute("username");
		OrderDAOImpl orderDao = new OrderDAOImpl();
		int count = 0;
	%>
        <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
                <a href="index.jsp" class="aui-navBar-item">
                    <i class="icon icon-return"></i>
                </a>
                <div class="aui-center">
                    <span class="aui-center-title">My Order</span>
                </div>
                <a href="javascript:;" class="aui-navBar-item">
                Hello, <%=username%>
                    <i class="icon icon-sys"></i>
                </a>
            </header>
            <section class="aui-scrollView">
                <div class="aui-tab" data-ydui-tab>
                    <ul class="tab-nav">
                        <li class="tab-nav-item tab-active">
                            <a href="javascript:;">All orders</a>
                        </li>
                        <li class="tab-nav-item">
                            <a href="javascript:;">Pending payment</a>
                        </li>
                        <li class="tab-nav-item">
                            <a href="javascript:;">Pending receipt</a>
                        </li>
                        <li class="tab-nav-item">
                            <a href="javascript:;">Pending comment</a>
                        </li>
                        <li class="tab-nav-item">
                            <a href="javascript:;">Completed</a>
                        </li>
                    </ul>

                            
                        <div class="tab-panel">
                     <!-- 1 -->
                        <div class="tab-panel-item tab-active">
                        <ul>
                        <%
                        	ArrayList<Order> list_order = orderDao.getAllOrder(username);
                        	if (list_order != null && list_order.size() > 0) {
                        		for (int i = 0; i < list_order.size(); i++) {
                        			Order order1 = list_order.get(i);
                        			String orderID_1 = order1.getOrderID();
                        %>
                        <li class="<%=orderID_1%>"  value="<%=orderID_1%>">
                        <div class="divHeight"></div>
                            
                            <div class="tab-item">
                                <a href="javascript:void(0);" class="aui-well-item aui-well-item-clear">
                                    <form>
                                    <div class="aui-well-item-bd">
                                        <h3>Order number: <%=orderID_1%></h3>
                                    </div>
                                    <input type="hidden" id="orderID" name="orderID" value="<%=orderID_1%>" >
                                    <span class="aui-well-item-fr"><%=order1.getDate()%></span>
                                    <input type="button" class="aui-well-item-after" onClick="javascript:var orderID=this.form.orderID.value; deleteMyOrder(orderID);DeleteDiv(orderID);">
                                    </form>
                                </a>
                                <%
                                	ArrayList<Order> list_detail1 = orderDao.getOrderDetail(orderID_1);
                                			if (list_detail1 != null && list_detail1.size() > 0) {
                                				for (int j = 0; j < list_detail1.size(); j++) {
                                					Order order2 = list_detail1.get(j);
                                %>
                                <div class="aui-mail-product">
                                    <a href="javascript:;" class="aui-mail-product-item">
                                        <div class="aui-mail-product-item-hd">
                                            <img src="picture/product/<%=order2.getPictureName()%>_<%=order2.getPictureNum()%>.png" alt="">
                                        </div>
                                        <div class="aui-mail-product-item-bd">
                                            <p><%=order2.getNameOfProduct()%>(<%=order2.getType()%>)</p>
                                            <p>Subtotal: <%=order2.getNumOfProduct()%> x $<%=order2.getPriceOfProduct()%> = $<%=order2.getNumOfProduct() * order2.getPriceOfProduct()%></p>
                                        </div>
                                    </a>
                                </div>
                                <%
                                	count += order2.getNumOfProduct();
                                				}
                                			}
                                %>
                                <a href="javascript:;" class="aui-mail-payment">
                                    <p>
                                        Total <em><%=count%></em>
                                        items. Actual payment: $<i><%=order1.getPrice()%></i>
                                    </p>
                                </a>
                                <div class="aui-mail-button">
                                    <a href="list.jsp">Buy More</a>
                                    <a href="javascript:;" class="aui-df-color">Share</a>
                                    
                                </div>
                                </div>
                                <%
                            	count = 0;
                            		}
                           %>
                           </li>
                           <% 
                            	}
                            %>
                            </ul>
                            </div>
                       
                        
                        
                    <!--2-->
                        <div class="tab-panel-item">
                          <ul>
                            <%
                            	ArrayList<Order> list_pay = orderDao.getNotPay(username);
                            	if (list_pay != null && list_pay.size() > 0) {
                            		for (int a = 0; a < list_pay.size(); a++) {
                            			Order order3 = list_pay.get(a);
                            			String orderID_2 = order3.getOrderID();
                            %>
                            <li class="<%=orderID_2%>" value="<%=orderID_2%>">
                            <div class="divHeight"></div>
                            <div class="tab-item">
                                <a href="javascript:void(0);" class="aui-well-item aui-well-item-clear">
                                    <form>
                                    <div class="aui-well-item-bd">
                                        <h3>Order number: <%=orderID_2%></h3>
                                    </div>
                                    <input type="hidden" id="orderID" name="orderID" value="<%=orderID_2%>" >
                                    <span class="aui-well-item-fr"><%=order3.getDate()%></span>
                                    <input type="button" class="aui-well-item-after" onClick="javascript:var orderID=this.form.orderID.value; deleteMyOrder(orderID);DeleteDiv(orderID);">
                                    </form>
                                </a>
                                <%
                                	ArrayList<Order> list_detail2 = orderDao.getOrderDetail(orderID_2);
                                			if (list_detail2 != null && list_detail2.size() > 0) {
                                				for (int b = 0; b < list_detail2.size(); b++) {
                                					Order order4 = list_detail2.get(b);
                                %>
                                <div class="aui-mail-product">
                                    <a href="javascript:;" class="aui-mail-product-item">
                                        <div class="aui-mail-product-item-hd">
                                            <img src="picture/product/<%=order4.getPictureName()%>_<%=order4.getPictureNum()%>.png" alt="">
                                        </div>
                                        <div class="aui-mail-product-item-bd">
                                            <p><%=order4.getNameOfProduct()%>(<%=order4.getType()%>)</p>
                                            <p>Subtotal: <%=order4.getNumOfProduct()%> x $<%=order4.getPriceOfProduct()%> = $<%=order4.getNumOfProduct() * order4.getPriceOfProduct()%></p>
                                        </div>
                                    </a>
                                </div>
                                <%
                                	count += order4.getNumOfProduct();
                                				}
                                			}
                                %>
                                <a href="javascript:;" class="aui-mail-payment">
                                    <p>
                                        Total <em><%=count%></em>
                                        items. Actual payment: $<i><%=order3.getPrice()%></i>
                                    </p>
                                </a>
                                <div class="aui-mail-button">
                                    <a href="pay.jsp?orderID=<%=orderID_2%>">Go to Pay</a>
                                    <a href="javascript:;" class="aui-df-color">Share</a>
                                    
                                </div>
                                </div>
                                <%
                            	count = 0;
                            		}
                            	%>
                            	</li>
                            	<%
                            	}
                            %>
                               </ul>
                            </div>
                            
                                
                    <!--3-->  
                        <div class="tab-panel-item">
                        <ul>
                         <%
                         	ArrayList<Order> list_logistic = orderDao.getNotLogistic(username);
                         	if (list_logistic != null && list_logistic.size() > 0) {
                         		for (int c = 0; c < list_logistic.size(); c++) {
                         			Order order5 = list_logistic.get(c);
                         			String orderID_3 = order5.getOrderID();
                         %>
                         <li class="<%=orderID_3%>" value="<%=orderID_3%>">
                            <div class="divHeight"></div>
                            <div class="tab-item">
                                <a href="javascript:void(0);" class="aui-well-item aui-well-item-clear">
                                    <form>
                                    <div class="aui-well-item-bd">
                                        <h3>Order number: <%=orderID_3%></h3>
                                    </div>
                                    <input type="hidden" id="orderID" name="orderID" value="<%=orderID_3%>" >
                                    <span class="aui-well-item-fr"><%=order5.getDate()%></span>
                                    <input type="button" class="aui-well-item-after" onClick="javascript:var orderID=this.form.orderID.value; deleteMyOrder(orderID);DeleteDiv(orderID);">
                                    </form>
                                </a>
                                <%
                                	ArrayList<Order> list_detail3 = orderDao.getOrderDetail(orderID_3);
                                			if (list_detail3 != null && list_detail3.size() > 0) {
                                				for (int d = 0; d < list_detail3.size(); d++) {
                                					Order order6 = list_detail3.get(d);
                                %>
                                <div class="aui-mail-product">
                                    <a href="javascript:;" class="aui-mail-product-item">
                                        <div class="aui-mail-product-item-hd">
                                            <img src="picture/product/<%=order6.getPictureName()%>_<%=order6.getPictureNum()%>.png" alt="">
                                        </div>
                                        <div class="aui-mail-product-item-bd">
                                            <p><%=order6.getNameOfProduct()%>(<%=order6.getType()%>)</p>
                                            <p>Subtotal: <%=order6.getNumOfProduct()%> x $<%=order6.getPriceOfProduct()%> = $<%=order6.getNumOfProduct() * order6.getPriceOfProduct()%></p>
                                        </div>
                                    </a>
                                </div>
                                <%
                                	count += order6.getNumOfProduct();
                                				}
                                			}
                                %>
                                <a href="javascript:;" class="aui-mail-payment">
                                    <p>
                                        Total <em><%=count%></em>
                                        items. Actual payment: $<i><%=order5.getPrice()%></i>
                                    </p>
                                </a>
                                
                                <div class="aui-mail-button">
                                    
                                    <a href="./myOrder?orderID=<%=orderID_3%>">Confirm Receipt</a>
                                    <a href="javascript:;" class="aui-df-color">Share</a>
                                    
                                </div>
                                
                                </div>
                                <%
                            	count = 0;
                            		}%>
                            		</li>
                            		<%
                            		}
                            %>
                            </ul>
                            </div>
                            
                             
                        
                    <!--4-->      
                        <div class="tab-panel-item">
                        <ul>
                        <%
                        	ArrayList<Order> list_remark = orderDao.getNotRemark(username);
                        	if (list_remark != null && list_remark.size() > 0) {
                        		for (int e = 0; e < list_remark.size(); e++) {
                        			Order order7 = list_remark.get(e);
                        			String orderID_4 = order7.getOrderID();
                        %>
                        <li class="<%=orderID_4%>" value="<%=orderID_4%>">
                            <div class="divHeight"></div>
                            <div class="tab-item">
                                <a href="javascript:void(0);" class="aui-well-item aui-well-item-clear">
                                    <form>
                                    <div class="aui-well-item-bd">
                                        <h3>Order number: <%=orderID_4%></h3>
                                    </div>
                                    <input type="hidden" id="orderID" name="orderID" value="<%=orderID_4%>" >
                                    <span class="aui-well-item-fr"><%=order7.getDate()%></span>
                                    <input type="button" class="aui-well-item-after" onClick="javascript:var orderID=this.form.orderID.value; deleteMyOrder(orderID);DeleteDiv(orderID);">
                                    </form>
                                </a>
                                <%
                                	ArrayList<Order> list_detail4 = orderDao.getOrderDetail(orderID_4);
                                			if (list_detail4 != null && list_detail4.size() > 0) {
                                				for (int f = 0; f < list_detail4.size(); f++) {
                                					Order order8 = list_detail4.get(f);
                                %>
                                <div class="aui-mail-product">
                                    <a href="javascript:;" class="aui-mail-product-item">
                                        <div class="aui-mail-product-item-hd">
                                            <img src="picture/product/<%=order8.getPictureName()%>_<%=order8.getPictureNum()%>.png" alt="">
                                        </div>
                                        <div class="aui-mail-product-item-bd">
                                            <p><%=order8.getNameOfProduct()%>(<%=order8.getType()%>)</p>
                                            <p>Subtotal: <%=order8.getNumOfProduct()%> x $<%=order8.getPriceOfProduct()%> = $<%=order8.getNumOfProduct() * order8.getPriceOfProduct()%></p>
                                        </div>
                                    </a>
                                </div>
                                <%
                                	count += order8.getNumOfProduct();
                                				}
                                			}
                                %>
                                <a href="javascript:;" class="aui-mail-payment">
                                    <p>
                                        Total <em><%=count%></em>
                                        items. Actual payment: $<i><%=order7.getPrice()%></i>
                                    </p>
                                </a>
                                <div class="aui-mail-button">
                                    <a href="list.jsp">Make Evaluations</a>
                                    <a href="javascript:;" class="aui-df-color">Share</a>
                                    
                                </div>
                                </div>
                                <%
                            	count = 0;
                            		}%>
                            		</li>
                            		<%
                            	}
                            %>
                            </ul>
                            </div>
                            

                        
                    <!--5-->     
                        <div class="tab-panel-item">
                        <ul>
                        <%
                        	ArrayList<Order> list_finish = orderDao.getAllFinish(username);
                        	if (list_finish != null && list_finish.size() > 0) {
                        		for (int g = 0; g < list_finish.size(); g++) {
                        			Order order9 = list_finish.get(g);
                        			String orderID_5 = order9.getOrderID();
                        %>
                        <li class="<%=orderID_5%>" value="<%=orderID_5%>">
                            <div class="divHeight"></div>
                            <div class="tab-item">
                                <a href="javascript:void(0);" class="aui-well-item aui-well-item-clear">
                                    <form>
                                    <div class="aui-well-item-bd">
                                        <h3>Order number: <%=orderID_5%></h3>
                                    </div>
                                    <input type="hidden" id="orderID" name="orderID" value="<%=orderID_5%>" >
                                    <span class="aui-well-item-fr"><%=order9.getDate()%></span>
                                    <input type="button" class="aui-well-item-after" onClick="javascript:var orderID=this.form.orderID.value; deleteMyOrder(orderID);DeleteDiv(orderID);">
                                    </form>
                                </a>
                                <%
                                	ArrayList<Order> list_detail5 = orderDao.getOrderDetail(orderID_5);
                                			if (list_detail5 != null && list_detail5.size() > 0) {
                                				for (int h = 0; h < list_detail5.size(); h++) {
                                					Order order10 = list_detail5.get(h);
                                %>
                                <div class="aui-mail-product">
                                    <a href="javascript:;" class="aui-mail-product-item">
                                        <div class="aui-mail-product-item-hd">
                                            <img src="picture/product/<%=order10.getPictureName()%>_<%=order10.getPictureNum()%>.png" alt="">
                                        </div>
                                        <div class="aui-mail-product-item-bd">
                                            <p><%=order10.getNameOfProduct()%>(<%=order10.getType()%>)</p>
                                            <p>Subtotal: <%=order10.getNumOfProduct()%> x $<%=order10.getPriceOfProduct()%> = $<%=order10.getNumOfProduct() * order10.getPriceOfProduct()%></p>
                                        </div>
                                    </a>
                                </div>
                                <%
                                	count += order10.getNumOfProduct();
                                				}
                                			}
                                %>
                                <a href="javascript:;" class="aui-mail-payment">
                                    <p>
                                        Total <em><%=count%></em>
                                        items. Actual payment: $<i><%=order9.getPrice()%></i>
                                    </p>
                                </a>
                                <div class="aui-mail-button">
                                    <a href="list.jsp">Buy More</a>
                                    <a href="javascript:;" class="aui-df-color">Share</a>
                                    
                                </div>
                                </div>
                                <%
                            	count = 0;
                            		}
                            		%>
                            		</li>
                            		<%
                            	}
                            %>
                            </ul>
                            </div>                          
                    </div>              
            </section>
        </section>
    </body>
</html>
