package ch04_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PostServlet04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<body>");
		out.print("<h1>Post Servlet 방식</h1>");
		out.print("<h3>ID : "+ id +"</h3>");
		out.print("<h3>PW : "+ pw +"</h3>");
		out.print("<h3>EMAIL : "+ email +"</h3>");
		out.print("</body>");
		out.print("</html>");
	}

}
