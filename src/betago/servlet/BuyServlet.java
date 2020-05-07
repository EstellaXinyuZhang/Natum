package betago.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import betago.dao.impl.BuyDAOImpl;

public class BuyServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
		HttpSession session = req.getSession();
		String password=(String)session.getAttribute("password");
		String password2=req.getParameter("password");
		String orderID=req.getParameter("orderID");
		System.out.println("The orderID is:"+orderID);
		String pay=req.getParameter("payment");
		System.out.println("payment:"+pay);
		BuyDAOImpl dao=new BuyDAOImpl();

		if(password.equals(password2)){
			try{
				dao.buy(orderID);
				dao.fillPayment(orderID, pay);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(!"".equals(orderID)){
					res.sendRedirect("./jump.jsp?jumpID=3");
				}
				else{
					res.sendRedirect("./error.jsp");
				}
			}
			
		}
	}
}
