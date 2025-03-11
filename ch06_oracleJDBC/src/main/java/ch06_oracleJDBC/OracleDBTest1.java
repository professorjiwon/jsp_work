package ch06_oracleJDBC;

import java.sql.Connection;
import java.sql.DriverManager;

public class OracleDBTest1 {

	public static void main(String[] args) {
		try {
			// Class.forName("com.mysql.jdbc.Driver");  // mysql
			Class.forName("oracle.jdbc.OracleDriver");	// oracle
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tjoeun", "1234");
			System.out.println("Success");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
