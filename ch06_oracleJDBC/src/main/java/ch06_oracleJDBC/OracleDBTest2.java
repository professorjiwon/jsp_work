package ch06_oracleJDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class OracleDBTest2 {

	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tjoeun", "1234");
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from department");
			
			while(rs.next()) {
				String deptId = rs.getString(1); 
				String deptTitle = rs.getString(2);
				String location = rs.getString(3);
				System.out.println(deptId + ", " + deptTitle + ", " + location);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
}
