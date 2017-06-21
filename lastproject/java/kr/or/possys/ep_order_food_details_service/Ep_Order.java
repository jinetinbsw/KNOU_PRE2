package kr.or.possys.ep_order_food_details_service;

public class Ep_Order {
	private String ep_order_id;
	private String food_id;
	private String ep_id;
	private String ep_order_date;
	private String ep_order_wh_date;
	private String ep_order_food_shelflife;
	private int ep_order_ea;
	private int ep_order_wh_ea;
	private int ep_order_unit_price;
	private int ep_order_total_price;
	private String ep_order_payment_option;
	private int food_nowquantity;
	private String ea_order_statement;
					
	//식재현황 리스트를 위해서 food name을 가져옴. 쿼리문에서 
	private String food_name;
	//입고등록 폼을 위한 ep_name 가져옴
	private String ep_name;
	
	public String getEp_name() {
		return ep_name;
	}
	public void setEp_name(String ep_name) {
		this.ep_name = ep_name;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public String getEp_order_id() {
		return ep_order_id;
	}
	public void setEp_order_id(String ep_order_id) {
		this.ep_order_id = ep_order_id;
	}
	public String getFood_id() {
		return food_id;
	}
	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}
	public String getEp_id() {
		return ep_id;
	}
	public void setEp_id(String ep_id) {
		this.ep_id = ep_id;
	}
	public String getEp_order_date() {
		return ep_order_date;
	}
	public void setEp_order_date(String ep_order_date) {
		this.ep_order_date = ep_order_date;
	}
	public String getEp_order_wh_date() {
		return ep_order_wh_date;
	}
	public void setEp_order_wh_date(String ep_order_wh_date) {
		this.ep_order_wh_date = ep_order_wh_date;
	}
	public String getEp_order_food_shelflife() {
		return ep_order_food_shelflife;
	}
	public void setEp_order_food_shelflife(String ep_order_food_shelflife) {
		this.ep_order_food_shelflife = ep_order_food_shelflife;
	}
	public int getEp_order_ea() {
		return ep_order_ea;
	}
	public void setEp_order_ea(int ep_order_ea) {
		this.ep_order_ea = ep_order_ea;
	}
	public int getEp_order_wh_ea() {
		return ep_order_wh_ea;
	}
	public void setEp_order_wh_ea(int ep_order_wh_ea) {
		this.ep_order_wh_ea = ep_order_wh_ea;
	}
	public int getEp_order_unit_price() {
		return ep_order_unit_price;
	}
	public void setEp_order_unit_price(int ep_order_unit_price) {
		this.ep_order_unit_price = ep_order_unit_price;
	}
	public int getEp_order_total_price() {
		return ep_order_total_price;
	}
	public void setEp_order_total_price(int ep_order_total_price) {
		this.ep_order_total_price = ep_order_total_price;
	}
	public String getEp_order_payment_option() {
		return ep_order_payment_option;
	}
	public void setEp_order_payment_option(String ep_order_payment_option) {
		this.ep_order_payment_option = ep_order_payment_option;
	}
	public int getFood_nowquantity() {
		return food_nowquantity;
	}
	public void setFood_nowquantity(int food_nowquantity) {
		this.food_nowquantity = food_nowquantity;
	}
	public String getEa_order_statement() {
		return ea_order_statement;
	}
	public void setEa_order_statement(String ea_order_statement) {
		this.ea_order_statement = ea_order_statement;
	}
	
	
}
