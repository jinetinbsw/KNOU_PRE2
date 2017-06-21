package kr.or.possys.Menu_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.Order_service.Order;
import kr.or.possys.food_service.Food;



@Repository
public class Menu_Dao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//menu 입력요청
	public int insertmenu(Menu menu){
		return sqlSessionTemplate.insert("kr.or.possys.Menu_service.Menu_Mapper.insertmenu",menu);
	}
	//menu 리스트 요청
	public int getmenucount(){
		System.out.println("02_Menu_dao.java->>getmenucount 실행 ");
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Menu_Mapper.getmenucount");
	}
	public List<Menu> menulist(int currentPage, int pageRow){
		System.out.println("03_menu_dao.java->>menulist 실행");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", (currentPage-1)*pageRow);
		map.put("pageRow", pageRow);
		return sqlSessionTemplate.selectList("kr.or.possys.Menu_service.Menu_Mapper.menulist",map);
	}
	//menu 수정폼 요청
	public Menu menuview(String menu_id){
		System.out.println("04_Menu_dao.java->>menuview 실행");
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Menu_Mapper.menuview",menu_id);
	}
	//식재 소비
	public Menu menuperview(String menu_id){
		System.out.println("04_Menu_dao.java->>menuview 실행");
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Menu_Mapper.menuview",menu_id);
	}
	//menu 수정액션 요청
	public int menumodify(Menu menu){
		System.out.println("05_Menu_dao.java->>menumodify 실행");
		return sqlSessionTemplate.update("kr.or.possys.Menu_service.Menu_Mapper.menumodify",menu);
			
		}
	public int menudelete(String menu_id){
		System.out.println("06_Menu_dao.java->>menudelete 실행");
		return sqlSessionTemplate.delete("kr.or.possys.Menu_service.Menu_Mapper.menudelete",menu_id);
	}
	//menu 검색 요청
		public List<Menu> menusearch(String selbox, String keyWord, int currentPage, int pageRow){
			System.out.println("07_Menu_dao.java->>menusearch 실행");
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
			
				
			return sqlSessionTemplate.selectList("kr.or.possys.Menu_service.Menu_Mapper.menusearch", map);
		}
	//menu 자동 등록 Dao//	
	public Menu menu_count(){
		System.out.println("getcount");
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Menu_Mapper.menu_count");
	}
	//menu 검색 수 요청//
		public int menuSRlist(String selbox,String keyWord){
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("selbox", selbox);
			map.put("keyWord", keyWord);
			System.out.println(map.get("selbox"));
			System.out.println(map.get("keyWord"));
			return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Menu_Mapper.menuSRlist",map);
			
	}
	public List<Menu> menu_list(){
		System.out.println("메뉴목록실행");
		return sqlSessionTemplate.selectList("kr.or.possys.Menu_service.Menu_Mapper.menu_list");
	}
	
}
