package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import my.util.ConnUtil;

public class DAO {
	String sql="";
	
	
	
	public int count() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		int cnt = 0;
		
		try {
			conn = ConnUtil.getConnection();
			sql = "SELECT COUNT(*) FROM board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt=rs.getInt(1);
			}
			
		}catch(Exception e) {
			
		}finally {
	         ConnUtil.close(pstmt, conn);
		}
		return cnt;
	}
	
	public String pasing(String data) {
		try {
			data = new String(data.getBytes("8859_1"), "euc-kr");
		}catch (Exception e){ }
		return data;
	}
	
	public ArrayList<VO> getMemberList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<VO> alist = new ArrayList<VO>();
		
		try {
			conn = ConnUtil.getConnection();
			sql = "SELECT NUM, USERNAME, TITLE, TIME, HIT, INDENT from board order by ref desc, step asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				VO vo = new VO();
				boolean dayNew = false;
				vo.setNum(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setTitle(rs.getString(3));
				
				Date date = new Date();
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd"); 
				String year = (String)simpleDate.format(date);
				String yea = rs.getString(4).substring(0,10);
				
				if(year.equals(yea)){
					dayNew = true;
				}
				
				vo.setTime(yea);
				vo.setHit(rs.getInt(5));
				vo.setIndent(rs.getInt(6));
				vo.setDayNew(dayNew);
				alist.add(vo);
			}
			
		}catch(Exception e) {
			
		}finally {
			ConnUtil.close(rs,pstmt, conn);
		}
		return alist;
	}
	
	public int getMax() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int max = 0;
		
		try {
			conn = ConnUtil.getConnection();
			sql = "SELECT MAX(NUM) FROM board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				max=rs.getInt(1);
			}
			
		}catch(Exception e) {
			
		}finally {
			ConnUtil.close(rs,pstmt, conn);
		}
		return max;
	}
	
	public void insertWrite(VO vo, int max) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ConnUtil.getConnection();
			sql = "INSERT INTO board(USERNAME,PASSWORD,TITLE,MEMO,REF) VALUES(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pasing(vo.getName()));
			pstmt.setString(2, pasing(vo.getPassword()));
			pstmt.setString(3, pasing(vo.getTitle()));
			pstmt.setString(4, pasing(vo.getMemo()));
			pstmt.setInt(5, max+1);
			
			pstmt.execute();
		}catch(Exception e) {
			
		}finally {
			ConnUtil.close(pstmt, conn);
		}
	}
	
	public VO getView(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		VO vo = null;
		
		try {
			conn = ConnUtil.getConnection();
			sql = "SELECT USERNAME, TITLE, MEMO, TIME, HIT, PASSWORD, REF, INDENT, STEP FROM board WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new VO();
				vo.setName(rs.getString(1));
				vo.setTitle(rs.getString(2));
				vo.setMemo(rs.getString(3));
				vo.setTime(rs.getString(4));
				vo.setHit(rs.getInt(5)+1);
				vo.setPassword(rs.getString(6));
				vo.setRef(rs.getInt(7));
				vo.setIndent(rs.getInt(8));
				vo.setStep(rs.getInt(9));
			}
			
		}catch(Exception e) {
			
		}finally {
			ConnUtil.close(rs,pstmt, conn);
		}
		return vo;
	}
	
	public void UpdateHit(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ConnUtil.getConnection();
			sql = "UPDATE board SET HIT=HIT+1 where NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			
		}finally {
		}
	}
	
	public boolean checkPassword(VO vo, int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean ch = false;
		
		try {
			conn = ConnUtil.getConnection();
			sql = "SELECT NUM FROM board where NUM=? and PASSWORD=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, vo.getPassword());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ch = true;
			} else {
				ch = false;
			}
			
		}catch(Exception e) {
			
		}finally {
			ConnUtil.close(pstmt, conn);
		}
		return ch;
	}
	
	public void delete(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ConnUtil.getConnection();
			sql = "DELETE FROM board WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			
		}finally {
			ConnUtil.close(pstmt, conn);
		}
	}
	
	public void modify(VO vo, int idx) {
		Connection conn = null;
		
		PreparedStatement pstmt = null;
		
		try {conn = ConnUtil.getConnection();
			sql = "UPDATE board SET TITLE=?, MEMO=? where NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pasing(vo.getTitle()));
			pstmt.setString(2, pasing(vo.getMemo()));
			pstmt.setInt(3, idx);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			
		}finally {
			ConnUtil.close(pstmt, conn);
		}
	}
	
	public void UpdateStep(int ref, int step) {
		Connection conn = null;
		
		PreparedStatement pstmt = null;
		
		try {conn = ConnUtil.getConnection();
			sql = "UPDATE board SET STEP=STEP+1 where REF=? and STEP>?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(1, step);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			
		}finally {
			ConnUtil.close(pstmt, conn);
		}
	}
	
	public void insertReply(VO vo, int ref, int indent, int step) {
		Connection conn = null;
		
		PreparedStatement pstmt = null;
		
		try {conn = ConnUtil.getConnection();
			sql = "INSERT INTO board(USERNAME, PASSWORD, TITLE, MEMO, REF, INDENT, STEP) "+
					"VALUES(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pasing(vo.getName()));
			pstmt.setString(2, pasing(vo.getPassword()));
			pstmt.setString(3, pasing(vo.getTitle()));
			pstmt.setString(4, pasing(vo.getMemo()));
			pstmt.setInt(5, ref);
			pstmt.setInt(6, indent+1);
			pstmt.setInt(7, step+1);
			
			pstmt.execute();
		}catch(Exception e) {
			
		}finally {
			ConnUtil.close(pstmt, conn);
		}
	}

}
