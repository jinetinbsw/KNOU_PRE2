package kr.or.possys.ep_order_manage_service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.ep_order_food_details_service.Ep_Order;
import kr.or.possys.food_service.Food;

@Repository
public class Ep_Manage_Dao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	
	//AJAX DAO 식재료 업체 등록시 중복체크		
	public int aj_food_chck(String food_id){
		System.out.println(food_id+"<------AJAX Ep_Manage_Dao - aj_food_chck()실행");
		//중복체크 카운트
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.aj_food_chck",food_id);		
	}
		
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	AJAX DAO
	
	//업체리스트 상세보기 수정시 식재료 삭제 요청
	public void f_del(String food_id){
//		System.out.println(oder);
		
//			System.out.println(o.getEp_order_id()+"<--------oder id");
//			String oder_id = oder.getEp_order_id();
//			if(oder_id.equals("default")){
//				System.out.println("아이디 디폴트"); // 발주리스트도 동시 삭제
				sqlSessionTemplate.delete("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.f_del",food_id);
				sqlSessionTemplate.delete("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.f_del_o",food_id);
//			}else{
//				System.out.println("아이디 있음");
//				sqlSessionTemplate.delete("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.f_del",food_id);
//			}
		
//		System.out.println(food_id+"<----- Ep_Manage_Dao - f_del()실행 food_id ");
//		sqlSessionTemplate.delete("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.f_del",food_id);
	}
	
	//###### 업체 입력액션
	public void insertep_m(List<Ep_Manage> list){
		System.out.println("01_Ep_Manage_Dao.java->>insertep_m 실행 ");
//		System.out.println(map.get("list")+"<<<< map dao");
		
		int ep_mcount = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mcount");
		if(ep_mcount == 0){ // 초기업체 등록시
			for(Ep_Manage ep_m : list){
				ep_m.setEp_id("e0001");
				System.out.println(ep_m+" <<<=======epm 단일");
				sqlSessionTemplate.insert("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.insertep_m",ep_m);
			}
		}else{
			String ep_Mnum = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_Mnum");
			int s_Enum_count = Integer.parseInt(ep_Mnum.substring(1,5))+1;
			String result_id = "e"+String.format("%04d", s_Enum_count);
			for(Ep_Manage ep_m : list){
				if(ep_m.getEp_id() == ""){ // 새로운 업체 등록시
					ep_m.setEp_id(result_id);
					sqlSessionTemplate.insert("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.insertep_m",ep_m);
				}else{
					System.out.println("ep_id는 있다."); // 기존 업체 등록시
					sqlSessionTemplate.insert("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.in_insertep_m",ep_m);
				}
				
			}
		}
//		for(Ep_Manage ep_m : list){
//			System.out.println(ep_m+" <<<=======epm 단일");
//			if(ep_m.getEp_id() == ""){
////				System.out.println("ep_id는 null"); //새로운업체 등록시
//				int ep_mcount = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mcount");
//				if(ep_mcount == 0){
//					ep_m.setEp_id("e0001");
//					sqlSessionTemplate.insert("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.insertep_m",ep_m);
//					}else{
//					String ep_Mnum = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_Mnum");
//					int s_Enum_count = Integer.parseInt(ep_Mnum.substring(1,5))+1;
//					String result_id = "e"+String.format("%04d", s_Enum_count);
//					ep_m.setEp_id(result_id);
//					sqlSessionTemplate.insert("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.insertep_m",ep_m);
//					}
//				}else{
//				System.out.println("ep_id는 있다."); // 기존 업체 등록시
//				sqlSessionTemplate.insert("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.in_insertep_m",ep_m);
//			}
//		}
	}
	//###### 01_업체 입력액션과 동시에 발주현황 리스트에 발주코드, 식재코드, 업체코드 입력
		public void insertep_o(List<Ep_Manage> list){
			System.out.println("in_01_Ep_Manage_Dao.java->>insertep_o 실행 ");
//			System.out.println(map.get("list")+"<<<< map dao");
			for(Ep_Manage ep_m : list){
				System.out.println(ep_m+" <<<=======epm 단일");
//				if(ep_m.getEp_id() == ""){
//					System.out.println("ep_id는 null"); // 일련번호 부여하여 입력받아서 필요없어짐.
//					sqlSessionTemplate.insert("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.insertep_o",ep_m);
//				}else{
					System.out.println("ep_id는 있다."); // 기존 업체 등록시
					sqlSessionTemplate.insert("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.in_insertep_o",ep_m);
//				}
			}
		}
	// 02_동시에 입력된 발주현황 리스트 목록 요청해서 동시삭제를 위한
		public Ep_Order chk_del(String food_id){
			System.out.println(food_id+"<== food_id , in_01_Ep_Manage_Dao.java->> chk_del");
			return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.chk_del",food_id);
		}
		public List<Ep_Order> chk_alldel(String ep_id){
			System.out.println(ep_id+"<== ep_id , in_01_Ep_Manage_Dao.java->> chk_alldel");
			return sqlSessionTemplate.selectList("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.chk_alldel",ep_id);
		}
