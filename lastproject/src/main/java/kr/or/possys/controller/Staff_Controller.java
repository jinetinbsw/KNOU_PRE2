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

import kr.or.possys.Staff_service.Staff;
import kr.or.possys.Staff_service.Staff_Dao;
import kr.or.possys.food_service.Food;

@Controller
public class Staff_Controller {
	
	@Autowired
	private Staff_Dao sdao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println(" index ȭ��(�α���ȭ��) ������ �޼��� ���� Staff_Controller.java");
		
		return "join";
	}
	//������ �������� �̵������ִ� �޼���
	@RequestMapping(value = "/home")
	public String home2() {
		System.out.println(" index ȭ�� ���� Ȯ�� Staff_Controller.java");
		
		return "index";
	}
	//������ �α��� ��ư �������� ����
	//�α��� üũ �޼���
	@RequestMapping(value = "/loginAction", method = RequestMethod.POST)
	public String login(HttpServletRequest request) {
		System.out.println(" loginAction �޼��� ���� Ȯ�� Staff_Controller.java");
		String id = request.getParameter("usercode");
		String pw = request.getParameter("password");
	
		Staff s = sdao.loginSelect(id);
	
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
							request.getSession().setAttribute("admin", map);
							
							System.out.println(" �α��� ���� ��ġ ������ȭ�� �̵� Staff_Controller.java");
							returnURL = "redirect:/home"; // ��ġ�ϸ� ������ ȭ������ �̵�
						//���Ѻ� ȭ�� ��� ������ �Ŵ����϶�
							}
							
							if(s.getStaff_level().equals("�Ŵ���")){
							Map<String,Object> map = new HashMap<String,Object>();
							map.put("Staff_id",s.getStaff_id());
							map.put("Staff_name",s.getStaff_name());
							map.put("Staff_level", s.getStaff_level());
							request.getSession().setAttribute("Staff", map);
							
							System.out.println(" �α��� ���� ��ġ ����ȭ�� �̵� Staff_Controller.java");
							returnURL = "redirect:/Staff"; // ��ġ�ϸ� ���� ȭ������ �̵�
				
						}
				}else{
				System.out.println(" �α��� ���� ��ġ���� ���� �α���â �̵� Staff_Controller.java");
				returnURL = "redirect:/"; // ��ġ���� ������ �α��������� ���̵�
				}
		
		}else {
			System.out.println(" �α��� ���� ��ġ���� ���� �α���â �̵� Staff_Controller.java");
			returnURL = "redirect:/"; // ��ġ���� ������ �α��������� ���̵�
			
		}
		
		return returnURL;
	}
	
	//�α׾ƿ� ��ư Ŭ���� �α��� ������ �̵������ִ� �޼���
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		System.out.println(" ��Ʈ�ѷ� �α׾ƿ� �޼��� ���� Staff_Controller.java");	
		request.getSession().invalidate();
		request.getSession().removeAttribute("admin");
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
	
	@RequestMapping(value="/tori/staff/staff_add_form", method = RequestMethod.GET)
	public String staffadd(){
		System.out.println("01 Staff_Controller.java -> staffadd");
		return "/tori/staff/staff_add_form";
	}
	
	@RequestMapping(value="/tori/staff/staff_add_action", method = RequestMethod.POST)
	public String staffadd(Staff Staff){
		System.out.println("01_1 Staff_Controller.java -> paymentadd");
		
		String id = Staff.getStaff_id();
		System.out.println(id+"<------- ��Ʈ�ѷ� ���� Ȯ���Ѵ�.");
		
		sdao.insertStaff(Staff);
		return "redirect:/tori/staff/staff_list";
	}
	
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
}
