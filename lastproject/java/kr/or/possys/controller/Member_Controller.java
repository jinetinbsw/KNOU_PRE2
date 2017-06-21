package kr.or.possys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.possys.Cancel_Payment_service.Payment_Cancel;
import kr.or.possys.Member_sevice.Member;
import kr.or.possys.Member_sevice.Member_Dao;
import kr.or.possys.Member_sevice.expense_folios;
import kr.or.possys.Member_sevice.mVo;
import kr.or.possys.Order_service.Order;
import kr.or.possys.Order_service.Order_Dao;
import kr.or.possys.Payment_service.Payment;
import kr.or.possys.Staff_service.Staff;
import kr.or.possys.Staff_service.Staff_Dao;
import kr.or.possys.ep_order_food_details_service.Ep_Order;
import net.sf.json.JSONArray;
import kr.or.possys.Member_sevice.receipt;
@Controller
public class Member_Controller {

	@Autowired
	private	Member_Dao	Mdao;
	
	@Autowired
	private	Order_Dao	odao;
	
	@Autowired
	private Staff_Dao sdao;
	
	
/*	@RequestMapping(value="/expense_folios")
	public String expense_folios(){
		System.out.println("expense_folios_¸Þ¼­µå ½ÇÇà È®ÀÎ Member_Controller.java");
		return "/member/expense_folios";
	}*/
	
	//¸ÅÀå ¿ù ÆÇ¸Å±Ý¾× & Áö­x¹Ç¾× ±¸ÇÏ´Â ¸Þ¼­µå
	@RequestMapping(value="/expense_folios")
	
	public String expense_folios_action(Model model){
		System.out.println("expense_folios_action ¸Þ¼­µå ½ÇÇà È®ÀÎ  Member_Controller.java");
		
		
		//¾î·¹ÀÌ ¸®½ºÆ®·Î expense_folios ¹è¿­ »ý¼º 
		ArrayList<expense_folios> arr = new ArrayList<expense_folios>();
		
		//¿ùº° ÃÑ ÆÇ¸Å¾×°ú ¹ßÁÖ ½ÅÃ»±Ý¾× ±¸ÇØ¼­ °¢°¢ º¯¼ö¿¡ ´ã¾ÆÁØ´Ù. 
		List<Ep_Order> o_list = Mdao.expense_folios();
		List<Payment> sum_payment = Mdao.sum_payment();
		
		System.out.println(o_list);
		System.out.println(sum_payment.size()+"<<<<sum_payment.size()");
		//for¹®À» »ç¿ëÇÏ¿© expense_folios dto·Î ¼±¾ðÇÑ °´Ã¼¸¦ ¸¸µé¸é¼­ 
		//º¯¼ö¿¡ ´ã°ÜÀÖ´ø °ªÀ» ´ã¾ÆÁØ´Ù.
		
			
		if(o_list.size()==0){
			for (int i = 0; i < sum_payment.size(); i++){
				int p_total = sum_payment.get(i).getPayment_total();
				expense_folios expense_folios = new expense_folios();
			
				int total_result = p_total;
				
				expense_folios.setPayment_date(sum_payment.get(i).getPayment_date());
				expense_folios.setPayment_total(p_total);
				expense_folios.setTotal_result(total_result);
				
				arr.add(expense_folios);
				System.out.println("if ¹® olist"+i+"¹ø ¹Ýº¹ expense_folios_action ¸Þ¼­µå Member_Controller.java");
				}
			}
		if(o_list.size()>0){
			for (int i = 0; i < sum_payment.size(); i++){
				int p_total = sum_payment.get(i).getPayment_total();
				
				int o_total = o_list.get(i).getEp_order_total_price();
				
				//µÎ ±Ý¾×ÀÇ Â÷¸¦ ±¸ÇÏ¿© °á°ú°ªÀ» º¯¼ö¿¡ ´ã¾ÆÁØ´Ù.
				int total_result = (p_total-o_total);
				//¹Ýº¹ ÇÒ¶§¸¶´Ù »õ·Î¿î °´Ã¼ »ý¼º(°ªÀÌ Áßº¹ ¾ÈµÇ°Ô ÇØÁØ´Ù.)
				expense_folios expense_folios = new expense_folios();
				
				expense_folios.setPayment_date(sum_payment.get(i).getPayment_date());
				expense_folios.setPayment_total(p_total);
				
				
				expense_folios.setEp_order_wh_date(o_list.get(i).getEp_order_wh_date());
				expense_folios.setEp_order_total_price(o_total);
				//dto¿¡ º¯¼ö»ý¼ºÇÏ°í °Å±â¿¡ À§¿¡¼­ º¯¼ö¿¡ ´ãÀº °ªÀ» ¼ÂÆÃ  ÇØÁØ´Ù.
				expense_folios.setTotal_result(total_result);
				
				
				arr.add(expense_folios);
				System.out.println("else if ¹® olist"+i+"¹ø ¹Ýº¹ expense_folios_action ¸Þ¼­µå Member_Controller.java");
		
			
			}
		}
		model.addAttribute("expense_folios", arr);
		
		/*±¤ÁøÀÌÇü
		for(Ep_Order _o_list : o_list){
			expense_folios.setEp_order_total_price(_o_list.getEp_order_total_price());
			expense_folios.setEp_order_wh_date(_o_list.getEp_order_wh_date());			
			arr.add(expense_folios);
		}
		
		for(Payment pay : sum_payment){
			expense_folios.setPayment_date(pay.getPayment_date());
			expense_folios.setPayment_total(pay.getPayment_total());
			arr.add(expense_folios);
		}
		System.out.println(arr.size()+"///»çÀÌÁî");
		model.addAttribute("expense_folios", arr);*/
	
		
		

		return "/member/expense_folios";
	}
	
