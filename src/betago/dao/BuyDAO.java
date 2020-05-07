package betago.dao;

public interface BuyDAO {
	public boolean buy(String orderID);
	public String generateDate();
	public boolean fillPayment(String orderID,String method);
	
}
