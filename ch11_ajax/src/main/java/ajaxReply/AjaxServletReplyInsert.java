package ajaxReply;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class AjaxServletReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		String name = request.getParameter("name");
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		
		Reply bean = new Reply(0, content, bnum, name, null);
		
		int result = new ReplyDao().insertReply(bean);
		
		response.getWriter().print(result);
	}

}
