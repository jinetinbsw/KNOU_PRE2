package kr.or.possys.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Spliterator;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.possys.Menu_service.Menu;
import kr.or.possys.Menu_service.Menu_Dao;

import kr.or.possys.Order_service.Order;
import kr.or.possys.Order_service.Order_Dao;



@Controller
public class Order_Controller{
	@Autowired
	private Order_Dao odao;


	@RequestMapping(value="/order_list", method = RequestMethod.GET)
	public String order_list(Model model,@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage){
		System.out.println("오더리스트 요청");
		int order_count = odao.get_order_count();
		System.out.println(order_count);
		int pagePerRow = 10;
		int expage = 1;
		int lastPage = (int)(Math.ceil((double)order_count/(double)pagePerRow));
		
		
		
		List<Order> list = odao.get_order_list(currentPage, pagePerRow);
		model.addAttribute("order_list", list);
		model.addAttribute("expage",expage);
		model.addAttribute("pagePerRow",pagePerRow);
		model.addAttribute("order_count",order_count);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		
		return "/order/order_list";
	}
	
	@RequestMapping(value="/order_search_list", method = RequestMethod.GET)
	public String order_search_list(Model model,@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
			,@RequestParam(value="selbox") String selbox
			,@RequestParam(name="keyWord") String keyWord){
		
		System.out.println("오더리스트 요청");
		int order_count = odao.get_order_search_count(selbox,keyWord);
		System.out.println(order_count);
		int pagePerRow = 10;
		int expage = 1;
		int lastPage = (int)(Math.ceil((double)order_count/(double)pagePerRow));
		
		System.out.println(selbox+"/"+keyWord+"/"+currentPage+"/"+pagePerRow+"////");		
		
		
		List<Order> list = odao.get_order_search_list(selbox, keyWord,currentPage, pagePerRow);
		model.addAttribute("order_list", list);
		model.addAttribute("expage",expage);
		model.addAttribute("pagePerRow",pagePerRow);
		model.addAttribute("order_count",order_count);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		
		return "/order/order_list";
	}
	

	
	@RequestMapping(value="/order_detail", method = RequestMethod.GET)
	public String order_detail(Model model,@RequestParam(value="table_order_id") String table_order_id){
		System.out.println("주문상세 요청");
		Order order = odao.order_modify_form(table_order_id);
		List<Order> list = odao.order_detail(table_order_id);
		model.addAttribute("order",order);
		model.addAttribute("order_list",list);
		return "/order/order_detail";
	}
	
	@RequestMapping(value="/order_end_t", method = RequestMethod.GET)
	public String order_end_t(Model model,@RequestParam(value="table_order_id") String table_order_id){

		System.out.println("주문처리");
		List<Order> list = odao.order_detail(table_order_id);
		/*System.out.println("주문처리2"+list.get(0).getOrder_detail_end_ea());*/
		List<Order> list2;
		List<Order> list3;

		/*odao.order_end_t(table_order_id);*/
		for(int i = 0; i < list.size(); i++){
			System.out.println(list.get(i).getMenu_id()+"//"+list.get(i).getOrder_detail_ea()+"//"+list.get(i).getOrder_detail_end_ea());
		}

		for (int i = 0; i < list.size(); i++){
			if(list.get(i).getOrder_detail_end().equals("f")){
			
			list2 = odao.order_fpm(list.get(i).getMenu_id());
			if(list2.size() != 0){
				System.out.println("리스트사이즈가 0이 아닙니다.");
				for(int j = 0; j< list2.size(); j++){
					list3 = odao.order_ep_order(list2.get(j).getFood_id());
					System.out.println(list2.get(j).getFood_id()+"//푸드아이디");
/*					System.out.println(list2.get(j).getFpm_ea()+"//소비개수"+"//"+list.get(i).getOrder_detail_ea()+"//주문개수");*/
					int fpm = Integer.parseInt(list2.get(j).getFpm_ea());
					int total_ea = Integer.parseInt(list.get(i).getOrder_detail_ea());
					int total_use = (fpm * total_ea);
					int order_detail_end_ea = Integer.parseInt(list.get(i).getOrder_detail_end_ea());
					int end_use = (order_detail_end_ea * fpm);
					
					int final_used = (total_use - end_use); //식재갯수
					int final_ea = (total_ea - order_detail_end_ea); //주문갯수
					
					System.out.println("총소비갯수 : "+total_use+"/종결갯수 : "+order_detail_end_ea+"//total_used"+final_used);
					odao.order_detail_end_t(list.get(i));
					
					if(list3.size() != 0){
						for(int k = 0; k< list3.size(); k++){
							System.out.println(list3.get(k).getFood_nowquantity()+"//식재현황//"+list3.get(k).getEp_order_id());
							int food_now = Integer.parseInt(list3.get(k).getFood_nowquantity());
							int food_sum = food_now - final_used;
							if(food_now != 0 && food_sum > 0&&final_used > 0){
								list3.get(k).setFood_sum(food_sum);
								odao.order_ep_plus(list3.get(k));
								final_used = 0;
								System.out.println("총합 - 현황 > 0"+food_sum);
								
							}
							else if (food_now != 0 && food_sum <= 0 &&final_used > 0){
								System.out.println("총합 - 현황 <= 0");
								final_used -= food_now; 
								System.out.println("식재소비량"+final_used);
								odao.order_ep_zero(list3.get(k));
							}
						}
						
						if(final_used != 0){
							System.out.println("식재가 부족하지 않아?");
						}
					}
				}
			}
			}
		}
		
		
		return "redirect:/order_list";
	}
	
