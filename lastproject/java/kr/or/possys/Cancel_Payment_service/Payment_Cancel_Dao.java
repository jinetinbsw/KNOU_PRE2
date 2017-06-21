package kr.or.possys.Cancel_Payment_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.Payment_service.Payment;

@Repository
public class Payment_Cancel_Dao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// update, delete�� �ʿ�ÿ� �����Ѵ�.
	
	
	// payment�� payment_cancel ����
			public int PaymentCancel(Payment_Cancel payment_cancel) {
		    	System.out.println("Payment_Cancel");
		        return sqlSessionTemplate.insert("kr.or.possys.Cancel_Payment_service.Payment_Cancel_Mapper.PaymentCancel", payment_cancel);
		    }
	
	
	// payment_cancel ������Ҿ��̵� �ߺ� üũ
	public int check_pcid(String payment_cancel_id){
		System.out.println("check_pcid");
		System.out.println(payment_cancel_id);
		
		return sqlSessionTemplate.selectOne("kr.or.possys.Cancel_Payment_service.Payment_Cancel_Mapper.check_pcid",payment_cancel_id);
	}
	
	 //payment_cancel_search �˻� �� ��û
    public int paymentCSRlist(String select, String keyWord){
    	System.out.println("paymentCSRlist");
    	System.out.println(select);
    	System.out.println(keyWord);
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("select", select);
    	map.put("keyWord", keyWord);
    	return sqlSessionTemplate.selectOne("kr.or.possys.Cancel_Payment_service.Payment_Cancel_Mapper.paymentCSRlist",map);
    }

    //payment �˻���û
	public List<Payment_Cancel> paymentCSRsearch(String select,String keyWord, int currentPage, int pagePerRow){
		System.out.println("paymentCSRsearch");
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
		return sqlSessionTemplate.selectList("kr.or.possys.Cancel_Payment_service.Payment_Cancel_Mapper.paymentCSRsearch",map);
	}
	
	public Payment_Cancel getPaymentCancel(String payment_cancel_id) {
        return sqlSessionTemplate.selectOne("kr.or.possys.Cancel_Payment_service.Payment_Cancel_Mapper.getPaymentCancel", payment_cancel_id);
        
    }
 
    public List<Payment_Cancel> getPaymentCancelList(int currentPage, int pagePerRow) {
        System.out.println("getPaymentCancelList");
    	Map<String, Integer> map = new HashMap<String, Integer>();
    	System.out.println(map);
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        System.out.println(map.get("beginRow"));
        System.out.println(map.get("pagePerRow"));
        
        return sqlSessionTemplate.selectList("kr.or.possys.Cancel_Payment_service.Payment_Cancel_Mapper.getPaymentCancelList", map);
    }
    
    public int getPaymentCancelCount() {
    	System.out.println("getPaymentCancelCount");
        return sqlSessionTemplate.selectOne("kr.or.possys.Cancel_Payment_service.Payment_Cancel_Mapper.getPaymentCancelCount");
    }
 
    public int insertPaymentCancel(Payment_Cancel payment_cancel) {
    	System.out.println(payment_cancel);
    	System.out.println("insertPaymentCancel");
        return sqlSessionTemplate.insert("kr.or.possys.Cancel_Payment_service.Payment_Cancel_Mapper.insertPaymentCancel", payment_cancel);
    }
}
