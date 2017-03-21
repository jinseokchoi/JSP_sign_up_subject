package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

import my.util.ConnUtil;
import DB.Member;

public class MemberDao {

	static Connection con = null;
	static PreparedStatement stmt = null;
	static ResultSet rs = null;

	static String LoginID = null;

	private static MemberDao instance = new MemberDao();

	public String LoginID() {
		return LoginID;
	}

	public static MemberDao getInstance() {
		return instance;
	}

	private MemberDao() {
	}

	// 회원 아이디 , 비밀번호 체크
	public int stuCheck(String id, String passwd) throws Exception {

		LoginID = id;
		int x = -1;
		try {
			con = ConnUtil.getConnection();
			stmt = con.prepareStatement("select  AES_DECRYPT(UNHEX(password), \"abcd\") from student where student_id = '"
					+ id + "';");
		         rs = stmt.executeQuery();
			
			if (rs.next()) {
				if (passwd.equals(rs.getString(1)))
					x = 1; // 인증성공
				else
					x = 0; // 비밀번호 틀림
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
	         ConnUtil.close(rs, stmt, con);
	      }
		return x;
	}

	public int proCheck(String id, String passwd) throws Exception {
		LoginID = id;

		int x = -1;
		try {
			con = ConnUtil.getConnection();
			stmt = con.prepareStatement("select  AES_DECRYPT(UNHEX(password), \"abcd\") from professor where professor_id = '"
					+ id + "';");
		         rs = stmt.executeQuery();
			
			if (rs.next()) {
				if (passwd.equals(rs.getString(1)))
					x = 1; // 인증성공
				else
					x = 0; // 비밀번호 틀림
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
	         ConnUtil.close(rs, stmt, con);
	      }
		return x;
	}}

	