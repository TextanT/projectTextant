package com.besideYou.textant.manager.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
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
	
	@Around("managerMain()")
	public Object managerAdvice(ProceedingJoinPoint pjp)throws Throwable{
		
		HttpSession session= null;
		HttpServletResponse res= null;
		HttpServletRequest req = null;
		int userNum;
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
		if(session.getAttribute("id")==null){
			return "main/noLogin";
		}
		userNum = (int)session.getAttribute("userNum");
		System.out.println("manager + userNum : " + userNum);
		if(managerDao.getUserGrade(userNum)!=5) {
			return "main/noGrade";
		};
		
		
		Object result=pjp.proceed();
		return result;
	}
	
	@Around("execution(* com.besideYou.textant.manager.controller.ManagerController.*(..))")
	public Object controllAdvice(ProceedingJoinPoint pjp) throws Throwable{

		HttpSession session= null;
		HttpServletResponse res= null;
		HttpServletRequest req = null;
		int userNum;
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
		if(session.getAttribute("id")==null){
			return "main/noLogin";
		}
		userNum = (int)session.getAttribute("userNum");
		System.out.println("manager + userNum : " + userNum);
		if(managerDao.getUserGrade(userNum)!=5) {
			return "main/noGrade";
		};
		Object result=pjp.proceed();
		return result;
	}

}
