package kr.or.possys.drop_food_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class Drop_Dao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//drop �Է¿�û
	public int insertdrop(Drop drop){
		System.out.println("01_Drop_dao.java->>insertfood ���� ");	
		return sqlSessionTemplate.insert("kr.or.possys.drop_food_service.Drop_Mapper.insertdrop",drop);
	}
	//drop ��� ���� ī��Ʈ
	public int getdropcount(){
		System.out.println("02_Drop_dao.java->>getdropcount ���� ");
		return sqlSessionTemplate.selectOne("kr.or.possys.drop_food_service.Drop_Mapper.getdropcount");
	}
	//drop ��Ͽ�û
	public List<Drop> droplist(int currentPage, int pageRow){
		System.out.println("03_drop_dao.java->>droplist ����");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", (currentPage-1)*pageRow);
		map.put("pageRow", pageRow);
		return sqlSessionTemplate.selectList("kr.or.possys.drop_food_service.Drop_Mapper.droplist",map);
	}
	//drop ������ ��û
	public Drop dropview(String drop_id){
		System.out.println("04_drop_dao.java->>dropview ����");
		return sqlSessionTemplate.selectOne("kr.or.possys.drop_food_service.Drop_Mapper.dropview",drop_id);
	}
	//drop �����׼� ��û
	public int dropmodify(Drop drop){
		System.out.println("05_drop_dao.java->>dropmodify ����");
		return sqlSessionTemplate.update("kr.or.possys.drop_food_service.Drop_Mapper.dropmodify",drop);
		
	}
	//drop ���� ��û
	public int dropdelete(String drop_id){
		System.out.println("06_drop_dao.java->>dropdelete ����");
		return sqlSessionTemplate.delete("kr.or.possys.drop_food_service.Drop_Mapper.dropdelete",drop_id);
	}
	//drop �˻� ��û
		public List<Drop> dropsearch(String selbox, String keyWord, int currentPage, int pageRow){
			System.out.println("07_drop_dao.java->>dropsearch ����");
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
			
				
			return sqlSessionTemplate.selectList("kr.or.possys.drop_food_service.Drop_Mapper.dropsearch", map);
		}
		//drop �˻� �� ��û
		public int dropSRlist(String selbox,String keyWord){
			System.out.println("08_Drop_dao.java->>foodSRlist ����");
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("selbox", selbox);
			map.put("keyWord", keyWord);
			System.out.println(map.get("selbox"));
			System.out.println(map.get("keyWord"));
			return sqlSessionTemplate.selectOne("kr.or.possys.drop_food_service.Drop_Mapper.dropSRlist",map);
			
		}
}
