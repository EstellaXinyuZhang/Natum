package betago.dao;

import betago.entity.User;

public interface UserDAO{
	public String queryByUsername(User user) throws Exception;
	public int setUserInfo(User user) throws Exception;
	public boolean updateUserInfo(User user);
	public User getUserInfo(String customerID);
}