	//È¸¿ø ¸®½ºÆ®¿¡¼­ »ó¼¼º¸±â Å¬¸¯½Ã È¸¿øº° ÀÌ¿ë³»¿ª È®ÀÎ
	@RequestMapping(value="/ajax_receipt_list", method=RequestMethod.GET)
	@ResponseBody
	public void receipt_list(HttpServletResponse re
					,@RequestParam(value="member_phone")String member_phone) throws IOException{
		
		
		System.out.println("receipt_list ¸Þ¼­µå ½ÇÇà È®ÀÎ Member_Controller.java");
		System.out.println(member_phone+"<<--member_phoneÀÇ °ª receipt_list ¸Þ¼­µå ½ÇÇà È®ÀÎ Member_Controller.java");
		 
			re.setCharacterEncoding("UTF-8");
		  
			PrintWriter out = re.getWriter();
			
			JSONArray receipt_list = null;
			
			List<receipt> receipt = Mdao.receipt_list(member_phone);
			
			System.out.println(receipt);
			
			receipt_list = JSONArray.fromObject(receipt);
			System.out.println(receipt_list);
				
			//»õ·Î¿î È­¸é¿¡¼­ json¹æ½ÄÀ¸·Î ¹Þ¾Æ¿Â °ª Ãâ·Â
			out.write(receipt_list.toString());
			
			out.flush();
		
		
	}
	
	//È¸¿ø°¡ÀÔ È­¸é Ãâ·Â ¸Þ¼­µå
	@RequestMapping(value="/member/sign_up")
	public String sign_up(){
		System.out.println("sign_up È¸¿ø°¡ÀÔ È­¸é Ãâ·Â ¸Þ¼­µå Member_Controller");
		
		
		return "/member/sign_up";
	}
	//È¸¿ø°¡ÀÔ Ã³¸® ¸Þ¼­µå
	@RequestMapping(value="/sign_up_action")
	public String sign_up_action(Member m){
		System.out.println("sign_up_action È¸¿ø°¡ÀÔ È­¸é Ãâ·Â ¸Þ¼­µå Member_Controller");
/*		System.out.println(m.getMember_phone()+"getMember_phone");
		System.out.println(m.getMember_name()+"getMember_name");
		System.out.println(m.getMember_email()+"getMember_email");*/
		Mdao.sign_up_action(m);
		return "/member/sign_up";
	}
	
	
	//¿µ¼öÁõ È­¸é Ãâ·Â ¸Þ¼­µå
	@RequestMapping(value="/receipt")
	public String receipt(Model model
			,@RequestParam(value="table_order_id")String table_order_id
			,@RequestParam(value="member_phone")String member_phone
			){
		System.out.println("receipt ¸Þ¼­µå ½ÇÇà Member_Controller.java");
		System.out.println(table_order_id +"table_order_id °ª receipt ¸Þ¼­µå ½ÇÇà Member_Controller.java");
		System.out.println(member_phone +"member_phone °ª receipt ¸Þ¼­µå ½ÇÇà Member_Controller.java");
		
		List<receipt> receiptList = Mdao.receipt(member_phone, table_order_id);
		
		model.addAttribute("receiptList", receiptList);
		System.out.println(receiptList+"<<<<<<<<<<<receiptList ¸®ÅÏ °ª");
		
		return "/member/receipt";
	}
	
	
	
	//Å×ÀÌºí ÀÚ¸® ÀÌµ¿
	@RequestMapping(value="/table_move_D", method=RequestMethod.POST)
	@ResponseBody
	public void table_move(@RequestParam(value="table_order_id")String table_order_id
			,@RequestParam(value="table_num")int table_num){
		System.out.println("table_move ¸Þ¼­µå ½ÇÇà"+table_order_id+"<<<<<<<<<<<<<<<table_order_id");
		System.out.println("table_move ¸Þ¼­µå ½ÇÇà"+table_num+"<<<<<<<<<<<<<<<table_num");
		
		Mdao.table_move(table_order_id, table_num);
		
	}
	//Å×ÀÌºí true,false È®ÀÎ
	@ResponseBody
	@RequestMapping(value="/table_state")
	public void table_state(HttpServletResponse re) throws IOException{
		/*System.out.println("table_state ¸Þ¼­µå ½ÇÇà È®ÀÎ Member_Controller.java");*/
		   re.setCharacterEncoding("UTF-8");
		  
			PrintWriter out = re.getWriter();
			JSONArray table_state = null;
			
			List<Order> state = Mdao.table_state();
			
			/*System.out.println(plist);*/
			
			table_state = JSONArray.fromObject(state);
			/*System.out.println(table_state);*/
			
			//»õ·Î¿î È­¸é¿¡¼­ json¹æ½ÄÀ¸·Î ¹Þ¾Æ¿Â °ª Ãâ·Â
			out.write(table_state.toString());
			
			out.flush();
	}
	
	
	
