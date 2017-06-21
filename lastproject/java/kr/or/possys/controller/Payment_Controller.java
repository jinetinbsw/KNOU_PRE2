package kr.or.possys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.possys.Cancel_Payment_service.Payment_Cancel;
import kr.or.possys.Cancel_Payment_service.Payment_Cancel_Dao;
import kr.or.possys.Card_Payment_service.Card_Payment;
import kr.or.possys.Card_Payment_service.Card_Payment_Dao;
import kr.or.possys.Payment_service.Payment;
import kr.or.possys.Payment_service.Payment_Dao;

@Controller
public class Payment_Controller {
	@Autowired
	private Payment_Dao pdao;
	@Autowired
	private Payment_Cancel_Dao pcdao;
	//pcdao : 결제취소DAO
	@Autowired
	private Card_Payment_Dao cpdao;
	//cpdao : 카드결제DAO
	
	// view 페이지가 제대로 표시되도록 하기 위해서 다른 컨트롤러의 루트(/) 값을 모두 지우거나 주석처리해놓음
	
	//Staff 컨트롤러에서 login 페이지를 메인으로 보내기 위해 주석처리 했다 경로 다르게 잡아서 수정바람
	
	/*@RequestMapping(value="/", method = RequestMethod.GET)
	public String start(){
		System.out.println("start");
		return "tori_home";
	}*/
	//카드아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/tori/payment/chkDupCardId")
	public String checkCardId(@RequestParam(value="prmId",required=true) String card_id) throws Exception{
		System.out.println("checkCardId");
		System.out.println(card_id);
		int checkCardId = cpdao.check_cpid(card_id); // checkCardId에 넣어지는 값은 0 아니면 1.. 이것을 String타입으로 반환하여야 한다. 그래서 아래의 조건분기(1이면 중복, 0이면 사용가능)가 만들어져야 한다.
		System.out.println(checkCardId);
		String duvalue = null;
		if(checkCardId==0){
			System.out.println("아이디 사용가능");
			duvalue = "Y";
		}else{
			System.out.println("아이디가 중복되었어요");
			duvalue = "N";
		}
		
		return duvalue;
	}
	
	//결제취소아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/tori/payment/chkDupCancelId")
	public String checkCancelId(@RequestParam(value="prmId",required=true) String payment_cancel_id) throws Exception{
		System.out.println("checkCancelId"); 	// 메서드 접근했는지 확인하는 용도로 사용하는 출력문
		System.out.println(payment_cancel_id);	// 메서드 접근 확인 후에 name값이 payment_cancel_id인 텍스트박스에 입력된 값을 가져와서 출력하고 확인하는 용도로 사용한다.
		int checkCancelId = pcdao.check_pcid(payment_cancel_id);	// DAO에서 payment_cancel_id를 매개변수로 하는 check_pcid메서드를 실행한 결과값(반환형은 int)을 checkCancelId 변수에 할당한다.
		System.out.println(checkCancelId);		// checkCancelId 변수에 잘 할당되었는지를 확인하는 과정.
		String duvalue = null;					// Ajax에서 텍스트 타입으로 리턴을 받아오므로 텍스트타입에 해당하는 String형의 변수값을 선언하고 null값으로 초기화해준다.
		if(checkCancelId == 0){
			System.out.println("아이디 사용가능");	// checkCancelId가 0이라면 아이디가 중복되지 않았으므로 사용가능하다는 출력문과 duvalue라는 변수에 아이디가 사용가능하다는 문자열값을 넣어줌.
			duvalue = "Y";
		}else{
			System.out.println("아이디 중복되었음");	// checkCancelId가 1이라면 아이디가 중복되었으므로 사용가능하지 않다는 출력문과 duvalue라는 변수에 아이디가 사용불가하다는 문자열값을 넣어줌.
			duvalue = "N";
		}
		return duvalue;	// 또한 duvalue라는 값을 리턴값으로 설정해줌으로써 아이디중복체크버튼을 클릭하면 아이디가 사용가능하거나 사용불가하다는 안내문을 띄워주는 역할을 한다
	}
	
	
	//결제아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/tori/payment/chkDupId")
	public String checkId(@RequestParam(value="prmId",required=true) String payment_id) throws Exception{
		System.out.println("checkId");
		System.out.println(payment_id);
		int checkId = pdao.check_pid(payment_id);
		System.out.println(checkId);
		String duvalue = null;
		if(checkId == 0){
			System.out.println("아이디 사용가능");
			duvalue = "Y";
		}else{
			System.out.println("아이디 중복되었음");
			duvalue = "N";
		}
		return duvalue;
	}
	
