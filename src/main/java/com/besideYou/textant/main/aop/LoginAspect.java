package com.besideYou.textant.main.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LoginAspect {
	
	@Pointcut("execution(* com.besideYou.textant.main.controller.MainController.write(..))")
	public void write(){}
	
	@Pointcut("execution(* com.besideYou.textant.main.controller.MainController.text(..))")
	public void text(){}
	
	@Pointcut("execution(* com.besideYou.textant.main.controller.MainController.first(..))")
	public void first(){}

	@Pointcut("execution(* com.besideYou.textant.main.controller.MainController.textAmateur(..))")
	public void textAmateur(){}
	
	@Pointcut("execution(* com.besideYou.textant.main.controller.MainController.writeAmateur(..))")
	public void writeAmateur(){}
	
//	@Pointcut("execution(* com.pknu.bbs.bbs.controller.BBSController.content(..))")
//	public void content(){}
	
	@Around("write() || text() || textAmateur() || writeAmateur()")
	public Object writeFormAdvice(ProceedingJoinPoint pjp)throws Throwable{	
		HttpSession session= null;
		HttpServletResponse res= null;
		
		HttpServletRequest req = null;
		
		for(Object obj : pjp.getArgs()){
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
		
		if(session.getAttribute("id")==null){
			return "main/noLogin";
		}
		Object result=pjp.proceed();
		return result;
	}
	@Around("first()")
	public Object firstAdvice(ProceedingJoinPoint pjp)throws Throwable{	
		HttpSession session= null;
		HttpServletResponse res= null;
		HttpServletRequest req = null;
		
		for(Object obj : pjp.getArgs()){
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
			return "redirect:main.text";
		}
		Object result=pjp.proceed();
		return result;
	}

}