	// Å×ÀÌºí ¹èÄ¡ È­¸éÀ¸·Î ÀÌµ¿
	  @RequestMapping(value = "/table")
	  public String table() {
	   System.out.println("Å×ÀÌºí ¹èÄ¡ È­¸é ÀÌµ¿ ¸Þ¼­µå ");
	    return "/member/table";	    
	  } 
	//Å×ÀÌºí ÁÖ¹® ³»¿ª È®ÀÎ
	  @ResponseBody
	  @RequestMapping(value = "/table_order",method = RequestMethod.GET)
	  public void table_order(HttpServletResponse re,@RequestParam(value="table_order_num") String table_order_num) throws IOException{
		  System.out.println("Å×ÀÌºí ÁÖ¹®³»¿ª È®ÀÎ ¸Þ¼­µå Member_Controller.java");
		 
		 re.setCharacterEncoding("UTF-8");
		  
		PrintWriter out = re.getWriter();
		JSONArray order_detail = null;
		
		List<Order> order = Mdao.table_Order_detail(table_order_num);
		/*if(staff!=null){*/
		
		/*System.out.println(plist);*/
		
		order_detail = JSONArray.fromObject(order);
		/*System.out.println(order_detail);*/
		
		//»õ·Î¿î È­¸é¿¡¼­ json¹æ½ÄÀ¸·Î ¹Þ¾Æ¿Â °ª Ãâ·Â
		out.write(order_detail.toString());
		
		out.flush();
		  
	
	  }
	  
	  // ºñ¹Ð¹øÈ£ Àç¹ß±Þ È­¸é ÀÌµ¿
	  @RequestMapping(value = "/repw")
	  public String repw() {
	   System.out.println("ºñ¹Ð¹øÈ£ Àç¹ß±Þ È­¸é ÀÌµ¿ ¸Þ¼­µå ");
	    return "/repw";
	  }  
	// ºñ¹Ð¹øÈ£ Ã£±â  ¾ÆÀÌµð¿Í  name°ª °¡Á®¿À´Â ajaxÅë½Å¿ë
	  @ResponseBody
	  @RequestMapping(value = "/idcheck")
	  public void mailForm(HttpServletRequest request,HttpServletResponse re) throws IOException {
		  String checkid = request.getParameter("id");
		  System.out.println(checkid);
		 
		  	re.setCharacterEncoding("UTF-8");
		  
			PrintWriter out = re.getWriter();
			JSONArray CheckStaff = null;
			
			Staff staff = sdao.loginSelect(checkid);
			if(staff!=null){
			
			
			CheckStaff = JSONArray.fromObject(staff);
			System.out.println(CheckStaff);
			
			//»õ·Î¿î È­¸é¿¡¼­ json¹æ½ÄÀ¸·Î ¹Þ¾Æ¿Â °ª Ãâ·Â
			out.write(CheckStaff.toString());
			
			out.flush();
	   
	  }
	  }
	  // ºñ¹Ð¹øÈ£ Ã£±â ÈÄ ½Å±Ô pw Àç¹ß±Þ ÈÄ dbµî·Ï ¹×  ÀÌ¸ÞÀÏ ¹ß¼Û ÄÚµå 
	
