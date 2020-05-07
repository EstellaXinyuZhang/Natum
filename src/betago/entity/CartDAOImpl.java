package betago.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;

import betago.dao.CartDAO;
import betago.db.DBConnect;
import betago.entity.ACart;
import betago.entity.Items;
import betago.entity.Order;
import betago.entity.Recipient;

public class CartDAOImpl implements CartDAO{
	public boolean addToCart(ACart mycart){
		String cid=mycart.getCustomerID();
		String pid=mycart.getProductID();
		int type=mycart.getTypeNum();
		int num=mycart.getProductNum();
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		if(checkDupicate(cid,pid,type,num).getProductNum()==0){
			String sql = "insert into shoppingcart values(?,?,?,?,'0');";
			try {
				dbc = new DBConnect();
				pstmt = dbc.getConnection().prepareStatement(sql);
				pstmt.setString(1,cid);
				pstmt.setString(2,pid);
				pstmt.setInt(3,type);
				pstmt.setInt(4,num);
			    System.out.println("same "+cid+"  "+pid+"  "+type+" "+num);
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
		else{
			System.out.println("update");
			String sql = "update shoppingcart set numberOfProduct=? where customerID=? and productID=? and typeNum=?;";
			try {
				dbc = new DBConnect();
				pstmt = dbc.getConnection().prepareStatement(sql);
				pstmt.setInt(1,checkDupicate(cid,pid,type,num).getProductNum());
				pstmt.setString(2,cid);
				pstmt.setString(3,pid);
				pstmt.setInt(4,type);
				//System.out.println("different "+cid+"  "+pid+"  "+num);
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
	
	public ACart checkDupicate(String cid,String pid,int type,int num){
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select * from shoppingcart where customerID=? and productID=? and typeNum=?;";
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,cid);
			pstmt.setString(2,pid);
			pstmt.setInt(3,type);
			rs = pstmt.executeQuery();
			ACart exist=new ACart();
			if(rs.next()){
				int existNum=rs.getInt("numberOfProduct");
				exist.setCustomerID(cid);
				exist.setProductID(pid);
				exist.setTypeNum(type);
				exist.setProductNum(existNum+num);
			}
			else{
				exist.setProductNum(0);
			}
			rs.close();
			pstmt.close();
			return exist;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			dbc.close();
		}
	}
	
	public LinkedHashMap<Items,Integer> listCart(String cid, int select){
		//System.out.println("list my cart!");
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		if(select==0){
			sql ="select * from shoppingcart s, product p, producttype t where s.productID=p.productID and s.productID= t.productID and s.typeNum=t.typeNum and customerID=? order by productName;";
		}else{
			sql ="select * from shoppingcart s, product p, producttype t where s.productID=p.productID and s.productID= t.productID and s.typeNum=t.typeNum and customerID=? and buyOrNot=1 order by productName;";
		}
		
		LinkedHashMap<Items,Integer> goods=new LinkedHashMap<Items,Integer>();
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,cid);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Items item=new Items();
				int num =rs.getInt("numberOfProduct");
				item.setId(rs.getString("productID"));
				item.setName(rs.getString("productName"));
				item.setPrice(rs.getInt("priceOfProduct"));
				item.setIntro(rs.getString("productIntro"));
				item.setReserve(rs.getInt("reserveNum"));
				item.setSales(rs.getInt("salesVolume"));
				item.setClassfication(rs.getString("productClass"));
				item.setImg_name(rs.getString("pictureName"));
				item.setImg_num(rs.getInt("pictureNum"));
				item.setTypeNum(rs.getInt("typeNum"));
				item.setTypeName(rs.getString("typeName"));
				goods.put(item,num);
				//System.out.println(rs.getString("productID"));
			}
			rs.close();
			pstmt.close();
			return goods;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			dbc.close();
		}
	}
	
