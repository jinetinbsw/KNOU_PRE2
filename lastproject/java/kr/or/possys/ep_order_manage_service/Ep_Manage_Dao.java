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
	
	
	
	//AJAX DAO ����� ��ü ��Ͻ� �ߺ�üũ		
	public int aj_food_chck(String food_id){
		System.out.println(food_id+"<------AJAX Ep_Manage_Dao - aj_food_chck()����");
		//�ߺ�üũ ī��Ʈ
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.aj_food_chck",food_id);		
	}
		
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	AJAX DAO
	
	//��ü����Ʈ �󼼺��� ������ ����� ���� ��û
	public void f_del(String food_id){
//		System.out.println(oder);
		
//			System.out.println(o.getEp_order_id()+"<--------oder id");
//			String oder_id = oder.getEp_order_id();
//			if(oder_id.equals("default")){
//				System.out.println("���̵� ����Ʈ"); // ���ָ���Ʈ�� ���� ����
				sqlSessionTemplate.delete("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.f_del",food_id);
				sqlSessionTemplate.delete("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.f_del_o",food_id);
//			}else{
//				System.out.println("���̵� ����");
//				sqlSessionTemplate.delete("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.f_del",food_id);
//			}
		
//		System.out.println(food_id+"<----- Ep_Manage_Dao - f_del()���� food_id ");
//		sqlSessionTemplate.delete("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.f_del",food_id);
	}
	
	//###### ��ü �Է¾׼�
	public void insertep_m(List<Ep_Manage> list){
		System.out.println("01_Ep_Manage_Dao.java->>insertep_m ���� ");
//		System.out.println(map.get("list")+"<<<< map dao");
		
		int ep_mcount = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mcount");
		if(ep_mcount == 0){ // �ʱ��ü ��Ͻ�
			for(Ep_Manage ep_m : list){
				ep_m.setEp_id("e0001");
				System.out.println(ep_m+" <<<=======epm ����");
				sqlSessionTemplate.insert("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.insertep_m",ep_m);
			}
		}else{
			String ep_Mnum = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_Mnum");
			int s_Enum_count = Integer.parseInt(ep_Mnum.substring(1,5))+1;
			String result_id = "e"+String.format("%04d", s_Enum_count);
			for(Ep_Manage ep_m : list){
				if(ep_m.getEp_id() == ""){ // ���ο� ��ü ��Ͻ�
					ep_m.setEp_id(result_id);
					sqlSessionTemplate.insert("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.insertep_m",ep_m);
				}else{
					System.out.println("ep_id�� �ִ�."); // ���� ��ü ��Ͻ�
					sqlSessionTemplate.insert("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.in_insertep_m",ep_m);
				}
				
			}
		}
//		for(Ep_Manage ep_m : list){
//			System.out.println(ep_m+" <<<=======epm ����");
//			if(ep_m.getEp_id() == ""){
////				System.out.println("ep_id�� null"); //���ο��ü ��Ͻ�
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
//				System.out.println("ep_id�� �ִ�."); // ���� ��ü ��Ͻ�
//				sqlSessionTemplate.insert("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.in_insertep_m",ep_m);
//			}
//		}
	}
	//###### 01_��ü �Է¾׼ǰ� ���ÿ� ������Ȳ ����Ʈ�� �����ڵ�, �����ڵ�, ��ü�ڵ� �Է�
		public void insertep_o(List<Ep_Manage> list){
			System.out.println("in_01_Ep_Manage_Dao.java->>insertep_o ���� ");
//			System.out.println(map.get("list")+"<<<< map dao");
			for(Ep_Manage ep_m : list){
				System.out.println(ep_m+" <<<=======epm ����");
//				if(ep_m.getEp_id() == ""){
//					System.out.println("ep_id�� null"); // �Ϸù�ȣ �ο��Ͽ� �Է¹޾Ƽ� �ʿ������.
//					sqlSessionTemplate.insert("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.insertep_o",ep_m);
//				}else{
					System.out.println("ep_id�� �ִ�."); // ���� ��ü ��Ͻ�
					sqlSessionTemplate.insert("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.in_insertep_o",ep_m);
//				}
			}
		}
	// 02_���ÿ� �Էµ� ������Ȳ ����Ʈ ��� ��û�ؼ� ���û����� ����
		public Ep_Order chk_del(String food_id){
			System.out.println(food_id+"<== food_id , in_01_Ep_Manage_Dao.java->> chk_del");
			return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.chk_del",food_id);
		}
		public List<Ep_Order> chk_alldel(String ep_id){
			System.out.println(ep_id+"<== ep_id , in_01_Ep_Manage_Dao.java->> chk_alldel");
			return sqlSessionTemplate.selectList("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.chk_alldel",ep_id);
		}
