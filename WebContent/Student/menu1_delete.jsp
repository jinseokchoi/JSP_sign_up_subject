<%@ page contentType="text/html;charset=euc-kr"
	import="java.sql.DriverManager,
                   java.sql.*,my.util.*,DB.*"%>
<%@ page import="DB.MemberDao"%>
<%
	MemberDao manager = MemberDao.getInstance();
%>


<%
	response.setContentType("text/html;charset=euc-kr;");
	request.setCharacterEncoding("euc-kr"); //charset, Encoding ¼³Á¤

	String id = request.getParameter("id");
	String s_id = manager.LoginID();
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	try {
		conn = ConnUtil.getConnection();
		Statement stmt1 = conn.createStatement();
		Statement stmt2 = conn.createStatement();
		Statement stmt3 = conn.createStatement();

		int tot_cred;
		int credits;
		int nop;
		int p_nop;

		ResultSet rset1 = stmt1
				.executeQuery("SELECT tot_cred FROM student WHERE student_id = '"
						+ s_id + "';");
		if (rset1.next()) {
			tot_cred = rset1.getInt(1);

			ResultSet rset2 = stmt2
					.executeQuery("SELECT credits FROM course WHERE course_id = '"
							+ id + "';");
			if (rset2.next()) {
				credits = rset2.getInt(1);
				tot_cred = tot_cred - credits;

				ResultSet rset3 = stmt3
						.executeQuery("SELECT p_nop FROM teaches WHERE course_id = '"
								+ id + "';");
				if (rset3.next()) {
					p_nop = rset3.getInt(1);
					p_nop--;

					PreparedStatement stmt4 = conn
							.prepareStatement("UPDATE student SET tot_cred = ? WHERE student_id = '"
									+ s_id + "';");
					stmt4.setInt(1, tot_cred);
					stmt4.execute();
					stmt4.close();
					PreparedStatement stmt5 = conn
							.prepareStatement("UPDATE teaches SET p_nop = ? WHERE course_id = '"
									+ id + "';");
					stmt5.setInt(1, p_nop);
					stmt5.execute();
					stmt5.close();
					String sql = "DELETE FROM takes WHERE takes.course_id = '"
							+ id
							+ "' AND takes.student_id = '"
							+ s_id
							+ "'";
					ps = conn.prepareStatement(sql);
					ps.executeUpdate();

					response.sendRedirect("menu1.jsp");
				}
			}
		}
	}

	catch (Exception e) {
		out.println(e);

	}
%>