	/*  @RequestMapping(value="/mail/mailSending",method = RequestMethod.POST)
	  public String mailSending(HttpServletRequest request){
		  System.out.println("¸ÞÀÏº¸³»±â");
		  			//ÀÔ·Â¹ÞÀº email °ª id°ª °¢°¢ º¯¼ö¿¡ ´ã´Â´Ù.
		  			String tomail = request.getParameter("email");
		  			String checkid = request.getParameter("id");
		  			System.out.println(checkid);
		  			Staff staff = sdao.loginSelect(checkid);
		  			System.out.println(staff+"<---mailSending ¸Þ¼­µå ¾ÆÀÌµð ÀÔ·ÂÈÄ ¸®ÅÏ°ª Member_Controller.java");
					String setfrom = "bsh20057@gmail.com";
					String title = "possys ºñ¹Ð¹øÈ£ Àç¹ß±Þ ¾È³»ÀÔ´Ï´Ù.";
				    String content ="";
				    String newpw = "";
				    for (int i = 0;i < 5; i++) { 
				        // UUID uuid = UUID.randomUUID() // UUID ÀÚÃ¼´Â Object Å¸ÀÔ 
				    	String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -¸¦ Á¦°ÅÇØ ÁÖ¾ú´Ù. 
				        uuid = uuid.substring(0, 6); //uuid¸¦ ¾Õ¿¡¼­ºÎÅÍ 10ÀÚ¸® Àß¶óÁÜ. 
				        content = "½Å±Ô ºñ¹Ð¹øÈ£ ÀÔ´Ï´Ù. ·Î±×ÀÎ ÈÄ ¼öÁ¤ ÇØÁÖ¼¼¿ä \n"
				        		+ "½Å±Ô ºñ¹Ð¹øÈ£ :"+uuid;
				        newpw = uuid;
				    }
				    
				    
				    
				    staff.setStaff_pw(newpw);
				    staff.getStaff_name();
				    staff.getStaff_level();
				    staff.getStaff_age();
				    staff.getStaff_addr();
				    staff.getStaff_gender();
				    staff.getStaff_phone();
				    staff.getStaff_date();
				    staff.getStaff_id();	    
			
				    System.out.println(staff.getStaff_pw()+"<<<<<<<È®ÀÎ");
				    //½Å±Ô ºñ¹Ð¹øÈ£·Î ¾÷µ¥ÀÌÆ®
				    sdao.updateStaff(staff);
				  
				    System.out.println("»õ·Î¿î ºñ¹Ð¹øÈ£"+newpw);
				    System.out.println("¹Þ´Â»ç¶÷ ÀÌ¸ÞÀÏ"+tomail);
				    System.out.println("ÀÌ¸ÞÀÏ Á¦¸ñ"+title);
				    System.out.println("ÀÌ¸ÞÀÏ ³»¿ë"+content);
				    try {
				      MimeMessage message = mailSender.createMimeMessage();
				      
				      MimeMessageHelper messageHelper 
				                        = new MimeMessageHelper(message, true, "UTF-8");
				 
				      messageHelper.setFrom(setfrom);  // º¸³»´Â»ç¶÷ »ý·«ÇÏ°Å³ª ÇÏ¸é Á¤»óÀÛµ¿À» ¾ÈÇÔ
				      messageHelper.setTo(tomail);     // ¹Þ´Â»ç¶÷ ÀÌ¸ÞÀÏ
				      messageHelper.setSubject(title); // ¸ÞÀÏÁ¦¸ñÀº »ý·«ÀÌ °¡´ÉÇÏ´Ù
				      messageHelper.setText(content);  // ¸ÞÀÏ ³»¿ë
				     
				      mailSender.send(message);
				    } catch(Exception e){
				      System.out.println(e);
				    }
					return "redirect:/";
					
			}
*/
	  
 
	
	
	//±×·¡ÇÁ Ãâ·Â È­¸é È£Ãâ ¸Þ¼­µå
	@RequestMapping(value="/total_payment")
	public String total_payment(){
		return "/member/total_payment";
	}
	//Ä«µå°áÁ¦ ¸Þ¼­µå(Ãë¼Ò)
		@RequestMapping(value="/C_CDcate",method = RequestMethod.GET)
		@ResponseBody
		public void C_CDcatePayment(HttpServletResponse re
				,@RequestParam(value="selbox") String selbox) throws IOException{
			System.out.println("C_CDcatePayment ¸Þ¼­µå ½ÇÇà È®ÀÎ Member_Controller.java");
			System.out.println(selbox);
			re.setCharacterEncoding("UTF-8");
			PrintWriter out = re.getWriter();
			JSONArray C_CDcatePayment = null;
			
			List<Payment_Cancel> CDcate = Mdao.C_CDcatePayment(selbox);
			
			/*System.out.println(plist);*/
			
			C_CDcatePayment = JSONArray.fromObject(CDcate);
			System.out.println(C_CDcatePayment);
			
			//»õ·Î¿î È­¸é¿¡¼­ json¹æ½ÄÀ¸·Î ¹Þ¾Æ¿Â °ª Ãâ·Â
			out.write(C_CDcatePayment.toString());
			
			out.flush();
		}
		//Çö±Ý°áÁ¦ ¸Þ¼­µå(Ãë¼Ò)
		@RequestMapping(value="/C_Mcate",method = RequestMethod.GET)
		@ResponseBody
		public void C_McatePayment(HttpServletResponse re
				,@RequestParam(value="selbox") String selbox) throws IOException{
			System.out.println("C_McatePayment ¸Þ¼­µå ½ÇÇà È®ÀÎ Member_Controller.java");
			System.out.println(selbox);
			re.setCharacterEncoding("UTF-8");
			PrintWriter out = re.getWriter();
			JSONArray C_McatePayment = null;
			
			List<Payment_Cancel> Mcate = Mdao.C_McatePayment(selbox);
			
			/*System.out.println(plist);*/
			
			C_McatePayment = JSONArray.fromObject(Mcate);
			System.out.println(C_McatePayment);
			
			//»õ·Î¿î È­¸é¿¡¼­ json¹æ½ÄÀ¸·Î ¹Þ¾Æ¿Â °ª Ãâ·Â
			out.write(C_McatePayment.toString());
			
			out.flush();
		}
		//ÅëÇÕ¸ÅÃâ³»¿ª(Ãë¼Ò)
		@RequestMapping(value="/C_graph",method = RequestMethod.GET)
		@ResponseBody
		public void C_totalPayment(HttpServletResponse re
				,@RequestParam(value="selbox") String selbox) throws IOException{
			System.out.println("C_totalPayment ¸Þ¼­µå ½ÇÇà È®ÀÎ Member_Controller.java");
			System.out.println(selbox);
			re.setCharacterEncoding("UTF-8");
			PrintWriter out = re.getWriter();
			JSONArray C_totalPayment = null;
			
			List<Payment_Cancel> plist = Mdao.C_totalPaymentList(selbox);
			
			/*System.out.println(plist);*/
			
			C_totalPayment = JSONArray.fromObject(plist);
			System.out.println(C_totalPayment);
			
			//»õ·Î¿î È­¸é¿¡¼­ json¹æ½ÄÀ¸·Î ¹Þ¾Æ¿Â °ª Ãâ·Â
			out.write(C_totalPayment.toString());
			
			out.flush();
		}
	
