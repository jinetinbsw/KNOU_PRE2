package kr.or.possys.drop_food_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.ep_order_food_details_service.Ep_Order;



@Repository
public class Drop_Dao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//drop ȭ���û (ep_order_food_details ���̺��� �����°� �ѱ��)
	public Ep_Order aj_drop_form(String food_id,String ep_order_id){
		System.out.println("01_Drop_dao.java->>aj_drop_form ���� ");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("food_id", food_id);
		map.put("ep_order_id", ep_order_id);
		return sqlSessionTemplate.selectOne("kr.or.possys.drop_food_service.Drop_Mapper.aj_drop_form",map);
		
	}
	//drop �Է¿�û
	public void aj_insertdrop(Drop drop){
		System.out.println("01_Drop_dao.java->>aj_insertdrop ���� ");
		System.out.println(drop.getFood_id()+"<<== food_id");
		
		int wh_ea = drop.getFood_nowquantity();
		int d_ea = drop.getDrop_ea();
		int sub_ea = wh_ea - d_ea;
		int d_count = sqlSessionTemplate.selectOne("kr.or.possys.drop_food_service.Drop_Mapper.getdropcount");
		if(d_count == 0){
			System.out.println("�ʱⰪ ����");
			drop.setDrop_id("d0001");
//			System.out.println(drop.getFood_id());
			sqlSessionTemplate.insert("kr.or.possys.drop_food_service.Drop_Mapper.aj_insertdrop",drop);
		}else{
			System.out.println("�ʱⰪ ����");
			String s_Dnum = sqlSessionTemplate.selectOne("kr.or.possys.drop_food_service.Drop_Mapper.s_Dnum");
			int s_Dnum_count = Integer.parseInt(s_Dnum.substring(1,5))+1;
			String result_id = "d"+String.format("%04d", s_Dnum_count);
			drop.setDrop_id(result_id);
			sqlSessionTemplate.insert("kr.or.possys.drop_food_service.Drop_Mapper.aj_insertdrop",drop);
		}
		// ��������Ȳ ����Ʈ ������� ������Ʈ
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("drop", drop);
		map.put("sub_ea", sub_ea);		
//		System.out.println(sub_ea+"<< ����������� - ������");
		sqlSessionTemplate.update("kr.or.possys.drop_food_service.Drop_Mapper.sub_ep_o_up",map);
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
	//02.drop ������ ��û
	public Drop aj_drop_sangse(String drop_id){
		System.out.println("04_drop_dao.java->>aj_drop_sangse ����");
		return sqlSessionTemplate.selectOne("kr.or.possys.drop_food_service.Drop_Mapper.dropview",drop_id);
	}
	//02.drop �����׼� ��û
	public void aj_dropmodify(Drop drop){
		System.out.println("05_drop_dao.java->>dropmodify ����");
		int wh_ea = drop.getFood_nowquantity();
		
		int cha_ea = drop.getCha_drop_ea();
		int sub_ea = wh_ea + cha_ea;
		System.out.println(sub_ea+"������ ���� ���� ���������� ���� ��");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("drop", drop);
		map.put("sub_ea", sub_ea);
		// ep_order_food_details ���̺��� ���� �������� ������Ʈ
		sqlSessionTemplate.update("kr.or.possys.drop_food_service.Drop_Mapper.sub_ep_o_up",map);
		// ������
		sqlSessionTemplate.update("kr.or.possys.drop_food_service.Drop_Mapper.dropmodify",drop);
		
	}
	//02.drop ���� ��û / ep_order_food_details ���̺� ����� �������� ����
	public void aj_dropdelete(String drop_id, String ep_order_id, String food_id, int re_dorder_wh_ea){
		System.out.println("06_drop_dao.java->>dropdelete ����");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ep_order_id", ep_order_id);
		map.put("food_id", food_id);
		map.put("re_dorder_wh_ea", re_dorder_wh_ea);		
		// ep_order_food_details ���̺� ���� ������Ʈ
		sqlSessionTemplate.update("kr.or.possys.drop_food_service.Drop_Mapper.aj_drop_del_up",map);
		// ��� ���̺� �ش� id row����
		sqlSessionTemplate.delete("kr.or.possys.drop_food_service.Drop_Mapper.aj_dropdelete",drop_id);
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
