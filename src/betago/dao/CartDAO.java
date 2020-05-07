package betago.dao;

import java.util.LinkedHashMap;

import betago.entity.ACart;
import betago.entity.Items;

public interface CartDAO {
	public boolean addToCart(ACart mycart);
	public ACart checkDupicate(String cid,String pid,int type,int num);
	public LinkedHashMap<Items,Integer> listCart(String cid,int select);
	public boolean deleteFromCart(ACart mycart);
	public boolean modifyCart(ACart mycart);
}
