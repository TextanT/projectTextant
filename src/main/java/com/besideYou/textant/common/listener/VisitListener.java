package com.besideYou.textant.common.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.besideYou.textant.main.dao.LoginServiceDao;

public class VisitListener implements HttpSessionListener{
	LoginServiceDao loginServiceDao;
	
	HttpSession session;
	
	
	@Override
	public void sessionCreated(HttpSessionEvent sessionEvent) {
		// TODO Auto-generated method stub
		if(sessionEvent.getSession().isNew()) {
			visitCount(sessionEvent);
		}
	}

	public void visitCount(HttpSessionEvent sessionEvent) {
		
		 //HttpSession 객체 가져오기
		 HttpSession session = sessionEvent.getSession();
		 
		 //ServletContext 객체 가져오기
		 ServletContext conext = session.getServletContext();
		 
		 //Spring Context 가져오기
		 WebApplicationContext wContext = WebApplicationContextUtils.getWebApplicationContext(conext);
		loginServiceDao = (LoginServiceDao) wContext.getBean("loginServiceDao");
		 
		loginServiceDao.setTotalCount();
		
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent sessionEvent) {
		// TODO Auto-generated method stub
		
	}

}
