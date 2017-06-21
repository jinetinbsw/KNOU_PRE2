package kr.or.possys.Member_sevice;

public class Member {
	String p_member_phone;
	
	String member_phone;
	String member_name;
	int member_point;
	String member_sign;
	String member_join;
	String member_email;
	
	int sum_total;
	
	
	
	public String getP_member_phone() {
		return p_member_phone;
	}
	public void setP_member_phone(String p_member_phone) {
		this.p_member_phone = p_member_phone;
	}
	public int getSum_total() {
		return sum_total;
	}
	public void setSum_total(int sum_total) {
		this.sum_total = sum_total;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getMember_point() {
		return member_point;
	}
	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}
	public String getMember_sign() {
		return member_sign;
	}
	public void setMember_sign(String member_sign) {
		this.member_sign = member_sign;
	}
	public String getMember_join() {
		return member_join;
	}
	public void setMember_join(String member_join) {
		this.member_join = member_join;
	}
}
