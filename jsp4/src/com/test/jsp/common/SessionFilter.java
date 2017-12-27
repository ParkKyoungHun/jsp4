package com.test.jsp.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionFilter implements Filter {

	private ArrayList<String> urlList;
	@Override
	public void destroy() {
		System.out.println("필터클래스 종료!!");
	}

	@Override
	public void doFilter
	(ServletRequest req, ServletResponse res, FilterChain fc) 
			throws IOException, ServletException {
		System.out.println("session");
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		String url = request.getServletPath();
		boolean allowedRequest = false;
		
		if(urlList.contains(url) || url.indexOf("css")!=-1 || url.indexOf("js")!=-1) {
			allowedRequest = true;
		}
			
		if (!allowedRequest) {
			HttpSession session = request.getSession(false);
			if (null == session || session.getAttribute("user")==null) {
				response.sendRedirect("/user/login.jsp");
			}
		}else {
			fc.doFilter(req, res);
		}
	}

	@Override
	public void init(FilterConfig fc) throws ServletException {
		String urls = fc.getInitParameter("avoidUrls");
		StringTokenizer token = new StringTokenizer(urls, ",");

		urlList = new ArrayList<String>();

		while (token.hasMoreTokens()) {
			urlList.add(token.nextToken());
		}
		System.out.println("Session 필터클래스 최초 생성!!");
	}

}
