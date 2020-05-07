package betago.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import betago.db.DBConnect;
import betago.entity.Comment;

public class CommentDAOImpl {
	public ArrayList<Comment> listComment(String productID){
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from commentofproduct c, `order` o, payment p where c.orderID=p.orderID and c.orderID=o.orderID and productID=?;";
		ArrayList<Comment> list = new ArrayList<Comment>();
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,productID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Comment comment = new Comment();
				comment.setProductID(productID);
				comment.setCustomerID(rs.getString("customerID"));
				comment.setDateOfComment(rs.getString("dateOfComment"));
				comment.setPoint(rs.getInt("pointOfProduct"));
				comment.setCommentOfProduct(rs.getString("commentOfPro"));
				list.add(comment);
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
