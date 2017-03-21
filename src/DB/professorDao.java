package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import my.util.ConnUtil;

public class professorDao {
	static String LoginID = null;

	public String LoginID() {
		return LoginID;
	}

	private static professorDao instance = new professorDao();

	public static professorDao getInstance() {

		 return instance;

	}

	public professorVo selectprofessor(String id) {

		professorVo voI = new professorVo();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = ConnUtil.getConnection();

			String sql = "select * from professor where professor_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				voI.setprofessor_id(rs.getString("professor_id"));
				voI.setprofessor_name(rs.getString("professor_name"));
				voI.setprofessor_address(rs.getString("professor_address"));
				voI.setprofessor_phone(rs.getString("professor_phone"));
				voI.setprofessor_dept(rs.getString("professor_dept"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnUtil.close(rs, ps, conn);
		}
		return voI;
	}

	public int updateprofessor(professorVo voI) {
		int rst = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ConnUtil.getConnection();
			String sql = "update professor set professor_name=?, professor_address=?, professor_phone=?, professor_dept=?, password=HEX(AES_ENCRYPT(?, \"abcd\"))"
					+ "where professor_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, voI.getprofessor_name());
			ps.setString(2, voI.getprofessor_address());
			ps.setString(3, voI.getprofessor_phone());
			ps.setString(4, voI.getprofessor_dept());
			ps.setString(5, voI.getPassword());
			ps.setString(6, voI.getprofessor_id());

			rst = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnUtil.close(ps, conn);
		}
		return rst;
	}

	public void insertprofessor(professorVo vo) throws Exception {
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = ConnUtil.getConnection();
			String sql = "insert into professor values(?,?,?,?,?,HEX(AES_ENCRYPT(?, \"abcd\")))";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getprofessor_id());
			stmt.setString(2, vo.getprofessor_name());
			stmt.setString(3, vo.getprofessor_address());
			stmt.setString(4, vo.getprofessor_phone());
			stmt.setString(5, vo.getprofessor_dept());
			stmt.setString(6, vo.getPassword());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnUtil.close(stmt, conn);
		}

	}

	public int confirmId(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;

		try {
			conn = ConnUtil.getConnection();

			pstmt = conn
					.prepareStatement("select professor_id from professor where professor_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next())
				x = 1; // 해당 아이디 있음
			else
				x = -1;// 해당 아이디 없음
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}
	public int proCheck(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try {
			conn = ConnUtil.getConnection();

			pstmt = conn.prepareStatement("select professor_id from professor where professor_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
					x = 1; // 인증성공
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	//회원탈퇴 , 회원정보 삭제
    public void deletePro(String id)throws Exception{
        Connection conn=null;
        PreparedStatement pstmt =null;
        String sql = null;
        try{
			conn = ConnUtil.getConnection();
            sql = "delete from professor where professor_id=?";
            pstmt =conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
			ConnUtil.close(pstmt, conn);
        }
    }
}
