package ch06_oracleJDBC;

import java.sql.*;
import java.util.ArrayList;

public class UseDBPool5 {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	
	public ArrayList<Bean> getList() {
		ArrayList<Bean> alist = new ArrayList<Bean>();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select * from department");
			while(rs.next()) {
				Bean bean = new Bean();
				bean.setDept_id(rs.getString(1));
				bean.setDept_title(rs.getString(2));
				bean.setLocation_id(rs.getString(3));
				alist.add(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
}
