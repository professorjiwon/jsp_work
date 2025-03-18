package ajax01;

import java.io.IOException;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxServletController4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Member bean = new MemberDao().getMember(id);
		
		// 1. 객체의 주소 반환. toString() 오버라이딩 했다면 toString()의 값(문자열)이 반환
		/*
		System.out.println(bean);	
		response.getWriter().print(bean);  // 문자열로 출력
		*/
		
		// 2. JSONObject 객체로
		/*
		JSONObject jObj = new JSONObject();
		jObj.put("userId", bean.getId());
		jObj.put("userName", bean.getName());
		jObj.put("gender", bean.getGender());
		jObj.put("email", bean.getEmail());
		
		response.setContentType("application/json");
		response.getWriter().print(jObj);
		*/
		
		// 3. 2번을 간단하게 하는 방법 : GSON사용
		// MVNREPOSITORY에서 다운로드하여 lib에 넣기
		/*
		 Gson gson = new Gson();
		 gson.toJson(응답할 자바객체, 응답할스트림);
		 */
		
		response.setContentType("application/json");
//		Gson gson = new Gson();
//		gson.toJson(bean, response.getWriter());

		// 위를 한줄로
		new Gson().toJson(bean, response.getWriter());
	}
}