//	##### ��ü �ߺ����� ���� ī��Ʈ
	public int getep_mcount(){
		System.out.println("02_Ep_Manage_Dao.java->>getep_mcount ���� ");
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.getep_mcount");
	}
	//��ü ��� ���� ī��Ʈ
//	public int getep_mcount(){
//		System.out.println("02_Ep_Manage_Dao.java->>getep_mcount ���� ");
//		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.getep_mcount");
//	}
	 //#####��ü ��� ��û (�ߺ�����)
	public List<Ep_Manage> ep_mlist(int currentPage, int pageRow){
		System.out.println("03_Ep_Manage_Dao->>ep_mlist ����");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", (currentPage-1)*pageRow);
		map.put("pageRow", pageRow);
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mlist",map);
	}
	
	//��ü��Ͽ�û)
//	public List<Ep_Manage> ep_mlist(int currentPage, int pageRow){
//		System.out.println("03_Ep_Manage_Dao->>ep_mlist ����");
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("beginRow", (currentPage-1)*pageRow);
//		map.put("pageRow", pageRow);
//		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mlist",map);
//	}
	//#01_��ü ������ ��û - #02_ajax sel_ep()���࿡���� ���
	public Ep_Manage ep_mview(String ep_id){
		System.out.println("04_Ep_Manage_Dao.java->>ep_mview ����");
//		System.out.println(ep_id+"<---ep_name Dao");
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mview",ep_id);
	}
	//#02_��ü ������ ��ü���� ����� ��û
	public List<Ep_Manage_fo_VO> ep_mview_fo(String ep_id){
		System.out.println("04-sub_Ep_Manage_Dao.java->>ep_mview_fo ����");
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mview_fo",ep_id);
	}
	//### üũ�ڽ� ��ü �Է��� ��û
	public Food ep_mchck(Food food_id){
		System.out.println(food_id+"<==== 09_Ep_Manage_Dao.java-ep_mchck()-> food_id");
		return  sqlSessionTemplate.selectOne("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_chkadd",food_id);
	}
	//###��ü �Է��� select ��ü ����Ʈ ��û // 
	public List<Ep_Manage> ep_msel_list(){
		System.out.println("10_Ep_Manage_Dao.java - ep_msel_list");
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_msel_list");
	}
	//��ü �����׼� ��û
	public int ep_mmodify(Ep_Manage ep_m){
		System.out.println("05_Ep_Manage_Dao->>ep_mmodify ����");
//		System.out.println(ep_m.getEp_id());
		return sqlSessionTemplate.update("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mmodify",ep_m);
		
	}
	//��ü ��ü���� ��û
	public void ep_mdelete(String ep_id,List<Ep_Order> order){
		System.out.println("06_Ep_Manage_Dao->>ep_mdelete ����");
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
				System.out.println(ep_order_id+"<==== ����Ʈ �ƴ� ����X");
			}
		}		
//		return sqlSessionTemplate.delete("kr.or.possys.ep_order_manage_service.Ep_Manage_Mapper.ep_mdelete",ep_id);
	}
	//
	//��ü �˻� ��û
//	public List<Ep_Manage> ep_msearch(String selbox, String keyWord, int currentPage, int pageRow){
//		System.out.println("07_Ep_Manage_Dao->>ep_msearch ����");
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
//	//��ü �˻� �� ��û
//	public int ep_mSRlist(String selbox,String keyWord){
//		System.out.println("08_Ep_Manage_Dao.java->>ep_mSRlist ����");
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
