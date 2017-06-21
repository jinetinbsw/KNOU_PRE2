package kr.or.possys.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.possys.Member_sevice.Member_Dao;
import net.sf.json.JSONArray;

@Controller
public class Template {
	@Autowired
	Member_Dao Mdao;
	
	@RequestMapping(value="/test_index/table_state")
	public String table_state(){
		return "/test_index/table_state";
	}
	
	
	//���� �Ѿ� ���ϴ� �޼���
		@RequestMapping(value="/today_total")
		@ResponseBody
		public void today_total(HttpServletResponse re) throws IOException{
			/*System.out.println("today_total �޼��� ���� Template.java");*/
			 re.setCharacterEncoding("UTF-8");
			 
			 PrintWriter out = re.getWriter();
			JSONArray today_total = null;
			int total = Mdao.today_total();
			/*System.out.println(total+"<<<<<today_total");*/
			today_total = JSONArray.fromObject(total);
			/*System.out.println(today_total);*/
			
			//���ο� ȭ�鿡�� json������� �޾ƿ� �� ���
			out.write(today_total.toString());
			
			out.flush();
		
		}
	
	//������� ���̺� ����
	@RequestMapping(value="/f_table_count")
	@ResponseBody
	public void f_table_count(HttpServletResponse re) throws IOException{
		/*System.out.println("f_table_count �޼��� ���� Template.java");*/
		 re.setCharacterEncoding("UTF-8");
		 
		 PrintWriter out = re.getWriter();
		JSONArray f_table_count = null;
		int count = Mdao.f_table_count();
		/*System.out.println(count+"<<<<<f_table_count Template.java");*/
		f_table_count = JSONArray.fromObject(count);
		/*System.out.println(f_table_count);*/
		
		//���ο� ȭ�鿡�� json������� �޾ƿ� �� ���
		out.write(f_table_count.toString());
		
		out.flush();
	
	}
	//ȸ�� ��Ȳ ȭ�� �̵�
	@RequestMapping(value="/new_member_list")
	public String new_member_list(){
		return "/test_index/handsontable";
	}
	
	//������Ȳ ȭ�� �̵�
	@RequestMapping(value="/chartjs")
	public String menu_chart(){
		return "/test_index/morris";
	}
	
	//���� ��� ȭ�� �̵�
	@RequestMapping(value="/staff_chart")
	public String staff_chart(){
		return "/test_index/flot";
	}
	
	//�޴��Ǹ� ��Ȳ ȭ�� �̵�
	@RequestMapping(value="/menu_chart")
	public String Chart_go(){
		return "/test_index/chartjs";
	}
	
	//���ο� ���ø� �޷� ȭ�� �̵�
		@RequestMapping(value="/Calendar")
		public String Calendar(){
			return "/test_index/calendar";
		}
	//���ο� ���ø� ����ȭ�� �̵�
	@RequestMapping(value="/test_index/index")
	public String main(){
		return "/test_index/index";
	}
	
	
}
