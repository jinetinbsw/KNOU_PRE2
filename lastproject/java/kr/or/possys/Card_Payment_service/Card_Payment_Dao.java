package kr.or.possys.Card_Payment_service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.Cancel_Payment_service.Payment_Cancel;
import kr.or.possys.Payment_service.Payment;

@Repository
public class Card_Payment_Dao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//payment_card card�ߺ����� Ȯ��
	public int check_cpid(String card_id){
		System.out.println("check_cpid");
		System.out.println(card_id);
		
		return sqlSessionTemplate.selectOne("kr.or.possys.Card_Payment_service.Card_Payment_Mapper.check_cpid",card_id);
	}
	
	 //payment_cancel_search �˻� �� ��û
    public int CPSlist(String select, String keyWord){
    	System.out.println("CPSlist");
    	System.out.println(select);
    	System.out.println(keyWord);
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("select", select);
    	map.put("keyWord", keyWord);
    	return sqlSessionTemplate.selectOne("kr.or.possys.Card_Payment_service.Card_Payment_Mapper.CPSlist",map);
    }

    //payment �˻���û
	public List<Card_Payment> CPSsearch(String select,String keyWord, int currentPage, int pagePerRow){
		System.out.println("CPSsearch");
		System.out.println(select);
		System.out.println(keyWord);
		System.out.println(currentPage);
		System.out.println(pagePerRow);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("select", select);
		map.put("keyWord", keyWord);
		map.put("beginRow", (currentPage-1)*pagePerRow);
		map.put("pagePerRow", pagePerRow);
		System.out.println(map.get("select"));
		System.out.println(map.get("keyWord"));
		System.out.println(map.get("beginRow"));
		System.out.println(map.get("pagePerRow"));
		
		//selectOne�� �ƴ� selectList �޼��尡 ����Ǿ�� �ϴ� ȭ���̶� �� �Ѿ����.
		//����Ÿ���� ����Ʈ�ε� ���� ������ selectList�� �ƴ϶� �� ���ڵ��� ���� �޴� selectOne���� �ϰ� �־�����..
		return sqlSessionTemplate.selectList("kr.or.possys.Card_Payment_service.Card_Payment_Mapper.CPSsearch",map);
	}
	    
		public int deleteCard(String payment_id) {
			System.out.println("deleteCard");
			System.out.println(payment_id);
	        Card_Payment card = new Card_Payment();
	        card.setPayment_id(payment_id);
			return sqlSessionTemplate.delete("kr.or.possys.Card_Payment_service.Card_Payment_Mapper.deleteCard", card);
		}
	
	    public Card_Payment getCardPayment(String card_id) {
	    	System.out.println("getCardPayment");
	        return sqlSessionTemplate.selectOne("kr.or.possys.Card_Payment_service.Card_Payment_Mapper.getCardPayment", card_id);
	        
	    }
	 
	    public List<Card_Payment> getCardPaymentList(int currentPage, int pagePerRow) {
	    	System.out.println("getCardPaymentList");
	        Map<String, Integer> map = new HashMap<String, Integer>();
	        map.put("beginRow", (currentPage-1)*pagePerRow);
	        map.put("pagePerRow", pagePerRow);
	        System.out.println(map.get("beginRow"));
	        System.out.println(map.get("pagePerRow"));
	        
	        return sqlSessionTemplate.selectList("kr.or.possys.Card_Payment_service.Card_Payment_Mapper.getCardPaymentList", map);
	    }
	    
	    public int getCardPaymentCount() {
	        return sqlSessionTemplate.selectOne("kr.or.possys.Card_Payment_service.Card_Payment_Mapper.getCardPaymentCount");
	    }
	 
	    public int insertCardPayment(Card_Payment card_payment) {
	        return sqlSessionTemplate.insert("kr.or.possys.Card_Payment_service.Card_Payment_Mapper.insertCardPayment", card_payment);
	    }
}