	//Ä«µå°áÁ¦ ¸Þ¼­µå
	@RequestMapping(value="/CDcate",method = RequestMethod.GET)
	@ResponseBody
	public void CDcatePayment(HttpServletResponse re
			,@RequestParam(value="selbox") String selbox) throws IOException{
		System.out.println("totalPayment ¸Þ¼­µå ½ÇÇà È®ÀÎ Member_Controller.java");
		System.out.println(selbox);
		re.setCharacterEncoding("UTF-8");
		PrintWriter out = re.getWriter();
		JSONArray CDcatePayment = null;
		
		List<Payment> CDcate = Mdao.CDcatePayment(selbox);
		
		/*System.out.println(plist);*/
		
		CDcatePayment = JSONArray.fromObject(CDcate);
		System.out.println(CDcatePayment);
		
		//»õ·Î¿î È­¸é¿¡¼­ json¹æ½ÄÀ¸·Î ¹Þ¾Æ¿Â °ª Ãâ·Â
		out.write(CDcatePayment.toString());
		
		out.flush();
	}
	//Çö±Ý°áÁ¦ ¸Þ¼­µå
	@RequestMapping(value="/Mcate",method = RequestMethod.GET)
	@ResponseBody
	public void McatePayment(HttpServletResponse re
			,@RequestParam(value="selbox") String selbox) throws IOException{
		System.out.println("totalPayment ¸Þ¼­µå ½ÇÇà È®ÀÎ Member_Controller.java");
		System.out.println(selbox);
		re.setCharacterEncoding("UTF-8");
		PrintWriter out = re.getWriter();
		JSONArray McatePayment = null;
		
		List<Payment> Mcate = Mdao.McatePayment(selbox);
		
		/*System.out.println(plist);*/
		
		McatePayment = JSONArray.fromObject(Mcate);
		System.out.println(McatePayment);
		
		//»õ·Î¿î È­¸é¿¡¼­ json¹æ½ÄÀ¸·Î ¹Þ¾Æ¿Â °ª Ãâ·Â
		out.write(McatePayment.toString());
		
		out.flush();
	}
	//ÅëÇÕ¸ÅÃâ³»¿ª
	@RequestMapping(value="/graph",method = RequestMethod.GET)
	@ResponseBody
	public void totalPayment(HttpServletResponse re
			,@RequestParam(value="selbox") String selbox) throws IOException{
		System.out.println("totalPayment ¸Þ¼­µå ½ÇÇà È®ÀÎ Member_Controller.java");
		System.out.println(selbox);
		re.setCharacterEncoding("UTF-8");
		PrintWriter out = re.getWriter();
		JSONArray PaymentList = null;
		
		List<Payment> plist = Mdao.totalPaymentList(selbox);
		
		/*System.out.println(plist);*/
		
		PaymentList = JSONArray.fromObject(plist);
		System.out.println(PaymentList);
		
		//»õ·Î¿î È­¸é¿¡¼­ json¹æ½ÄÀ¸·Î ¹Þ¾Æ¿Â °ª Ãâ·Â
		out.write(PaymentList.toString());
		
		out.flush();
	}
	//¾Ë¶÷Ã¢ ajax Å×½ºÆ®
	@RequestMapping(value="/alram_test",method = RequestMethod.GET)
	@ResponseBody
	public void am(HttpServletResponse re) throws IOException{
		System.out.println("am ½ÇÇà");
		//ÇÑ±ÛÈ­
		re.setCharacterEncoding("UTF-8");
		//out °´Ã¼ »ç¿ëÇÏ±â À§ÇØ ÁØºñ
		PrintWriter out = re.getWriter();
		JSONArray OrderListJson = null;
		
		List<Order> olist = odao.order_list();
		System.out.println(olist);
		
		OrderListJson = JSONArray.fromObject(olist);
		System.out.println(OrderListJson);
		
		//»õ·Î¿î È­¸é¿¡¼­ json¹æ½ÄÀ¸·Î ¹Þ¾Æ¿Â °ª Ãâ·Â
		out.write(OrderListJson.toString());
		
		out.flush();
	
	}
	//¾Ë¶÷Ã¢ È£Ãâ
	@RequestMapping(value="/ho.html")
	public String alram(){
		System.out.println("¾Ë¶÷Ã¢ È£Ãâ");
		return "/member/alram";
	}

