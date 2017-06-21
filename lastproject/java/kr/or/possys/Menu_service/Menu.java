package kr.or.possys.Menu_service;

import org.springframework.web.multipart.MultipartFile;

public class Menu {
	private String menu_id;
	private String menu_name;
	private String menu_cate;
	private int menu_price;
	private int menu_sprice;
	private String menu_sale;
	private int menu_kcal;
	private String food_id;
	private String menu_count;
	
	private String orgname;
	private String newname;
	
	private MultipartFile order_file;
	private String order_max_per;
	
	

	

	public String getMenu_count() {
		return menu_count;
	}
	public void setMneu_count(String menu_count) {
		this.menu_count = menu_count;
	}
	public String getOrder_max_per() {
		return order_max_per;
	}
	public void setOrder_max_per(String order_max_per) {
		this.order_max_per = order_max_per;

	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getNewname() {
		return newname;
	}
	public void setNewname(String newname) {
		this.newname = newname;
	}
	public MultipartFile getOrder_file() {
		return order_file;
	}
	public void setOrder_file(MultipartFile order_file) {
		this.order_file = order_file;
	}
	public String getFood_id() {
		return food_id;
	}
	public void setFood_id(String food_id) {
		this.food_id = food_id;
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
	public String getMenu_cate() {
		return menu_cate;
	}
	public void setMenu_cate(String menu_cate) {
		this.menu_cate = menu_cate;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public int getMenu_sprice() {
		return menu_sprice;
	}
	public void setMenu_sprice(int menu_sprice) {
		this.menu_sprice = menu_sprice;
	}
	public String getMenu_sale() {
		return menu_sale;
	}
	public void setMenu_sale(String menu_sale) {
		this.menu_sale = menu_sale;
	}
	public int getMenu_kcal() {
		return menu_kcal;
	}
	public void setMenu_kcal(int menu_kcal) {
		this.menu_kcal = menu_kcal;
	}

}
