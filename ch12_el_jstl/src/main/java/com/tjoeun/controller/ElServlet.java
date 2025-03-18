package com.tjoeun.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.tjoeun.vo.Person;

public class ElServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 데이터를 담을 수 있는 JSP내장 객체 종류
		 1. ServletContext(application Scope)
		    한 애플리케이션 당 1개만 존재하는 객체
		    이 영역에 데이터를 담으면 애플리케이션 전역에서 사용가능
		    공유범위가 가장 큼(jsp/servlet/java)
		    
		 2. HttpSession(session Scope)
		 	한 브라우저당 1개 존재하는 객체
		 	이 영역에 데이터를 담으면 jsp/servlet에서 사용가능
		 	공유범위가 2번째로 큼(jsp/servlet)
		 	
		 3. HttpServletRequest(request Scope)	
		 	요청할 때만다 매번 생성되는 객체
		 	이 영역에 데이터를 담으면 request객체를 포워딩 받는 응답jsp에서만 사용가능
		 	공유범위 응답jsp만
		 	
		 4. PageContext(page Scope)
		 	jsp마다 존재하는 객체
		 	공유범위가 가장 작음(해당 페이지)
		 	
		 * 객체들 사용
		 - 데이터를 담을 때 :  .setAttribute("키", 데이터)
		 - 데이터를 가져올 때 : .getAttribute("키")
		 - 데이터를 삭제할 때 : .removeAttribute("키")
		 */
		
		// requestScope에 담기
		request.setAttribute("classRoom", "801호");
		request.setAttribute("student", new Person("홍길동", 23, "남자"));
		
		// sessionScope에 담기
		HttpSession session = request.getSession();
		session.setAttribute("academy", "tjoeun");
		session.setAttribute("teacher", new Person("김지원", 31, "여자"));
		
		// requestScope와 sessionScope에 동일한 키값으로 데이터 담기
		request.setAttribute("scope", "request");
		session.setAttribute("scope", "session");
		
		// applicationScope에 담기
		ServletContext application = request.getServletContext();
		application.setAttribute("scope", "application");
		
		request.getRequestDispatcher("views/01_EL/01.el.jsp").forward(request, response);
	}

}