	//½Ç½Ã°£ °Ë»ö È£Ãâ
	@RequestMapping(value="/real_time")
	public String real_time(Model model){	
		int memberCount = Mdao.getMemberCount();
		model.addAttribute("memberCount",memberCount);
		return "/member/real_time";
	}
	
	//ÀÔ·Â°ªÀÌ ÇÑ±ÛÀÎ °æ¿ì È¸¿ø ¸®½ºÆ® Á¦ÀÌ¼Õ ¹æ½ÄÀ¸·Î ¹Þ¾Æ¿À±â
		@RequestMapping(value="/K_real_time", method = RequestMethod.GET)
		@ResponseBody
			public void K_real_time(@RequestParam(value="insert") String insert
						,Model model
						,HttpServletResponse re
						,@RequestParam(value="currentPage",required=false,defaultValue="1" )int currentPage) throws IOException{
					System.out.println("josn È£ÃâÈ®ÀÎ");
					//ajax·Î ¹Þ¾Æ¿Â ¸Å°³º¯¼ö ÀÔ·Â°ª
					System.out.println(insert+"ÀÔ·Â°ª");
					//ÇÑ±ÛÈ­
					URLEncoder.encode(insert , "UTF-8");
					re.setCharacterEncoding("UTF-8");
					//out °´Ã¼ »ç¿ëÇÏ±â À§ÇØ ÁØºñ
					PrintWriter out = re.getWriter();
					int pagePerRow = 100;
			
					//json¹æ½Ä »ç¿ë
					JSONArray memberListJson = null;
					//¸®½ºÆ® Äõ¸® È£Ãâ
					List<Member> list = Mdao.K_AjaxMemberList(currentPage, pagePerRow, insert);
					//¹Þ¾Æ¿Â ¸®½ºÆ® °ªÀ» Á¦ÀÌ¼Õ °´Ã¼¿¡ ³Ö¾îÁÜ 
					memberListJson = JSONArray.fromObject(list);
					System.out.println(memberListJson);	
					//»õ·Î¿î È­¸é¿¡¼­ json¹æ½ÄÀ¸·Î ¹Þ¾Æ¿Â °ª Ãâ·Â
					out.write(memberListJson.toString());
					//¸Þ¸ð¸® ÃÊ±âÈ­
					out.flush();
		}
		
	
	//¿µ¾î¿Í ¼ýÀÚÀÎ ÀÔ·Â°ªÀÏ °æ¿ì È¸¿ø ¸®½ºÆ® Á¦ÀÌ¼Õ ¹æ½ÄÀ¸·Î ¹Þ¾Æ¿À±â
	@RequestMapping(value="/E_real_time", method = RequestMethod.GET)
	@ResponseBody
		public void E_real_time(@RequestParam(value="insert") String insert
					,Model model
					,HttpServletResponse re
					,@RequestParam(value="currentPage",required=false,defaultValue="1" )int currentPage) throws IOException{
				System.out.println("josn È£ÃâÈ®ÀÎ");
				//ajax·Î ¹Þ¾Æ¿Â ¸Å°³º¯¼ö ÀÔ·Â°ª
				System.out.println(insert+"ÀÔ·Â°ª");
				//ÇÑ±ÛÈ­
				URLEncoder.encode(insert , "UTF-8");
				re.setCharacterEncoding("UTF-8");
				//out °´Ã¼ »ç¿ëÇÏ±â À§ÇØ ÁØºñ
				PrintWriter out = re.getWriter();
				int pagePerRow = 100;
		
				//json¹æ½Ä »ç¿ë
				JSONArray memberListJson = null;
				//¸®½ºÆ® Äõ¸® È£Ãâ
				List<Member> list = Mdao.AjaxMemberList(currentPage, pagePerRow,insert);
				//¹Þ¾Æ¿Â ¸®½ºÆ® °ªÀ» Á¦ÀÌ¼Õ °´Ã¼¿¡ ³Ö¾îÁÜ 
				memberListJson = JSONArray.fromObject(list);
				System.out.println(memberListJson);	
				//»õ·Î¿î È­¸é¿¡¼­ json¹æ½ÄÀ¸·Î ¹Þ¾Æ¿Â °ª Ãâ·Â
				out.write(memberListJson.toString());
				//¸Þ¸ð¸® ÃÊ±âÈ­
				out.flush();
	}
	
	
	//ÆË¾÷Ã¢ È£Ãâ
	@RequestMapping(value="/popup.html", method = RequestMethod.GET)
	public String pop(Model model
					 ,@RequestParam(value="currentPage",required=false,defaultValue="1" )int currentPage) throws IOException{
		
		System.out.println("ÆË¾÷Ã¢ ½ÇÇà È®ÀÎ");

		
		return "test";
	}
	

	
	// °Ë»öÃ³¸® ¸Þ¼­µå
			@RequestMapping(value="/member_select",method = RequestMethod.GET)
			public String memberselect(HttpServletRequest request
					,Model model
					,@RequestParam(value="ScurrentPage",required=false,defaultValue="1" )int ScurrentPage){
				/*@RequestParam(value="selBox")String selBox*/
				//jsp¿¡¼­ °Ë»ö¿¡ ÇÊ¿äÇÑ °ªÀ» ¹Þ¾Æ¿Â´Ù.
				System.out.println("memberselect¸Þ¼­µå È£Ãâ    Member_Controller.java");
				
				
				String search =	request.getParameter("search2");
				String selBox = request.getParameter("selBox");
				
				mVo m = new mVo();
				m.setSearch(search);
				m.setSelBox(selBox);
			    request.getSession().setAttribute("m", m);
				
				System.out.println("["+selBox+"]<---°Ë»ö Á¶°Ç memberselect ¸Þ¼­µå Member_Controller.java");
				System.out.println(search+"<---°Ë»ö¾î memberselect ¸Þ¼­µå Member_Controller.java");
			
			    int SpagePerRow = 5;
				//¸Þ¼­µå È£Ãâ ¹è¿­·Î °Ë»ö ÇÑ Á¶°Ç¿¡ ¸Â´Â °ªÀ» ´ã¾Æ¿Â´Ù
				List<Member> Mlist = Mdao.searchMember(selBox, search,ScurrentPage,SpagePerRow);
				System.out.println(Mlist+"<--------- searchMember ¸®ÅÏ°ªÈ®ÀÎ");
				
				
				//°Ë»öÇÑ Á¶°ÇÀÇ ÃÑ °³¼ö¸¦ ÆÄ¾ÇÇÏ´Â ¸Þ¼­µå¸¦ È£Ãâ ÈÄ º¯¼ö¿¡ ´ã¾ÆÁØ´Ù.
				int SmemberCount = Mdao.getsearchCount(selBox, search);
				
				//¸Þ¼­µå¿¡¼­ ¹Þ¾Æ¿Â °ª ¼ÂÆÃÇÏ´Â ºÎºÐ	
				
				int Slastpage = (int)(Math.ceil((double)SmemberCount/(double)SpagePerRow));
				int Sexpage = 1;
				if(ScurrentPage == 0){
					ScurrentPage++;
				}else if(ScurrentPage >Slastpage){
					ScurrentPage = Slastpage;
				}
				
				model.addAttribute("ScurrentPage", ScurrentPage);
				model.addAttribute("SmemberCount",SmemberCount);
				model.addAttribute("SpagePerRow",SpagePerRow);
				model.addAttribute("Slastpage",Slastpage);
				model.addAttribute("Mlist",Mlist);
				model.addAttribute("Sexpage",Sexpage);
			
				
				
				
				
				return "/member/member_select";
			}
	//¸®½ºÆ®
	@RequestMapping(value="/member_list", method = RequestMethod.GET)
	
