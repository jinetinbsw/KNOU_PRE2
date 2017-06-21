package kr.or.possys.Order_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.or.possys.Menu_service.Menu;

@Repository
public class Order_Dao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate2;
	
	public List<Order> order_list(){
		System.out.println("OrderList실행");
		
		return sqlSessionTemplate2.selectList("kr.or.possys.Order_service.Order_Mapper.order_list");	
	}
	
    public List<Order> get_order_list(int currentPage, int pagePerRow) {
    	System.out.println("get_order_list");
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        System.out.println(map.get("beginRow"));
        System.out.println(map.get("pagePerRow"));
        
        return sqlSessionTemplate2.selectList("kr.or.possys.Order_service.Order_Mapper.get_order_list", map);
    }
    
    public List<Order> get_order_search_list(String selbox, String keyWord,int currentPage, int pagePerRow) {
    	System.out.println("get_order_list");
    	System.out.println(selbox+"/"+keyWord+"/"+currentPage+"/"+pagePerRow+"////");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
		map.put("selbox", selbox);
		map.put("keyWord", keyWord);
		
        System.out.println(map.get("beginRow"));
        System.out.println(map.get("pagePerRow"));
        
        return sqlSessionTemplate2.selectList("kr.or.possys.Order_service.Order_Mapper.get_order_search_list", map);
    }
	
	public Order order_modify_form(String table_order_id){
		System.out.println("주문수정폼실행");
		return sqlSessionTemplate2.selectOne("kr.or.possys.Order_service.Order_Mapper.order_modify_form",table_order_id);
	}
	
	public String get_price(String menu_id){
		System.out.println("가격가져오기");
		return sqlSessionTemplate2.selectOne("kr.or.possys.Order_service.Order_Mapper.get_price",menu_id);
	}
	
	public List<Order> order_detail(String table_order_id){
		System.out.println("주문상세실행");
		return sqlSessionTemplate2.selectList("kr.or.possys.Order_service.Order_Mapper.order_detail",table_order_id);
	}
	
	public int order_end_t(String table_order_id){
		System.out.println("주문종결실행");
		return sqlSessionTemplate2.update("kr.or.possys.Order_service.Order_Mapper.order_end_t",table_order_id);
	}
	
	public int order_cancel(String table_order_id){
		System.out.println("주문취소실행");
		return sqlSessionTemplate2.update("kr.or.possys.Order_service.Order_Mapper.order_cancel",table_order_id);
	}
	

	
	public int order_detail_end_t(Order order){
		System.out.println("주문종결실행");
		return sqlSessionTemplate2.update("kr.or.possys.Order_service.Order_Mapper.order_detail_end_t",order);
	}
	
	public int order_detail_end_ea(Order order){
		System.out.println("주문종결실행");
		return sqlSessionTemplate2.update("kr.or.possys.Order_service.Order_Mapper.order_detail_end_ea",order);
	}
	
	public int order_detail_modify(Order order){
		System.out.println("주문상세실행");
		return sqlSessionTemplate2.update("kr.or.possys.Order_service.Order_Mapper.order_detail_modify",order);
	}
	
	public int order_detail_delete(String table_ordere_id){
		System.out.println("주문삭제실행");
		return sqlSessionTemplate2.delete("kr.or.possys.Order_service.Order_Mapper.order_detail_delete",table_ordere_id);
	}
	
	public int order_detail_insert(Order order){
		System.out.println("주문상세입력실행");
		return sqlSessionTemplate2.insert("kr.or.possys.Order_service.Order_Mapper.order_detail_insert",order);
	}
	
	public List<Menu> menu_list(){
		System.out.println("메뉴목록실행");
		return sqlSessionTemplate2.selectList("kr.or.possys.Order_service.Order_Mapper.menu_list");
	}
	
	public List<Order> order_fpm(String menu_id){
		System.out.println("Order_fpm실행");
		
		return sqlSessionTemplate2.selectList("kr.or.possys.Order_service.Order_Mapper.order_fpm",menu_id);	
	}
	
	public List<Order> order_ep_order(String food_id){
		System.out.println("Order_ep_order실행");
		
		return sqlSessionTemplate2.selectList("kr.or.possys.Order_service.Order_Mapper.order_ep_order",food_id);	
	}
	
	public int order_ep_zero(Order order){
		System.out.println("식재 0개실행");
		return sqlSessionTemplate2.delete("kr.or.possys.Order_service.Order_Mapper.order_ep_zero",order);
	}
	
	public int order_ep_plus(Order order){
		System.out.println("식재 소비실행");
		return sqlSessionTemplate2.delete("kr.or.possys.Order_service.Order_Mapper.order_ep_plus",order);
	}
	
	public Order order_count(){
		System.out.println("getcount");
		return sqlSessionTemplate2.selectOne("kr.or.possys.Order_service.Order_Mapper.order_count");
	}
	
	public int order_insert(Order order){
		System.out.println("order_insert");
		return sqlSessionTemplate2.insert("kr.or.possys.Order_service.Order_Mapper.order_insert",order);
	}
	
	public List<Order> order_fpm_all(){
		System.out.println("Order_fpm_all실행");
		
		return sqlSessionTemplate2.selectList("kr.or.possys.Order_service.Order_Mapper.order_fpm_all");	
	}
	
	public Order order_nowquantity(String food_id){
		System.out.println("get_order_nowquantity"+food_id);
		return sqlSessionTemplate2.selectOne("kr.or.possys.Order_service.Order_Mapper.order_nowquantity",food_id);
	}
	
	public Order get_end_ea(Order order){
		System.out.println("소비한 갯수 가져오기");
		return sqlSessionTemplate2.selectOne("kr.or.possys.Order_service.Order_Mapper.order_detail_end_ea",order);
	}
	
    public int get_order_count(){
    	System.out.println("order_count");
    	// 경로가 잘못 입력된 것을 미처 확인하지 못함
        return sqlSessionTemplate2.selectOne("kr.or.possys.Order_service.Order_Mapper.get_order_count");
    }
    
    public int table_num_count(int table_order_num){
    	System.out.println("table_num_count");

        return sqlSessionTemplate2.selectOne("kr.or.possys.Order_service.Order_Mapper.table_num_count",table_order_num);
    }
    
    public int get_order_search_count(String selbox,String keyWord){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("selbox", selbox);
		map.put("keyWord", keyWord);
    	System.out.println("order_count");
    	// 경로가 잘못 입력된 것을 미처 확인하지 못함
        return sqlSessionTemplate2.selectOne("kr.or.possys.Order_service.Order_Mapper.get_order_search_count",map);
    }

}