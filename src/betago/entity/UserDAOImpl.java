package betago.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import betago.dao.UserDAO;
import betago.db.DBConnect;
import betago.entity.User;

public class UserDAOImpl implements UserDAO{
	public String queryByUsername(User user) throws Exception {
		//int flag=0;
				String sql="select * from customer where userID=? OR userTel=?"; 
				PreparedStatement pstmt=null;
				DBConnect dbc=null;
				//下面是针对数据库的具体操作
				try{
					//连接数据库
					dbc=new DBConnect();
					pstmt=dbc.getConnection().prepareStatement(sql);
					pstmt.setString(1,user.getUsername());
					pstmt.setString(2,user.getPhonenumber());
					//进行数据库查询工作
					ResultSet rs=pstmt.executeQuery();
					if(rs.next()){
						
							if(rs.getString("password").equals(user.getPassword())){
								
								return rs.getString("userID");
							}
						
					}
					rs.close();
					pstmt.close();
				}catch(SQLException e){
					System.out.println(e.getMessage());
				}finally{
					//关闭数据库
					dbc.close();
				}
				//return flag;
				return "";
    }
	
	public int setUserInfo(User user) throws Exception {
		DBConnect dbc = null;
		PreparedStatement pstmt1 = null, pstmt2 = null, pstmt3 = null;
		String sql1 = "insert into customer values ('"+user.getUsername()+"','"+user.getFname()+"','"+user.getLname()+"','"+user.getSex()+"','"+user.getDob()+"','"+user.getPassword()+"','"+user.getPhonenumber()+"','"+user.getAddress()+"')";
		String sql2 = "select * from customer where userID=?";
		String sql3 = "select * from customer where userTel=?";
		try
		{
			dbc = new DBConnect();
			pstmt1 = dbc.getConnection().prepareStatement(sql1);
			pstmt2 = dbc.getConnection().prepareStatement(sql2);
			pstmt3 = dbc.getConnection().prepareStatement(sql3);
			pstmt2.setString(1,user.getUsername());
			pstmt3.setString(1,user.getPhonenumber());
			ResultSet rs1 = pstmt2.executeQuery(), rs2 = pstmt3.executeQuery();
			int i = rs1.next()?1:0, j = rs2.next()?1:0;
			if(i == 0 && j == 0)
			{
				pstmt1.executeUpdate();	
				rs1.close();
				pstmt1.close();
				dbc.close();
				return 1;
			}
			else if(i == 1 || j == 1)
			{
				rs1.close();
				pstmt1.close();
				dbc.close();
				return 2;
			}
			else
			{
				rs1.close();
				pstmt1.close();
				dbc.close();
				return 0;
			}
			/*pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getFname());
			pstmt.setString(3, user.getLname());
			pstmt.setString(4, user.getSex());
			pstmt.setString(5, user.getDob());
			pstmt.setString(6, user.getPassword());
			pstmt.setString(7, user.getPhonenumber());
			pstmt.setString(8, user.getAddress());*/
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public User getUserInfo(String customerID){
		User user=new User();
		String sql="select * from customer where userID=?"; 
		PreparedStatement pstmt=null;
		DBConnect dbc=null;
		try{
			dbc=new DBConnect();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1,customerID);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				user.setUsername(customerID);
				user.setFname(rs.getString("fName"));
				user.setLname(rs.getString("lName"));
				user.setSex(rs.getString("sex"));
				user.setDob(rs.getString("DoB"));
				user.setPassword(rs.getString("password"));
				user.setPhonenumber(rs.getString("userTel"));
				user.setAddress(rs.getString("address"));
			}
			rs.close();
			pstmt.close();
			return user;
		}catch(SQLException e){
			System.out.println(e.getMessage());
			return null;
		}finally{
			dbc.close();
		}
	}
	
	public boolean updateUserInfo(User user){
		String username=user.getUsername();
		String fname=user.getFname();
		String lname=user.getLname();
		String sex=user.getSex();
		String DoB=user.getDob();
		String password=user.getPassword();
		String userTel=user.getPhonenumber();
		String address=user.getAddress();
		PreparedStatement pstmt=null;
		DBConnect dbc=null;
		String sql = "update customer set fName=?, lName=?, sex=?, DoB=?, password=?, userTel=?, address=? where userID=?;";
		try {
			dbc = new DBConnect();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, fname);
			pstmt.setString(2, lname);
			pstmt.setString(3, sex);
			pstmt.setString(4, DoB);
			pstmt.setString(5, password);
			pstmt.setString(6, userTel);
			pstmt.setString(7, address);
			pstmt.setString(8, username);
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
