package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import my.util.ConnUtil;

public class StudentDao {
	static String LoginID = null;

	public String LoginID() {
		return LoginID;
	}

	private static StudentDao instance = new StudentDao();

	public static StudentDao getInstance() {

		return instance;

	}

	public StudentVo selectStudent(String id) {

		StudentVo vo = new StudentVo();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = ConnUtil.getConnection();

			String sql = "select * from student where student_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				vo.setStudent_id(rs.getString("student_id"));
				vo.setStudent_name(rs.getString("student_name"));
				vo.setStudent_phone(rs.getString("student_phone"));
				vo.setStudent_address(rs.getString("student_address"));
				vo.setTot_cred(rs.getInt("tot_cred"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnUtil.close(rs, ps, conn);
		}
		return vo;
	}

	public int updateStudent(StudentVo vo) {
		int rst = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = ConnUtil.getConnection();
			String sql = "update student set student_name=?, student_address=?, student_phone=?, password=HEX(AES_ENCRYPT(?, \"abcd\"))"
					+ "where student_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getStudent_name());
			ps.setString(2, vo.getStudent_address());
			ps.setString(3, vo.getStudent_phone());
			ps.setString(4, vo.getPassword());
			ps.setString(5, vo.getStudent_id());
			
			rst = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnUtil.close(ps, conn);
		}
		return rst;
	}

	

	public void insertStudent(StudentVo vo) throws Exception {
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = ConnUtil.getConnection();
			String sql = "insert into student values(?,?,?,?,null,HEX(AES_ENCRYPT(?, \"abcd\")))";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getStudent_id());
			stmt.setString(2, vo.getStudent_name());
			stmt.setString(3, vo.getStudent_address());
			stmt.setString(4, vo.getStudent_phone());
			stmt.setString(5, vo.getPassword());
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

			pstmt = conn.prepareStatement("select student_id from Student where student_id = ?");
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
	public int stuCheck(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try {
			conn = ConnUtil.getConnection();

			pstmt = conn.prepareStatement("select student_id from Student where student_id = ?");
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
    public void deleteStu(String id)throws Exception{
        Connection conn=null;
        PreparedStatement pstmt =null;
        String sql = null;
        try{
			conn = ConnUtil.getConnection();
            sql = "delete from student where student_id=?";
            pstmt =conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
			ConnUtil.close(pstmt, conn);
        }
    }
    public int stuCouresCheck(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try {
			conn = ConnUtil.getConnection();

			pstmt = conn.prepareStatement("select course_id from teaches where course_id = ?");
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

}
