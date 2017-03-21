package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import my.util.ConnUtil;

public class CourseDao {

	MemberDao manager = MemberDao.getInstance();
	String LoginID = manager.LoginID();

	private static CourseDao instance = new CourseDao();

	public static CourseDao getInstance() {

		return instance;

	}

	public void insertcourse(CourseVo vo) throws Exception {
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = ConnUtil.getConnection();
			String sql = "insert into course values(?,?,?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getCourse_id());
			stmt.setString(2, vo.getTitle());
			stmt.setInt(3, vo.getCredits());
			stmt.setString(4, vo.getType());
			stmt.setInt(5, vo.getYear());
			stmt.setInt(6, vo.getTerm());
			stmt.setString(7, vo.getClassroom());
			stmt.setInt(8, vo.getNop());
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

			pstmt =conn
					.prepareStatement("select course_id from course where course_id = ?");
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
	public CourseVo confirmId2(String id) {

	      CourseVo voI = new CourseVo();
	      Connection conn = null;
	      PreparedStatement ps = null;
	      ResultSet rs = null;

	      try {
	         conn = ConnUtil.getConnection();

	         String sql = "select * from course where course_id = '"+id+"'";
	         ps = conn.prepareStatement(sql);
	         rs = ps.executeQuery();

	         if (rs.next()) {
	            voI.setCourse_id(rs.getString("course_id"));
	            voI.setTitle(rs.getString("title"));
	            voI.setCredits(rs.getInt("credits"));

	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnUtil.close(rs, ps, conn);
	      }
	      return voI;
	   }
	
	public int confirmTId(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;

		try {
			conn = ConnUtil.getConnection();

			pstmt = conn
					.prepareStatement("select course_id from teaches where course_id = ?");
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
	
	public CourseVo confirmTId2(String id) {

	      CourseVo voI = new CourseVo();
	      Connection conn = null;
	      PreparedStatement ps = null;
	      ResultSet rs = null;

	      try {
	         conn = ConnUtil.getConnection();

	         String sql = "select * from teaches where course_id = '"+id+"'";
	         ps = conn.prepareStatement(sql);
	         rs = ps.executeQuery();

	         if (rs.next()) {
	            voI.setCourse_id(rs.getString("Course_id"));
	            voI.setprofessor_id(rs.getString("professor_id"));
	         

	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnUtil.close(rs, ps, conn);
	      }
	      return voI;
	   }


	

	public void selectprofessor(String courseId,String LoginID,int x) {

		Connection conn = null;
		PreparedStatement ps = null;

		try {
			conn = ConnUtil.getConnection();

			String sql = "INSERT INTO teaches VALUES(?,?,?)";
			ps = conn.prepareStatement(sql);

			ps.setString(1, LoginID);
			ps.setString(2, courseId);
			ps.setInt(3, x);
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnUtil.close(ps, conn);
		}
	}
	
	public void deleteCoursePro(String courseId) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = ConnUtil.getConnection();
			sql = "delete from teaches WHERE course_id = '" + courseId +"'";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnUtil.close(pstmt, conn);
		}
	}
	
	public CourseVo selectCourse() {

	      CourseVo voI = new CourseVo();
	      Connection conn = null;
	      PreparedStatement ps = null;
	      ResultSet rs = null;

	      try {
	         conn = ConnUtil.getConnection();

	         String sql = "select * from Course";
	         ps = conn.prepareStatement(sql);
	         rs = ps.executeQuery();

	         if (rs.next()) {
	            voI.setCourse_id(rs.getString("Course_id"));
	            voI.setTitle(rs.getString("Title"));
	            voI.setCredits(rs.getInt("Credits"));
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnUtil.close(rs, ps, conn);
	      }
	      return voI;
	   }
	public boolean checkCourseTeaches(String courseId) throws SQLException {
		  Connection conn = null;
	      PreparedStatement ps = null;
	      ResultSet rs = null;
	         conn = ConnUtil.getConnection();
	    	
	         String sql = "SELECT professor_Id FROM teaches WHERE course_id = '" + courseId +"'";
	         ps = conn.prepareStatement(sql);
	         rs = ps.executeQuery();
	         
	    	boolean result = false;
	    	
	    	
	    	while(rs.next()) {
	    			result = true;
	        }

	    			         ConnUtil.close(rs, ps, conn);
		    
	        return result;
	    }  
	public boolean checkProfessorTeaches(String ProfessorId, String courseId) throws SQLException {
    	 Connection conn = null;
	      PreparedStatement ps = null;
	      ResultSet rs = null;
	         conn = ConnUtil.getConnection();
	         
	         String sql = "SELECT course_Id FROM teaches WHERE Professor_id = '" + ProfessorId +"'";
	         ps = conn.prepareStatement(sql);
	         rs = ps.executeQuery();
	         
    	
    	boolean result = false;
    	
    	
    	while(rs.next()) {
    		if(rs.getString(1).equals(courseId))
    			result = true;
        }

    	ConnUtil.close(rs, ps, conn);
        return result;
    }  
	public CourseVo displayCourse() throws SQLException {

	      CourseVo voI = new CourseVo(); 
		Connection conn = null;
	      PreparedStatement ps = null;
	      ResultSet rs = null;
	      try{   
	      conn = ConnUtil.getConnection();
	         

	         String sql = "SELECT * FROM course,teaches where course.course_id = teaches.course_id ";
	         ps = conn.prepareStatement(sql);
	         rs = ps.executeQuery();
	         
    	
    	if (rs.next()) {
            voI.setCourse_id(rs.getString("Course_id"));
            voI.setTitle(rs.getString("Title"));
            voI.setCredits(rs.getInt("Credits"));
            voI.setprofessor_id(rs.getString("professor_id"));

         }}  catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnUtil.close(rs, ps, conn);
	      }
	      return voI;
	   }
	
	public int CouCheck(String id) throws Exception {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      int x = -1;
	      try {
	         conn = ConnUtil.getConnection();
	         String sql = "select course_id from course where course_id = '"+id+"'";
	         pstmt = conn.prepareStatement(sql);
	        
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            x = 1; // 인증성공
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return x;
	   }

	   public void deleteCou(String id) throws Exception {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      String sql = null;
	      try {
	         conn = ConnUtil.getConnection();
	         sql = "delete from course where course_id=?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, id);
	         pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         ConnUtil.close(pstmt, conn);
	      }
	   }
    
    }