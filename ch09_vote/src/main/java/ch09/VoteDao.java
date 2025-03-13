package ch09;

import java.sql.*;

public class VoteDao {
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	// 설문 등록하기
	public boolean voteInsert(VoteList vlist, VoteItem vitem) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into votelist values(seq_vote.nextval,?,?,?,default,?,default)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vlist.getQuestion());
			pstmt.setString(2, vlist.getSdate());
			pstmt.setString(3, vlist.getEdate());
			pstmt.setInt(4, vlist.getType());
			
			int result = pstmt.executeUpdate();
			
			int lastResult = 0;
			if(result == 1) {
				sql = "insert into voteitem values(seq_vote.currval,?,?,default)";
				pstmt = con.prepareStatement(sql);
				String[] item = vitem.getItem();
				for(int i=0; i<item.length; i++) {
					if(item[i] == null || item[i].equals("")) {
						break;
					}
					pstmt.setInt(1, i);
					pstmt.setString(2, item[i]);
					lastResult = pstmt.executeUpdate();
				}
			}
			if(lastResult == 1)
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
}











