package kr.or.possys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.possys.Menu_service.Menu;
import kr.or.possys.Menu_service.Menu_Dao;


@Controller
public class menu_Controller {
	@Autowired
	private Menu_Dao dao;
	//메뉴 화면
	@RequestMapping(value="/menu_add_form", method = RequestMethod.GET)
	public String menuadd(){
		return "/zeus/menu_add_form";
	}
	//메뉴 목록
	@RequestMapping(value="/menu_add_form", method = RequestMethod.POST)
	public String menuadd(Menu menu){
		System.out.println("02_menuController.java ->>menuadd 액션 요청");
		dao.insertmenu(menu);
		return "redirect:/menu_list";
	}
	@RequestMapping(value="/menu_list", method = RequestMethod.GET)
	public String menulist(Model model, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		System.out.println("menuController.java ->>menulist 요청");
		int foodcount = dao.getmenucount();
		int pageRow = 20;
		int lastPage = (int)(Math.ceil((double)foodcount/(double)pageRow));
		List<Menu> list = dao.menulist(currentPage, pageRow);
		model.addAttribute("foodcount", foodcount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("foodcount", foodcount);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		return "/zeus/menu_list";
	}
	//메뉴 수정 
	@RequestMapping(value="/menu_view", method = RequestMethod.GET)
	public String menuview(Model model, @RequestParam(value="menu_id",required=true) String menu_id){
		System.out.println("MenuController.java ->>menuview 요청");
		Menu menu = dao.menuview(menu_id);
		model.addAttribute("menu",menu);
		return "/zeus/menu_modify_view";
	}
	//메뉴 수정액션 요청
	@RequestMapping(value="/menu_modify", method = RequestMethod.POST)
	public String menumodify(Menu menu){
		System.out.println("MenuController.java ->>menumodify 요청");
		dao.menumodify(menu);
		return "redirect:/menu_list";
		
	}
	//메뉴 삭제 요청
	@RequestMapping(value="/menu_delete", method = RequestMethod.GET)
	public String menudelete(@RequestParam(value="menu_id", required=true) String menu_id){
		dao.menudelete(menu_id);
		return "redirect:/menu_list";
	}
	//메뉴 검색
	@RequestMapping(value="/menu_search", method = RequestMethod.GET)
	public String menuSRlist(Model model, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
			,@RequestParam(value="selbox") String selbox
			,@RequestParam(name="keyWord") String keyWord){
			
		int menuSRcount = dao.menuSRlist(selbox,keyWord);
		int pageRow = 20;
		int lastPage = (int)(Math.ceil((double)menuSRcount/(double)pageRow));
		List<Menu> list = dao.menusearch(selbox, keyWord, currentPage, pageRow);
			
		model.addAttribute("pageRow",pageRow);
		model.addAttribute("menucount", menuSRcount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		
				
		return "/zeus/menu_list";
	
	}
	
	

}
	
