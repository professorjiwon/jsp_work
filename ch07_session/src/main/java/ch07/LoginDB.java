package ch07;

import java.sql.*;

public class LoginDB {
	private DBConnectionMgr pool;
	
	public LoginDB() {
		pool = DBConnectionMgr.getInstance();
	}
	
	// login 메소드
	public boolean loginMethod(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			String query = "select count(*) from test where userid=? and userpw=?";
	
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next() && rs.getInt(1) > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
}
