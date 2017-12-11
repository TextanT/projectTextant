package com.besideYou.textant.manager.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.besideYou.textant.manager.dao.ManagerDao;

@Component
@Aspect
public class ManagerAspect {
	
	@Autowired
	ManagerDao managerDao;
	
	@Pointcut("execution(* com.besideYou.textant.manager.controller.ManagerController.managerMain(..))")
	public void managerMain(){}
	
//	@Pointcut("execution(* com.besideYou.textant.main.controller.MainController.text(..))")
//	public void text(){}
//	
//	@Pointcut("execution(* com.besideYou.textant.main.controller.MainController.first(..))")
//	public void first(){}
//	
//	@Pointcut("execution(* com.pknu.bbs.bbs.controller.BBSController.content(..))")
//	public void content(){}
	
	@Around("managerMain()")
	public Object managerAdvice(ProceedingJoinPoint pjp)throws Throwable{
		
		HttpSession session= null;
		HttpServletResponse res= null;
		HttpServletRequest req = null;
		int userNum;
		for(Object obj : pjp.getArgs()/*Object형배열*/){
			if(obj instanceof HttpSession){
				session =(HttpSession)obj;
			}
			if(obj instanceof HttpServletResponse){
				res =(HttpServletResponse)obj;
			}
			if(obj instanceof HttpServletRequest) {
				req = (HttpServletRequest)obj;
			}
		}
		System.out.println(req.getRequestURI());
//		if(req.getRequestURI().equals("/textant/write.text")) {
//			req.setAttribute("pageNum", "1");
//		}
		if(session.getAttribute("id")==null){
//			컨트롤러가 String을 리턴하므로 가능함
			return "main/noLogin";
//			return "redirect:/loginForm.bbs";
//			res.sendRedirect("/bbs/loginForm.bbs");
		}
		userNum = (int)session.getAttribute("userNum");
		System.out.println("manager + userNum : " + userNum);
		if(managerDao.getUserGrade(userNum)!=5) {
			return "main/noGrade";
		};
		
		
		Object result=pjp.proceed();
//		포인트컷 메소드가 실행되고 난 이후에 코드
		return result;
	}
/*	@Around("first()")
	public Object firstAdvice(ProceedingJoinPoint pjp)throws Throwable{	
		HttpSession session= null;
		HttpServletResponse res= null;
		HttpServletRequest req = null;
		
		for(Object obj : pjp.getArgs()Object형배열){
			if(obj instanceof HttpSession){
				session =(HttpSession)obj;
			}
			if(obj instanceof HttpServletResponse){
				res =(HttpServletResponse)obj;
			}
			if(obj instanceof HttpServletRequest) {
				req = (HttpServletRequest)obj;
			}
		}
		System.out.println(req.getRequestURI());
		if(req.getRequestURI().equals("/textant/write.text")) {
			req.setAttribute("pageNum", "1");
		}
		
		if(session.getAttribute("id")!=null){
//			컨트롤러가 String을 리턴하므로 가능함
			return "redirect:main.text";
//			return "redirect:/loginForm.bbs";
//			res.sendRedirect("/bbs/loginForm.bbs");
		}
		Object result=pjp.proceed();
//		포인트컷 메소드가 실행되고 난 이후에 코드
		return result;
	}*/

}
