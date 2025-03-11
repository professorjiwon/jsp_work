package ch06_oracleJDBC;

import java.sql.*;
import java.util.ArrayList;

public class UseBeanDB4 {
	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "tjoeun";
	private final String PASS = "1234";
	
	public UseBeanDB4() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	// 메소드: list목록 모두 가져오는 메소드
	public ArrayList<Bean> getList() {
		ArrayList<Bean> alist = new ArrayList<Bean>();
		
		try {
			Connection con = DriverManager.getConnection(JDBC_URL, USER, PASS);
			Statement st = con.createStatement();
			String query = "select * from department";
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				Bean bean = new Bean();
				// bean.setDept_id(rs.getString(1));
				bean.setDept_id(rs.getString("dept_id"));
				bean.setDept_title(rs.getString("dept_title"));
				bean.setLocation_id(rs.getString("location_id"));
				alist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return alist;
	}
	
}
