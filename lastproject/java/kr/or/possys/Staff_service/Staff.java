package kr.or.possys.Staff_service;

public class Staff {
	private String staff_id;
	private String staff_pw;
	private String staff_name;
	private String staff_level;
	private int staff_age;
	private String staff_addr;
	private String staff_gender;
	private String staff_phone;
	private String staff_date;
	private String staff_email;
	
	public String getStaff_email() {
		return staff_email;
	}
	public void setStaff_email(String staff_email) {
		this.staff_email = staff_email;
	}
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public String getStaff_pw() {
		return staff_pw;
	}
	public void setStaff_pw(String staff_pw) {
		this.staff_pw = staff_pw;
	}
	public String getStaff_name() {
		return staff_name;
	}
	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}
	public String getStaff_level() {
		return staff_level;
	}
	public void setStaff_level(String staff_level) {
		this.staff_level = staff_level;
	}
	public int getStaff_age() {
		return staff_age;
	}
	public void setStaff_age(int staff_age) {
		this.staff_age = staff_age;
	}
	public String getStaff_addr() {
		return staff_addr;
	}
	public void setStaff_addr(String staff_addr) {
		this.staff_addr = staff_addr;
	}
	public String getStaff_gender() {
		return staff_gender;
	}
	public void setStaff_gender(String staff_gender) {
		this.staff_gender = staff_gender;
	}
	public String getStaff_phone() {
		return staff_phone;
	}
	public void setStaff_phone(String staff_phone) {
		this.staff_phone = staff_phone;
	}
	public String getStaff_date() {
		return staff_date;
	}
	public void setStaff_date(String staff_date) {
		this.staff_date = staff_date;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Staff [staff_id=" + staff_id + ", staff_pw=" + staff_pw +", staff_name=" + staff_name + ", staff_level=" + staff_level
				+ ", staff_age=" + staff_age + ", staff_addr=" + staff_addr +", staff_gender=" + staff_gender + ", staff_phone=" + staff_phone
				+ ", staff_date=" + staff_date + "]";
	}
	
	

}