	//테이블주문번호중복체크
	@ResponseBody
	@RequestMapping(value="/tori/payment/ToidCheck")
	public String checkToid(@RequestParam(value="Toid",required=true) String table_order_id) throws Exception{
		System.out.println("01_0_1 Payment_Controller.java -> checkPid");
		System.out.println(table_order_id);
		//String Toid = oddao.getTable_order_id();
		int Toid = pdao.checkToid(table_order_id);
		String duvalue = null;
		System.out.println(Toid);
		if(Toid == 0){
			System.out.println("주문번호 사용가능");
			duvalue = "Y";
		}else{
			System.out.println("주문번호 중복됨");
			duvalue = "N";
		}
		return duvalue;
	}
	
	//회원전화번호중복체크
	@ResponseBody
	@RequestMapping(value="/tori/payment/ToMPhoneCheck")
	public String checkPMPhone(@RequestParam(value="ToMPhone",required=true) String member_phone) throws Exception{
		System.out.println("01_0_2 Payment_Controller.java -> checkPMPhone");
		System.out.println(member_phone);
		int ToMPhone = pdao.checkPMPhone(member_phone);
		String duvalue = null;
		System.out.println(ToMPhone);
		if(ToMPhone == 0){
			System.out.println("회원번호 사용가능");
			duvalue = "Y";
		}else{
			System.out.println("회원번호 중복됨");
			duvalue = "N";
		}
		return duvalue;
	}
	
	//주문가격총합등가져오기
	@ResponseBody
	@RequestMapping(value="/tori/payment/bringOrderList")
	public String bringOrderList(@RequestParam(value="Toid",required=true) String table_order_id) throws Exception{
		System.out.println("01_0_3 Payment_Controller.java -> bringOrderList");
		System.out.println(table_order_id);
		//List<Order> orderList = pdao.bringOrderList(table_order_id);
		int OrderList = pdao.bringOrderList(table_order_id);
		//String duvalue = null;
		System.out.println(OrderList);
		if(OrderList >= 0){
			System.out.println("주문별 가격 확인 가능");
			//duvalue = "Y";
		}else{
			System.out.println("주문별 가격 확인 불가");
			//duvalue = "N";
		}
		String temp_OrderList = Integer.toString(OrderList);
		//정수값을 반환해도 ajax에서 받지 못할 것으로 예상하여 OrderList(결과값이 정수) 변수를 문자열로 형변환시킴
		
		return temp_OrderList;
	}
	
	//마일리지총합가져오기
		@ResponseBody
		@RequestMapping(value="/tori/payment/bringMemberList")
		public String bringMemberList(@RequestParam(value="Toid",required=true) String member_phone) throws Exception{
			System.out.println("01_0_4 Payment_Controller.java -> bringMemberList");
			System.out.println(member_phone);
			//List<Order> orderList = pdao.bringOrderList(table_order_id);
			int MemberList = pdao.bringMemberList(member_phone);
			//String duvalue = null;
			System.out.println(MemberList);
			if(MemberList >= 0){
				System.out.println("마일리지 가져오기 가능");
				//duvalue = "Y";
			}else{
				System.out.println("마일리지 가져오기 불가");
				//duvalue = "N";
			}
			String temp_MemberList = Integer.toString(MemberList);
			//정수값을 반환해도 ajax에서 받지 못할 것으로 예상하여 OrderList(결과값이 정수) 변수를 문자열로 형변환시킴
			
			return temp_MemberList;
		}
	
