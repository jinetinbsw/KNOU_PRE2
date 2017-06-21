package kr.or.possys.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	//폐기 입력액션 요청
	@RequestMapping(value="/drop_add_form", method = RequestMethod.POST)
	public String dropadd(Drop drop){
		System.out.println("02_Drop_Food_Controller.java ->>dropadd 액션 요청");
		dao.insertdrop(drop);
		return "redirect:/drop_list";
	}
	//폐기 목록 요청
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
	//폐기 수정화면 요청
	@RequestMapping(value="/drop_modify_view", method = RequestMethod.GET)
	public String dropview(Model model, @RequestParam(value="drop_id",required=true) String drop_id){
		System.out.println("Drop_Food_Controller.java ->>dropview 요청");
		Drop drop = dao.dropview(drop_id);
		model.addAttribute("drop",drop);
		return "/wonbin/drop_food/drop_modify_view";
	}
	//폐기 수정액션 요청
	@RequestMapping(value="/drop_modify", method = RequestMethod.POST)
	public String dropmodify(Drop drop){
		System.out.println("Drop_Food_Controller.java ->>dropmodify 요청");
		dao.dropmodify(drop);
		return "redirect:/drop_list";
		/*return "redirect:/drop_listmodify_view?food_id="+food.getFood_id();*/
	}
	//폐기 삭제 요청
	@RequestMapping(value="/drop_delete", method = RequestMethod.GET)
	public String dropdelete(@RequestParam(value="drop_id", required=true) String drop_id){
		dao.dropdelete(drop_id);
		return "redirect:/drop_list";
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
