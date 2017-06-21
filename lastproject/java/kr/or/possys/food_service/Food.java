package kr.or.possys.food_service;

import java.util.List;

public class Food {
	private String food_id;
	private String food_name;
	private String food_unit;
	private int food_shelflife;
	private String food_date;
	private String staff_id;
	private List<String> food_list;
			
	
	public List<String> getFood_list() {
		return food_list;
	}
	public void setFood_list(List<String> food_list) {
		this.food_list = food_list;
	}
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
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
//		System.out.println(food_name);
		this.food_name = food_name;
	}
	
	public String getFood_unit() {
		return food_unit;
	}
	public void setFood_unit(String food_unit) {
		this.food_unit = food_unit;
	}
	public int getFood_shelflife() {
		return food_shelflife;
	}
	public void setFood_shelflife(int food_shelflife) {
		this.food_shelflife = food_shelflife;
	}
	public String getFood_date() {
		return food_date;
	}
	public void setFood_date(String food_date) {
		this.food_date = food_date;
	}
	
	
	
}
