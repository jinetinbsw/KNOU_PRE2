package kr.or.possys.Member_sevice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.Cancel_Payment_service.Payment_Cancel;
import kr.or.possys.Order_service.Order;
import kr.or.possys.Payment_service.Payment;
import kr.or.possys.ep_order_food_details_service.Ep_Order;


@Repository
public class Member_Dao {

	@Autowired
	private SqlSessionTemplate Msql;
	
	//�� �� ����ݾ�(���ֽ�û�ݾ�)
	public List<Ep_Order> expense_folios(){
		System.out.println("expense_folios �޼��� ����  Member_Dao.java");
		
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.expense_folios");
	}
	
	
	//�� �� �Ǹűݾ�
	public List<Payment> sum_payment(){
		System.out.println("sum_payment �޼��� ����  Member_Dao.java");
		
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.sum_payment");
	}
	
	//���κ� �̿� ����
	public List<receipt> receipt_list(String member_phone){
		System.out.println("receipt_list �޼��� ���� Member_Dao.java");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("member_phone", member_phone);
		
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.receipt_list",map );
	}
	//ȸ������ ó�� �޼���
	public int sign_up_action(Member m){
		System.out.println("sign_up_action ���� Member_Dao.java");
		return Msql.insert("kr.or.possys.Member_sevice.Member_Mapper.sign_up_action", m);
	}
	
	//������ ��� �޼���
	public List<receipt> receipt(String member_phone,String table_order_id){
		System.out.println("receipt �޼��� ���� Ȯ�� Member_Dao.java");
		System.out.println(table_order_id+"<--table_order_id receipt �޼��� ���� Ȯ�� Member_Dao.java");
		System.out.println(member_phone+"<--member_phone receipt �޼��� ���� Ȯ�� Member_Dao.java");
		if(member_phone==""||member_phone==null){
			System.out.println("ȸ�� �ڵ��� ��ȣ�� ����.  receipt�޼��� Member_Dao.java");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("table_order_id",table_order_id);
			
			return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.no_member_receipt",map);
		}else{
			System.out.println("ȸ�� �ڵ��� ��ȣ�� �ִ�. receipt�޼��� Member_Dao.java ");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("table_order_id",table_order_id);
		map.put("member_phone",member_phone);
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.receipt",map);
		}
		/*return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.receipt",map);*/
	}
	//���̺� �ڸ��̵� �޼���
	public int table_move(String table_order_id,int table_num){
		System.out.println("table_move �޼��� ���� Ȯ�� Member_Dao.java");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("table_order_id", table_order_id);
		map.put("table_num", table_num);
		return Msql.update("kr.or.possys.Member_sevice.Member_Mapper.table_move", map);	
	}
	//���� �Ѿ� ���ϴ� �޼���
	public int today_total(){
		/*System.out.println("today_total �޼��� ���� Member_Dao.java");*/
		return Msql.selectOne("kr.or.possys.Member_sevice.Member_Mapper.today_total");
	}
	
	//���� ������� ���̺� ���ϴ� �޼��� 
	public int f_table_count(){
		/*System.out.println("f_table_count �޼��� ���� Member_Dao.java");	*/
		return Msql.selectOne("kr.or.possys.Member_sevice.Member_Mapper.f_table_count");
	}
	
	//���̺� ���� ���ϴ� �޼��� 
	public List<Order> table_state(){
		/*System.out.println("table_state �޼��� ���� Ȯ�� Member_Dao.java");*/
	return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.table_state");
	}
	//���̺� Ŭ���� �ֹ����� Ȯ�� �޼���
	public List<Order> table_Order_detail(String table_order_num){
		System.out.println("table_Order_detail �޼��� ���� Ȯ�� Member_dao.java");
		System.out.println(table_order_num+"<<<<<<<<<<<<");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.table_Order_detail", table_order_num);
		
	}
	
	//������Ȳ ī�庰 ��ȸ �޼���(���)
	public List<Payment_Cancel> C_CDcatePayment(String selbox){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selbox", selbox);
		System.out.println("C_CDcatePayment �޼��� ���� Ȯ�� Member_Dao.java");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.C_CDcatePayment", map);
		
	}

	//������Ȳ ���� �� ��ȸ �޼���(���)
	public List<Payment_Cancel> C_McatePayment(String selbox){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selbox", selbox);
		System.out.println("C_McatePayment �޼��� ���� Ȯ�� Member_Dao.java");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.C_McatePayment", map);
		
	}
	
	//������Ȳ ��ȸ �޼���(���)
	public List<Payment_Cancel> C_totalPaymentList(String selbox){
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("selbox", selbox);
	System.out.println("C_totalPaymentList �޼��� ���� Ȯ�� Member_Dao.java");
	return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.C_totalPaymentList", map);
	
	}
	
