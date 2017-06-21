package kr.or.possys.ep_order_food_details_service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class Ep_Order_Dao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 입고 수정 - 입고취소 액션
		public void aj_ep_wh_cancel(String ep_order_id){
			System.out.println(ep_order_id+"<=== ep_order_id - 16_AJAX Ep_Manage_Dao -aj_ep_wh_cancel실행");
			sqlSessionTemplate.update("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_ep_wh_cancel",ep_order_id);
		}
	
	// 상세보기 폼 화면 table 관련 - ajax
		public Food_Present_Sangse_VO aj_sangse_table(String food_id){
			System.out.println(food_id+"<== food_id - 15_AJAX Ep_Manage_Dao -aj_sangse_table()실행");
			Ep_Order ep_o = new Ep_Order();
			Food_Present_Sangse_VO wh = new Food_Present_Sangse_VO();
			// 최근 정보
			ep_o = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_sangse_rctable",food_id);
			if(ep_o == null){ // 입고된 값 없으면 null로 json 못받음.
//				System.out.println("입고된값 없음");
				wh.setRecent_ep_order_id("-");
				wh.setRecent_or_date("-"); // 입고된 발주일자
				wh.setRecent_or_wh_date("-"); // 입고된 입고일자
				wh.setRecent_or_wh_ea(0); // 현재 입고수량 
				wh.setRecent_food_shelflife("-"); // 입고된 입고 유통기한
			}else{
					wh.setRecent_ep_order_id(ep_o.getEp_order_id()); //최근 발주id
					wh.setRecent_or_date(ep_o.getEp_order_date()); // 최근발주일자
					wh.setRecent_or_wh_date(ep_o.getEp_order_wh_date()); // 최근입고일자
					wh.setRecent_or_wh_ea(ep_o.getFood_nowquantity()); // 현재 최근입고수량
					wh.setRecent_food_shelflife(ep_o.getEp_order_food_shelflife()); // 최근 입고 유통기한
				}
			// 이전 정보
			ep_o = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_sangse_b4table",food_id);
			if(ep_o == null){ // 이전값 없으면 null로 json 못받음.
//				System.out.println("이전값 없음");
				wh.setB4_ep_order_id("-"); //이전 발주 id
				wh.setB4_or_date("-"); // 이전발주일자
				wh.setB4_or_wh_date("-"); // 이전입고일자
				wh.setB4_or_wh_ea(0); // 현재이전입고수량 
				wh.setB4_food_shelflife("-"); // 이전 입고 유통기한				
			}else{
					wh.setB4_ep_order_id(ep_o.getEp_order_id()); //이전 발주 id
					wh.setB4_or_date(ep_o.getEp_order_date()); // 이전발주일자
					wh.setB4_or_wh_date(ep_o.getEp_order_wh_date()); // 이전입고일자
					wh.setB4_or_wh_ea(ep_o.getFood_nowquantity()); // 현재이전입고수량
					wh.setB4_food_shelflife(ep_o.getEp_order_food_shelflife()); // 이전 입고 유통기한
				}
			return wh;
		}
	// 상세보기 폼 화면 span 관련 - ajax
	public Food_Present_Sangse_VO aj_sangse_span(String food_id){
		System.out.println(food_id+"<== food_id - 14_AJAX Ep_Manage_Dao -aj_sangse_span()실행");
		Food_Present_Sangse_VO food = new Food_Present_Sangse_VO(); // 식자재 정보
		Food_Present_Sangse_VO ep = new Food_Present_Sangse_VO(); // 업체 정보
		food = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_sangse_Fspan",food_id);
		int count = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_sangse_Ecount",food_id);
		if(count == 0){
			food.setEp_id("미등록");
			food.setEp_name("미등록");
		}else{
			ep = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_sangse_Espan",food_id);
			food.setEp_id(ep.getEp_id());
			food.setEp_name(ep.getEp_name());
		}
//		System.out.println(food.getFood_id());
//		System.out.println(food.getFood_name());
//		System.out.println(food.getEp_id());
//		System.out.println(food.getEp_name());
		return food;		
	}
	
	// 상세보기에서 전체발주취소 
	public void aj_sangse_cancel(String ep_order_id){
		System.out.println(ep_order_id+"<== ep_order_id - 13_AJAX Ep_Manage_Dao -aj_sangse_cancel()실행");
//		sqlSessionTemplate.update("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_sangse_cancel",ep_order_id);
		sqlSessionTemplate.delete("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_sangse_cancel",ep_order_id);
	}
	
	// 발주주문 목록에서 상세보기 - 발주 재등록시 update
	public void ep_order_update(Ep_Order ep_o){
		System.out.println(ep_o+"<------AJAX Ep_Manage_Dao - ep_order_update()실행");
		System.out.println(ep_o.getEp_order_id()+"<<<<ep_order_id");
		sqlSessionTemplate.update("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_order_update",ep_o);
	}
	
	//AJAX 발주 주문목록 상세보기 폼에서 해당 식재 발주 취소시 DB 의 해당 발주주문이 삭제처리
	public void aj_select_del(String ep_order_id, String food_id){
			System.out.println(ep_order_id+"<------12_AJAX Ep_Manage_Dao - select_del()실행");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ep_order_id", ep_order_id);
			map.put("food_id", food_id);
//			List<String> a = sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper",map);
//			for(String b : a){
//				if(b.equals("default")){
//					sqlSessionTemplate.delete("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_select_delA",map);
//				}
//			}
//			sqlSessionTemplate.update("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_select_del",map);
			sqlSessionTemplate.delete("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_select_del",map);
		}
		
	//AJAX 발주등록시 식재자가 업체의 등록이 되었는지 확인
	public int aj_ep_chck(String food_id){
			System.out.println(food_id+"<------11_AJAX Ep_Manage_Dao - ep_chck()실행");
			return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_ep_chck",food_id);		
		}
	
	// 입고 목록 요청
	public List<Ep_Order> ep_wh_list(int currentPage, int pageRow){
		System.out.println("10_ep_wh_list 실행 - Ep_Order_Dao.java");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", (currentPage-1)*pageRow);
		map.put("pageRow", pageRow);
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_wh_list",map);
		
	}
	
	// 입고목록  갯수 요청
	public int ep_wh_conunt(){
		System.out.println("09_ep_o_wh_add 실행 - Ep_Order_Dao.java");
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_wh_conunt");		
	}
	
	// 입고등록 액션 (update 넣어줌)
	public void ep_o_wh_update(List<Ep_Order> list){
		System.out.println("08_ep_o_wh_add 실행 - Ep_Order_Dao.java");
		for(Ep_Order ep_o : list){ 
			System.out.println(ep_o+"<< 담긴 Dto 주소값");
//		for(int i=0; i<list.size(); i++){  // 다른방법
//			System.out.println(list.get(i)+"<<< "+i+"번째 주소값");
			sqlSessionTemplate.update("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_o_wh_update",ep_o);
		}
	}
	
	// ajax// 발주 주문목록에서 비동기 입고등록 폼
	public List<Ep_Order> js_ep_wh_list(String ep_order_id){
		System.out.println("AJAX_01_ js_ep_wh_list 실행 - Ep_Order_Dao.java");	
		System.out.println(ep_order_id+"<=== ep_order_id - Ep_Order_Dao.java");
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.js_ep_wh_list",ep_order_id);
	}
	
	// 발주 주문 목록 요청 중복없이
	public List<Ep_Order> ep_o_list(){
		System.out.println("07_ep_o_list 실행 - Ep_Order_Dao.java");
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_o_list");
	}
	// 발주 주문 목록 중복 없는 count 쿼리
	public int ep_o_count(){
		System.out.println("06_ep_o_count 실행 - Ep_Order_Dao.java");		
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_o_count");
	}
	
	// 발주등록 default 값 확인 update 쿼리  문제가 많아서 삭제함........
