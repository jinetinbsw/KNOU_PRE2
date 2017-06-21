package kr.or.possys.ep_order_food_details_service;

public class Food_Present_Sangse_VO {
	private String food_id;
	private String food_name;
	private String ep_id;
	private String ep_name;
	private String B4_or_date;
	private String B4_or_wh_date;
	private int B4_or_wh_ea;
	private String B4_food_shelflife;
	private String B4_ep_order_id;
	private String recent_or_date;
	private String recent_or_wh_date;
	private int recent_or_wh_ea;
	private String recent_food_shelflife;
	private String recent_ep_order_id;
		
	public String getB4_ep_order_id() {
		return B4_ep_order_id;
	}
	public void setB4_ep_order_id(String b4_ep_order_id) {
		B4_ep_order_id = b4_ep_order_id;
	}
	public String getRecent_ep_order_id() {
		return recent_ep_order_id;
	}
	public void setRecent_ep_order_id(String recent_ep_order_id) {
		this.recent_ep_order_id = recent_ep_order_id;
	}
	public String getB4_food_shelflife() {
		return B4_food_shelflife;
	}
	public void setB4_food_shelflife(String b4_food_shelflife) {
		B4_food_shelflife = b4_food_shelflife;
	}
	public String getRecent_food_shelflife() {
		return recent_food_shelflife;
	}
	public void setRecent_food_shelflife(String recent_food_shelflife) {
		this.recent_food_shelflife = recent_food_shelflife;
	}
	public String getFood_id() {
		return food_id;
	}
	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public String getEp_id() {
		return ep_id;
	}
	public void setEp_id(String ep_id) {
		this.ep_id = ep_id;
	}
	public String getEp_name() {
		return ep_name;
	}
	public void setEp_name(String ep_name) {
		this.ep_name = ep_name;
	}
	public String getB4_or_date() {
		return B4_or_date;
	}
	public void setB4_or_date(String b4_or_date) {
		B4_or_date = b4_or_date;
	}
	public String getB4_or_wh_date() {
		return B4_or_wh_date;
	}
	public void setB4_or_wh_date(String b4_or_wh_date) {
		B4_or_wh_date = b4_or_wh_date;
	}
	public int getB4_or_wh_ea() {
		return B4_or_wh_ea;
	}
	public void setB4_or_wh_ea(int b4_or_wh_ea) {
		B4_or_wh_ea = b4_or_wh_ea;
	}
	public String getRecent_or_date() {
		return recent_or_date;
	}
	public void setRecent_or_date(String recent_or_date) {
		this.recent_or_date = recent_or_date;
	}
	public String getRecent_or_wh_date() {
		return recent_or_wh_date;
	}
	public void setRecent_or_wh_date(String recent_or_wh_date) {
		this.recent_or_wh_date = recent_or_wh_date;
	}
	public int getRecent_or_wh_ea() {
		return recent_or_wh_ea;
	}
	public void setRecent_or_wh_ea(int recent_or_wh_ea) {
		this.recent_or_wh_ea = recent_or_wh_ea;
	}
	
	
}
