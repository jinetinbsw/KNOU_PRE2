package kr.or.possys.Member_sevice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.Cancel_Payment_service.Payment_Cancel;
import kr.or.possys.Order_service.Order;
import kr.or.possys.Payment_service.Payment;
import kr.or.possys.ep_order_food_details_service.Ep_Order;


@Repository
public class Member_Dao {

	@Autowired
	private SqlSessionTemplate Msql;
	
	//월 총 지출금액(발주신청금액)
	public List<Ep_Order> expense_folios(){
		System.out.println("expense_folios 메서드 실행  Member_Dao.java");
		
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.expense_folios");
	}
	
	
	//월 총 판매금액
	public List<Payment> sum_payment(){
		System.out.println("sum_payment 메서드 실행  Member_Dao.java");
		
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.sum_payment");
	}
	
	//개인별 이용 내역
	public List<receipt> receipt_list(String member_phone){
		System.out.println("receipt_list 메서드 실행 Member_Dao.java");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("member_phone", member_phone);
		
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.receipt_list",map );
	}
	//회원가입 처리 메서드
	public int sign_up_action(Member m){
		System.out.println("sign_up_action 실행 Member_Dao.java");
		return Msql.insert("kr.or.possys.Member_sevice.Member_Mapper.sign_up_action", m);
	}
	
	//영수증 출력 메서드
	public List<receipt> receipt(String member_phone,String table_order_id){
		System.out.println("receipt 메서드 실행 확인 Member_Dao.java");
		System.out.println(table_order_id+"<--table_order_id receipt 메서드 실행 확인 Member_Dao.java");
		System.out.println(member_phone+"<--member_phone receipt 메서드 실행 확인 Member_Dao.java");
		if(member_phone==""||member_phone==null){
			System.out.println("회원 핸드폰 번호가 없다.  receipt메서드 Member_Dao.java");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("table_order_id",table_order_id);
			
			return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.no_member_receipt",map);
		}else{
			System.out.println("회원 핸드폰 번호가 있다. receipt메서드 Member_Dao.java ");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("table_order_id",table_order_id);
		map.put("member_phone",member_phone);
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.receipt",map);
		}
		/*return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.receipt",map);*/
	}
	//테이블 자리이동 메서드
	public int table_move(String table_order_id,int table_num){
		System.out.println("table_move 메서드 실행 확인 Member_Dao.java");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("table_order_id", table_order_id);
		map.put("table_num", table_num);
		return Msql.update("kr.or.possys.Member_sevice.Member_Mapper.table_move", map);	
	}
	//오늘 총액 구하는 메서드
	public int today_total(){
		/*System.out.println("today_total 메서드 실행 Member_Dao.java");*/
		return Msql.selectOne("kr.or.possys.Member_sevice.Member_Mapper.today_total");
	}
	
	//현재 사용중인 테이블 구하는 메서드 
	public int f_table_count(){
		/*System.out.println("f_table_count 메서드 실행 Member_Dao.java");	*/
		return Msql.selectOne("kr.or.possys.Member_sevice.Member_Mapper.f_table_count");
	}
	
	//테이블 상태 구하는 메서드 
	public List<Order> table_state(){
		/*System.out.println("table_state 메서드 실행 확인 Member_Dao.java");*/
	return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.table_state");
	}
	//테이블 클릭시 주문내역 확인 메서드
	public List<Order> table_Order_detail(String table_order_num){
		System.out.println("table_Order_detail 메서드 실행 확인 Member_dao.java");
		System.out.println(table_order_num+"<<<<<<<<<<<<");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.table_Order_detail", table_order_num);
		
	}
	
	//매출현황 카드별 조회 메서드(취소)
	public List<Payment_Cancel> C_CDcatePayment(String selbox){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selbox", selbox);
		System.out.println("C_CDcatePayment 메서드 실행 확인 Member_Dao.java");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.C_CDcatePayment", map);
		
	}

	//매출현황 현금 별 조회 메서드(취소)
	public List<Payment_Cancel> C_McatePayment(String selbox){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selbox", selbox);
		System.out.println("C_McatePayment 메서드 실행 확인 Member_Dao.java");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.C_McatePayment", map);
		
	}
	
	//매출현황 조회 메서드(취소)
	public List<Payment_Cancel> C_totalPaymentList(String selbox){
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("selbox", selbox);
	System.out.println("C_totalPaymentList 메서드 실행 확인 Member_Dao.java");
	return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.C_totalPaymentList", map);
	
	}
	