//	public void default_up(Ep_Order ep_o){
//		System.out.println("_05_01_default_up실행 - Ep_Order_Dao.java");
////		System.out.println(ep_o.getEp_id());
////		System.out.println(ep_o.getEp_order_ea());
////		System.out.println(ep_o.getFood_id());
//		String ep_Onum = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_Onum");
//		System.out.println(ep_Onum+"<=====ep_Onum");
//		if(ep_Onum.equals("default")){ // 테이블 row 중 default보다 큰값이 있으면 else문으로 이동
//			ep_o.setEp_order_id("eo0001");
//			sqlSessionTemplate.update("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.default_up",ep_o);
//		}else{
//			int s_ep_Onem = Integer.parseInt(ep_Onum.substring(2,6))+1;
//			String result_id = "eo"+String.format("%04d", s_ep_Onem);
//			System.out.println(result_id+"<<==result_id");
//			ep_o.setEp_order_id(result_id);
//			sqlSessionTemplate.update("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.default_up",ep_o);
//		}???????????????????????????????????????
//		}
	
	// 발주등록시 default 확인하기 위한 select one
	public String ep_default(){
		System.out.println("_05_ep_default실행 - Ep_Order_Dao.java");		
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_default");
	}
	// 발주등록시 해당 row가 default 인지 확인 // 문제가 많이 생겨서 없앴슴..
