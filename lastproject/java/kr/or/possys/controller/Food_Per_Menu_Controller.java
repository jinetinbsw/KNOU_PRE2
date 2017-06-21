
package kr.or.possys.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.possys.Menu_service.Menu;
import kr.or.possys.Menu_service.Menu_Dao;
import kr.or.possys.Menu_service.Menu_Food;
import kr.or.possys.Menu_service.Per;
import kr.or.possys.Menu_service.Per_Dao;
import kr.or.possys.food_service.Food;

@Controller
public class Food_Per_Menu_Controller {
	@Autowired
	private Per_Dao dao;
	//메뉴 화면
	
	
	@RequestMapping(value="/menu_per_view", method = RequestMethod.GET)
	public String menuperview(Model model, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage	){
			int foodcount = dao.getmenucount();
			int pageRow = 10;
			int lastPage = (int)(Math.ceil((double)foodcount/(double)pageRow));
			List<Per> list = dao.perlist(currentPage, pageRow);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("foodcount", foodcount);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("list", list);
			return "/zeus/menu_per_view";
	}
	//메뉴
	@RequestMapping(value="/menu_searchz", method = RequestMethod.GET)
	public String menuSRlist(Model model, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
			,@RequestParam(value="selbox") String selbox
			,@RequestParam(name="keyWord") String keyWord
			,@RequestParam(name="menu_id") String menu_id
			,@RequestParam(name="menu_name") String menu_name
			){
			
		int menuSRcount = dao.foodSRlist(selbox,keyWord);
		int pageRow = 10;
		int lastPage = (int)(Math.ceil((double)menuSRcount/(double)pageRow));
		List<Food> list = dao.foodsearch(selbox, keyWord, currentPage, pageRow);
			
		model.addAttribute("pageRow",pageRow);
		model.addAttribute("menucount", menuSRcount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		model.addAttribute("menu_id", menu_id);
		model.addAttribute("menu_name", menu_name);
		
				
		return "/zeus/menu_per_view";
	
	}
	@RequestMapping(value="/menu_per_modify", method = RequestMethod.GET)
	public String menuview(Model model, @RequestParam(value="menu_id",required=true) String menu_id ,
										@RequestParam(value="food_id",required=true) String food_id){
		System.out.println(menu_id);
		System.out.println(food_id);
		System.out.println("인식 완료");
		Menu menu = dao.menuview(menu_id);
		Food food = dao.menuview01(food_id);
		model.addAttribute("menu",menu);
		model.addAttribute("food",food);
		return "/zeus/menu_per_modify";
	}
	//식자재 등록
	@RequestMapping(value="/menu_modify2", method = RequestMethod.POST)
    public String menuinsert(Menu_Food mf){
		System.out.println(mf);
        Menu menu1 = dao.menuinsert(mf);
        return "redirect:/menu_list";
    }
	
	@RequestMapping(value="/ep_chck")
	@ResponseBody
		public int ep_chck(@RequestParam(value="food_id", required=true) String food_id ,
						   @RequestParam(value="menu_id", required=true) String menu_id
												,HttpServletResponse response) throws Exception{ 
		System.out.println("06_ep_chck실행 -Ep_OF_Details_Controller.java" );
		System.out.println(food_id+"<=== 식재코드!");
		int chk_count = dao.aj_ep_chck(food_id,menu_id);			
		return chk_count;	
	}
	
}