	public String MemberList(
			Model model
			,@RequestParam(value="currentPage",required=false,defaultValue="1" )int currentPage){
		System.out.println("MemberList ¸Þ¼­µå ½ÇÇà È®ÀÎ  Member_Controller.java ");
		int memberCount = Mdao.getMemberCount();
		System.out.println(memberCount+"<-----memberCount °ª È®ÀÎ");
		int pagePerRow = 10;
		int lastpage = (int)(Math.ceil((double)memberCount/(double)pagePerRow));
		int expage = 1;
		if(currentPage == 0){
			currentPage++;
		}else if(currentPage >lastpage){
			currentPage = lastpage;
		}
		
		
		//json¹æ½Ä »ç¿ë
				JSONArray memberListJson = null;
				//¸®½ºÆ® Äõ¸® È£Ãâ
				List<Member> list = Mdao.getMemberList(currentPage, pagePerRow);		
				
				System.out.println(lastpage+"lastpage ¸®ÅÏ°ª È®ÀÎ");
				System.out.println(currentPage+"currentPage ¸®ÅÏ°ª È®ÀÎ");
				
				memberListJson = JSONArray.fromObject(list);
				
				model.addAttribute("jsonString", memberListJson);
				
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("memberCount",memberCount);
				model.addAttribute("pagePerRow",pagePerRow);
				model.addAttribute("lastpage",lastpage);
				model.addAttribute("list",list);
				model.addAttribute("expage",expage);
			
		
		return "/member/member_list";
		
	}
	
	//È¸¿ø °³ÀÎ Á¤º¸ ¿­¶÷ È­¸é
	@RequestMapping(value="/member_information_view" ,method = RequestMethod.GET)
	public String memberView(Model model,@RequestParam(value="member_phone",required=false,defaultValue="1")String member_phone){
		System.out.println("memberView ¸Þ¼­µå ½ÇÇà È®ÀÎ  Member_Controller.java ");
		Member m = Mdao.getMember(member_phone);
		model.addAttribute("Member",m);
		return "/member/member_information_view";
		
	}
	