	public boolean deleteFromCart(ACart mycart){
		String cid=mycart.getCustomerID();
		String pid=mycart.getProductID();
		int type=mycart.getTypeNum();
		//System.out.println("DELEYE "+cid+" "+pid);
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		String sql ="delete from shoppingcart where customerID=? and productID=? and typeNum=?;";
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,cid);
			pstmt.setString(2,pid);
			pstmt.setInt(3,type);
			pstmt.executeUpdate();
			//System.out.println("TRY DELEYE "+cid+" "+pid+" type: "+type);
			pstmt.close();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			dbc.close();
		}
	}
	
	public boolean modifyCart(ACart mycart){
		String cid=mycart.getCustomerID();
		String pid=mycart.getProductID();
		int type=mycart.getTypeNum();
		int num=mycart.getProductNum();
		//System.out.println("In cartDAO: "+cid+" "+pid+" type: "+type+" "+num);
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		String sql = "update shoppingcart set numberOfProduct=? where customerID=? and typeNum=? and productID=?;";
		try {
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.setString(2,cid);
			pstmt.setInt(3,type);
			pstmt.setString(4,pid);
			//System.out.println("different "+cid+"  "+pid+"  "+num);
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
	
	public ArrayList<ACart> list(String customerID){
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ACart> list=new ArrayList<ACart>();
		String sql ="select * from shoppingcart where customerID=? and buyOrNot=?;";
		try {
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, customerID);
			pstmt.setInt(2, 1);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ACart item=new ACart();
				item.setCustomerID(customerID);
				item.setProductID(rs.getString("productID"));
				item.setTypeNum(rs.getInt("typeNum"));
				item.setProductNum(rs.getInt("numberOfProduct"));
				list.add(item);
			}
			pstmt.close();
			return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			dbc.close();
		}
	}
	
	public ArrayList<Recipient> getAllRecipient(String customerID){
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from recipient where customerID=?";
		ArrayList<Recipient> list = new ArrayList<Recipient>();
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,customerID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Recipient recipient=new Recipient();
				recipient.setAddress(rs.getString("recipientAddress"));
				recipient.setId(rs.getString("recipientID"));
				recipient.setCustomerID(customerID);
				recipient.setName(rs.getString("recipientName"));
				recipient.setTel(rs.getString("recipientTel"));
				list.add(recipient);
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
	
	public String generateID(){
		String OrderID=Long.toString(new Date().getTime());
		return OrderID;
	}
	
	public String generateDate(){
		Calendar calendar= Calendar.getInstance();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
		String date=dateFormat.format(calendar.getTime());
		//System.out.println(date);
		return date;
	}
	
	public String generateOrder(Order order){
		String orderID=generateID();
		order.setOrderID(orderID);
		String remark=order.getRemark();
		String paymentStatment=order.getPaymentState();
		String date=generateDate();
		order.setDate(date);
		String custmerID=order.getCustomerID();
		String recipientID=order.getRecipientID();
		float price=order.getPrice();
		ArrayList<ACart> list=order.getList();
		DBConnect dbc = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		String sql1 = "insert into `order` values(?,?,?,?,?,?,?,'N');";
		String sql2 = "insert into orderdetail values(?,?,?,?);";
		
		try {
			dbc = new DBConnect();
			pstmt1 = dbc.getConnection().prepareStatement(sql1);
			pstmt1.setString(1,orderID);
			pstmt1.setString(2,remark);
			pstmt1.setString(3,paymentStatment);
			pstmt1.setString(4,date);
			pstmt1.setString(5,custmerID);
			pstmt1.setString(6,recipientID);
			pstmt1.setFloat(7,price);
			pstmt1.executeUpdate();
			pstmt1.close();
			for(int i = 0; i < list.size(); i++){
				pstmt2 = dbc.getConnection().prepareStatement(sql2);
				ACart cart=list.get(i);
				String productID=cart.getProductID();
				int typeNum=cart.getTypeNum();
				int num=cart.getProductNum();
				//System.out.println(productID+" "+typeNum+" "+num);
				pstmt2.setString(1,orderID);
				pstmt2.setString(2,productID);
				pstmt2.setInt(3,typeNum);
				pstmt2.setInt(4,num);
				pstmt2.executeUpdate();
			}
			pstmt2.close();
			
			return orderID;
		}catch(Exception e){
			e.printStackTrace();
			return orderID;
		}finally{
			dbc.close();
		}
	}
	
	public String generateRecipent(String customerID,String address, String name, String tel){
		String ID=generateID();
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		String sql = "insert into recipient values(?,?,?,?,?);";
		try {
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,ID);
			pstmt.setString(2,customerID);
			pstmt.setString(3,address);
			pstmt.setString(4,tel);
			pstmt.setString(5,name);
			pstmt.executeUpdate();
			pstmt.close();
			return ID;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			dbc.close();
		}
	}
	
	public String onlyOrderDetail(ACart cart, int price){
		String username=cart.getCustomerID();
		String orderID=generateID();
		String productID=cart.getProductID();
		int typeNum=cart.getTypeNum();
		int num=cart.getProductNum();
		DBConnect dbc = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		String sql1="insert into `order` values(?,?,?,?,?,?,?,'N');";
		String sql2="insert into orderDetail values(?,?,?,?);";
		try {
			dbc = new DBConnect();
			pstmt1=dbc.getConnection().prepareStatement(sql1);
			pstmt1.setString(1,orderID);
			pstmt1.setString(2,null);
			pstmt1.setString(3,"N");
			pstmt1.setString(4,null);
			pstmt1.setString(5,username);
			pstmt1.setString(6,"000001");
			pstmt1.setInt(7,price);
			pstmt1.executeUpdate();
			pstmt1.close();
			pstmt2=dbc.getConnection().prepareStatement(sql2);
			pstmt2.setString(1,orderID);
			pstmt2.setString(2,productID);
			pstmt2.setInt(3,typeNum);
			pstmt2.setInt(4,num);
			pstmt2.executeUpdate();
			pstmt2.close();
			return orderID;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			dbc.close();
		}
	}
	
	public boolean fillOrder(Order order){
		System.out.println("fill order");
		String remark=order.getRemark();
		String date=generateDate();
		String recipientID=order.getRecipientID();
		String orderID=order.getOrderID();
		System.out.println("The orderID in fill: "+orderID);
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		
		String sql = "update `order` set remarkOfOrder=?, dateOfOrder=?, recipientID=? where orderID=?;";
		
		try {
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,remark);
			pstmt.setString(2,date);
			pstmt.setString(3,recipientID);
			pstmt.setString(4,orderID);
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
	
	public boolean deleteWrongOrder(String orderID){
		DBConnect dbc = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		String sql1 = "delete from orderdetail where orderId=?;";
		String sql2 = "delete from `order` where orderId=?;";
		try {
			dbc = new DBConnect();
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
	
	public boolean forOrder(ACart mycart,int choose){
		String cid=mycart.getCustomerID();
		String pid=mycart.getProductID();
		int type=mycart.getTypeNum();
		//System.out.println("In cartDAO: "+cid+" "+pid+" type: "+type+" "+num);
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		String sql2 = "update shoppingcart set buyOrNot=? where customerID=? and typeNum=? and productID=?;";
		try {
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql2);
			pstmt.setInt(1,choose);
			pstmt.setString(2,cid);
			pstmt.setInt(3,type);
			pstmt.setString(4,pid);
			//System.out.println("different "+cid+"  "+pid+"  "+num);
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
	
	public boolean deleteAfterOrder(String customerID){
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		String sql ="delete from shoppingcart where customerID=? and buyOrNot=1;";
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,customerID);
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
	
	public int checkState(String cid,String pid,int type){
		int state=10;
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql ="select * from shoppingcart where customerID=? and productID=? and typeNum=?;";
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,cid);
			pstmt.setString(2,pid);
			pstmt.setInt(3,type);
			rs = pstmt.executeQuery();
			if(rs.next()){
				state =rs.getInt("buyOrNot");
			}
			rs.close();
			pstmt.close();
			return state;
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			dbc.close();
		}
	}
}