	@RequestMapping(value="/order_modify_action", method = {RequestMethod.GET,RequestMethod.POST})
	public String order_modify_action(Order order){
		System.out.println("수정처리");
		
		/*List<Order> list = new ArrayList<Order>();*/
		
		odao.order_detail_delete(order.getTable_order_id());
		if(order.getMenu_id() != null){
		String [] menu_id = order.getMenu_id().split(",");
		String [] menu_name = order.getMenu_name().split(",");
		String [] order_detail_ea = order.getOrder_detail_ea().split(",");
		String [] order_detail_sum = order.getOrder_detail_sum().split(",");
		String [] order_detail_end = order.getOrder_detail_end().split(",");
		String [] order_detail_end_ea = order.getOrder_detail_end_ea().split(",");
		
		
		for(int i = 0; i < menu_id.length; i++){
			Order order2 = new Order();
			order2.setTable_order_id(order.getTable_order_id());
			order2.setMenu_id(menu_id[i]);
			order2.setMenu_name(menu_name[i]);
			order2.setOrder_detail_ea(order_detail_ea[i]);
			order2.setOrder_detail_sum(order_detail_sum[i]);
			/*order2.setOrder_detail_end(order_detail_end[i]);*/
			order2.setOrder_detail_end("f");
			order2.setOrder_detail_end_ea(order_detail_end_ea[i]);
			
			odao.order_detail_insert(order2);
			System.out.println(order2.getMenu_id()+order2.getTable_order_id());
		}
		
		}
		
/*		for(int i = 0; i < menu_id.length; i++){
			Order order2 = new Order();
			order2.setTable_order_id(order.getTable_order_id());
			order2.setMenu_id(menu_id[i]);
			order2.setMenu_name(menu_name[i]);
			order2.setOrder_detail_ea(order_detail_ea[i]);
			order2.setOrder_detail_sum(order_detail_sum[i]);
			odao.order_detail_modify(order2);
			System.out.println(order2.getMenu_id()+order2.getTable_order_id());
		}*/

		
		
		return "redirect:/order_list";
	}
	
	
	@RequestMapping(value="/order_modify_form", method = RequestMethod.GET)
	public String order_modify_form(Model model,@RequestParam(value="table_order_id") String table_order_id,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		System.out.println("주문수정폼 요청");
		Order order = odao.order_modify_form(table_order_id);
		List<Order> list = odao.order_detail(table_order_id);
		
		for(int i = 0; i< list.size(); i++){
			String menu_id = list.get(i).getMenu_id();
			String menu_price =odao.get_price(menu_id);
			list.get(i).setMenu_price(menu_price);
			System.out.println(list.get(i).getMenu_price()+"가격");
		}
		//메뉴목록시작
		List<Menu> menu_list = odao.menu_list();
		
		List<Order> order_list = odao.order_fpm_all();
		
		List<Order> order_per_list = new ArrayList();
		
		Order order_per = new Order();
		order_per.setMenu_id("first");
		

		
		for(int i = 0; i< order_list.size(); i++){
			
			System.out.println(order_per.getMenu_id()+"확인");
			Order order_now = odao.order_nowquantity(order_list.get(i).getFood_id());
			
			order_list.get(i).setFood_nowquantity(order_now.getFood_nowquantity());
			
			order_list.get(i).setOrder_now_per(Integer.toString(Integer.parseInt(order_list.get(i).getFood_nowquantity())/Integer.parseInt(order_list.get(i).getFpm_ea())));
			
			System.out.println(order_list.get(i).getMenu_id()+"//"+order_list.get(i).getFood_id()+
					"//"+order_list.get(i).getFpm_ea()+"//"+order_list.get(i).getFood_nowquantity()+"//"+order_list.get(i).getOrder_now_per());
			
			if(order_per.getMenu_id().equals(order_list.get(i).getMenu_id())){
				int max_per = Integer.parseInt(order_per.getOrder_max_per());
				int in_per = Integer.parseInt(order_list.get(i).getOrder_now_per());
				if(max_per > in_per){
					order_per.setOrder_max_per(order_list.get(i).getOrder_now_per());
				}
				
			}
			else if(order_per.getMenu_id().equals("first")){
				System.out.println("첫번째");
				order_per.setMenu_id(order_list.get(i).getMenu_id());
				order_per.setOrder_max_per(order_list.get(i).getOrder_now_per());
				System.out.println(order_per.getMenu_id()+"엘스실행"+order_per.getOrder_max_per());
				
			}
			else if(order_per.getMenu_id() != order_list.get(i).getMenu_id()){
				order_per_list.add(order_per);
				order_per = new Order();
				
				order_per.setMenu_id(order_list.get(i).getMenu_id());
				order_per.setOrder_max_per(order_list.get(i).getOrder_now_per());
				System.out.println(order_per.getMenu_id()+"엘스실행"+order_per.getOrder_max_per());
				
			}
			
			if(i+1 == order_list.size()){
				System.out.println("마지막번째");
				order_per_list.add(order_per);
			}
			
		}
		
		for(int i = 0; i< menu_list.size(); i++){
			 menu_list.get(i).setOrder_max_per(order_per_list.get(i).getOrder_max_per());

			System.out.println(menu_list.get(i).getOrder_max_per()+"//"+menu_list.get(i).getMenu_id());
			
		}
		/*for(int i =0; i< list.size(); i++){
			System.out.println(list.get(i).getMenu_id()+"////");
			
		}*/
		for(int i =0; i< menu_list.size(); i++){
			
			for(int j = 0; j < list.size(); j++){
				
				if(list.get(j).getMenu_id().equals(menu_list.get(i).getMenu_id())){
					list.get(j).setOrder_max_per(menu_list.get(i).getOrder_max_per());
					
					System.out.println("실행"+menu_list.get(i).getOrder_max_per()+"입력"+list.get(j).getOrder_max_per());
				}
				
			}
		}
		
		model.addAttribute("menu_list", menu_list);
		
		//메뉴목록끝
		
		model.addAttribute("order",order);
		model.addAttribute("order_list",list);
		return "/order/order_modify_form";
		
	}

