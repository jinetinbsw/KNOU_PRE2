package kr.or.possys.Menu_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.food_service.Food;
@Repository
public class Per_Dao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//식재 등록
	
	public Menu menuview(String menu_id){
		System.out.println("04_Menu_dao.java->>menuview 실행");
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Per_Mapper.menuview",menu_id);
	}
	public Food menuview01(String food_id){
		System.out.println("05_Menu_dao.java->>menuview 실행");
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Per_Mapper.menuview01",food_id);
	}
	public Menu menuinsert(Menu_Food mf){
		System.out.println("06 Menu dao.javam>>menuinsert실행");
		System.out.println(mf.getFood_id()+"getFood_id");
		System.out.println(mf.getFood_name()+"getFood_name");
		System.out.println(mf.getFood_unit()+"getFood_unit");
		System.out.println(mf.getMenu_id()+"getMenu_id");
		System.out.println(mf.getMenu_name()+"getMenu_name");
		System.out.println(mf.getFpm_ea()+"getFpm_ea()");
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Per_Mapper.menuinsert",mf);
	}
	

	public int getmenucount(){
		System.out.println("02_Menu_dao.java->>getmenucount 실행 ");
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Per_Mapper.getmenucount");
	}
	public List<Per> perlist(int currentPage, int pageRow){
		System.out.println("03_per_dao.java->>menulist 실행");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", (currentPage-1)*pageRow);
		map.put("pageRow", pageRow);
		return sqlSessionTemplate.selectList("kr.or.possys.Menu_service.Per_Mapper.perlist",map);
	}
	// 검색 요청
	public List<Food> foodsearch(String selbox, String keyWord, int currentPage, int pageRow){
		System.out.println("07_Food_dao.java->>foodsearch 실행");
		System.out.println(selbox);
		System.out.println(keyWord);
		System.out.println(currentPage);
		System.out.println(pageRow);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("selbox", selbox);
		map.put("keyWord", keyWord);
		map.put("beginRow", (currentPage-1)*pageRow);
		map.put("pageRow", pageRow);
		System.out.println(map.get("selbox"));
		System.out.println(map.get("keyWord"));
		System.out.println(map.get("beginRow"));
		System.out.println(map.get("pageRow"));
		
			
		return sqlSessionTemplate.selectList("kr.or.possys.Menu_service.Per_Mapper.foodsearch", map);
	}
	// 검색수 요청
	public int foodSRlist(String selbox,String keyWord){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("selbox", selbox);
		map.put("keyWord", keyWord);
		System.out.println(map.get("selbox"));
		System.out.println(map.get("keyWord"));
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Per_Mapper.foodSRlist",map);
		
	}
	public int aj_ep_chck(String food_id, String menu_id){
		System.out.println(food_id+menu_id+"<Dao 확인요청");
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Per_Mapper.aj_ep_chck");		
	}
}
