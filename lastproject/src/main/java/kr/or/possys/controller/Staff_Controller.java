package kr.or.possys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.possys.Staff_service.Staff;
import kr.or.possys.Staff_service.Staff_Dao;
import kr.or.possys.food_service.Food;

@Controller
public class Staff_Controller {
	
	@Autowired
	private Staff_Dao sdao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println(" index 화면(로그인화면) 나오는 메서드 실행 Staff_Controller.java");
		
		return "join";
	}
	//관리자 페이지로 이동시켜주는 메서드
	@RequestMapping(value = "/home")
	public String home2() {
		System.out.println(" index 화면 실행 확인 Staff_Controller.java");
		
		return "index";
	}
	//폼에서 로그인 버튼 눌렀을때 실행
	//로그인 체크 메서드
	@RequestMapping(value = "/loginAction", method = RequestMethod.POST)
	public String login(HttpServletRequest request) {
		System.out.println(" loginAction 메서드 실행 확인 Staff_Controller.java");
		String id = request.getParameter("usercode");
		String pw = request.getParameter("password");
	
		Staff s = sdao.loginSelect(id);
	
		String returnURL = "";
		
		//폼에서 받은 아이디 패스워드 일치시 admin 세션 key 생성
		if(s != null){
			if(s.getStaff_id().equals(request.getParameter("usercode")) && s.getStaff_pw().equals(request.getParameter("password"))){
						//권한별 화면 출력 권한이 사장일때
							if(s.getStaff_level().equals("사장")){
							Map<String,Object> map = new HashMap<String,Object>();
							map.put("admin_id",s.getStaff_id());
							map.put("admin_name",s.getStaff_name());
							map.put("admin_level", s.getStaff_level());
							request.getSession().setAttribute("admin", map);
							
							System.out.println(" 로그인 정보 일치 관리자화면 이동 Staff_Controller.java");
							returnURL = "redirect:/home"; // 일치하면 관리자 화면으로 이동
						//권한별 화면 출력 권한이 매니저일때
							}
							
							if(s.getStaff_level().equals("매니저")){
							Map<String,Object> map = new HashMap<String,Object>();
							map.put("Staff_id",s.getStaff_id());
							map.put("Staff_name",s.getStaff_name());
							map.put("Staff_level", s.getStaff_level());
							request.getSession().setAttribute("Staff", map);
							
							System.out.println(" 로그인 정보 일치 스탭화면 이동 Staff_Controller.java");
							returnURL = "redirect:/Staff"; // 일치하면 스탭 화면으로 이동
				
						}
				}else{
				System.out.println(" 로그인 정보 일치하지 않음 로그인창 이동 Staff_Controller.java");
				returnURL = "redirect:/"; // 일치하지 않으면 로그인페이지 재이동
				}
		
		}else {
			System.out.println(" 로그인 정보 일치하지 않음 로그인창 이동 Staff_Controller.java");
			returnURL = "redirect:/"; // 일치하지 않으면 로그인페이지 재이동
			
		}
		
		return returnURL;
	}
	
	//로그아웃 버튼 클릭시 로그인 폼으로 이동시켜주는 메서드
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		System.out.println(" 컨트롤러 로그아웃 메서드 실행 Staff_Controller.java");	
		request.getSession().invalidate();
		request.getSession().removeAttribute("admin");
		return "join";
		
	}
	//스탭 페이지로 이동시켜주는 메서드
	@RequestMapping(value = "/Staff")
	public String Staff() {
		System.out.println(" Staff 화면 실행 확인 Staff_Controller.java");
		
		
		return "Staff";
	}
	
	/*@RequestMapping(value="/", method = RequestMethod.GET)
	public String start(){
		return "home";
	}*/
	
	@RequestMapping(value="/tori/staff/staff_add_form", method = RequestMethod.GET)
	public String staffadd(){
		System.out.println("01 Staff_Controller.java -> staffadd");
		return "/tori/staff/staff_add_form";
	}
	
	@RequestMapping(value="/tori/staff/staff_add_action", method = RequestMethod.POST)
	public String staffadd(Staff Staff){
		System.out.println("01_1 Staff_Controller.java -> paymentadd");
		
		String id = Staff.getStaff_id();
		System.out.println(id+"<------- 컨트롤러 값을 확인한다.");
		
		sdao.insertStaff(Staff);
		return "redirect:/tori/staff/staff_list";
	}
	
	@RequestMapping(value={"/tori/staff/staff_list"}, method = RequestMethod.GET)
	public String stafflist(Model model, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage){
		System.out.println("02_Staff_Controller.java -> stafflist");
		int staffcount = sdao.getStaffCount();
		System.out.println(staffcount);
		System.out.println("02_1 Staff_Controller.java -> stafflist");
		int pagePerRow = 10;
		int expage = 1;
		int lastPage = (int)(Math.ceil((double)staffcount/(double)pagePerRow));
		List<Staff> list = sdao.getStaffList(currentPage, pagePerRow);
		System.out.println(staffcount);
		System.out.println(Math.ceil(staffcount/pagePerRow));
		System.out.println(lastPage);
		// paymentcount 및 pagePerRpw(구 pageRow -> list페이지에는 pagePerRow로 el식의 이름이 작성되어 있는 것을 확인하고(무분별 복붙의 폐해) 변수명을 해당 이름에 맞게 수정 및 double형 타입 캐스팅)
		
		model.addAttribute("expage",expage);
		model.addAttribute("pagePerRow",pagePerRow);
		model.addAttribute("staffcount",staffcount);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("list",list);
		
		return "/tori/staff/staff_list";
		
	}
	
	//리스트에서 뷰로 넘어간다
		@RequestMapping(value={"/tori/staff/staff_view"}, method = RequestMethod.GET)
		public String stafftview(Model model , @RequestParam(value="staff_id",required=true) String staff_id){
			System.out.println("03_Payment_Controller.java -> paymentview");
			Staff staff = sdao.getStaff(staff_id);
			model.addAttribute("staff",staff);
			return "/tori/staff/staff_view";
		}
		
	//얻벳폼으로 이동한다
		@RequestMapping(value={"/tori/staff/staff_update_form"}, method = RequestMethod.GET)
		public String staffupdate(Model model , @RequestParam(value="staff_id",required=true) String staff_id){
			Staff staff = sdao.getStaff(staff_id);
			model.addAttribute("staff",staff);
			return "/tori/staff/staff_update_form";
		}
		
	
	//업뎃폼에서 업뎃액션 진행
		@RequestMapping(value={"/tori/staff/staff_update_action"}, method = RequestMethod.POST)
		public String staffupdate(Staff staff){
			sdao.updateStaff(staff);
			return "redirect:/tori/staff/staff_list";
		}
	
	//삭제폼으로 이동한다
		@RequestMapping(value={"/tori/staff/staff_delete_form"}, method = RequestMethod.GET)
		public String staffdelete(Model model, @RequestParam(value="staff_id",required=true) String staff_id){
			Staff staff = sdao.getStaff(staff_id);
			model.addAttribute("staff", staff);
			return "/tori/staff/staff_delete_form";
		}
	
	//삭제실행
		@RequestMapping(value={"/tori/staff/staff_delete_action"}, method = RequestMethod.POST)
		public String staffdelete(@RequestParam(value="staff_id",required=true) String staff_id,
								@RequestParam(value="staff_pw",required=true) String staff_pw){
			sdao.deleteStaff(staff_id, staff_pw);
			return "redirect:/tori/staff/staff_list";
		}
}