//	public String s_de(String food_id, String ep_id){
//		System.out.println("_05_02_s_de실행 - Ep_Order_Dao.java");
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("food_id", food_id);
//		map.put("ep_id", ep_id);
//		System.out.println(map.get("food_id")+"<===s_de - dao");
//		System.out.println(map.get("ep_id")+"<===s_de - dao");
//		
//		String s_de = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.s_de",map);
//		return s_de;
//	}
	
	// 발주등록시 default 값이 아니면 최대값을 찾아서 +1 시킨다.
	public String result_id(){
		System.out.println("05_result_id실행 - Ep_Order_Dao.java");
		String ep_Onum = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_Onum");
		int s_ep_Onem = Integer.parseInt(ep_Onum.substring(2,6))+1;
		String result_id = "eo"+String.format("%04d", s_ep_Onem);
//		ep_o.setEp_order_id(result_id);
//		sqlSessionTemplate.insert("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_oinsert",ep_o);
		return result_id;
//		String ep_id = ep_o.getEp_id();
//		String food_id = ep_o.getFood_id();
//		int ep_order_ea = ep_o.getEp_order_ea();
//		System.out.println(ep_id+" <===ep_id");
//		System.out.println(food_id+" <===food_id");
//		System.out.println(ep_order_ea+" <===ep_order_ea");
		
	}
	// 일련번호 받은 다음 식재료 insert
	public void re_insert(Ep_Order ep_o){
		System.out.println("05_01_re_insert실행 - Ep_Order_Dao.java");
//		for(Ep_Order _ep_o : ep_o){
			sqlSessionTemplate.insert("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_oinsert",ep_o);
//		}
	}
		
	
	// 식재자현황 중복없이 전체 count 요청
	public int ep_ocount(){
		System.out.println("01_ep_ocount()실행 - Ep_Oder_Dao.java");
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_ocount");
	}
	// 식재자현황 목록 요청
	public List<Ep_Order> ep_olist(){
		System.out.println("02_ep_olist 실행 ->> Ep_Oder_Dao.java");
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("beginRow", (currentPage-1)*pageRow);
//		map.put("pageRow", pageRow);
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_olist");
	}
	//식재자현황 현재수량 List 구하는 요청
	public List<Ep_Order> ep_now(String food_id){
		System.out.println("02_01_ep_now 실행 ->> Ep_Oder_Dao.java");
		List<Ep_Order> now_list = new ArrayList<Ep_Order>();
		now_list = sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_now",food_id);
		return now_list;
	}
	
	//식자재현황 검색 목록 요청
	public List<Ep_Order> food_DT_SRlist(String selbox, String keyWord, int currentPage, int pageRow){
		System.out.println("03_Ep_Order_Dao.java->>food_DT_search 실행");
//		System.out.println(selbox);
//		System.out.println(keyWord);
//		System.out.println(currentPage);
//		System.out.println(pageRow);
		Map<String, Object> map = new HashMap<String, Object>();
		String plus = "food_manage";
		String plus2 = "ep_order_food_details";
		if(selbox.equals("food_name")){ //selbox가 food_name으로 되있다면
			map.put("plus", plus);
		}else{map.put("plus", plus2);}
		map.put("selbox", selbox);
		map.put("keyWord", keyWord);
//		map.put("beginRow", (currentPage-1)*pageRow);
//		map.put("pageRow", pageRow);
//		System.out.println(map.get("selbox"));
//		System.out.println(map.get("keyWord"));
//		System.out.println(map.get("beginRow"));
//		System.out.println(map.get("pageRow"));
//		
			
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.food_DT_SRlist", map);
	}
	//식재자현황 검색 수 요청
	public int food_DT_SRcount(String selbox,String keyWord){
		System.out.println("04_food_DT_SRlist실행 - Ep_Order_Dao.java");
		Map<String, Object> map = new HashMap<String, Object>();
		String plus = "food_manage";
		String plus2 = "ep_order_food_details";
		if(selbox.equals("food_name")){
			map.put("plus", plus);
		}else{map.put("plus", plus2);}
		map.put("selbox", selbox);
		map.put("keyWord", keyWord);
		System.out.println(map.get("selbox"));
		System.out.println(map.get("keyWord"));
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.food_DT_SRcount",map);
		
	}
}