	//µ¿Àû ¼öÁ¤È­¸é ¿¬½À
	@RequestMapping(value ="/ajax_member_update", method = RequestMethod.GET)
	@ResponseBody
	public void ajax_update(
			 HttpServletResponse re
			,@RequestParam(value="member_phone")String member_phone) throws IOException{
		System.out.println("µ¿Àû ¼öÁ¤Ã³¸® update ¸Þ¼­µå È£Ãâ    Member_Controller.java");
		
		/*model.addAttribute("Member",m);*/
		URLEncoder.encode(member_phone , "UTF-8");
		re.setCharacterEncoding("UTF-8");
		//out °´Ã¼ »ç¿ëÇÏ±â À§ÇØ ÁØºñ
		PrintWriter out = re.getWriter();
		//json¹æ½Ä »ç¿ë
		JSONArray J_member_update = null;
		//ÇÑ¸íÀÇ È¸¿øÁ¤º¸ Ãâ·Â Äõ¸® È£Ãâ
		Member member_update = Mdao.getMember(member_phone);
		//¹Þ¾Æ¿Â È¸¿øÁ¤º¸¸¦ Á¦ÀÌ¼Õ °´Ã¼¿¡ ³Ö¾îÁÜ 
		J_member_update = JSONArray.fromObject(member_update);
		System.out.println(J_member_update);	
		//»õ·Î¿î È­¸é¿¡¼­ json¹æ½ÄÀ¸·Î ¹Þ¾Æ¿Â °ª Ãâ·Â
		out.write(J_member_update.toString());
		//¸Þ¸ð¸® ÃÊ±âÈ­
		out.flush();
	}
	
	
	//µ¿Àû ¼öÁ¤Ã³¸® ¸Þ¼­µå ¿¬½À
		@RequestMapping(value ="/ajax_member_update_action", method = RequestMethod.POST)
		@ResponseBody
		public void ajax_update_Action(
					@RequestParam(value="member_join")String member_join
					,@RequestParam(value="member_name")String member_name
					,@RequestParam(value="member_phone")String member_phone
					,@RequestParam(value="member_point")int member_point
					,@RequestParam(value="member_sign")String member_sign
					,@RequestParam(value="p_member_phone")String p_member_phone){
			System.out.println("ajax_update_Action ¸Þ¼­µå ½ÇÇà");
		/*	System.out.println(member_join+"member_join Member_Controller.java");
			System.out.println(member_name+"member_name Member_Controller.java");
			System.out.println(member_phone+"Member_Controller.java");
			System.out.println(member_point+"Member_Controller.java");
			System.out.println(member_sign+"Member_Controller.java");*/
			System.out.println(member_phone+"<<<member_phone  ¼öÁ¤Ã³¸® ÀÔ·Â °ª Member_Controller.java");
			System.out.println(p_member_phone+"<<<p_member_phone  Á¶È¸ÇÒ ÇÚµåÆù ¹øÈ£ Member_Controller.java");
			Member m = new Member();
			m.setMember_join(member_join);
			m.setMember_name(member_name);
			m.setMember_phone(member_phone);
			m.setMember_point(member_point);
			m.setMember_sign(member_sign);
			
			m.setP_member_phone(p_member_phone);
			System.out.println(m.getMember_phone()+"ÀÔ·Â¹ÞÀº ÇÚµåÆù ¹øÈ£<=-----------");
			System.out.println(m.getMember_phone()+"Á¶È¸ÇÒ ÇÚµåÆù ¹øÈ£<=-----------");
			Mdao.Mupdate(m);
		
		}
	
	//¼öÁ¤Ã³¸® È­¸é Ãâ·Â ¸Þ¼­µå 
	@RequestMapping(value ="/member_update", method = RequestMethod.GET)
		public String update(Model model,@RequestParam(value="member_phone")String member_phone){
			System.out.println("update ¸Þ¼­µå È£Ãâ    Member_Controller.java");
			Member m = Mdao.getMember(member_phone);
			model.addAttribute("Member",m);
			
		return "/member/member_Update";
		}
	//¼öÁ¤Ã³¸® ¸Þ¼­µå
	@RequestMapping(value ="/member_update", method = RequestMethod.POST)
	public String update_Action(Member m){
		System.out.println("update_Action¸Þ¼­µå È£Ãâ    Member_Controller.java");
		System.out.println(m.getMember_phone()+"<=-----------");
		Mdao.Mupdate(m);
	return "redirect:member_information_view?member_phone="+m.getMember_phone();
	}
	//»èÁ¦È­¸é Ãâ·Â ¸Þ¼­µå
	@RequestMapping(value="/member_Secede",method = RequestMethod.GET)
	public String memberDeletePage(Model model , @RequestParam(value="member_phone")String member_phone){
		Member m = Mdao.getMember(member_phone);
		model.addAttribute("Member",m);
		
		System.out.println("memberDeletePage ¸Þ¼­µå È£Ãâ    Member_Controller.java");
		return "/member/member_Secede";
	}
	// »èÁ¦Ã³¸® ¸Þ¼­µå
		@RequestMapping(value="/member_SecedeAction",method = RequestMethod.POST)
		public String memberDelete(@RequestParam(value="member_phone")String member_phone){
			System.out.println("memberDelete¸Þ¼­µå È£Ãâ    Member_Controller.java");
			Mdao.deleteMember(member_phone);
			return "redirect:member_list";
		}
		
	

}
