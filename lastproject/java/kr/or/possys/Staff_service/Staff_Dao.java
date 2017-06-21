package kr.or.possys.Staff_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.possys.Staff_service.Staff;

@Repository
public class Staff_Dao {
	// Staff���̺� �°� DAO �����ϱ�.
	@Autowired
private SqlSessionTemplate sqlSessionTemplate;
	//���� �α��� üũ �޼��� 
		public Staff loginSelect(String s){
			System.out.println("loginSelect �޼��� ���� Staff_Dao.java");

		
			return sqlSessionTemplate.selectOne("kr.or.possys.Staff_service.Staff_Mapper.login", s);
		}

	//�����ڵ� �ߺ� �޼���
	public int check_staffid(String staff_id){
		System.out.println("check_staffid");
		System.out.println(staff_id);
			
		return sqlSessionTemplate.selectOne("kr.or.possys.Staff_service.Staff_Mapper.check_staffid",staff_id);
	}	
	
	//�����ڵ��� �ߺ� �޼���
	public int check_staffphone(String staff_phone){
		System.out.println("check_staffphone");
		System.out.println(staff_phone);
				
		return sqlSessionTemplate.selectOne("kr.or.possys.Staff_service.Staff_Mapper.check_staffphone",staff_phone);
	}	
	
	public int updateStaff(Staff Staff) {
		System.out.println("updateStaff");
        return sqlSessionTemplate.update("kr.or.possys.Staff_service.Staff_Mapper.updateStaff", Staff);
    }
    
    public int deleteStaff(String staff_id, String staff_pw) {
    	System.out.println("deleteStaff");
        Staff Staff = new Staff();
        Staff.setStaff_id(staff_id);
        Staff.setStaff_pw(staff_pw);
        return sqlSessionTemplate.delete("kr.or.possys.Staff_service.Staff_Mapper.deleteStaff", Staff);
    }
    
    public Staff getStaff(String staff_id) {
    	System.out.println("getStaff");
        return sqlSessionTemplate.selectOne("kr.or.possys.Staff_service.Staff_Mapper.getStaff", staff_id);
    }
 
    public List<Staff> getStaffList(int currentPage, int pagePerRow) {
    	System.out.println("getStaffList");
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("beginRow", (currentPage-1)*pagePerRow);
        map.put("pagePerRow", pagePerRow);
        System.out.println(map.get("beginRow"));
        System.out.println(map.get("pagePerRow"));
        
        return sqlSessionTemplate.selectList("kr.or.possys.Staff_service.Staff_Mapper.getStaffList", map);
    }
    
    public int getStaffCount(){
    	System.out.println("getStaffCount");
    	// ��ΰ� �߸� �Էµ� ���� ��ó Ȯ������ ����
        return sqlSessionTemplate.selectOne("kr.or.possys.Staff_service.Staff_Mapper.getStaffCount");
    }
 
    //staff �˻��� ��û
    public int staffSRlist(String select, String keyWord){
    	System.out.println("staffSRlist");
    	System.out.println(select);
    	System.out.println(keyWord);
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("select",select);
    	map.put("keyWord", keyWord);
    	return sqlSessionTemplate.selectOne("kr.or.possys.Staff_service.Staff_Mapper.staffSRlist",map);
    }
    
    //staff �˻� ��û
    public List<Staff> staffSRsearch(String select,String keyWord,int currentPage,int pagePerRow){
    	System.out.println("staffSRsearch");
    	System.out.println(select);
    	System.out.println(keyWord);
    	System.out.println(currentPage);
    	System.out.println(pagePerRow);
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("select", select);
    	map.put("keyWord", keyWord);
    	map.put("beginRow", (currentPage-1)*pagePerRow);
    	map.put("pagePerRow", pagePerRow);
    	
    	System.out.println(map.get("select"));
    	System.out.println(map.get("keyWord"));
    	System.out.println(map.get("beginRow"));
    	System.out.println(map.get("pagePerRow"));
    	
    	return sqlSessionTemplate.selectList("kr.or.possys.Staff_service.Staff_Mapper.staffSRsearch",map);
    }
    
    //staff �߰�
    public int insertStaff(Staff Staff) {
    	System.out.println("insertStaff");
        return sqlSessionTemplate.insert("kr.or.possys.Staff_service.Staff_Mapper.insertStaff", Staff);
    }
    
   
   /* public int check_sid(String staff_id){
    	System.out.println("check_sid");
    	System.out.println(staff_id);
    	return sqlSessionTemplate.selectOne("kr.or.possys.Staff_service.Staff_Mapper.check_sid", staff_id);
    }*/
}
