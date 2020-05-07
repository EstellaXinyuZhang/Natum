package betago.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import betago.dao.OrderDAO;
import betago.db.DBConnect;
import betago.entity.Order;

public class OrderDAOImpl implements OrderDAO{
	
	public ArrayList<Order> getAllOrder(String id) {
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from `order` where customerID=?;";
		ArrayList<Order> list = new ArrayList<Order>();
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				order.setOrderID(rs.getString("orderID"));
				order.setDate(rs.getString("dateOfOrder"));
				order.setPrice(rs.getFloat("totalPrice"));
				list.add(order);
			}
			rs.close();
			pstmt.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			dbc.close();
		}
	}
	
	public ArrayList<Order> getNotPay(String id) {
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from `order` where customerID=? and paymentStatment='N';";
		ArrayList<Order> list = new ArrayList<Order>();
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				order.setOrderID(rs.getString("orderID"));
				order.setDate(rs.getString("dateOfOrder"));
				order.setPrice(rs.getFloat("totalPrice"));
				list.add(order);
			}
			rs.close();
			pstmt.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			dbc.close();
		}
	}
	
	public ArrayList<Order> getNotLogistic(String id) {
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from `order` where customerID=? and receiveOrNot='N' and paymentStatment='Y';";
		ArrayList<Order> list = new ArrayList<Order>();
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				order.setOrderID(rs.getString("orderID"));
				order.setDate(rs.getString("dateOfOrder"));
				order.setPrice(rs.getFloat("totalPrice"));
				list.add(order);
			}
			rs.close();
			pstmt.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			dbc.close();
		}
	}
	
	public ArrayList<Order> getNotRemark(String id) {
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select o.orderID, dateOfOrder, totalPrice from `order` o, customer c, commentofproduct m where m.orderID=o.orderID and o.customerID=c.userID and commentofpro IS NULL and userID=?;";
		ArrayList<Order> list = new ArrayList<Order>();
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				order.setOrderID(rs.getString("orderID"));
				order.setDate(rs.getString("dateOfOrder"));
				order.setPrice(rs.getFloat("totalPrice"));
				list.add(order);
			}
			rs.close();
			pstmt.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			dbc.close();
		}
	}
	
	public ArrayList<Order> getAllFinish(String id) {
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select distinct o.orderID, dateOfOrder, totalPrice from `order` o, customer c, commentofproduct m where m.orderID=o.orderID and o.customerID=c.userID and commentofpro IS NOT NULL and userID=? and paymentStatment='Y' and receiveOrNot='Y';";
		ArrayList<Order> list = new ArrayList<Order>();
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				order.setOrderID(rs.getString("orderID"));
				order.setDate(rs.getString("dateOfOrder"));
				order.setPrice(rs.getFloat("totalPrice"));
				list.add(order);
			}
			rs.close();
			pstmt.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			dbc.close();
		}
	}
	
	public ArrayList<Order> getOrderDetail(String orderID) {
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select distinct productName, typename, numberofproduct, priceofproduct, pictureNum, pictureName from `order` o, orderdetail d, product p, producttype t where o.orderID=d.orderID and d.productID=p.productID and d.productID=t.productID and t.productID=p.productID  and d.typenum=t.typenum and o.orderID=?;";
		ArrayList<Order> list = new ArrayList<Order>();
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, orderID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				order.setNameOfProduct(rs.getString("productName"));
				order.setType(rs.getString("typename"));
				order.setNumOfProduct(rs.getInt("numberofproduct"));
				order.setPriceOfProduct(rs.getFloat("priceofproduct"));
				order.setPictureNum(rs.getInt("pictureNum"));
				order.setPictureName(rs.getString("pictureName"));
				list.add(order);
			}
			rs.close();
			pstmt.close();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			dbc.close();
		}
	}
	
	public boolean deleteMyOrder(String orderID){
		DBConnect dbc = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt4 = null;
		String sql1 = "delete from orderdetail where orderId=?;";
		String sql2 = "delete from `order` where orderId=?;";
		String sql3 = "delete from payment where orderId=?;";
		String sql4 = "delete from commentofproduct where orderId=?;";
		try {
			dbc = new DBConnect();
			pstmt4 = dbc.getConnection().prepareStatement(sql4);
			pstmt4.setString(1,orderID);
			pstmt4.executeUpdate();
			pstmt4.close();
			pstmt3 = dbc.getConnection().prepareStatement(sql3);
			pstmt3.setString(1,orderID);
			pstmt3.executeUpdate();
			pstmt3.close();
			pstmt1 = dbc.getConnection().prepareStatement(sql1);
			pstmt1.setString(1,orderID);
			pstmt1.executeUpdate();
			pstmt1.close();
			pstmt2 = dbc.getConnection().prepareStatement(sql2);
			pstmt2.setString(1,orderID);
			pstmt2.executeUpdate();
			pstmt2.close();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			dbc.close();
		}
	}
	
	public boolean confirmReceipt(String orderID){
		DBConnect dbc = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		String sql1 = "update `order` set receiveOrNot='Y' where orderID=?;";
		try {
			dbc = new DBConnect();
			pstmt1 = dbc.getConnection().prepareStatement(sql1);
			pstmt1.setString(1,orderID);
			pstmt1.executeUpdate();
			pstmt1.close();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			dbc.close();
		}
	}
}

