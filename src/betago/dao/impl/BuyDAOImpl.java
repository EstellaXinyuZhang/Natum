package betago.dao.impl;

import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import betago.dao.BuyDAO;
import betago.db.DBConnect;

public class BuyDAOImpl implements BuyDAO{
	public boolean buy(String orderID){
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		String sql = "update `order` set paymentStatment=? where orderID=?;";
		try {
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,"Y");
			pstmt.setString(2,orderID);
			pstmt.executeUpdate();
			pstmt.close();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			dbc.close();
		}
	}
	
	public String generateDate(){
		Calendar calendar= Calendar.getInstance();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
		String date=dateFormat.format(calendar.getTime());
		//System.out.println(date);
		return date;
	}
	
	public boolean fillPayment(String orderID,String method){
		String date=generateDate();
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		String sql = "insert into payment values(?,?,?);";
		try {
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,orderID);
			pstmt.setString(2,method);
			pstmt.setString(3,date);
			pstmt.executeUpdate();
			pstmt.close();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			dbc.close();
		}
	}
}