//	##### 업체 중복없는 갯수 카운트
	public int getep_mcount(){
		System.out.println("02_Ep_Manage_Dao.java->>getep_mcount 실행 ");
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.getep_mcount");
	}
	//업체 목록 갯수 카운트
//	public int getep_mcount(){
//		System.out.println("02_Ep_Manage_Dao.java->>getep_mcount 실행 ");
//		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.getep_mcount");
//	}
	 //#####업체 목록 요청 (중복없이)
	public List<Ep_Manage> ep_mlist(int currentPage, int pageRow){
		System.out.println("03_Ep_Manage_Dao->>ep_mlist 실행");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", (currentPage-1)*pageRow);
		map.put("pageRow", pageRow);
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mlist",map);
	}
	
	//업체목록요청)
//	public List<Ep_Manage> ep_mlist(int currentPage, int pageRow){
//		System.out.println("03_Ep_Manage_Dao->>ep_mlist 실행");
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("beginRow", (currentPage-1)*pageRow);
//		map.put("pageRow", pageRow);
//		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mlist",map);
//	}
	//#01_업체 수정폼 요청 - #02_ajax sel_ep()실행에서도 사용
	public Ep_Manage ep_mview(String ep_id){
		System.out.println("04_Ep_Manage_Dao.java->>ep_mview 실행");
//		System.out.println(ep_id+"<---ep_name Dao");
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mview",ep_id);
	}
	//#02_업체 수정폼 업체관련 식재료 요청
	public List<Ep_Manage_fo_VO> ep_mview_fo(String ep_id){
		System.out.println("04-sub_Ep_Manage_Dao.java->>ep_mview_fo 실행");
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mview_fo",ep_id);
	}
	//### 체크박스 업체 입력폼 요청
	public Food ep_mchck(Food food_id){
		System.out.println(food_id+"<==== 09_Ep_Manage_Dao.java-ep_mchck()-> food_id");
		return  sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_chkadd",food_id);
	}
	//###업체 입력폼 select 업체 리스트 요청 // 
	public List<Ep_Manage> ep_msel_list(){
		System.out.println("10_Ep_Manage_Dao.java - ep_msel_list");
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_msel_list");
	}
	//업체 수정액션 요청
	public int ep_mmodify(Ep_Manage ep_m){
		System.out.println("05_Ep_Manage_Dao->>ep_mmodify 실행");
//		System.out.println(ep_m.getEp_id());
		return sqlSessionTemplate.update("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mmodify",ep_m);
		
	}
	//업체 전체삭제 요청
	public void ep_mdelete(String ep_id,List<Ep_Order> order){
		System.out.println("06_Ep_Manage_Dao->>ep_mdelete 실행");
		for(Ep_Order o : order){
			String ep_order_id = o.getEp_order_id();
//			System.out.println(oder_id+"<----oder id");
			if(ep_order_id.equals("default")){
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("ep_id", ep_id);
				map.put("ep_order_id", ep_order_id);
				System.out.println(map.get("ep_order_id")+"asdasd");
				sqlSessionTemplate.delete("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.f_del_oall",map);
				sqlSessionTemplate.delete("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mdelete",ep_id);
			}else{
				sqlSessionTemplate.delete("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mdelete",ep_id);
				System.out.println(ep_order_id+"<==== 디폴트 아님 삭제X");
			}
		}		
//		return sqlSessionTemplate.delete("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mdelete",ep_id);
	}
	//
	//업체 검색 요청
//	public List<Ep_Manage> ep_msearch(String selbox, String keyWord, int currentPage, int pageRow){
//		System.out.println("07_Ep_Manage_Dao->>ep_msearch 실행");
////		System.out.println(selbox);
////		System.out.println(keyWord);
////		System.out.println(currentPage);
////		System.out.println(pageRow);
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("selbox", selbox);
//		map.put("keyWord", keyWord);
//		map.put("beginRow", (currentPage-1)*pageRow);
//		map.put("pageRow", pageRow);
//		System.out.println(map.get("selbox"));
//		System.out.println(map.get("keyWord"));
//		System.out.println(map.get("beginRow"));
//		System.out.println(map.get("pageRow"));
		
			
//		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_msearch", map);
//	}
//	//업체 검색 수 요청
//	public int ep_mSRlist(String selbox,String keyWord){
//		System.out.println("08_Ep_Manage_Dao.java->>ep_mSRlist 실행");
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("selbox", selbox);
//		map.put("keyWord", keyWord);
//		System.out.println(map.get("selbox"));
//		System.out.println(map.get("keyWord"));
//		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mSRlist",map);
//		
//	}
}
