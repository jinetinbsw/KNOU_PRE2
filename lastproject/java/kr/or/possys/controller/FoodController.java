package kr.or.possys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.possys.food_service.Food;
import kr.or.possys.food_service.Food_Dao;

@Controller
public class FoodController {
	@Autowired
	private Food_Dao dao;
	
	/*@RequestMapping(value="/", method = RequestMethod.GET)
	public String start(){
		return "index";
	}*/
	//식재료 전체/등록/미등록 리스트 select
	@RequestMapping(value="sel_list",method= RequestMethod.GET)
	public String sel_list(@RequestParam(value="sel_list") String sel_list){
		System.out.println("00_FoodController.java ->> sel_list();");
		System.out.println(sel_list+"<<==sel_list");
		String re = null;
		if(sel_list.equals("sel_all")){
			System.out.println(sel_list+"<== sel_all");
			re = "redirect:/food_list";
		}else if(sel_list.equals("sel_y")){
			System.out.println(sel_list+"<== sel_y");
			re = "redirect:/food_list?sel_list="+sel_list;
		}else if(sel_list.equals("sel_n")){
			System.out.println(sel_list+"<== sel_n");
			re = "redirect:/food_list?sel_list="+sel_list;
		}
		return re;
	}
	
	
	//식재료 입력폼 요청
	@RequestMapping(value="/food_add_form", method = RequestMethod.GET)
	public String foodadd(){
		System.out.println("01_FoodController.java ->>foodadd 폼 요청");
		return "/wonbin/food_manage/food_add_form";
	}
	//식재료 입력액션 요청
	@ResponseBody
	@RequestMapping(value="/food_add_form", method = RequestMethod.POST)
	public void foodadd(Food food){
		System.out.println("02_FoodController.java ->>foodadd 액션 요청");
		dao.insertfood(food);
//		return "redirect:/food_list";
	}
	//식재료 목록 요청
	@RequestMapping(value="/food_list", method = RequestMethod.GET)
	public String foodlist(Model model, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
									,@RequestParam(value="sel_list",required=false,defaultValue="go") String sel_list){
		System.out.println("FoodController.java ->>foodlist 요청");
		System.out.println(sel_list+"<=== sel_list");
		String re = null;
		int pageRow = 50;
		int expage = 1;
		if(sel_list.equals("sel_y")){
			int getselcount = dao.getsel_count();
			System.out.println(getselcount);
			int y_lastPage = (int)(Math.ceil((double)getselcount/(double)pageRow));
			List<Food> y_list = dao.foody_list(currentPage, pageRow);
			model.addAttribute("expage",expage);
			model.addAttribute("pageRow",pageRow);
			model.addAttribute("foodcount", getselcount);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("lastPage", y_lastPage);
			model.addAttribute("list", y_list);
			model.addAttribute("sel_list", sel_list);
			re = "/wonbin/food_manage/food_list";
		}else if(sel_list.equals("sel_n")){
			int foodcount = dao.getfoodcount();
			int getselcount = dao.getsel_count();
			int get_nselcount = foodcount - getselcount;
			System.out.println(get_nselcount+"<== 전체 카운터에서 등록된 카운터 빼기 (등록안된 수)");
			int n_lastPage = (int)(Math.ceil((double)get_nselcount/(double)pageRow));
			List<Food> n_list = dao.foodn_list(currentPage, pageRow);
			model.addAttribute("expage",expage);
			model.addAttribute("pageRow",pageRow);
			model.addAttribute("foodcount", get_nselcount);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("lastPage", n_lastPage);
			model.addAttribute("list", n_list);
			model.addAttribute("sel_list", sel_list);
			re = "/wonbin/food_manage/food_list";
//			
		}else if(sel_list.equals("go") || sel_list.equals("sel_all")){
		int foodcount = dao.getfoodcount();		
		int lastPage = (int)(Math.ceil((double)foodcount/(double)pageRow));
		List<Food> list = dao.foodlist(currentPage, pageRow);
		
		model.addAttribute("expage",expage);
		model.addAttribute("pageRow",pageRow);
		model.addAttribute("foodcount", foodcount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		re = "/wonbin/food_manage/food_list";
		}
		
		
		return re;
	}
	//식재료 수정화면 요청
	@RequestMapping(value="/food_modify_view", method = RequestMethod.GET)
	public String foodview(Model model, @RequestParam(value="food_id",required=true) String food_id){
		System.out.println("FoodController.java ->>foodview 요청");
		Food food = dao.foodview(food_id);
		model.addAttribute("food",food);
		return "/wonbin/food_manage/food_modify_view";
	}
	//식재료 수정액션 요청
	@RequestMapping(value="/food_modify", method = RequestMethod.POST)
	public String foodmodify(Food food){
		System.out.println("FoodController.java ->>foodmodify 요청");
		dao.foodmodify(food);
		return "redirect:/food_list";
		
	}
	//식재료 삭제 요청
	@RequestMapping(value="/food_delete", method = RequestMethod.GET)
	public String fooddelete(@RequestParam(value="food_id", required=true) String food_id){
		dao.fooddelete(food_id);
		return "redirect:/food_list";
	}
	//식재료 검색 요청
	@RequestMapping(value="/food_search", method = RequestMethod.GET)
	public String foodSRlist(Model model, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
			,@RequestParam(value="selbox") String selbox
			,@RequestParam(name="keyWord") String keyWord){
			
		int foodSRcount = dao.foodSRlist(selbox,keyWord);
		int pageRow = 20;
		int expage = 1;
		int lastPage = (int)(Math.ceil((double)foodSRcount/(double)pageRow));
		List<Food> list = dao.foodsearch(selbox, keyWord, currentPage, pageRow);
		
		model.addAttribute("expage",expage);
		model.addAttribute("pageRow",pageRow);
		model.addAttribute("foodcount", foodSRcount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		
				
		return "/wonbin/food_manage/food_list";
	
	}
		
}
