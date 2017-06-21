package kr.or.possys.Member_sevice;

public class expense_folios {

	String payment_date;
	int payment_total;
	String ep_order_wh_date;
	int ep_order_total_price;
	
	int total_result;
	
	public int getTotal_result() {
		return total_result;
	}
	public void setTotal_result(int total_result) {
		this.total_result = total_result;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public int getPayment_total() {
		return payment_total;
	}
	public void setPayment_total(int payment_total) {
		this.payment_total = payment_total;
	}
	public String getEp_order_wh_date() {
		return ep_order_wh_date;
	}
	public void setEp_order_wh_date(String ep_order_wh_date) {
		this.ep_order_wh_date = ep_order_wh_date;
	}
	public int getEp_order_total_price() {
		return ep_order_total_price;
	}
	public void setEp_order_total_price(int ep_order_total_price) {
		this.ep_order_total_price = ep_order_total_price;
	}
	
}
