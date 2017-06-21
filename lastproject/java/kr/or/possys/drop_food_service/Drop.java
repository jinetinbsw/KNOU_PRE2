package kr.or.possys.drop_food_service;

public class Drop {
	private String drop_id;
	private String food_id;
	private String drop_date;
	// 폐기 수량
	private int drop_ea;
	private String drop_reason;
	private String staff_id;
	private String ep_order_id;
	//남은 현재수량 총수
	private int food_nowquantity;
	//상품명
	private String food_name;
	private int cha_drop_ea;
	
	
	public int getFood_nowquantity() {
		return food_nowquantity;
	}
	public void setFood_nowquantity(int food_nowquantity) {
		this.food_nowquantity = food_nowquantity;
	}
	public int getCha_drop_ea() {
		return cha_drop_ea;
	}
	public void setCha_drop_ea(int cha_drop_ea) {
		this.cha_drop_ea = cha_drop_ea;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	
	public String getDrop_id() {
		return drop_id;
	}
	public void setDrop_id(String drop_id) {
		this.drop_id = drop_id;
	}
	public String getFood_id() {
		return food_id;
	}
	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}
	public String getDrop_date() {
		return drop_date;
	}
	public void setDrop_date(String drop_date) {
		this.drop_date = drop_date;
	}
	public int getDrop_ea() {
		return drop_ea;
	}
	public void setDrop_ea(int drop_ea) {
		this.drop_ea = drop_ea;
	}
	public String getDrop_reason() {
		return drop_reason;
	}
	public void setDrop_reason(String drop_reason) {
		this.drop_reason = drop_reason;
	}
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public String getEp_order_id() {
		return ep_order_id;
	}
	public void setEp_order_id(String ep_order_id) {
		this.ep_order_id = ep_order_id;
	}
	
}
	
	
	