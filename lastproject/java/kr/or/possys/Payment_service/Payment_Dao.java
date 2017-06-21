package kr.or.possys.Payment_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.Cancel_Payment_service.Payment_Cancel;
import kr.or.possys.Member_sevice.Member;
import kr.or.possys.Order_service.Order;

@Repository
public class Payment_Dao {
	// Payment���̺� �°Բ� DAO ���� �����ϱ�.
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/*public int updatePayment(Payment Payment) {
        return sqlSessionTemplate.update("kr.or.possys.Payment_service.Payment_Mapper.updatePayment", payment_id);
    }*/
	
	public int getToid(String table_order_id){
		System.out.println("insertPayment_bringToid");
		System.out.println(table_order_id);
		
		return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.checkToid", table_order_id);
	}
	
	//�ֹ��󼼸������������ ������������ ���̺��ֹ���ȣ�� ���� ������ �Ѿ���� �ϴ� ������ �Ѵ�.
	public String getTableorderid(String table_order_id){
		System.out.println("Payment_getTableorderid");
		System.out.println(table_order_id);
		
		return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.bringToid", table_order_id);
	}
    
	//payment_cancel���̺�� payment���̺� ����
	public int insertPaymentCancel(String payment_id){
		System.out.println("insertPaymentCancel");
		System.out.println(payment_id);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("payment_id", payment_id);
		System.out.println(map);
		
		return sqlSessionTemplate.insert("kr.or.possys.Payment_service.Payment_Mapper.insertPaymentCancel",map);		
	}
	
	//�Ѱ����ݾ����� ��������
	public int bringOrderList(String table_order_id){
		System.out.println("bringOrderList");
		System.out.println(table_order_id);
		Map<String, Object> map = new HashMap<String, Object>();
		Order order = new Order();
		System.out.println(map);
		System.out.println(order);
    	map.put("table_order_id", table_order_id);
    	System.out.println(map);
		return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.bringOrderList",table_order_id);
	}
	
	//�Ѹ��ϸ��� ��������
		public int bringMemberList(String member_phone){
			System.out.println("bringMemberList");
			System.out.println(member_phone);
			Map<String, Object> map = new HashMap<String, Object>();
			Member member = new Member();
			System.out.println(map);
			System.out.println(member);
	    	map.put("member_phone", member_phone);
	    	System.out.println(map);
			return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.bringMemberList",member_phone);
		}
	//���� ������������ ���ϸ����� �����ͼ� ȸ�� ���� ���ϸ������� �ش� ���ϸ�����ŭ�� �����ؼ� �������ѳ���
	//�ֹ����̺��� �ֹ����°� t�� ���� f�� �������ѳ���
		
		
	//������ϻ����� �ռ��� ���� �������°��� ��ҷ� �������ִ� ���
	public int PaymentUpdate(String payment_id){
		System.out.println("PaymentUpdate");
		System.out.println(payment_id);
		Payment payment = new Payment();
		payment.setPayment_id(payment_id);
		return sqlSessionTemplate.update("kr.or.possys.Payment_service.Payment_Mapper.paymentUpdate", payment);
	}
		
	//������ϻ������
    public int deletePayment(String payment_id) {
    	System.out.println("deletePayment");
    	System.out.println(payment_id);
        Payment Payment = new Payment();
        Payment.setPayment_id(payment_id);
        return sqlSessionTemplate.delete("kr.or.possys.Payment_service.Payment_Mapper.deletePayment", Payment);
    }
	
	// payment�� payment_cancel ����
	/*	public int PaymentCancel(Payment payment) {
	    	System.out.println("Payment_Cancel");
	        return sqlSessionTemplate.insert("kr.or.possys.Payment_service.Payment_Mapper.PaymentCancel", payment);
	    }*/
	
	//payment ���� ���̵� �ߺ� üũ
	public int check_pid(String payment_id) {
		System.out.println("check_pid");
		System.out.println(payment_id);
		
		return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.check_pid", payment_id);
		
	}
	
	//Payment ���̺��ֹ����̵� �ߺ�üũ
	public int checkToid(String table_order_id){
		System.out.println("checkToid");
		System.out.println(table_order_id);
		
		return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.checkToid", table_order_id);
	}
	
	//Payment ȸ����ȭ��ȣ �ߺ�üũ
		public int checkPMPhone(String member_phone){
			System.out.println("checkPMPhone");
			System.out.println(member_phone);
			
			return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.checkPMPhone", member_phone);
		}
	
	//Payment ������Ʈ(�����Ϸ�ó�������߿� ����Ȯ�ο���(order_detail_end) F->T ����
		public int updatePayment(String table_order_id){
			System.out.println("updatePayment");
			System.out.println(table_order_id);
			return sqlSessionTemplate.update("kr.or.possys.Payment_service.Payment_Mapper.updatePayment",table_order_id);
		}
		
	//�����Ϸ�ó���Ŀ� ȸ���������ϸ����� ���ϸ��� ����� ��ŭ �������ִ� ����
		public int subtractMileage(Payment payment){
			System.out.println("subtractMileage");
			System.out.println(payment);
			String table_order_id = payment.getTable_order_id();
			String member_phone = payment.getMember_phone();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("table_order_id", table_order_id);
			map.put("member_phone", member_phone);
			System.out.println(map);
			return sqlSessionTemplate.update("kr.or.possys.Payment_service.Payment_Mapper.subtractMileage",map);
		}
		
	//�����Ϸ�ó���Ŀ� �����Ѹ��ϸ����� �����и�ŭ �������ִ� ����
		public int addMileage(Payment payment){
			System.out.println("addMileage");
			System.out.println(payment);
			String table_order_id = payment.getTable_order_id();
			String member_phone = payment.getMember_phone();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("table_order_id", table_order_id);
			map.put("member_phone", member_phone);
			System.out.println(map);
			return sqlSessionTemplate.update("kr.or.possys.Payment_service.Payment_Mapper.addMileage",map);
		}
		
    //payment �˻� �� ��û
    public int paymentSRlist(String select, String keyWord){
    	System.out.println("paymentSRlist");
    	System.out.println(select);
    	System.out.println(keyWord);
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("select", select);
    	map.put("keyWord", keyWord);
    	return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.paymentSRlist",map);
    }

    //payment �˻���û
	public List<Payment> paymentSRsearch(String select,String keyWord, int currentPage, int pagePerRow){
		System.out.println("paymentSRsearch");
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
		return sqlSessionTemplate.selectList("kr.or.possys.Payment_service.Payment_Mapper.paymentSRsearch",map);
	}
	
	
	//payment ����Ʈ���� view�� ���� ���ؼ� �⺻Ű �� ��û
    public Payment getPayment(String payment_id) {
    	System.out.println("getPayment");
        return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.getPayment", payment_id);
        
    }
 
    //payment ��Ͽ�û
    public List<Payment> getPaymentList(int currentPage, int pagePerRow) {
    	System.out.println("getPaymentList");
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        System.out.println(map.get("beginRow"));
        System.out.println(map.get("pagePerRow"));
        
        return sqlSessionTemplate.selectList("kr.or.possys.Payment_service.Payment_Mapper.getPaymentList", map);
    }
    
    //payment ��� ���� ī��Ʈ
    public int getPaymentCount() {
    	System.out.println("getPaymentCount");
        return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.getPaymentCount");
    }
    
    //payment �Է¿�û
    public int insertPayment(Payment Payment) {
        return sqlSessionTemplate.insert("kr.or.possys.Payment_service.Payment_Mapper.insertPayment", Payment);
    }

}