	//리스트 입력 폼으로 이동한다
	@RequestMapping(value="/tori/payment/payment_add_form", method = RequestMethod.GET)
	public String paymentadd(){
		System.out.println("01 Payment_Controller.java -> paymentadd");
		return "/tori/payment/payment_add_form";
		//tori_home에서 설정한 경로와 매핑경로값 및 리턴값을 일치하게끔 설정한다.
		
	}
	

	
	//입력 요청 : 액션으로 이동한다
	@RequestMapping(value="/tori/payment/payment_add_action", method = RequestMethod.POST)
	public String paymentadd(Payment Payment
			,@RequestParam(value="table_order_id")String table_order_id
			,@RequestParam(value="member_phone")String member_phone){
		System.out.println("01_1 Payment_Controller.java -> paymentadd");
		
		System.out.println(table_order_id +"table_order_id 값 payment_add_action 메서드 실행 Payment_Controller.java");
		System.out.println(member_phone +"member_phone 값 payment_add_action 메서드 실행 Payment_Controller.java");
		
		
		String id = Payment.getPayment_id();
		System.out.println(id+"<------ 컨트롤러 값 확인 ");
		
		String card = Payment.getPayment_cate();
		System.out.println(card+"<-- 결제유형값이 받아와지는지?");
		pdao.insertPayment(Payment);
		pdao.updatePayment(table_order_id);
		pdao.subtractMileage(Payment);
		pdao.addMileage(Payment);
		if(card == "카드")
		{
			return "/tori/payment/payment_card_form";
		//Card_Payment card_payment = new Card_Payment();
		//System.out.println(card_payment);
		//this.paymentcardadd(card);
		//cpdao.insertCardPayment(card_payment);
		//cpdao.insertCardPayment(card);
		}
		
		/*return "redirect:/tori/payment/payment_list";*/
		return "redirect:/receipt?member_phone="+member_phone+"&table_order_id="+table_order_id;
		
		
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
	
	//검색버튼을 클릭한 후 검색화면으로 넘어간다(구현안하는쪽으로 수정)
	@RequestMapping(value={"/tori/payment/payment_search_form"}, method = RequestMethod.GET)
	public String paymentsearch(){
		System.out.println("04 Payment_Controller.java -> paymentsearch");
		return "/tori/payment/payment_search_form";
		//tori_home에서 설정한 경로와 매핑경로값 및 리턴값을 일치하게끔 설정한다.
		
	}
	
	//조건별 검색 리스트 표현
	@RequestMapping(value={"/tori/payment/payment_search_action"}, method = RequestMethod.GET)
	public String paymentSRsearch(Model model , 
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
			@RequestParam(value="select") String select,
			@RequestParam(name="keyWord") String keyWord){
		System.out.println("04_1 Payment_Controller.java -> paymentSRlist");
		int paymentSRcount = pdao.paymentSRlist(select,keyWord);
		//int paymentSRcount = pdao.getPaymentCount();
		int pagePerRow = 10;
		int lastPage = (int)(Math.ceil((double)paymentSRcount/(double)pagePerRow));
		List<Payment> list = pdao.paymentSRsearch(select,keyWord,currentPage,pagePerRow);
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
	
	
	//조건별 검색결과 리스트 표현
	@RequestMapping(value={"/tori/payment/payment_search_list"}, method = RequestMethod.GET)
	public String paymentSRlist(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
			,@RequestParam(value="select") String select
			,@RequestParam(value="keyWord") String keyWord){
		System.out.println("04_2_Payment_Controller.java -> paymentSRlist");
		int paymentSRcount = pdao.paymentSRlist(select,keyWord);
		System.out.println(paymentSRcount);
		System.out.println("06_1 Payment_Controller.java -> paymentSRlist");
		int pagePerRow = 10;
		int expage = 1;
		int lastPage = (int)(Math.ceil((double)paymentSRcount/(double)pagePerRow));
		List<Payment> paymentSRsearch = pdao.paymentSRsearch(select,keyWord,currentPage, pagePerRow);
		System.out.println(paymentSRcount);
		System.out.println(Math.ceil(paymentSRcount/pagePerRow));
		System.out.println(lastPage);
		// paymentcount 및 pagePerRpw(구 pageRow -> list페이지에는 pagePerRow로 el식의 이름이 작성되어 있는 것을 확인하고(무분별 복붙의 폐해) 변수명을 해당 이름에 맞게 수정 및 double형 타입 캐스팅)
		
		model.addAttribute("select",select);
		model.addAttribute("keyWord",keyWord);
		model.addAttribute("expage",expage);
		model.addAttribute("pagePerRow",pagePerRow);
		model.addAttribute("paymentSRcount", paymentSRcount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("paymentSRsearch",paymentSRsearch);
		
		return "/tori/payment/payment_search_list";
		
	}
	
	/*//결제상황을 보고 결제취소버튼을 누른 경우에 실행1
	@RequestMapping(value={"/tori/payment/payment_delete"})
	public String getpayment(Model model , @RequestParam(value="payment_id",required=true) String payment_id){
		System.out.println("05_pre Payment_Controller.java -> getpayment");
		Payment payment = pdao.getPayment(payment_id);
		System.out.println(payment);
		model.addAttribute("payment",payment);
		return "/tori/payment/payment_delete";
		
	}*/
	
	
	//결제상황을 보고 결제취소버튼을 누를 경우에 실행2
	@RequestMapping(value={"/tori/payment/payment_delete"})
	public String paymentcanceladd(Model model,@RequestParam(value="payment_id",required=true) String payment_id){
		System.out.println("05 Payment_Controller.java -> payment_delete");
		System.out.println(payment_id);
		//String id = payment.getPayment_id();
		Payment payment = pdao.getPayment(payment_id);
		//System.out.println(id+"<------ 컨트롤러 값 확인 ");
		//pcdao.insertPaymentCancel(payment_cancel);
		model.addAttribute("payment",payment);
		System.out.println(payment);
		//pdao.insertPaymentCancel(payment);
		return "/tori/payment/payment_cancel_intro";
		
	}
	
	//payment_cancel_intro진입
		@RequestMapping(value={"/tori/payment/payment_cancel_intro"})
		public String paymentcancelintro(Model model,@RequestParam(value="payment_id", required=true) String payment_id){
			System.out.println("05_1 Payment_Controller.java -> payment_cancel_intro");
			System.out.println(payment_id);
			System.out.println(model);
			Payment payment = pdao.getPayment(payment_id);
			model.addAttribute("payment",payment);
			//model.addAttribute("payment_id",payment_id);
			//pdao.insertPaymentCancel(payment_id);
			System.out.println(payment);
			System.out.println(model);
			
			return "/tori/payment/payment_cancel_intro";
			//tori_home에서 설정한 경로와 매핑경로값 및 리턴값을 일치하게끔 설정한다.
			
		}
	
	@RequestMapping(value={"/tori/payment/payment_cancel_ACT"},method = RequestMethod.POST)
	public String paymentdelete(@RequestParam(value="payment_id") String payment_id){
		System.out.println("05_2 Payment_Controller.java -> payment_cancel_ACT");
		/*System.out.println(payment_id);
		System.out.println(model);*/
		
		//Payment payment = new Payment();
		
		/*String payment_id = payment.getPayment_id();*/
		System.out.println(payment_id+"<<<<<<<");
		/*model.addAttribute("payment_cancel",payment_cancel);
		model.addAttribute("payment_id",payment_id);*/
		pdao.PaymentUpdate(payment_id);
		pdao.insertPaymentCancel(payment_id);
		pdao.deletePayment(payment_id);
		cpdao.deleteCard(payment_id);
		
		/*System.out.println(model);*/
		return "redirect:/tori/payment/payment_cancel_list";
		}
	
	// 결제 취소 목록 시작
	
	//리스트 입력 폼으로 이동한다
		@RequestMapping(value="/tori/payment/payment_cancel_form", method = RequestMethod.GET)
		public String paymentcanceladd(){
			System.out.println("01 Payment_Controller.java -> paymentcanceladd");
			return "/tori/payment/payment_cancel_form";
			//tori_home에서 설정한 경로와 매핑경로값 및 리턴값을 일치하게끔 설정한다.
			
		}
		
		//입력 요청 : 액션으로 이동한다
		@RequestMapping(value="/tori/payment/payment_cancel_action", method = RequestMethod.POST)
		public String paymentcanceladd_1(Payment_Cancel payment_cancel){
			System.out.println("01_1 Payment_Controller.java -> paymentadd");
			
			String id = payment_cancel.getPayment_cancel_id();
			System.out.println(id+"<------ 컨트롤러 값 확인 ");
			
			
			pcdao.insertPaymentCancel(payment_cancel);
			return "redirect:/tori/payment/payment_cancel_list";
			
		}
		
		
		//입력 요청 : 액션으로 이동한다(이동하는데 먼젓번의 이동과는 다른 성격을 가지고 있다 : 결제와 결제취소를 연동한다)
		@RequestMapping(value={"/tori/payment/payment_cancel_list"},method = RequestMethod.GET)
		public String paymentcancellist(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
			System.out.println("02_Payment_Controller.java -> paymentcancellist");
			int paymentcancelcount = pcdao.getPaymentCancelCount();
			System.out.println(paymentcancelcount);
			System.out.println("02_1 Payment_Controller.java -> paymentcancellist");
			int pagePerRow = 10;
			int expage = 1;
			int lastPage = (int)(Math.ceil((double)paymentcancelcount/(double)pagePerRow));
			List<Payment_Cancel> paymentcancellist = pcdao.getPaymentCancelList(currentPage, pagePerRow);
			System.out.println(paymentcancelcount);
			System.out.println(Math.ceil(paymentcancelcount/pagePerRow));
			System.out.println(lastPage);
			// paymentcount 및 pagePerRpw(구 pageRow -> list페이지에는 pagePerRow로 el식의 이름이 작성되어 있는 것을 확인하고(무분별 복붙의 폐해) 변수명을 해당 이름에 맞게 수정 및 double형 타입 캐스팅)
			
			model.addAttribute("expage",expage);
			model.addAttribute("pagePerRow",pagePerRow);
			model.addAttribute("paymentcancelcount", paymentcancelcount);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("paymentcancellist",paymentcancellist);
			
			return "/tori/payment/payment_cancel_list";
			
		}
		
		
		
		//리스트로 값을 받아온다
		/*@RequestMapping(value={"/tori/payment/payment_cancel_list"}, method = RequestMethod.GET)
		public String paymentcancellist(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
			System.out.println("02_Payment_Controller.java -> paymentcancellist");
			int paymentcancelcount = pcdao.getPaymentCancelCount();
			System.out.println(paymentcancelcount);
			System.out.println("02_1 Payment_Controller.java -> paymentcancellist");
			int pagePerRow = 10;
			int expage = 1;
			int lastPage = (int)(Math.ceil((double)paymentcancelcount/(double)pagePerRow));
			List<Payment_Cancel> paymentcancellist = pcdao.getPaymentCancelList(currentPage, pagePerRow);
			System.out.println(paymentcancelcount);
			System.out.println(Math.ceil(paymentcancelcount/pagePerRow));
			System.out.println(lastPage);
			// paymentcount 및 pagePerRpw(구 pageRow -> list페이지에는 pagePerRow로 el식의 이름이 작성되어 있는 것을 확인하고(무분별 복붙의 폐해) 변수명을 해당 이름에 맞게 수정 및 double형 타입 캐스팅)
			
			model.addAttribute("expage",expage);
			model.addAttribute("pagePerRow",pagePerRow);
			model.addAttribute("paymentcancelcount", paymentcancelcount);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("paymentcancellist",paymentcancellist);
			
			return "/tori/payment/payment_cancel_list";
			
		}*/
		
		//검색버튼을 클릭한 후 검색화면으로 넘어간다
		@RequestMapping(value={"/tori/payment/payment_cancel_search_form"}, method = RequestMethod.GET)
		public String paymentcancelsearch(){
			System.out.println("04 Payment_Controller.java -> paymentcancelsearch");
			return "/tori/payment/payment_cancel_search_form";
			//tori_home에서 설정한 경로와 매핑경로값 및 리턴값을 일치하게끔 설정한다.
			
		}
		
		//조건별 검색 리스트 표현
		@RequestMapping(value={"/tori/payment/payment_cancel_search_action"}, method = RequestMethod.GET)
		public String paymentCSRsearch(Model model , 
				@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
				@RequestParam(value="select") String select,
				@RequestParam(name="keyWord") String keyWord){
			System.out.println("05 Payment_Controller.java -> paymentCSRlist");
			int paymentCSRcount = pcdao.paymentCSRlist(select,keyWord);
			//int paymentSRcount = pdao.getPaymentCount();
			int pagePerRow = 10;
			int lastPage = (int)(Math.ceil((double)paymentCSRcount/(double)pagePerRow));
			List<Payment_Cancel> paymentCSRlist = pcdao.paymentCSRsearch(select,keyWord,currentPage,pagePerRow);
			int expage = 1;
			
			model.addAttribute("select",select);
			model.addAttribute("keyWord",keyWord);
			model.addAttribute("expage",expage);
			model.addAttribute("pagePerRow",pagePerRow);
			model.addAttribute("paymentCSRcount",paymentCSRcount);
			model.addAttribute("currentPage",currentPage);
			model.addAttribute("lastPage",lastPage);
			model.addAttribute("paymentCSRlist",paymentCSRlist);
			
			return "/tori/payment/payment_cancel_search_list";
		}
		
		
		//조건별 검색결과 리스트 표현
		@RequestMapping(value={"/tori/payment/payment_cancel_search_list"}, method = RequestMethod.GET)
		public String paymentCSRlist(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
				,@RequestParam(value="select") String select
				,@RequestParam(value="keyWord") String keyWord){
			System.out.println("06_Payment_Controller.java -> paymentCSRlist");
			int paymentCSRcount = pcdao.paymentCSRlist(select,keyWord);
			System.out.println(paymentCSRcount);
			System.out.println("06_1 Payment_Controller.java -> paymentCSRlist");
			int pagePerRow = 10;
			int expage = 1;
			int lastPage = (int)(Math.ceil((double)paymentCSRcount/(double)pagePerRow));
			List<Payment_Cancel> paymentCSRsearch = pcdao.paymentCSRsearch(select,keyWord,currentPage,pagePerRow);
			System.out.println(paymentCSRcount);
			System.out.println(Math.ceil(paymentCSRcount/pagePerRow));
			System.out.println(lastPage);
			// paymentcount 및 pagePerRpw(구 pageRow -> list페이지에는 pagePerRow로 el식의 이름이 작성되어 있는 것을 확인하고(무분별 복붙의 폐해) 변수명을 해당 이름에 맞게 수정 및 double형 타입 캐스팅)
			
			model.addAttribute("select",select);
			model.addAttribute("keyWord",keyWord);
			model.addAttribute("expage",expage);
			model.addAttribute("pagePerRow",pagePerRow);
			model.addAttribute("paymentCSRcount", paymentCSRcount);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("paymentCSRsearch",paymentCSRsearch);
			
			return "/tori/payment/payment_cancel_search_list";
			
		}
		
		
		
		//리스트에서 뷰로 넘어간다
		@RequestMapping(value={"/tori/payment/payment_cancel_view"}, method = RequestMethod.GET)
		public String paymentcancelview(Model model , @RequestParam(value="payment_cancel_id",required=true) String payment_cancel_id){
			System.out.println("03_Payment_Controller.java -> paymentcancelview");
			Payment_Cancel paymentcancel = pcdao.getPaymentCancel(payment_cancel_id);
			model.addAttribute("paymentcancel",paymentcancel);
			return "/tori/payment/payment_cancel_view";
		}
	
	
		
		
	// 카드 결제 목록 시작
		
		//리스트 입력 폼으로 이동한다
		/*@RequestMapping(value="/tori/payment/payment_card_form", method = RequestMethod.GET)
		public String paymentcardadd(){
			System.out.println("01 Payment_Controller.java -> paymentcardadd");
			return "/tori/payment/payment_card_form";
			//tori_home에서 설정한 경로와 매핑경로값 및 리턴값을 일치하게끔 설정한다.
			
		}*/
		
		@RequestMapping(value="/tori/payment/payment_card_form")
		public String paymentcardform(){
			System.out.println("01 Payment_Controller.java -> paymentcardform");
		/*	System.out.println(payment_cate);
			if(payment_cate == "카드"){
				return "/tori/payment/payment_card_form";
			}*/
			return "/tori/payment/payment_card_form";
		}
		
		
		/*@RequestMapping(value="/tori/payment/payment_card_form", method = RequestMethod.GET)
		public String paymentcardadd(@RequestParam(value="payment_cate", required=true) String payment_cate){
			System.out.println("01 Payment_Controller.java -> paymentcardadd");
			System.out.println(payment_cate);
			if(payment_cate == "카드")
			{
			return "/tori/payment/payment_card_form";
			}
			return "/tori/payment/payment_list";
			//tori_home에서 설정한 경로와 매핑경로값 및 리턴값을 일치하게끔 설정한다.
			
		}*/
		
		//입력 요청 : 액션으로 이동한다
		@RequestMapping(value="/tori/payment/payment_card_action", method = RequestMethod.POST)
		public String paymentcardadd(Card_Payment card_payment){
			System.out.println("01_1 Payment_Controller.java -> paymentcardadd");
			
			String id = card_payment.getCard_id();
			System.out.println(id+"<------ 컨트롤러 값 확인 ");
			
			
			cpdao.insertCardPayment(card_payment);
			//return "redirect:/tori/payment/payment_card_action";
			return "redirect:/tori/payment/payment_card_list";
			
		}
		
		//리스트로 값을 받아온다
		@RequestMapping(value={"/tori/payment/payment_card_list"}, method = RequestMethod.GET)
		public String paymentcardlist(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
			System.out.println("02_Payment_Controller.java -> paymentcardlist");
			int paymentcardcount = cpdao.getCardPaymentCount();
			System.out.println(paymentcardcount);
			System.out.println("02_1 Payment_Controller.java -> paymentcardlist");
			int pagePerRow = 10;
			int expage = 1;
			int lastPage = (int)(Math.ceil((double)paymentcardcount/(double)pagePerRow));
			List<Card_Payment> list = cpdao.getCardPaymentList(currentPage, pagePerRow);
			System.out.println(paymentcardcount);
			System.out.println(Math.ceil(paymentcardcount/pagePerRow));
			System.out.println(lastPage);
			// paymentcount 및 pagePerRpw(구 pageRow -> list페이지에는 pagePerRow로 el식의 이름이 작성되어 있는 것을 확인하고(무분별 복붙의 폐해) 변수명을 해당 이름에 맞게 수정 및 double형 타입 캐스팅)
			
			model.addAttribute("expage",expage);
			model.addAttribute("pagePerRow",pagePerRow);
			model.addAttribute("paymentcardcount", paymentcardcount);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("list",list);
			
			return "/tori/payment/payment_card_list";
			
		}
		
		
		//리스트에서 뷰로 넘어간다
		@RequestMapping(value={"/tori/payment/payment_card_view"}, method = RequestMethod.GET)
		public String paymentcardview(Model model , @RequestParam(value="card_id",required=true) String card_id){
			System.out.println("03_Payment_Controller.java -> paymencardview");
			Card_Payment card = cpdao.getCardPayment(card_id);
			model.addAttribute("card",card);
			return "/tori/payment/payment_card_view";
		}
		
		//검색버튼을 클릭한 후 검색화면으로 넘어간다
				@RequestMapping(value={"/tori/payment/payment_card_search_form"}, method = RequestMethod.GET)
				public String paymentcardsearch(){
					System.out.println("04 Payment_Controller.java -> paymentcardsearch");
					return "/tori/payment/payment_card_search_form";
					//tori_home에서 설정한 경로와 매핑경로값 및 리턴값을 일치하게끔 설정한다.
					
				}
				
				//조건별 검색 리스트 표현
				@RequestMapping(value={"/tori/payment/payment_card_search_action"}, method = RequestMethod.GET)
				public String paymentcardsearch(Model model , 
						@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
						@RequestParam(value="select") String select,
						@RequestParam(name="keyWord") String keyWord){
					System.out.println("05 Payment_Controller.java -> paymentcardsearch");
					int CPScount = cpdao.CPSlist(select,keyWord);
					//int paymentSRcount = pdao.getPaymentCount();
					int pagePerRow = 10;
					int lastPage = (int)(Math.ceil((double)CPScount/(double)pagePerRow));
					List<Card_Payment> CPSlist = cpdao.CPSsearch(select,keyWord,currentPage,pagePerRow);
					int expage = 1;
					
					model.addAttribute("select",select);
					model.addAttribute("keyWord",keyWord);
					model.addAttribute("expage",expage);
					model.addAttribute("pagePerRow",pagePerRow);
					model.addAttribute("CPScount",CPScount);
					model.addAttribute("currentPage",currentPage);
					model.addAttribute("lastPage",lastPage);
					model.addAttribute("CPSlist",CPSlist);
					
					return "/tori/payment/payment_card_search_list";
				}
				
				
				//조건별 검색결과 리스트 표현
				@RequestMapping(value={"/tori/payment/payment_card_search_list"}, method = RequestMethod.GET)
				public String paymentcardlist(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
						,@RequestParam(value="select") String select
						,@RequestParam(value="keyWord") String keyWord){
					System.out.println("06_Payment_Controller.java -> paymentCSRlist");
					int CPScount = cpdao.CPSlist(select,keyWord);
					//int paymentSRcount = pdao.getPaymentCount();
					int pagePerRow = 10;
					int lastPage = (int)(Math.ceil((double)CPScount/(double)pagePerRow));
					List<Card_Payment> CPSlist = cpdao.CPSsearch(select,keyWord,currentPage,pagePerRow);
					int expage = 1;
					
					model.addAttribute("select",select);
					model.addAttribute("keyWord",keyWord);
					model.addAttribute("expage",expage);
					model.addAttribute("pagePerRow",pagePerRow);
					model.addAttribute("CPScount",CPScount);
					model.addAttribute("currentPage",currentPage);
					model.addAttribute("lastPage",lastPage);
					model.addAttribute("CPSlist",CPSlist);
					
					return "/tori/payment/payment_card_search_list";
				}
}
	
	

