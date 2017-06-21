package kr.or.possys.Card_Payment_service;

public class Card_Payment {
	private String card_id;
	private String payment_id;
	private String card_app;
	private String card_detail;
	private String card_date;
	private String card_company;
	private int card_total;
	private int card_price;
	private int card_tax;
	
	public String getCard_id() {
		return card_id;
	}
	public void setCard_id(String card_id) {
		this.card_id = card_id;
	}
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
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
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Card [ card_id = " + card_id + ", payment_id = " + payment_id + 
				", card_app = " + card_app + " , card_detail= " + card_detail + 
				", card_date=" + card_date + ", card_company= " + card_company + 
				", card_total= " + card_total + ", card_price= " + card_price + 
				", card_tax= " + card_tax + "]";
	}
	
	
}
