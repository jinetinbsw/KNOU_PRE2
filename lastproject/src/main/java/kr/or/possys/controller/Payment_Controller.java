package kr.or.possys.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.possys.Payment_service.Payment;
import kr.or.possys.Payment_service.Payment_Dao;

@Controller
public class Payment_Controller {
	@Autowired
	private Payment_Dao pdao;
	
	// view 페이지가 제대로 표시되도록 하기 위해서 다른 컨트롤러의 루트(/) 값을 모두 지우거나 주석처리해놓음
	
	//Staff 컨트롤러에서 login 페이지를 메인으로 보내기 위해 주석처리 했다 경로 다르게 잡아서 수정바람
	
	/*@RequestMapping(value="/", method = RequestMethod.GET)
	public String start(){
		System.out.println("start");
		return "tori_home";
	}*/
	
	//리스트 입력 폼으로 이동한다
	@RequestMapping(value="/tori/payment/payment_add_form", method = RequestMethod.GET)
	public String paymentadd(){
		System.out.println("01 Payment_Controller.java -> paymentadd");
		return "/tori/payment/payment_add_form";
		//tori_home에서 설정한 경로와 매핑경로값 및 리턴값을 일치하게끔 설정한다.
		
	}
	
	//입력 요청 : 액션으로 이동한다
	@RequestMapping(value="/tori/payment/payment_add_action", method = RequestMethod.POST)
	public String paymentadd(Payment Payment){
		System.out.println("01_1 Payment_Controller.java -> paymentadd");
		
		String id = Payment.getPayment_id();
		System.out.println(id+"<------ 컨트롤러 값 확인 ");
		
		
		pdao.insertPayment(Payment);
		return "redirect:/tori/payment/payment_list";
		
	}
	
	//리스트로 값을 받아온다
	@RequestMapping(value={"/tori/payment/payment_list"}, method = RequestMethod.GET)
	public String paymentlist(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		System.out.println("02_Payment_Controller.java -> paymentlist");
		int paymentcount = pdao.getPaymentCount();
		System.out.println(paymentcount);
		System.out.println("02_1 Payment_Controller.java -> paymentlist");
		int pagePerRow = 10;
		int expage = 1;
		int lastPage = (int)(Math.ceil((double)paymentcount/(double)pagePerRow));
		List<Payment> list = pdao.getPaymentList(currentPage, pagePerRow);
		System.out.println(paymentcount);
		System.out.println(Math.ceil(paymentcount/pagePerRow));
		System.out.println(lastPage);
		// paymentcount 및 pagePerRpw(구 pageRow -> list페이지에는 pagePerRow로 el식의 이름이 작성되어 있는 것을 확인하고(무분별 복붙의 폐해) 변수명을 해당 이름에 맞게 수정 및 double형 타입 캐스팅)
		
		model.addAttribute("expage",expage);
		model.addAttribute("pagePerRow",pagePerRow);
		model.addAttribute("paymentcount", paymentcount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("list",list);
		
		return "/tori/payment/payment_list";
		
	}
	
	
	//리스트에서 뷰로 넘어간다
	@RequestMapping(value={"/tori/payment/payment_view"}, method = RequestMethod.GET)
	public String paymentview(Model model , @RequestParam(value="payment_id",required=true) String payment_id){
		System.out.println("03_Payment_Controller.java -> paymentview");
		Payment payment = pdao.getPayment(payment_id);
		model.addAttribute("payment",payment);
		return "/tori/payment/payment_view";
	}
	
	//검색버튼을 클릭한 후 검색화면으로 넘어간다
	@RequestMapping(value={"/tori/payment/payment_search_form"}, method = RequestMethod.GET)
	public String paymentsearch(){
		System.out.println("04 Payment_Controller.java -> paymentsearch");
		return "/tori/payment/payment_search_form";
		//tori_home에서 설정한 경로와 매핑경로값 및 리턴값을 일치하게끔 설정한다.
		
	}
	
	//조건별 검색 액션으로 수행
	@RequestMapping(value="/tori/payment/payment_search_action", method = RequestMethod.GET)
	public String paymentSRlist(HttpServletRequest request , Model model , 
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
			@RequestParam(value="select") String select,
			@RequestParam(name="keyWord") String keyWord){
		int paymentSRcount = pdao.paymentSRlist(select, keyWord);
		int pagePerRow = 10;
		int lastPage = (int)(Math.ceil((double)paymentSRcount/(double)pagePerRow));
		List<Payment> list = pdao.paymentSearch(select,keyWord,currentPage,pagePerRow);
		int expage = 1;
		
		model.addAttribute("select",select);
		model.addAttribute("keyWord",keyWord);
		model.addAttribute("expage",expage);
		model.addAttribute("pagePerRow",pagePerRow);
		model.addAttribute("paymentSRcount",paymentSRcount);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("list",list);
		
		return "/tori/payment/payment_search_list";
	}
	
}
	
	

