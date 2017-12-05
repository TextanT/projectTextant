package com.besideYou.textant.aop;

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
	
	@Pointcut("execution(* com.besideYou.textant.HomeController.write(..))")
	public void write(){}
	
	@Pointcut("execution(* com.besideYou.textant.HomeController.text(..))")
	public void text(){}
	
//	@Pointcut("execution(* com.pknu.bbs.bbs.controller.BBSController.content(..))")
//	public void content(){}
	
	@Around("write() || text()")
	public Object writeFormAdvice(ProceedingJoinPoint pjp)throws Throwable{	
		HttpSession session= null;
		HttpServletResponse res= null;
		
		HttpServletRequest req = null;
		
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
		if(req.getRequestURI().equals("/textant/write.text")) {
			req.setAttribute("pageNum", "1");
		}
		
		if(session.getAttribute("id")==null){
//			컨트롤러가 String을 리턴하므로 가능함
			return "main/noLogin";
//			return "redirect:/loginForm.bbs";
//			res.sendRedirect("/bbs/loginForm.bbs");
		}
		Object result=pjp.proceed();
//		포인트컷 메소드가 실행되고 난 이후에 코드
		return result;
	}


}
