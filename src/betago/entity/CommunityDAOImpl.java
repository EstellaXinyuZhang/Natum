package betago.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import betago.dao.CommunityDAO;
import betago.db.DBConnect;
import betago.entity.Post;
import betago.entity.Reply;


public class CommunityDAOImpl implements CommunityDAO{
	//int max = 5, count = 0, firstPage = 1, lastPage = 1, firstID = 1, lastID = 1, prePage = 1, nextPage = 1, pageNo = 1;
	
	public ArrayList<Post> getAllPosts() {
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from post;";
		ArrayList<Post> list = new ArrayList<Post>();
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Post post = new Post();
				post.setPostID(rs.getInt("postID"));
				post.setUserID(rs.getString("username"));
				post.setSubject(rs.getString("subject"));
				post.setPostTime(rs.getString("postTime"));
				post.setContent(rs.getString("content"));
				list.add(post);
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
	
	public Post getContentById(String id) {
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from post where postID=?;";
		try {
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Post post = new Post();
				post.setUserID(rs.getString("username"));
				post.setSubject(rs.getString("subject"));
				post.setContent(rs.getString("content"));
				post.setPostTime(rs.getString("postTime"));				
				rs.close();
				pstmt.close();
				return post;
			} else
				return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			dbc.close();
		}
	}
	
	public ArrayList<Reply> getReplyById(String id){
		DBConnect dbc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from reply where repostID=?;";
		ArrayList<Reply> list = new ArrayList<Reply>();
		try{
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setRepostID(id);
				reply.setUsername(rs.getString("username"));
				reply.setContent(rs.getString("content"));
				reply.setReplyTime(rs.getString("replyTime"));
				list.add(reply);
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
	
	public int setNewPost(Post post) throws Exception {
		DBConnect dbc = null;
		PreparedStatement pstmt1 = null, pstmt2 = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time = format.format(Calendar.getInstance().getTime());
		int postid = 0;
		String sql1 = "insert into post values('"+postid+"','"+post.getUserID()+"','"+post.getSubject()+"','"+post.getContent()+"','"+time+"')";
		String sql2 = "select * from post where username=? and subject=?";
		try{
			dbc = new DBConnect();
			pstmt1 = dbc.getConnection().prepareStatement(sql1);
			pstmt2 = dbc.getConnection().prepareStatement(sql2);
			pstmt2.setString(1, post.getUserID());
			pstmt2.setString(2, post.getSubject());
			ResultSet rs = pstmt2.executeQuery();
			int i = rs.next()?1:0;
			if(i == 1){
				//failure
				rs.close();
				pstmt2.close();
				//pstmt2.close();
				dbc.close();
				return 0;
			}
			else{
				pstmt1.executeUpdate();
				rs.close();
				pstmt1.close();
				pstmt2.close();
				dbc.close();
				return 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			dbc.close();
		}
	}
	
	public int setNewReply(Reply reply) throws Exception {
		DBConnect dbc = null;
		PreparedStatement pstmt1 = null, pstmt2 = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String time = format.format(Calendar.getInstance().getTime());
		int replyid = 0;
		String sql1 = "insert into reply values('"+replyid+"','"+reply.getRepostID()+"','"+reply.getUsername()+"','"+reply.getContent()+"','"+time+"')";
		String sql2 = "select * from reply where username=? and content=?";
		try{
			dbc = new DBConnect();
			pstmt1 = dbc.getConnection().prepareStatement(sql1);
			pstmt2 = dbc.getConnection().prepareStatement(sql2);
			pstmt2.setString(1, reply.getUsername());
			pstmt2.setString(2, reply.getContent());
			ResultSet rs = pstmt2.executeQuery();
			int i = rs.next()?1:0;
			if(i == 1){
				//failure
				rs.close();
				pstmt2.close();
				//pstmt2.close();
				dbc.close();
				return 0;
			}
			else{
				pstmt1.executeUpdate();
				rs.close();
				pstmt1.close();
				pstmt2.close();
				dbc.close();
				return 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			dbc.close();
		}
	}
}
