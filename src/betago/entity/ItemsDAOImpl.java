package betago.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import betago.dao.ItemsDAO;
import betago.db.DBConnect;
import betago.entity.Items;
import betago.entity.Type;

public class ItemsDAOImpl implements ItemsDAO{
	public ArrayList<Items> getAllItems() {
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from product;";
		ArrayList<Items> list = new ArrayList<Items>();
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Items item = new Items();
				item.setId(rs.getString("productID"));
				item.setName(rs.getString("productName"));
				item.setPrice(rs.getInt("priceOfProduct"));
				item.setIntro(rs.getString("productIntro"));
				item.setReserve(rs.getInt("reserveNum"));
				item.setSales(rs.getInt("salesVolume"));
				item.setClassfication(rs.getString("productClass"));
				item.setImg_name(rs.getString("pictureName"));
				item.setImg_num(rs.getInt("pictureNum"));
				list.add(item);
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
	
	public ArrayList<String> getAllCategory(){
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select distinct productClass from product;";
		ArrayList<String> list = new ArrayList<String>();
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String cate;
				cate=rs.getString("productClass");
				list.add(cate);
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
	
	public Items getDetailById(String id) {
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from product where productID=?;";
		try {
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Items item = new Items();
				item.setId(rs.getString("productID"));
				item.setName(rs.getString("productName"));
				item.setPrice(rs.getInt("priceOfProduct"));
				item.setIntro(rs.getString("productIntro"));
				item.setReserve(rs.getInt("reserveNum"));
				item.setSales(rs.getInt("salesVolume"));
				item.setClassfication(rs.getString("productClass"));
				item.setImg_name(rs.getString("pictureName"));
				item.setImg_num(rs.getInt("pictureNum"));
				rs.close();
				pstmt.close();
				return item;
			} else
				return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			dbc.close();
		}
	}
	
	public Items getAItems(String ID) {
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from product where productID=?;";
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			Items aitem = new Items();
			if(rs.next()) {
				aitem.setId(rs.getString("productID"));
				aitem.setName(rs.getString("productName"));
				aitem.setPrice(rs.getInt("priceOfProduct"));
				aitem.setIntro(rs.getString("productIntro"));
				aitem.setReserve(rs.getInt("reserveNum"));
				aitem.setSales(rs.getInt("salesVolume"));
				aitem.setClassfication(rs.getString("productClass"));
				aitem.setImg_name(rs.getString("pictureName"));
				aitem.setImg_num(rs.getInt("pictureNum"));
			}
			rs.close();
			pstmt.close();
			return aitem;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			dbc.close();
		}
	}
	
	public ArrayList<Items> searchOutItems(String name){
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from product where productName like '%" + name + "%';";
		ArrayList<Items> list = new ArrayList<Items>();
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Items item = new Items();
				item.setId(rs.getString("productID"));
				item.setName(rs.getString("productName"));
				item.setPrice(rs.getInt("priceOfProduct"));
				item.setIntro(rs.getString("productIntro"));
				item.setReserve(rs.getInt("reserveNum"));
				item.setSales(rs.getInt("salesVolume"));
				item.setClassfication(rs.getString("productClass"));
				item.setImg_name(rs.getString("pictureName"));
				item.setImg_num(rs.getInt("pictureNum"));
				list.add(item);
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
	
	public ArrayList<Type> getType(String productID){
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from producttype where productID=?;";
		ArrayList<Type> list = new ArrayList<Type>();
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, productID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Type type=new Type();
				type.setProductID(productID);
				type.setTypeNum(rs.getInt("typeNum"));
				type.setTypeName(rs.getString("typeName"));
				list.add(type);
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
}
