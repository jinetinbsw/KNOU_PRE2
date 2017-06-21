package kr.or.possys.controller;


import java.util.ArrayList;
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

import kr.or.possys.ep_order_food_details_service.Ep_Order;
import kr.or.possys.ep_order_manage_service.Ep_Manage;
import kr.or.possys.ep_order_manage_service.Ep_Manage_Dao;
import kr.or.possys.ep_order_manage_service.Ep_Manage_fo_VO;
import kr.or.possys.food_service.Food;



@Controller
public class Ep_Manage_Controller {
	@Autowired
	private Ep_Manage_Dao dao;
	
	
	//######체크박스를 이용한  업체등록 폼
	@RequestMapping(value="/ep_chkbox", method = RequestMethod.POST)
	public String ep_chkbox(Model model
			,@RequestParam(value="food_id") List<String> food_id){
		System.out.println(food_id);

		List<Food> list = new ArrayList<Food>();
		for(String s : food_id){
			//입력폼
			Food food = new Food();
			food.setFood_id(s);
			Food fo = dao.ep_mchck(food);
//			System.out.println(food.getFood_id()+"<<<<<<<<<<<<<<??");
			list.add(fo);
			model.addAttribute("list",list);
		}
		List<Ep_Manage> sel_list = new ArrayList<Ep_Manage>();
		sel_list = dao.ep_msel_list();
		model.addAttribute("sel_list",sel_list);
		
		

		return "/wonbin/ep_order_manage/ep_manage_add_form";
		
	}
	//(업체관리 입력폼 요청)
//	@RequestMapping(value="/ep_manage_add_form", method = RequestMethod.GET)
//	public String ep_madd(Model model
//			,@RequestParam(value="food_id") List<String> food_id){
//		System.out.println("01_Ep_Manage_Controller.java ->>ep_madd 폼 요청");
//		
//		return null/*"/wonbin/ep_order_manage/ep_manage_add_form"*/;
//	}
	//업체관리 입력액션 요청
	@RequestMapping(value="/ep_manage_add_form", method = RequestMethod.POST)
	public String ep_madd(Ep_Manage ep_m
			,@RequestParam(value="food_id") List<String> food_id){
		System.out.println("02_Ep_Manage_Controller.java ->>ep_madd 액션 요청");
//		System.out.println(food_id);
//		System.out.println(ep_m.getEp_director()+"<<<<담당자");
		List<Ep_Manage> list = new ArrayList<Ep_Manage>();

			for(String s : food_id){
				Ep_Manage epm = new Ep_Manage();
				epm.setEp_id(ep_m.getEp_id()); //업체 id가 들어있으면 세팅
				epm.setEp_address(ep_m.getEp_address());
				epm.setEp_name(ep_m.getEp_name());
				epm.setEp_phone(ep_m.getEp_phone());
				epm.setEp_text(ep_m.getEp_text());				
				epm.setEp_director(ep_m.getEp_director());
				epm.setFood_id(s);				
				list.add(epm);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			dao.insertep_m(list); // 업체 리스트에 insert
			dao.insertep_o(list); // 발주리스트 에 해당 값 insert
		
		return "redirect:/ep_manage_list";
	}
	//발주업체 목록 요청
	@RequestMapping(value="/ep_manage_list", method = RequestMethod.GET)
	public String ep_mlist(Model model
			, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		System.out.println("03_Ep_Manage_Controller.java ->>ep_mlist 요청");
		
		
		int ep_mcount = dao.getep_mcount(); //중첩 없이 갯수
		int pageRow = 10;
		int expage = 1;
		int lastPage = (int)(Math.ceil((double)ep_mcount/(double)pageRow));
		
		List<Ep_Manage> list = dao.ep_mlist(currentPage, pageRow);
		
		model.addAttribute("expage",expage);
		model.addAttribute("pageRow",pageRow);
		model.addAttribute("ep_mcount", ep_mcount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
//		System.out.println("천재");
		return "/wonbin/ep_order_manage/ep_manage_list";
	}
	// @@@@@@?@@@@@@@ 발주업체 수정화면 요청
	@RequestMapping(value="/ep_manage_modify_view", method = RequestMethod.GET)
	public String ep_mview(Model model, @RequestParam(value="ep_id",required=true) String ep_id){
		System.out.println("04_Ep_Manage_Controller.java ->>ep_mview 요청");
		
		Ep_Manage ep_m = dao.ep_mview(ep_id); //해당 업체 정보
		List<Ep_Manage_fo_VO> ep_m_fv = dao.ep_mview_fo(ep_id); //업체 관련 식재료 요청
				
		//		for(int i=0;i<ep_m_fo.size();i++){
//		System.out.println(ep_m_fo.get(i)+"담긴값임"); //오류 : 확인해본 결과 주소값이 들어가 있음.
//		}
		model.addAttribute("ep_m_fv",ep_m_fv);	
		model.addAttribute("ep_m",ep_m);
		return "/wonbin/ep_order_manage/ep_manage_modify_view";
	}
	// 발주업체 수정액션 요청
	@RequestMapping(value="/ep_manage_modify", method = RequestMethod.POST)
	public String ep_mmodify(Ep_Manage ep_m
							,@RequestParam(value="food_id", required=false,defaultValue="no") String food_id){
		System.out.println("05_Ep_Manage_Controller.java ->>ep_mmodify 요청");
//		System.out.println(food_id+" <==== food_id");
		if(food_id.equals("no")){
//			System.out.println("no다");			
		}else{
//			System.out.println("no아니다");
			String[] food_id_arr = food_id.split(",");
//			String ep_id = ep_m.getEp_id();
			for(int i=0; i<food_id_arr.length; i++){
//				System.out.println(food_id_arr[i]);
//				System.out.println(ep_id);
				String f_id = food_id_arr[i];
				dao.f_del(f_id);			
			}
		}
		dao.ep_mmodify(ep_m);
		return "redirect:/ep_manage_list";
		
	}
	//발주업체 전체 삭제 요청
	@RequestMapping(value="/ep_manage_delete", method = RequestMethod.GET)
	public String ep_mdelete(@RequestParam(value="ep_id", required=true) String ep_id){
//		System.out.println(ep_id +"<----asd");
		// 식재자현황 테이블도 삭제시키기 위한 default 값 확인
		List<Ep_Order> order = dao.chk_alldel(ep_id);
		dao.ep_mdelete(ep_id, order);
		return "redirect:/ep_manage_list";
	}
	//업체 상세보기에서 식재료 삭제버튼
//		@RequestMapping(value="/f_del_bt", method = RequestMethod.GET)
//		public String f_del_bt(@RequestParam(value="food_id") String food_id
//								,@RequestParam(value="ep_id") String ep_id){
//			System.out.println("Ep_Manage_Controller - f_del_bt() 실행");
////			Ep_Order oder = dao.chk_del(food_id);
//			dao.f_del(food_id,ep_id);
//			return "redirect:/ep_manage_modify_view?ep_id="+ep_id;
//			//redirect : 컨트롤러 value 
//		}
	
	
	//발주업체 검색 요청
//	@RequestMapping(value="/ep_msearch", method = RequestMethod.GET)
//	public String ep_mSRlist(HttpServletRequest request
//			,Model model, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
//			,@RequestParam(value="selbox") String selbox
//			,@RequestParam(name="keyWord") String keyWord){
//
//		int ep_mSRcount = dao.ep_mSRlist(selbox,keyWord);
//		int pageRow = 10;
//		int lastPage = (int)(Math.ceil((double)ep_mSRcount/(double)pageRow));
//		List<Ep_Manage> list = dao.ep_msearch(selbox, keyWord, currentPage, pageRow);
//		int expage = 1;
//		
//		model.addAttribute("selbox",selbox);
//		model.addAttribute("keyWord",keyWord);
//		model.addAttribute("expage",expage);
//		model.addAttribute("pageRow",pageRow);
//		model.addAttribute("ep_mcount", ep_mSRcount);
//		model.addAttribute("currentPage", currentPage);
//		model.addAttribute("lastPage", lastPage);
//		model.addAttribute("list", list);
//		
//				
//		return "/wonbin/ep_order_manage/ep_manage_list";
//	
//	}
}
