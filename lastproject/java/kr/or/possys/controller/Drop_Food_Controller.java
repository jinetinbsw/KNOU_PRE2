package kr.or.possys.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.java.swing.plaf.windows.resources.windows;

import kr.or.possys.drop_food_service.Drop;
import kr.or.possys.drop_food_service.Drop_Dao;



@Controller
public class Drop_Food_Controller {

	@Autowired
	private Drop_Dao dao;
	
	
	//drop 입력폼 요청
	@RequestMapping(value="/drop_add_form", method = RequestMethod.GET)
	public String dropadd(){
		System.out.println("01_Drop_Food_Controller.java ->>dropadd 폼 요청");
		return "/wonbin/drop_food/drop_add_form";
	}
	//식재료 목록 요청
	@RequestMapping(value="/drop_list", method = RequestMethod.GET)
	public String droplist(Model model, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		System.out.println("Drop_Food_Controller.java ->>foodlist 요청");
		int dropcount = dao.getdropcount();
		int pageRow = 10;
		int expage = 1;
		int lastPage = (int)(Math.ceil((double)dropcount/(double)pageRow));
		List<Drop> list = dao.droplist(currentPage, pageRow);
		
		model.addAttribute("expage",expage);
		model.addAttribute("pageRow",pageRow);
		model.addAttribute("dropcount", dropcount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list", list);
		return "/wonbin/drop_food/drop_list";
	}

	//폐기 검색 요청
		@RequestMapping(value="/drop_search", method = RequestMethod.GET)
		public String foodSRlist(HttpServletRequest request
				,Model model, @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
				,@RequestParam(value="selbox") String selbox
				,@RequestParam(name="keyWord") String keyWord){

			int dropSRcount = dao.dropSRlist(selbox,keyWord);
			int pageRow = 10;
			int lastPage = (int)(Math.ceil((double)dropSRcount/(double)pageRow));
			List<Drop> list = dao.dropsearch(selbox, keyWord, currentPage, pageRow);
			int expage = 1;
			
			model.addAttribute("selbox",selbox);
			model.addAttribute("keyWord",keyWord);
			model.addAttribute("expage",expage);
			model.addAttribute("pageRow",pageRow);
			model.addAttribute("dropcount", dropSRcount);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("list", list);
			
					
			return "/wonbin/drop_food/drop_list";
		
		}
	
}
