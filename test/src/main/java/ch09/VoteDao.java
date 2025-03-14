package ch09;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
			sql = "insert into votelist values(seq_vote.nextval,?,?,?,sysdate,?,default)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vlist.getQuestion());
			pstmt.setString(2, vlist.getSdate());
			pstmt.setString(3, vlist.getEdate());
			pstmt.setInt(4, vlist.getType());
			
			int result = pstmt.executeUpdate();
			
			int lastResult = 0;
			if(result == 1) {
				sql = "insert into voteitem values(seq_vote.currval, ?,?,default)";
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
			if(lastResult == 1) {
				flag = true;
			} else {
				con.rollback();
			}
			con.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	// 설문 목록 가져오기
	public ArrayList<VoteList> getList() {
		ArrayList<VoteList> alist = new ArrayList<VoteList>();
		
		try {
			con = pool.getConnection();
			sql = "select * from votelist order by num desc";	
			/* Statement st = con.createStatement();
			rs = st.executeQuery(sql); */
			ResultSet rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				VoteList vlist = new VoteList();
				vlist.setNum(rs.getInt("num"));
				vlist.setQuestion(rs.getString("question"));
				vlist.setSdate(rs.getString("sdate"));
				vlist.setEdate(rs.getString("edate"));
				alist.add(vlist);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;	
	}
	
	// 질문의 가장 큰 num 가져오기 (제일 최신 설문조사)
	public int getMaxNum( ) {
		int maxNum = 0;
		try {
			con = pool.getConnection();
			sql = "select max(num) from votelist";
			rs = con.createStatement().executeQuery(sql);
			if(rs.next())
				maxNum = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return maxNum;
	}
	
	// 설문폼의 질문과 타입 가져오기
	public VoteList getOneVote(int num) {
		VoteList vlist = new VoteList();
		
		try {
			con = pool.getConnection();
			if(num == 0) {
				num = getMaxNum();
			}
				sql = "select * from votelist where num=" + num;
				
				rs = con.createStatement().executeQuery(sql);
				if(rs.next()) {
					vlist.setQuestion(rs.getString("question"));
					vlist.setType(rs.getInt("type1"));
					vlist.setActive(rs.getInt("active"));
				}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return vlist;
		
	}
	
	// 설문폼의 item 가져오기
	public ArrayList<String> getItem(int num) {
		ArrayList<String> alist = new ArrayList<String>();
		
		try {
			con = pool.getConnection();
			if(num == 0) {
				num = getMaxNum();
			}
			sql = "select item from voteitem where listnum=" + num;
			rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				String re = rs.getString(1);
				alist.add(re);
				// 한줄로 줄이기 alist.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;		
	}
	
	// 투표하기(count 증가)
	public boolean updateCount(int num, String[] itemnum) {  // 0,2,5
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "update VoteItem set count = count+1 where listnum=? and itemnum=?";
			pstmt = con.prepareStatement(sql);
			if(num == 0) {
				num = getMaxNum();
			}
			
			int result = 0;
			for(int i=0; i<itemnum.length; i++) {
				pstmt.setInt(1, num);
				pstmt.setInt(2, Integer.parseInt(itemnum[i]));
				result = pstmt.executeUpdate();
			}
			if(result == 1) 
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	

}
