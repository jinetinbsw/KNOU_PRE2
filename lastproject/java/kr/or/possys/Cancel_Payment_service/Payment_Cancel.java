package kr.or.possys.Cancel_Payment_service;

public class Payment_Cancel {
	private String payment_cancel_id;
	private String payment_id;
	private String table_order_id;
	private String member_phone;
	private int payment_cancel_total;
	private int payment_cancel_pay;
	private int payment_cancel_backmileage;
	private int payment_cancel_returnmileage;
	private String payment_cancel_date;
	private String payment_cate;
	//payment_state를 쿼리입력의 기준으로 받기 위한 용도
	private String payment_state;
	
	
	public String getPayment_cancel_id() {
		return payment_cancel_id;
	}
	public void setPayment_cancel_id(String payment_cancel_id) {
		this.payment_cancel_id = payment_cancel_id;
	}
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	public String getTable_order_id() {
		return table_order_id;
	}
	public void setTable_order_id(String table_order_id) {
		this.table_order_id = table_order_id;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public int getPayment_cancel_total() {
		return payment_cancel_total;
	}
	public void setPayment_cancel_total(int payment_cancel_total) {
		this.payment_cancel_total = payment_cancel_total;
	}
	public int getPayment_cancel_pay() {
		return payment_cancel_pay;
	}
	public void setPayment_cancel_pay(int payment_cancel_pay) {
		this.payment_cancel_pay = payment_cancel_pay;
	}
	public int getPayment_cancel_backmileage() {
		return payment_cancel_backmileage;
	}
	public void setPayment_cancel_backmileage(int payment_cancel_backmileage) {
		this.payment_cancel_backmileage = payment_cancel_backmileage;
	}
	public int getPayment_cancel_returnmileage() {
		return payment_cancel_returnmileage;
	}
	public void setPayment_cancel_returnmileage(int payment_cancel_returnmileage) {
		this.payment_cancel_returnmileage = payment_cancel_returnmileage;
	}
	public String getPayment_cancel_date() {
		return payment_cancel_date;
	}
	public void setPayment_cancel_date(String payment_cancel_date) {
		this.payment_cancel_date = payment_cancel_date;
	}
	public String getPayment_cate() {
		return payment_cate;
	}
	public void setPayment_cate(String payment_cate) {
		this.payment_cate = payment_cate;
	}
	
	// payment_state가 취소일 경우 payment테이블에서 payment_state값을 받아오기 위한
	public String getPayment_state() {
		return payment_state;
	}
	public void setPayment_state(String payment_state) {
		this.payment_state = payment_state;
	}
	@Override
	public String toString() {
		
		return "Payment_Cancel [payment_cancel_id= " + payment_cancel_id + ", payment_id= " + payment_id + ", table_order_id= " + table_order_id +
				", member_phone= " + member_phone + ", payment_cancel_total= " + payment_cancel_total + ", payment_cancel_backmileage= " + payment_cancel_backmileage + 
				", payment_cancel_returnmileage= " + payment_cancel_returnmileage + ", payment_cancel_date= " + payment_cancel_date + ", payment_cate= "
				+ payment_cate + ", payment_state= " + payment_state + "]";
	}
	
	
}
