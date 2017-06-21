package kr.or.possys.Order_service;

public class Order_Detail {
	private String table_order_id;
	private String menu_id;
	private String menu_name;
	private int order_detail_ea;
	private int order_detail_sum;
	public String getTable_order_id() {
		return table_order_id;
	}
	public void setTable_order_id(String table_order_id) {
		this.table_order_id = table_order_id;
	}
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getOrder_detail_ea() {
		return order_detail_ea;
	}
	public void setOrder_detail_ea(int order_detail_ea) {
		this.order_detail_ea = order_detail_ea;
	}
	public int getOrder_detail_sum() {
		return order_detail_sum;
	}
	public void setOrder_detail_sum(int order_detail_sum) {
		this.order_detail_sum = order_detail_sum;
	}
	
	
}
