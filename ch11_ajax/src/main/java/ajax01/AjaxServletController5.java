package ajax01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;


public class AjaxServletController5 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Member> alist = new MemberDao().getAllMember(); 
		
		// 1. JSONArray : [{}, {}]
		/*
		JSONArray jArr = new JSONArray();
		for(Member m : alist) {
			JSONObject jObj = new JSONObject();
			jObj.put("id", m.getId());
			jObj.put("name", m.getName());
			jObj.put("gender", m.getGender());
			jObj.put("email", m.getEmail());
			jArr.add(jObj);
		}
		
		response.setContentType("application/json");
		response.getWriter().print(jArr);
		*/
		
		response.setContentType("application/json");
		new Gson().toJson(alist, response.getWriter());
	}

}
