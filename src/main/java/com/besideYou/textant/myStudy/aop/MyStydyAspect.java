package com.besideYou.textant.myStudy.aop;

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
public class MyStydyAspect {
	
	@Pointcut("execution(* com.besideYou.textant.myStudy.controller.MyStudyController.myStudymain(..))")
	public void myStudymain(){}
	
//	@Pointcut("execution(* com.pknu.bbs.bbs.controller.BBSController.content(..))")
//	public void content(){}
	
	@Around("myStudymain()")
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
		
		
		if(session.getAttribute("userNum")==null){
			return "main/noLogin";
		}
		if(session.getAttribute("id")==null){
			return "main/noLogin";
		}
		Object result=pjp.proceed();
		return result;
	}
}
