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
	// �԰� ���� - �԰���� �׼�
		public void aj_ep_wh_cancel(String ep_order_id){
			System.out.println(ep_order_id+"<=== ep_order_id - 16_AJAX Ep_Manage_Dao -aj_ep_wh_cancel����");
			sqlSessionTemplate.update("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_ep_wh_cancel",ep_order_id);
		}
	
	// �󼼺��� �� ȭ�� table ���� - ajax
		public Food_Present_Sangse_VO aj_sangse_table(String food_id){
			System.out.println(food_id+"<== food_id - 15_AJAX Ep_Manage_Dao -aj_sangse_table()����");
			Ep_Order ep_o = new Ep_Order();
			Food_Present_Sangse_VO wh = new Food_Present_Sangse_VO();
			// �ֱ� ����
			ep_o = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_sangse_rctable",food_id);
			if(ep_o == null){ // �԰�� �� ������ null�� json ������.
//				System.out.println("�԰�Ȱ� ����");
				wh.setRecent_ep_order_id("-");
				wh.setRecent_or_date("-"); // �԰�� ��������
				wh.setRecent_or_wh_date("-"); // �԰�� �԰�����
				wh.setRecent_or_wh_ea(0); // ���� �԰���� 
				wh.setRecent_food_shelflife("-"); // �԰�� �԰� �������
			}else{
					wh.setRecent_ep_order_id(ep_o.getEp_order_id()); //�ֱ� ����id
					wh.setRecent_or_date(ep_o.getEp_order_date()); // �ֱٹ�������
					wh.setRecent_or_wh_date(ep_o.getEp_order_wh_date()); // �ֱ��԰�����
					wh.setRecent_or_wh_ea(ep_o.getFood_nowquantity()); // ���� �ֱ��԰����
					wh.setRecent_food_shelflife(ep_o.getEp_order_food_shelflife()); // �ֱ� �԰� �������
				}
			// ���� ����
			ep_o = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_sangse_b4table",food_id);
			if(ep_o == null){ // ������ ������ null�� json ������.
//				System.out.println("������ ����");
				wh.setB4_ep_order_id("-"); //���� ���� id
				wh.setB4_or_date("-"); // ������������
				wh.setB4_or_wh_date("-"); // �����԰�����
				wh.setB4_or_wh_ea(0); // ���������԰���� 
				wh.setB4_food_shelflife("-"); // ���� �԰� �������				
			}else{
					wh.setB4_ep_order_id(ep_o.getEp_order_id()); //���� ���� id
					wh.setB4_or_date(ep_o.getEp_order_date()); // ������������
					wh.setB4_or_wh_date(ep_o.getEp_order_wh_date()); // �����԰�����
					wh.setB4_or_wh_ea(ep_o.getFood_nowquantity()); // ���������԰����
					wh.setB4_food_shelflife(ep_o.getEp_order_food_shelflife()); // ���� �԰� �������
				}
			return wh;
		}
	// �󼼺��� �� ȭ�� span ���� - ajax
	public Food_Present_Sangse_VO aj_sangse_span(String food_id){
		System.out.println(food_id+"<== food_id - 14_AJAX Ep_Manage_Dao -aj_sangse_span()����");
		Food_Present_Sangse_VO food = new Food_Present_Sangse_VO(); // ������ ����
		Food_Present_Sangse_VO ep = new Food_Present_Sangse_VO(); // ��ü ����
		food = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_sangse_Fspan",food_id);
		int count = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_sangse_Ecount",food_id);
		if(count == 0){
			food.setEp_id("�̵��");
			food.setEp_name("�̵��");
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
	
	// �󼼺��⿡�� ��ü������� 
	public void aj_sangse_cancel(String ep_order_id){
		System.out.println(ep_order_id+"<== ep_order_id - 13_AJAX Ep_Manage_Dao -aj_sangse_cancel()����");
//		sqlSessionTemplate.update("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_sangse_cancel",ep_order_id);
		sqlSessionTemplate.delete("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_sangse_cancel",ep_order_id);
	}
	
	// �����ֹ� ��Ͽ��� �󼼺��� - ���� ���Ͻ� update
	public void ep_order_update(Ep_Order ep_o){
		System.out.println(ep_o+"<------AJAX Ep_Manage_Dao - ep_order_update()����");
		System.out.println(ep_o.getEp_order_id()+"<<<<ep_order_id");
		sqlSessionTemplate.update("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_order_update",ep_o);
	}
	
	//AJAX ���� �ֹ���� �󼼺��� ������ �ش� ���� ���� ��ҽ� DB �� �ش� �����ֹ��� ����ó��
	public void aj_select_del(String ep_order_id, String food_id){
			System.out.println(ep_order_id+"<------12_AJAX Ep_Manage_Dao - select_del()����");
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
		
	//AJAX ���ֵ�Ͻ� �����ڰ� ��ü�� ����� �Ǿ����� Ȯ��
	public int aj_ep_chck(String food_id){
			System.out.println(food_id+"<------11_AJAX Ep_Manage_Dao - ep_chck()����");
			return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.aj_ep_chck",food_id);		
		}
	
	// �԰� ��� ��û
	public List<Ep_Order> ep_wh_list(int currentPage, int pageRow){
		System.out.println("10_ep_wh_list ���� - Ep_Order_Dao.java");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", (currentPage-1)*pageRow);
		map.put("pageRow", pageRow);
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_wh_list",map);
		
	}
	
	// �԰���  ���� ��û
	public int ep_wh_conunt(){
		System.out.println("09_ep_o_wh_add ���� - Ep_Order_Dao.java");
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_wh_conunt");		
	}
	
	// �԰��� �׼� (update �־���)
	public void ep_o_wh_update(List<Ep_Order> list){
		System.out.println("08_ep_o_wh_add ���� - Ep_Order_Dao.java");
		for(Ep_Order ep_o : list){ 
			System.out.println(ep_o+"<< ��� Dto �ּҰ�");
//		for(int i=0; i<list.size(); i++){  // �ٸ����
//			System.out.println(list.get(i)+"<<< "+i+"��° �ּҰ�");
			sqlSessionTemplate.update("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_o_wh_update",ep_o);
		}
	}
	
	// ajax// ���� �ֹ���Ͽ��� �񵿱� �԰��� ��
	public List<Ep_Order> js_ep_wh_list(String ep_order_id){
		System.out.println("AJAX_01_ js_ep_wh_list ���� - Ep_Order_Dao.java");	
		System.out.println(ep_order_id+"<=== ep_order_id - Ep_Order_Dao.java");
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.js_ep_wh_list",ep_order_id);
	}
	
	// ���� �ֹ� ��� ��û �ߺ�����
	public List<Ep_Order> ep_o_list(){
		System.out.println("07_ep_o_list ���� - Ep_Order_Dao.java");
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_o_list");
	}
	// ���� �ֹ� ��� �ߺ� ���� count ����
	public int ep_o_count(){
		System.out.println("06_ep_o_count ���� - Ep_Order_Dao.java");		
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_o_count");
	}
	
	// ���ֵ�� default �� Ȯ�� update ����  ������ ���Ƽ� ������........
//	public void default_up(Ep_Order ep_o){
//		System.out.println("_05_01_default_up���� - Ep_Order_Dao.java");
////		System.out.println(ep_o.getEp_id());
////		System.out.println(ep_o.getEp_order_ea());
////		System.out.println(ep_o.getFood_id());
//		String ep_Onum = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_Onum");
//		System.out.println(ep_Onum+"<=====ep_Onum");
//		if(ep_Onum.equals("default")){ // ���̺� row �� default���� ū���� ������ else������ �̵�
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
	
	// ���ֵ�Ͻ� default Ȯ���ϱ� ���� select one
	public String ep_default(){
		System.out.println("_05_ep_default���� - Ep_Order_Dao.java");		
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_default");
	}
	// ���ֵ�Ͻ� �ش� row�� default ���� Ȯ�� // ������ ���� ���ܼ� ���ݽ�..
//	public String s_de(String food_id, String ep_id){
//		System.out.println("_05_02_s_de���� - Ep_Order_Dao.java");
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("food_id", food_id);
//		map.put("ep_id", ep_id);
//		System.out.println(map.get("food_id")+"<===s_de - dao");
//		System.out.println(map.get("ep_id")+"<===s_de - dao");
//		
//		String s_de = sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.s_de",map);
//		return s_de;
//	}
	
	// ���ֵ�Ͻ� default ���� �ƴϸ� �ִ밪�� ã�Ƽ� +1 ��Ų��.
	public String result_id(){
		System.out.println("05_result_id���� - Ep_Order_Dao.java");
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
	// �Ϸù�ȣ ���� ���� ����� insert
	public void re_insert(Ep_Order ep_o){
		System.out.println("05_01_re_insert���� - Ep_Order_Dao.java");
//		for(Ep_Order _ep_o : ep_o){
			sqlSessionTemplate.insert("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_oinsert",ep_o);
//		}
	}
		
	
	// ��������Ȳ �ߺ����� ��ü count ��û
	public int ep_ocount(){
		System.out.println("01_ep_ocount()���� - Ep_Oder_Dao.java");
		return sqlSessionTemplate.selectOne("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_ocount");
	}
	// ��������Ȳ ��� ��û
	public List<Ep_Order> ep_olist(){
		System.out.println("02_ep_olist ���� ->> Ep_Oder_Dao.java");
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("beginRow", (currentPage-1)*pageRow);
//		map.put("pageRow", pageRow);
		return sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_olist");
	}
	//��������Ȳ ������� List ���ϴ� ��û
	public List<Ep_Order> ep_now(String food_id){
		System.out.println("02_01_ep_now ���� ->> Ep_Oder_Dao.java");
		List<Ep_Order> now_list = new ArrayList<Ep_Order>();
		now_list = sqlSessionTemplate.selectList("kr.or.possys.ep_order_food_details_service.Ep_Order_Mapper.ep_now",food_id);
		return now_list;
	}
	
	//��������Ȳ �˻� ��� ��û
	public List<Ep_Order> food_DT_SRlist(String selbox, String keyWord, int currentPage, int pageRow){
		System.out.println("03_Ep_Order_Dao.java->>food_DT_search ����");
//		System.out.println(selbox);
//		System.out.println(keyWord);
//		System.out.println(currentPage);
//		System.out.println(pageRow);
		Map<String, Object> map = new HashMap<String, Object>();
		String plus = "food_manage";
		String plus2 = "ep_order_food_details";
		if(selbox.equals("food_name")){ //selbox�� food_name���� ���ִٸ�
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
	//��������Ȳ �˻� �� ��û
	public int food_DT_SRcount(String selbox,String keyWord){
		System.out.println("04_food_DT_SRlist���� - Ep_Order_Dao.java");
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
