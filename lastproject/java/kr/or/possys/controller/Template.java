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
	
	
	//오늘 총액 구하는 메서드
		@RequestMapping(value="/today_total")
		@ResponseBody
		public void today_total(HttpServletResponse re) throws IOException{
			/*System.out.println("today_total 메서드 실행 Template.java");*/
			 re.setCharacterEncoding("UTF-8");
			 
			 PrintWriter out = re.getWriter();
			JSONArray today_total = null;
			int total = Mdao.today_total();
			/*System.out.println(total+"<<<<<today_total");*/
			today_total = JSONArray.fromObject(total);
			/*System.out.println(today_total);*/
			
			//새로운 화면에서 json방식으로 받아온 값 출력
			out.write(today_total.toString());
			
			out.flush();
		
		}
	
	//사용중인 테이블 개수
	@RequestMapping(value="/f_table_count")
	@ResponseBody
	public void f_table_count(HttpServletResponse re) throws IOException{
		/*System.out.println("f_table_count 메서드 실행 Template.java");*/
		 re.setCharacterEncoding("UTF-8");
		 
		 PrintWriter out = re.getWriter();
		JSONArray f_table_count = null;
		int count = Mdao.f_table_count();
		/*System.out.println(count+"<<<<<f_table_count Template.java");*/
		f_table_count = JSONArray.fromObject(count);
		/*System.out.println(f_table_count);*/
		
		//새로운 화면에서 json방식으로 받아온 값 출력
		out.write(f_table_count.toString());
		
		out.flush();
	
	}
	//회원 현황 화면 이동
	@RequestMapping(value="/new_member_list")
	public String new_member_list(){
		return "/test_index/handsontable";
	}
	
	//매출현황 화면 이동
	@RequestMapping(value="/chartjs")
	public String menu_chart(){
		return "/test_index/morris";
	}
	
	//직원 통계 화면 이동
	@RequestMapping(value="/staff_chart")
	public String staff_chart(){
		return "/test_index/flot";
	}
	
	//메뉴판매 현황 화면 이동
	@RequestMapping(value="/menu_chart")
	public String Chart_go(){
		return "/test_index/chartjs";
	}
	
	//새로운 탬플릿 달력 화면 이동
		@RequestMapping(value="/Calendar")
		public String Calendar(){
			return "/test_index/calendar";
		}
	//새로운 탬플릿 메인화면 이동
	@RequestMapping(value="/test_index/index")
	public String main(){
		return "/test_index/index";
	}
	
	
}