	//������Ȳ ī�庰 ��ȸ �޼���
			public List<Payment> CDcatePayment(String selbox){
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("selbox", selbox);
				System.out.println("CDcatePayment �޼��� ���� Ȯ�� Member_Dao.java");
				return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.CDcatePayment", map);
				
			}
		
	//������Ȳ ���� �� ��ȸ �޼���
		public List<Payment> McatePayment(String selbox){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("selbox", selbox);
			System.out.println("McatePayment �޼��� ���� Ȯ�� Member_Dao.java");
			return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.McatePayment", map);
			
		}
	
	//������Ȳ ��ȸ �޼���
	public List<Payment> totalPaymentList(String selbox){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selbox", selbox);
		System.out.println("totalPaymentList �޼��� ���� Ȯ�� Member_Dao.java");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.totalPaymentList", map);
		
	}
	
	//�Է°��� �ѱ��� ��� ����Ǵ� �ǽð� ȸ�� ��ȸ �޼���
		public List<Member> K_AjaxMemberList(int currentPage, int pagePerRow ,String insert){
			System.out.println("getMemberList �޼��� ����   Member_Dao.java ");
			Map<String, Object> map = new HashMap<String, Object>();
	        map.put("beginRow", (currentPage-1)*pagePerRow);
	        map.put("pagePerRow", pagePerRow);
	        map.put("insert", insert);
	        
	        System.out.println(map.get("insert")+"�Է°� AjaxMemberList Member_Dao");
			return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.K_AjaxMemberList", map);
			
		}
	
	
	//�Է°��� ����� ������ ��� ����Ǵ� �ǽð� ȸ�� ��ȸ �޼���
	public List<Member> AjaxMemberList(int currentPage, int pagePerRow ,String insert){
		System.out.println("getMemberList �޼��� ����   Member_Dao.java ");
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        map.put("insert", insert);
        
        System.out.println(map.get("insert")+"�Է°� AjaxMemberList Member_Dao");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.AjaxMemberList", map);
		
	}
	
	
	//ȸ�� ���� ī��Ʈ �޼���
	public int getMemberCount(){
		System.out.println("getMemberCount �޼��� ����   Member_Dao.java ");
		
		return Msql.selectOne("kr.or.possys.Member_sevice.Member_Mapper.getMemberCount");
		}
	//��üȸ�� ��ȸ �޼���
	public List<Member> getMemberList(int currentPage, int pagePerRow){
		System.out.println("getMemberList �޼��� ����   Member_Dao.java ");
		Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.getMemberList", map);
		
	}
	//�Ѹ� ȸ������ ��ȸ �޼���
	public Member getMember(String member_phone){
		System.out.println("getMember �޼��� ����   Member_Dao.java ");
		return Msql.selectOne("kr.or.possys.Member_sevice.Member_Mapper.MselectOne", member_phone);
	}
	//����ó�� �޼���
	public int Mupdate(Member m){
		System.out.println("Mupdate �޼��� ���� Member_Dao.java");
		return Msql.update("kr.or.possys.Member_sevice.Member_Mapper.Mupdate",m);
	}
	//����ó�� �޼���
	public int deleteMember(String member_phone){
		System.out.println("deleteMember �޼��� ���� Member_Dao.java");
		
		return Msql.delete("kr.or.possys.Member_sevice.Member_Mapper.deleteMember", member_phone);
		
	}
	//�˻�ó�� �޼���(�˻��� ����� �迭�� ����Ʈó�� ������)
	public List<Member> searchMember(String selBox,String search,int currentPage,int pagePerRow){
		System.out.println("selectMember �޼��� ���� Member_Dao.java");
		mVo m = new mVo();
		m.setSelBox(selBox);
		m.setSearch(search);
		m.setBeginRow((currentPage-1)*pagePerRow);
		m.setPagePerRow(pagePerRow);
		System.out.println(m.getSelBox()+"<----------------�����Ѱ�");
		System.out.println(m.getSearch()+"<----------------�����Ѱ�");
		return Msql.selectList("kr.or.possys.Member_sevice.Member_Mapper.Msearch",m);
	}
	//�˻� ���ǿ� �´� ȸ���� ��ȸ �޼���
		public int getsearchCount(String selBox,String search){
			System.out.println("getsearchCount �޼��� ����   Member_Dao.java ");
			mVo m = new mVo();
			m.setSelBox(selBox);
			m.setSearch(search);
			
			return Msql.selectOne("kr.or.possys.Member_sevice.Member_Mapper.getsearchCount",m);
			}

}
