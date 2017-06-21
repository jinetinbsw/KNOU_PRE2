package kr.or.possys.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.possys.Payment_service.Payment;
import kr.or.possys.Staff_service.Staff;
import kr.or.possys.Staff_service.Staff_Dao;
import kr.or.possys.food_service.Food;

@Controller
public class Staff_Controller {
	
	@Autowired
	private Staff_Dao sdao;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		System.out.println("���� ȭ�� ������ �޼��� ���� Staff_Controller.java");
		
		return "main";
	}
	
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String home() {
		System.out.println(" index ȭ��(�α���ȭ��) ������ �޼��� ���� Staff_Controller.java");
		
		return "join";
	}
	//������ �������� �̵������ִ� �޼���
	@RequestMapping(value = "/home")
	public String home2() {
		System.out.println(" index ȭ�� ���� Ȯ�� Staff_Controller.java");
		
		return "index2";
	}
	//������ �α��� ��ư �������� ����
	//�α��� üũ �޼���
	@RequestMapping(value = "/loginAction", method = RequestMethod.POST)
	public String login(HttpServletRequest request) {
		System.out.println(" loginAction �޼��� ���� Ȯ�� Staff_Controller.java");
		String id = request.getParameter("usercode");
		String pw = request.getParameter("password");
			
		/*System.out.println(id+"id��");
		System.out.println(pw+"pw��");*/
		Staff s = sdao.loginSelect(id);
		
		/*System.out.println(s.getStaff_date()+"<< �Ի糯¥");
		*/
		String Staff_date = s.getStaff_date().substring(0, 10);
		/*System.out.println(s+"<<<���ϰ� Ȯ��");*/
		String returnURL = "";
		
		//������ ���� ���̵� �н����� ��ġ�� admin ���� key ����
		if(s != null){
			if(s.getStaff_id().equals(request.getParameter("usercode")) && s.getStaff_pw().equals(request.getParameter("password"))){
						//���Ѻ� ȭ�� ��� ������ �����϶�
							if(s.getStaff_level().equals("����")){
							Map<String,Object> map = new HashMap<String,Object>();
							map.put("admin_id",s.getStaff_id());
							map.put("admin_name",s.getStaff_name());
							map.put("admin_level", s.getStaff_level());
							map.put("admin_date", Staff_date);
							request.getSession().setAttribute("admin", map);
							
							System.out.println(" �α��� ���� ��ġ ������ȭ�� �̵� Staff_Controller.java");
							returnURL = "redirect:/test_index/index"; // ��ġ�ϸ� ������ ȭ������ �̵�
						//���Ѻ� ȭ�� ��� ������ �Ŵ����϶�
							}
							
							else if(s.getStaff_level().equals("�Ŵ���")){
							Map<String,Object> map = new HashMap<String,Object>();
							map.put("Staff_id",s.getStaff_id());
							map.put("Staff_name",s.getStaff_name());
							map.put("Staff_level", s.getStaff_level());
							map.put("Staff_date", Staff_date);
							request.getSession().setAttribute("Staff", map);
							
							System.out.println(" �α��� ���� ��ġ ����ȭ�� �̵� Staff_Controller.java");
							returnURL = "redirect:/home"; // ��ġ�ϸ� ���� ȭ������ �̵�
				
							}
							
							else{
								
								returnURL = "redirect:/join";
							}
						
				}else{
				System.out.println(" �α��� ���� ��ġ���� ���� �α���â �̵� Staff_Controller.java");
				returnURL = "redirect:/join"; // ��ġ���� ������ �α��������� ���̵�
				}
		
		}else {
			System.out.println(" �α��� ���� ��ġ���� ���� �α���â �̵� Staff_Controller.java");
			returnURL = "redirect:/join"; // ��ġ���� ������ �α��������� ���̵�
			
		}
		
		return returnURL;
	}
	
	//�α׾ƿ� ��ư Ŭ���� �α��� ������ �̵������ִ� �޼���
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		System.out.println(" ��Ʈ�ѷ� �α׾ƿ� �޼��� ���� Staff_Controller.java");	
		request.getSession().invalidate();
		request.getSession().removeAttribute("admin");
		request.getSession().removeAttribute("Staff");
		return "join";
		
	}
	//���� �������� �̵������ִ� �޼���
	@RequestMapping(value = "/Staff")
	public String Staff() {
		System.out.println(" Staff ȭ�� ���� Ȯ�� Staff_Controller.java");
		
		
		return "Staff";
	}
	
	/*@RequestMapping(value="/", method = RequestMethod.GET)
	public String start(){
		return "home";
	}*/
	
	//�������̵� �ߺ�üũ
		@ResponseBody
		@RequestMapping(value="/tori/staff/chkDupStaffId")
		public String checkCardId(@RequestParam(value="prmId",required=true) String staff_id) throws Exception{
			System.out.println("checkStaffId");
			System.out.println(staff_id);
			int checkStaffId = sdao.check_staffid(staff_id); // checkCardId�� �־����� ���� 0 �ƴϸ� 1.. �̰��� StringŸ������ ��ȯ�Ͽ��� �Ѵ�. �׷��� �Ʒ��� ���Ǻб�(1�̸� �ߺ�, 0�̸� ��밡��)�� ��������� �Ѵ�.
			System.out.println(checkStaffId);
			String duvalue = null;
			if(checkStaffId==0){
				System.out.println("���̵� ��밡��");
				duvalue = "Y";
			}else{
				System.out.println("���̵� �ߺ��Ǿ����");
				duvalue = "N";
			}
			
			return duvalue;
		}
		
	//��������ȣ �ߺ�üũ
			@ResponseBody
			@RequestMapping(value="/tori/staff/chkDupStaffPhone")
			public String checkStaffPhone(@RequestParam(value="prmId",required=true) String staff_phone) throws Exception{
				System.out.println("checkStaffPhone");
				System.out.println(staff_phone);
				int checkStaffPhone = sdao.check_staffphone(staff_phone); // checkCardId�� �־����� ���� 0 �ƴϸ� 1.. �̰��� StringŸ������ ��ȯ�Ͽ��� �Ѵ�. �׷��� �Ʒ��� ���Ǻб�(1�̸� �ߺ�, 0�̸� ��밡��)�� ��������� �Ѵ�.
				System.out.println(checkStaffPhone);
				String duvalue = null;
				if(checkStaffPhone==0){
					System.out.println("���̵� ��밡��");
					duvalue = "Y";
				}else{
					System.out.println("���̵� �ߺ��Ǿ����");
					duvalue = "N";
				}
					
				return duvalue;
			}
	
	
	// �����߰� ������ ����
	@RequestMapping(value="/tori/staff/staff_add_form", method = RequestMethod.GET)
	public String staffadd(){
		System.out.println("01 Staff_Controller.java -> staffadd");
		return "/tori/staff/staff_add_form";
	}
	
	// �����߰� �׼� ����
	@RequestMapping(value="/tori/staff/staff_add_action", method = RequestMethod.POST)
	public String staffadd(Staff Staff){
		System.out.println("01_1 Staff_Controller.java -> paymentadd");
		
		String id = Staff.getStaff_id();
		System.out.println(id+"<------- ��Ʈ�ѷ� ���� Ȯ���Ѵ�.");
		
		sdao.insertStaff(Staff);
		return "redirect:/tori/staff/staff_list";
	}
	
	// ���� ��� ���� ������ ����
	@RequestMapping(value={"/tori/staff/staff_list"}, method = RequestMethod.GET)
	public String stafflist(Model model, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage){
		System.out.println("02_Staff_Controller.java -> stafflist");
		int staffcount = sdao.getStaffCount();
		System.out.println(staffcount);
		System.out.println("02_1 Staff_Controller.java -> stafflist");
		int pagePerRow = 10;
		int expage = 1;
		int lastPage = (int)(Math.ceil((double)staffcount/(double)pagePerRow));
		List<Staff> list = sdao.getStaffList(currentPage, pagePerRow);
		System.out.println(staffcount);
		System.out.println(Math.ceil(staffcount/pagePerRow));
		System.out.println(lastPage);
		// paymentcount �� pagePerRpw(�� pageRow -> list���������� pagePerRow�� el���� �̸��� �ۼ��Ǿ� �ִ� ���� Ȯ���ϰ�(���к� ������ ����) �������� �ش� �̸��� �°� ���� �� double�� Ÿ�� ĳ����)
		
		model.addAttribute("expage",expage);
		model.addAttribute("pagePerRow",pagePerRow);
		model.addAttribute("staffcount",staffcount);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("list",list);
		
		return "/tori/staff/staff_list";
		
	}
	
	//����Ʈ���� ��� �Ѿ��
		@RequestMapping(value={"/tori/staff/staff_view"}, method = RequestMethod.GET)
		public String stafftview(Model model , @RequestParam(value="staff_id",required=true) String staff_id){
			System.out.println("03_Payment_Controller.java -> paymentview");
			Staff staff = sdao.getStaff(staff_id);
			model.addAttribute("staff",staff);
			return "/tori/staff/staff_view";
		}
	
	//���Ǻ� �˻� ������ ����
		@RequestMapping(value={"/tori/staff/staff_search_form"}, method = RequestMethod.GET)
		public String staffsearch(){
			System.out.println("staffsearchform");
			return "/tori/staff/staff_search_form";
		}
	
	//���Ǻ� �˻� ����Ʈ ǥ��
		@RequestMapping(value={"/tori/staff/staff_search_action"}, method = RequestMethod.POST)
		public String staffSRsearch(Model model,
				@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
				@RequestParam(value="select") String select,
				@RequestParam(name="keyWord") String keyWord){
			System.out.println("staffSRlist");
			int staffSRcount = sdao.staffSRlist(select,keyWord);
			int pagePerRow = 10;
			int lastPage = (int)(Math.ceil((double)staffSRcount/(double)pagePerRow));
			List<Staff> list = sdao.staffSRsearch(select, keyWord, currentPage, pagePerRow);
			int expage = 1;
			
			model.addAttribute("select",select);
			model.addAttribute("keyWord",keyWord);
			model.addAttribute("expage",expage);
			model.addAttribute("pagePerRow",pagePerRow);
			model.addAttribute("staffSRcount",staffSRcount);
			model.addAttribute("currentPage",currentPage);
			model.addAttribute("lastPage",lastPage);
			model.addAttribute("list",list);
			
			return "redirect:/tori/staff/staff_search_list";
			
		}
		
	//���Ǻ� �˻���� ����Ʈ ǥ��
		@RequestMapping(value={"/tori/staff/staff_search_list"}, method = RequestMethod.GET)
		public String paymentSRlist(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
				,@RequestParam(value="select") String select
				,@RequestParam(value="keyWord") String keyWord){
			System.out.println("stafflist");
			int staffSRcount = sdao.staffSRlist(select,keyWord);
			System.out.println(staffSRcount);
			System.out.println("stafflist");
			int pagePerRow = 10;
			int expage = 1;
			int lastPage = (int)(Math.ceil((double)staffSRcount/(double)pagePerRow));
			List<Staff> staffSRsearch = sdao.staffSRsearch(select,keyWord,currentPage, pagePerRow);
			System.out.println(staffSRcount);
			System.out.println(Math.ceil(staffSRcount/pagePerRow));
			System.out.println(lastPage);
			// paymentcount �� pagePerRpw(�� pageRow -> list���������� pagePerRow�� el���� �̸��� �ۼ��Ǿ� �ִ� ���� Ȯ���ϰ�(���к� ������ ����) �������� �ش� �̸��� �°� ���� �� double�� Ÿ�� ĳ����)
			
			model.addAttribute("select",select);
			model.addAttribute("keyWord",keyWord);
			model.addAttribute("expage",expage);
			model.addAttribute("pagePerRow",pagePerRow);
			model.addAttribute("staffSRcount", staffSRcount);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("staffSRsearch",staffSRsearch);
			
			return "/tori/staff/staff_search_list";
			
		}
		
	//�������� �̵��Ѵ�
		@RequestMapping(value={"/tori/staff/staff_update_form"}, method = RequestMethod.GET)
		public String staffupdate(Model model , @RequestParam(value="staff_id",required=true) String staff_id){
			Staff staff = sdao.getStaff(staff_id);
			model.addAttribute("staff",staff);
			return "/tori/staff/staff_update_form";
		}
		
	
	//���������� �����׼� ����
		@RequestMapping(value={"/tori/staff/staff_update_action"}, method = RequestMethod.POST)
		public String staffupdate(Staff staff){
			sdao.updateStaff(staff);
			return "redirect:/tori/staff/staff_list";
		}
	
	//���������� �̵��Ѵ�
		@RequestMapping(value={"/tori/staff/staff_delete_form"}, method = RequestMethod.GET)
		public String staffdelete(Model model, @RequestParam(value="staff_id",required=true) String staff_id){
			Staff staff = sdao.getStaff(staff_id);
			model.addAttribute("staff", staff);
			return "/tori/staff/staff_delete_form";
		}
	
	//��������
		@RequestMapping(value={"/tori/staff/staff_delete_action"}, method = RequestMethod.POST)
		public String staffdelete(@RequestParam(value="staff_id",required=true) String staff_id,
								@RequestParam(value="staff_pw",required=true) String staff_pw){
			sdao.deleteStaff(staff_id, staff_pw);
			return "redirect:/tori/staff/staff_list";
		}
		
	/*//staff_id �ߺ�üũ
		@ResponseBody
		@RequestMapping(value="/tori/staff/chkDupStaffId")
		public String checkStaffId(@RequestParam(value="prmId",required=true)String staff_id) throws Exception{
			System.out.println("checkStaffId");
			System.out.println(staff_id);
			int checkStaffId = sdao.check_sid(staff_id);
			System.out.println(checkStaffId);
			String duvalue = null;
			if(checkStaffId == 0){
				System.out.println("���̵� ��밡��");
				duvalue = "Y";
			}else{
				System.out.println("���̵� �ߺ��Ǿ����");
				duvalue = "N";
			}
			
			return duvalue;
		}*/
}
