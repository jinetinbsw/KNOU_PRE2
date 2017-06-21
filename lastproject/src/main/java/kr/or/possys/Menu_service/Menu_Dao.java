package kr.or.possys.Menu_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.food_service.Food;



@Repository
public class Menu_Dao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//menu �Է¿�û
	public int insertmenu(Menu menu){
		System.out.println("menu_Controll.java <-- ����Ȯ�� ");	
		return sqlSessionTemplate.insert("kr.or.possys.Menu_service.Menu_Mapper.insertmenu",menu);
	}
	//menu ����Ʈ ��û
	public int getmenucount(){
		System.out.println("02_Menu_dao.java->>getmenucount ���� ");
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Menu_Mapper.getmenucount");
	}
	public List<Menu> menulist(int currentPage, int pageRow){
		System.out.println("03_menu_dao.java->>menulist ����");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", (currentPage-1)*pageRow);
		map.put("pageRow", pageRow);
		return sqlSessionTemplate.selectList("kr.or.possys.Menu_service.Menu_Mapper.menulist",map);
	}
	//menu ������ ��û
	public Menu menuview(String menu_id){
		System.out.println("04_Menu_dao.java->>menuview ����");
		return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Menu_Mapper.menuview",menu_id);
	}
	//menu �����׼� ��û
	public int menumodify(Menu menu){
		System.out.println("05_Menu_dao.java->>menumodify ����");
		return sqlSessionTemplate.update("kr.or.possys.Menu_service.Menu_Mapper.menumodify",menu);
			
		}
	public int menudelete(String menu_id){
		System.out.println("06_Menu_dao.java->>menudelete ����");
		return sqlSessionTemplate.delete("kr.or.possys.Menu_service.Menu_Mapper.menudelete",menu_id);
	}
	//menu �˻� ��û
		public List<Menu> menusearch(String selbox, String keyWord, int currentPage, int pageRow){
			System.out.println("07_Menu_dao.java->>menusearch ����");
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
	//menu �˻� �� ��û
		public int menuSRlist(String selbox,String keyWord){
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("selbox", selbox);
			map.put("keyWord", keyWord);
			System.out.println(map.get("selbox"));
			System.out.println(map.get("keyWord"));
			return sqlSessionTemplate.selectOne("kr.or.possys.Menu_service.Menu_Mapper.menuSRlist",map);
			
		}
	
}