	//매출현황 카드별 조회 메서드
			public List<Payment> CDcatePayment(String selbox){
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("selbox", selbox);
				System.out.println("CDcatePayment 메서드 실행 확인 Member_Dao.java");
				return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.CDcatePayment", map);
				
			}
		
	//매출현황 현금 별 조회 메서드
		public List<Payment> McatePayment(String selbox){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("selbox", selbox);
			System.out.println("McatePayment 메서드 실행 확인 Member_Dao.java");
			return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.McatePayment", map);
			
		}
	
	//매출현황 조회 메서드
	public List<Payment> totalPaymentList(String selbox){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selbox", selbox);
		System.out.println("totalPaymentList 메서드 실행 확인 Member_Dao.java");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.totalPaymentList", map);
		
	}
	
	//입력값이 한글일 경우 실행되는 실시간 회원 조회 메서드
		public List<Member> K_AjaxMemberList(int currentPage, int pagePerRow ,String insert){
			System.out.println("getMemberList 메서드 실행   Member_Dao.java ");
			Map<String, Object> map = new HashMap<String, Object>();
	        map.put("beginRow", (currentPage-1)*pagePerRow);
	        map.put("pagePerRow", pagePerRow);
	        map.put("insert", insert);
	        
	        System.out.println(map.get("insert")+"입력값 AjaxMemberList Member_Dao");
			return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.K_AjaxMemberList", map);
			
		}
	
	
	//입력값이 영어와 숫자일 경우 실행되는 실시간 회원 조회 메서드
	public List<Member> AjaxMemberList(int currentPage, int pagePerRow ,String insert){
		System.out.println("getMemberList 메서드 실행   Member_Dao.java ");
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        map.put("insert", insert);
        
        System.out.println(map.get("insert")+"입력값 AjaxMemberList Member_Dao");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.AjaxMemberList", map);
		
	}
	
	
	//회원 숫자 카운트 메서드
	public int getMemberCount(){
		System.out.println("getMemberCount 메서드 실행   Member_Dao.java ");
		
		return Msql.selectOne("kr.or.possys.Member_sevice.Member_Mapper.getMemberCount");
		}
	//전체회원 조회 메서드
	public List<Member> getMemberList(int currentPage, int pagePerRow){
		System.out.println("getMemberList 메서드 실행   Member_Dao.java ");
		Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.getMemberList", map);
		
	}
	//한명 회원정보 조회 메서드
	public Member getMember(String member_phone){
		System.out.println("getMember 메서드 실행   Member_Dao.java ");
		return Msql.selectOne("kr.or.possys.Member_sevice.Member_Mapper.MselectOne", member_phone);
	}
	//수정처리 메서드
	public int Mupdate(Member m){
		System.out.println("Mupdate 메서드 실행 Member_Dao.java");
		return Msql.update("kr.or.possys.Member_sevice.Member_Mapper.Mupdate",m);
	}
	//삭제처리 메서드
	public int deleteMember(String member_phone){
		System.out.println("deleteMember 메서드 실행 Member_Dao.java");
		
		return Msql.delete("kr.or.possys.Member_sevice.Member_Mapper.deleteMember", member_phone);
		
	}
	//검색처리 메서드(검색후 결과를 배열로 리스트처럼 보여줌)
	public List<Member> searchMember(String selBox,String search,int currentPage,int pagePerRow){
		System.out.println("selectMember 메서드 실행 Member_Dao.java");
		mVo m = new mVo();
		m.setSelBox(selBox);
		m.setSearch(search);
		m.setBeginRow((currentPage-1)*pagePerRow);
		m.setPagePerRow(pagePerRow);
		System.out.println(m.getSelBox()+"<----------------선택한값");
		System.out.println(m.getSearch()+"<----------------선택한값");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.Msearch",m);
	}
	//검색 조건에 맞는 회원수 조회 메서드
		public int getsearchCount(String selBox,String search){
			System.out.println("getsearchCount 메서드 실행   Member_Dao.java ");
			mVo m = new mVo();
			m.setSelBox(selBox);
			m.setSearch(search);
			
			return Msql.selectOne("kr.or.possys.Member_sevice.Member_Mapper.getsearchCount",m);
			}

}
