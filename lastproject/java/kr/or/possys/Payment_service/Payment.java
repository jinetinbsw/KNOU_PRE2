package kr.or.possys.Payment_service;

public class Payment {

	private String payment_id;
	private String table_order_id;
	private String member_phone;
	private int payment_total;
	private int payment_pay;
	private int payment_addmileage;
	private int payment_usemileage;
	private String payment_date;
	private String payment_cate;
	private String payment_state;
	
	/*private String card_id;
	//private String payment_id;
	private String card_app;
	private String card_detail;
	private String card_date;
	private String card_company;
	private int card_total;
	private int card_price;
	private int card_tax;*/
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
	public int getPayment_total() {
		return payment_total;
	}
	public void setPayment_total(int payment_total) {
		this.payment_total = payment_total;
	}
	public int getPayment_pay() {
		return payment_pay;
	}
	public void setPayment_pay(int payment_pay) {
		this.payment_pay = payment_pay;
	}
	public int getPayment_addmileage() {
		return payment_addmileage;
	}
	public void setPayment_addmileage(int payment_addmileage) {
		this.payment_addmileage = payment_addmileage;
	}
	public int getPayment_usemileage() {
		return payment_usemileage;
	}
	public void setPayment_usemileage(int payment_usemileage) {
		this.payment_usemileage = payment_usemileage;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public String getPayment_cate() {
		return payment_cate;
	}
	public void setPayment_cate(String payment_cate) {
		this.payment_cate = payment_cate;
	}
	public String getPayment_state() {
		return payment_state;
	}
	public void setPayment_state(String payment_state) {
		this.payment_state = payment_state;
	}
	/*public String getCard_id() {
		return card_id;
	}
	public void setCard_id(String card_id) {
		this.card_id = card_id;
	}
	public String getCard_app() {
		return card_app;
	}
	public void setCard_app(String card_app) {
		this.card_app = card_app;
	}
	public String getCard_detail() {
		return card_detail;
	}
	public void setCard_detail(String card_detail) {
		this.card_detail = card_detail;
	}
	public String getCard_date() {
		return card_date;
	}
	public void setCard_date(String card_date) {
		this.card_date = card_date;
	}
	public String getCard_company() {
		return card_company;
	}
	public void setCard_company(String card_company) {
		this.card_company = card_company;
	}
	public int getCard_total() {
		return card_total;
	}
	public void setCard_total(int card_total) {
		this.card_total = card_total;
	}
	public int getCard_price() {
		return card_price;
	}
	public void setCard_price(int card_price) {
		this.card_price = card_price;
	}
	public int getCard_tax() {
		return card_tax;
	}
	public void setCard_tax(int card_tax) {
		this.card_tax = card_tax;
	}*/
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Payment [payment_id=" + payment_id + ", table_order_id=" + table_order_id + ", member_phone=" + member_phone
				+ ", payment_total=" + payment_total + ", payment_pay=" + payment_pay + ", payment_addmileage=" + payment_addmileage
				+ ", payment_usemileage=" + payment_usemileage + ", payment_date=" + payment_date + ", payment_cate=" + payment_cate
				+ ", payment_state=" + payment_state +"]";
				
	}
	
	
}
