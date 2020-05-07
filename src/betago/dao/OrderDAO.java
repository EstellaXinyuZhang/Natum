package betago.dao;

import java.util.ArrayList;

import betago.entity.Order;

public interface OrderDAO {
	public ArrayList<Order> getAllOrder(String id);
	public ArrayList<Order> getNotPay(String id);
	public ArrayList<Order> getNotLogistic(String id);
	public ArrayList<Order> getNotRemark(String id);
	public ArrayList<Order> getAllFinish(String id);
	public ArrayList<Order> getOrderDetail(String orderID);
	public boolean deleteMyOrder(String orderID);
}

