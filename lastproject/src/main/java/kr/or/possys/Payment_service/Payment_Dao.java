package kr.or.possys.Payment_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Payment_Dao {
	// Payment테이블에 맞게끔 DAO 새로 설정하기.
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/*public int updatePayment(Payment Payment) {
        return sqlSessionTemplate.update("kr.or.possys.Payment_service.Payment_Mapper.updatePayment", payment_id);
    }*/
    
    /*public int deletePayment(String payment_id, String payment_pw) {
        Payment Payment = new Payment();
        Payment.setPayment_id(payment_id);
        Payment.setPayment_pw(payment_pw);
        return sqlSessionTemplate.delete("kr.or.possys.Payment_service.Payment_Mapper.deletePayment", Payment);
    }*/
    
	public List<Payment> paymentSearch(String select, String keyWord, int currentPage, int pagePerRow){
		System.out.println("paymentSearch");
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
		
		
		return sqlSessionTemplate.selectList("kr.or.possys.payment_service.Payment_Mapper.paymentSearch",map);
	}
	
	public int paymentSRlist(String select,String keyWord){
		System.out.println("paymentSRlist");
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("select", select);
		map.put("keyWord", keyWord);
		System.out.println(map.get("select"));
		System.out.println(map.get("keyWord"));
		
		return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.paymentSRlist",map);
	}
	
    public Payment getPayment(String payment_id) {
    	System.out.println("getPayment");
        return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.getPayment", payment_id);
        
    }
 
    public List<Payment> getPaymentList(int currentPage, int pagePerRow) {
    	System.out.println("getPaymentList");
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        System.out.println(map.get("beginRow"));
        System.out.println(map.get("pagePerRow"));
        
        return sqlSessionTemplate.selectList("kr.or.possys.Payment_service.Payment_Mapper.getPaymentList", map);
    }
    
    public int getPaymentCount() {
    	System.out.println("getPaymentCount");
        return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.getPaymentCount");
    }
 
    public int insertPayment(Payment Payment) {
        return sqlSessionTemplate.insert("kr.or.possys.Payment_service.Payment_Mapper.insertPayment", Payment);
    }

}
