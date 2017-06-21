package kr.or.possys.Staff_service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Staff_interceptor extends HandlerInterceptorAdapter{

	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	        try {
	            //admin이라는 세션key를 가진 정보가 널일경우 로그인페이지로 이동
	            if(request.getSession().getAttribute("admin") == null && request.getSession().getAttribute("Staff") == null ){
	                    response.sendRedirect("/possys/");
	                    System.out.println("세션정보없음 로그인 화면으로 이동");
	                    return false;
	            }
	            System.out.println("세션정보있음 Staff_interceptor.java");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        //admin 세션key 존재시 main 페이지 이동
	        return true;
	    }
	 
	    @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	        super.postHandle(request, response, handler, modelAndView);
	    }
	 
	    @Override
	    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	        super.afterCompletion(request, response, handler, ex);
	    }
	 
	    @Override
	    public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	        super.afterConcurrentHandlingStarted(request, response, handler);
	    }
	
}