	@RequestMapping(value="/order_form", method = {RequestMethod.GET,RequestMethod.POST})
	public String order_form(Model model,Order order){
		System.out.println("카운트실행");
		int table_order_num = order.getTable_order_num();
		int table_num_count = odao.table_num_count(table_order_num);
		System.out.println(table_num_count+"이것을 찾는다.");
		model.addAttribute("table_num_count",table_num_count);
		
		if(table_num_count != 0){
			return "/order/order_table_input";
		}
		else{
		Order order_c = odao.order_count();
		
		/* 일련번호 자동증가 부분*/
		String count = order_c.getOrder_count();
		int counter = Integer.parseInt(count.substring(1, 5))+1;
		String result_id = "t"+String.format("%04d", counter);
		System.out.println(result_id);
		/*일련번호 자동증가부분 종료 과값은 result_id*/
		
		List<Menu> menu_list = odao.menu_list();
		List<Order> order_list = odao.order_fpm_all();
		
		List<Order> order_per_list = new ArrayList();
		
		Order order_per = new Order();
		order_per.setMenu_id("first");
		

		
		for(int i = 0; i< order_list.size(); i++){
			
			System.out.println(order_per.getMenu_id()+"확인");
			Order order_now = odao.order_nowquantity(order_list.get(i).getFood_id());
			
			order_list.get(i).setFood_nowquantity(order_now.getFood_nowquantity());
			
			order_list.get(i).setOrder_now_per(Integer.toString(Integer.parseInt(order_list.get(i).getFood_nowquantity())/Integer.parseInt(order_list.get(i).getFpm_ea())));
			
			System.out.println(order_list.get(i).getMenu_id()+"//"+order_list.get(i).getFood_id()+
					"//"+order_list.get(i).getFpm_ea()+"//"+order_list.get(i).getFood_nowquantity()+"//"+order_list.get(i).getOrder_now_per());
			
			if(order_per.getMenu_id().equals(order_list.get(i).getMenu_id())){
				int max_per = Integer.parseInt(order_per.getOrder_max_per());
				int in_per = Integer.parseInt(order_list.get(i).getOrder_now_per());
				if(max_per > in_per){
					order_per.setOrder_max_per(order_list.get(i).getOrder_now_per());
				}
				
			}
			else if(order_per.getMenu_id().equals("first")){
				System.out.println("첫번째");
				order_per.setMenu_id(order_list.get(i).getMenu_id());
				order_per.setOrder_max_per(order_list.get(i).getOrder_now_per());
				System.out.println(order_per.getMenu_id()+"엘스실행"+order_per.getOrder_max_per());
				
			}
			else if(order_per.getMenu_id() != order_list.get(i).getMenu_id()){
				order_per_list.add(order_per);
				order_per = new Order();
				
				order_per.setMenu_id(order_list.get(i).getMenu_id());
				order_per.setOrder_max_per(order_list.get(i).getOrder_now_per());
				System.out.println(order_per.getMenu_id()+"엘스실행"+order_per.getOrder_max_per());
				
			}
			
			if(i+1 == order_list.size()){
				System.out.println("마지막번째");
				order_per_list.add(order_per);
			}
			
		}
		
		for(int i = 0; i< menu_list.size(); i++){
			 menu_list.get(i).setOrder_max_per(order_per_list.get(i).getOrder_max_per());
			System.out.println(menu_list.get(i).getOrder_max_per()+"//"+menu_list.get(i).getMenu_id());
			
		}
		
		model.addAttribute("result_id",result_id);
		model.addAttribute("menu_list", menu_list);
		model.addAttribute("table_order_num",table_order_num);
		return "/order/order_form";
		}
		
	}
	
