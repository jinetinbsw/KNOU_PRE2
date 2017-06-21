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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.possys.Payment_service.Payment;
import kr.or.possys.Staff_service.Staff;
import kr.or.possys.Staff_service.Staff_Dao;
import kr.or.possys.food_service.Food;

@Controller
public class Staff_Controller {
	
	@Autowired
	private Staff_Dao sdao;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		System.out.println("메인 화면 나오는 메서드 실행 Staff_Controller.java");
		
		return "main";
	}
	
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String home() {
		System.out.println(" index 화면(로그인화면) 나오는 메서드 실행 Staff_Controller.java");
		
		return "join";
	}
	//관리자 페이지로 이동시켜주는 메서드
	@RequestMapping(value = "/home")
	public String home2() {
		System.out.println(" index 화면 실행 확인 Staff_Controller.java");
		
		return "index2";
	}
	//폼에서 로그인 버튼 눌렀을때 실행
	//로그인 체크 메서드
	@RequestMapping(value = "/loginAction", method = RequestMethod.POST)
	public String login(HttpServletRequest request) {
		System.out.println(" loginAction 메서드 실행 확인 Staff_Controller.java");
		String id = request.getParameter("usercode");
		String pw = request.getParameter("password");
			
		/*System.out.println(id+"id값");
		System.out.println(pw+"pw값");*/
		Staff s = sdao.loginSelect(id);
		
		/*System.out.println(s.getStaff_date()+"<< 입사날짜");
		*/
		String Staff_date = s.getStaff_date().substring(0, 10);
		/*System.out.println(s+"<<<리턴값 확인");*/
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
							map.put("admin_date", Staff_date);
							request.getSession().setAttribute("admin", map);
							
							System.out.println(" 로그인 정보 일치 관리자화면 이동 Staff_Controller.java");
							returnURL = "redirect:/test_index/index"; // 일치하면 관리자 화면으로 이동
						//권한별 화면 출력 권한이 매니저일때
							}
							
							else if(s.getStaff_level().equals("매니저")){
							Map<String,Object> map = new HashMap<String,Object>();
							map.put("Staff_id",s.getStaff_id());
							map.put("Staff_name",s.getStaff_name());
							map.put("Staff_level", s.getStaff_level());
							map.put("Staff_date", Staff_date);
							request.getSession().setAttribute("Staff", map);
							
							System.out.println(" 로그인 정보 일치 스탭화면 이동 Staff_Controller.java");
							returnURL = "redirect:/home"; // 일치하면 스탭 화면으로 이동
				
							}
							
							else{
								
								returnURL = "redirect:/join";
							}
						
				}else{
				System.out.println(" 로그인 정보 일치하지 않음 로그인창 이동 Staff_Controller.java");
				returnURL = "redirect:/join"; // 일치하지 않으면 로그인페이지 재이동
				}
		
		}else {
			System.out.println(" 로그인 정보 일치하지 않음 로그인창 이동 Staff_Controller.java");
			returnURL = "redirect:/join"; // 일치하지 않으면 로그인페이지 재이동
			
		}
		
		return returnURL;
	}
	
	//로그아웃 버튼 클릭시 로그인 폼으로 이동시켜주는 메서드
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		System.out.println(" 컨트롤러 로그아웃 메서드 실행 Staff_Controller.java");	
		request.getSession().invalidate();
		request.getSession().removeAttribute("admin");
		request.getSession().removeAttribute("Staff");
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
	
	//직원아이디 중복체크
		@ResponseBody
		@RequestMapping(value="/tori/staff/chkDupStaffId")
		public String checkCardId(@RequestParam(value="prmId",required=true) String staff_id) throws Exception{
			System.out.println("checkStaffId");
			System.out.println(staff_id);
			int checkStaffId = sdao.check_staffid(staff_id); // checkCardId에 넣어지는 값은 0 아니면 1.. 이것을 String타입으로 반환하여야 한다. 그래서 아래의 조건분기(1이면 중복, 0이면 사용가능)가 만들어져야 한다.
			System.out.println(checkStaffId);
			String duvalue = null;
			if(checkStaffId==0){
				System.out.println("아이디 사용가능");
				duvalue = "Y";
			}else{
				System.out.println("아이디가 중복되었어요");
				duvalue = "N";
			}
			
			return duvalue;
		}
		
	//직원폰번호 중복체크
			@ResponseBody
			@RequestMapping(value="/tori/staff/chkDupStaffPhone")
			public String checkStaffPhone(@RequestParam(value="prmId",required=true) String staff_phone) throws Exception{
				System.out.println("checkStaffPhone");
				System.out.println(staff_phone);
				int checkStaffPhone = sdao.check_staffphone(staff_phone); // checkCardId에 넣어지는 값은 0 아니면 1.. 이것을 String타입으로 반환하여야 한다. 그래서 아래의 조건분기(1이면 중복, 0이면 사용가능)가 만들어져야 한다.
				System.out.println(checkStaffPhone);
				String duvalue = null;
				if(checkStaffPhone==0){
					System.out.println("아이디 사용가능");
					duvalue = "Y";
				}else{
					System.out.println("아이디가 중복되었어요");
					duvalue = "N";
				}
					
				return duvalue;
			}
	
	
	// 직원추가 폼으로 진입
	@RequestMapping(value="/tori/staff/staff_add_form", method = RequestMethod.GET)
	public String staffadd(){
		System.out.println("01 Staff_Controller.java -> staffadd");
		return "/tori/staff/staff_add_form";
	}
	
	// 직원추가 액션 진입
	@RequestMapping(value="/tori/staff/staff_add_action", method = RequestMethod.POST)
	public String staffadd(Staff Staff){
		System.out.println("01_1 Staff_Controller.java -> paymentadd");
		
		String id = Staff.getStaff_id();
		System.out.println(id+"<------- 컨트롤러 값을 확인한다.");
		
		sdao.insertStaff(Staff);
		return "redirect:/tori/staff/staff_list";
	}
	
	// 직원 목록 보기 페이지 진입
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
	
	//조건별 검색 폼으로 진입
		@RequestMapping(value={"/tori/staff/staff_search_form"}, method = RequestMethod.GET)
		public String staffsearch(){
			System.out.println("staffsearchform");
			return "/tori/staff/staff_search_form";
		}
	
	//조건별 검색 리스트 표현
		@RequestMapping(value={"/tori/staff/staff_search_action"}, method = RequestMethod.POST)
		public String staffSRsearch(Model model,
				@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
				@RequestParam(value="select") String select,
				@RequestParam(name="keyWord") String keyWord){
			System.out.println("staffSRlist");
			int staffSRcount = sdao.staffSRlist(select,keyWord);
			int pagePerRow = 10;
			int lastPage = (int)(Math.ceil((double)staffSRcount/(double)pagePerRow));
			List<Staff> list = sdao.staffSRsearch(select, keyWord, currentPage, pagePerRow);
			int expage = 1;
			
			model.addAttribute("select",select);
			model.addAttribute("keyWord",keyWord);
			model.addAttribute("expage",expage);
			model.addAttribute("pagePerRow",pagePerRow);
			model.addAttribute("staffSRcount",staffSRcount);
			model.addAttribute("currentPage",currentPage);
			model.addAttribute("lastPage",lastPage);
			model.addAttribute("list",list);
			
			return "redirect:/tori/staff/staff_search_list";
			
		}
		
	//조건별 검색결과 리스트 표현
		@RequestMapping(value={"/tori/staff/staff_search_list"}, method = RequestMethod.GET)
		public String paymentSRlist(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
				,@RequestParam(value="select") String select
				,@RequestParam(value="keyWord") String keyWord){
			System.out.println("stafflist");
			int staffSRcount = sdao.staffSRlist(select,keyWord);
			System.out.println(staffSRcount);
			System.out.println("stafflist");
			int pagePerRow = 10;
			int expage = 1;
			int lastPage = (int)(Math.ceil((double)staffSRcount/(double)pagePerRow));
			List<Staff> staffSRsearch = sdao.staffSRsearch(select,keyWord,currentPage, pagePerRow);
			System.out.println(staffSRcount);
			System.out.println(Math.ceil(staffSRcount/pagePerRow));
			System.out.println(lastPage);
			// paymentcount 및 pagePerRpw(구 pageRow -> list페이지에는 pagePerRow로 el식의 이름이 작성되어 있는 것을 확인하고(무분별 복붙의 폐해) 변수명을 해당 이름에 맞게 수정 및 double형 타입 캐스팅)
			
			model.addAttribute("select",select);
			model.addAttribute("keyWord",keyWord);
			model.addAttribute("expage",expage);
			model.addAttribute("pagePerRow",pagePerRow);
			model.addAttribute("staffSRcount", staffSRcount);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("staffSRsearch",staffSRsearch);
			
			return "/tori/staff/staff_search_list";
			
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
		
	/*//staff_id 중복체크
		@ResponseBody
		@RequestMapping(value="/tori/staff/chkDupStaffId")
		public String checkStaffId(@RequestParam(value="prmId",required=true)String staff_id) throws Exception{
			System.out.println("checkStaffId");
			System.out.println(staff_id);
			int checkStaffId = sdao.check_sid(staff_id);
			System.out.println(checkStaffId);
			String duvalue = null;
			if(checkStaffId == 0){
				System.out.println("아이디 사용가능");
				duvalue = "Y";
			}else{
				System.out.println("아이디가 중복되었어요");
				duvalue = "N";
			}
			
			return duvalue;
		}*/
}
