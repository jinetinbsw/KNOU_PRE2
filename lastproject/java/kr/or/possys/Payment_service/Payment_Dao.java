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
	// Payment테이블에 맞게끔 DAO 새로 설정하기.
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
	
	//주문상세목록페이지에서 결제페이지로 테이블주문번호의 값을 가지고 넘어오게 하는 역할을 한다.
	public String getTableorderid(String table_order_id){
		System.out.println("Payment_getTableorderid");
		System.out.println(table_order_id);
		
		return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.bringToid", table_order_id);
	}
    
	//payment_cancel테이블과 payment테이블 연결
	public int insertPaymentCancel(String payment_id){
		System.out.println("insertPaymentCancel");
		System.out.println(payment_id);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("payment_id", payment_id);
		System.out.println(map);
		
		return sqlSessionTemplate.insert("kr.or.possys.Payment_service.Payment_Mapper.insertPaymentCancel",map);		
	}
	
	//총결제금액정보 가져오기
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
	
	//총마일리지 가져오기
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
	//또한 결제단위당의 마일리지를 가져와서 회원 적립 마일리지에서 해당 마일리지만큼을 차감해서 원복시켜놓기
	//주문테이블에서 주문상태가 t인 것을 f로 원복시켜놓기
		
		
	//결제목록삭제에 앞서서 먼저 결제상태값을 취소로 변경해주는 기능
	public int PaymentUpdate(String payment_id){
		System.out.println("PaymentUpdate");
		System.out.println(payment_id);
		Payment payment = new Payment();
		payment.setPayment_id(payment_id);
		return sqlSessionTemplate.update("kr.or.possys.Payment_service.Payment_Mapper.paymentUpdate", payment);
	}
		
	//결제목록삭제기능
    public int deletePayment(String payment_id) {
    	System.out.println("deletePayment");
    	System.out.println(payment_id);
        Payment Payment = new Payment();
        Payment.setPayment_id(payment_id);
        return sqlSessionTemplate.delete("kr.or.possys.Payment_service.Payment_Mapper.deletePayment", Payment);
    }
	
	// payment와 payment_cancel 연결
	/*	public int PaymentCancel(Payment payment) {
	    	System.out.println("Payment_Cancel");
	        return sqlSessionTemplate.insert("kr.or.possys.Payment_service.Payment_Mapper.PaymentCancel", payment);
	    }*/
	
	//payment 결제 아이디 중복 체크
	public int check_pid(String payment_id) {
		System.out.println("check_pid");
		System.out.println(payment_id);
		
		return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.check_pid", payment_id);
		
	}
	
	//Payment 테이블주문아이디 중복체크
	public int checkToid(String table_order_id){
		System.out.println("checkToid");
		System.out.println(table_order_id);
		
		return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.checkToid", table_order_id);
	}
	
	//Payment 회원전화번호 중복체크
		public int checkPMPhone(String member_phone){
			System.out.println("checkPMPhone");
			System.out.println(member_phone);
			
			return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.checkPMPhone", member_phone);
		}
	
	//Payment 업데이트(결제완료처리진행중에 결제확인여부(order_detail_end) F->T 교대
		public int updatePayment(String table_order_id){
			System.out.println("updatePayment");
			System.out.println(table_order_id);
			return sqlSessionTemplate.update("kr.or.possys.Payment_service.Payment_Mapper.updatePayment",table_order_id);
		}
		
	//결제완료처리후에 회원보유마일리지를 마일리지 사용한 만큼 차감해주는 역할
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
		
	//결제완료처리후에 적립한마일리지를 적립분만큼 가산해주는 역할
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
		
    //payment 검색 수 요청
    public int paymentSRlist(String select, String keyWord){
    	System.out.println("paymentSRlist");
    	System.out.println(select);
    	System.out.println(keyWord);
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("select", select);
    	map.put("keyWord", keyWord);
    	return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.paymentSRlist",map);
    }

    //payment 검색요청
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
		
		//selectOne이 아닌 selectList 메서드가 실행되어야 일단 화면이라도 잘 넘어가진다.
		//리턴타입이 리스트인데 정작 리턴을 selectList가 아니라 한 레코드의 값만 받는 selectOne으로 하고 있었으니..
		return sqlSessionTemplate.selectList("kr.or.possys.Payment_service.Payment_Mapper.paymentSRsearch",map);
	}
	
	
	//payment 리스트에서 view를 보기 위해서 기본키 값 요청
    public Payment getPayment(String payment_id) {
    	System.out.println("getPayment");
        return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.getPayment", payment_id);
        
    }
 
    //payment 목록요청
    public List<Payment> getPaymentList(int currentPage, int pagePerRow) {
    	System.out.println("getPaymentList");
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        System.out.println(map.get("beginRow"));
        System.out.println(map.get("pagePerRow"));
        
        return sqlSessionTemplate.selectList("kr.or.possys.Payment_service.Payment_Mapper.getPaymentList", map);
    }
    
    //payment 목록 갯수 카운트
    public int getPaymentCount() {
    	System.out.println("getPaymentCount");
        return sqlSessionTemplate.selectOne("kr.or.possys.Payment_service.Payment_Mapper.getPaymentCount");
    }
    
    //payment 입력요청
    public int insertPayment(Payment Payment) {
        return sqlSessionTemplate.insert("kr.or.possys.Payment_service.Payment_Mapper.insertPayment", Payment);
    }

}