	@RequestMapping(value="/order_action", method = {RequestMethod.GET,RequestMethod.POST})
	public String order_action(Order order){
		
		if(order.getMenu_id() != null){
		String [] menu_id = order.getMenu_id().split(",");
		String [] menu_name = order.getMenu_name().split(",");
		String [] order_detail_ea = order.getOrder_detail_ea().split(",");
		String [] order_detail_sum = order.getOrder_detail_sum().split(",");
		odao.order_insert(order);
		
		for(int i = 0; i < menu_id.length; i++){
			Order order2 = new Order();
			order2.setTable_order_id(order.getTable_order_id());
			order2.setResult_id(order.getResult_id());
			order2.setMenu_id(menu_id[i]);
			order2.setMenu_name(menu_name[i]);
			order2.setOrder_detail_ea(order_detail_ea[i]);
			order2.setOrder_detail_sum(order_detail_sum[i]);
			order2.setOrder_detail_end("f");
			order2.setOrder_detail_end_ea("0");
			
			odao.order_detail_insert(order2);
			
			System.out.println(order2.getMenu_id());
		}
		
		} 
		
		return "redirect:/order_list";
	}
	
	@RequestMapping(value="/order_insert", method = RequestMethod.POST)
    public String order_file_insert(Order order, HttpServletRequest request, HttpSession session){
        
        String path = request.getRealPath("/resources/upload");
        String path2 = request.getContextPath()+"/resources/upload";
        System.out.println(path);	
        System.out.println(path2);
        String filename =order.getOrder_file().getOriginalFilename();
        order.setNewname(path2+"/"+filename);
        System.out.println(order.getNewname());
        
        try {
        	order.getOrder_file().transferTo(new File(path+"/"+filename));
        }catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		return null;
	}	
	
	@RequestMapping(value="/order_table_input", method = RequestMethod.GET)
	public String order_table_input(){
		return "/order/order_table_input";
	}
	
	@RequestMapping(value="/order_cancel", method = RequestMethod.GET)
	public String order_cancel(Model model,@RequestParam(value="table_order_id") String table_order_id){
		odao.order_cancel(table_order_id);
		return "redirect:/order_list";
	}
	
	
	@RequestMapping(value="/portfolio", method = RequestMethod.GET)
	public String pot(Model model){

		
		return "/order/portfolio";
	}
	
	
}