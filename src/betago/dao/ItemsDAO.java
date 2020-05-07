package betago.dao;

import java.util.ArrayList;

import betago.entity.Items;
import betago.entity.Type;

//��Ʒ��ҵ���߼���
public interface ItemsDAO {
	public ArrayList<Items> getAllItems();
	public ArrayList<String> getAllCategory();
	public Items getDetailById(String id);
	public Items getAItems(String ID);
	public ArrayList<Items> searchOutItems(String name);
	public ArrayList<Type> getType(String productID);
}
