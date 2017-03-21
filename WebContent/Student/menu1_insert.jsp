<%@ page contentType="text/html;charset=euc-kr"
	import="java.sql.DriverManager,
                   java.sql.*,my.util.*,DB.*"%>
<%@ page import="DB.*"%>
<%
	MemberDao manager = MemberDao.getInstance();
	StudentDao sdao = StudentDao.getInstance();
%>

<%
	response.setContentType("text/html;charset=euc-kr;");
	request.setCharacterEncoding("euc-kr"); //charset, Encoding ����

	String c_id = request.getParameter("course_id");
	String s_id = manager.LoginID();

	int check = sdao.stuCouresCheck(c_id);
	if (check == 1) {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ConnUtil.getConnection();
			Statement stmt1 = conn.createStatement();
			Statement stmt2 = conn.createStatement();
			Statement stmt3 = conn.createStatement();
			Statement stmt4 = conn.createStatement();

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
						.executeQuery("SELECT credits,nop FROM course WHERE course_id = '"
								+ c_id + "';");
				if (rset2.next()) {

					credits = rset2.getInt(1);
					tot_cred = credits + tot_cred;

					ResultSet rset3 = stmt3
							.executeQuery("SELECT nop FROM course WHERE course_id = '"
									+ c_id + "';");
					if (rset3.next()) {
						nop = rset3.getInt(1);

						ResultSet rset4 = stmt4
								.executeQuery("SELECT p_nop FROM teaches WHERE course_id = '"
										+ c_id + "';");
						if (rset4.next()) {
							p_nop = rset4.getInt(1);
							p_nop++;

							if (tot_cred <= 20 && p_nop <= nop) { // 21 ���� ���Ͽ� ���������ο�(nop)���ϸ� �����Ҽ� �ֵ��� ����

								PreparedStatement stmt5 = conn
										.prepareStatement("UPDATE student SET tot_cred = ? WHERE student_id = '"
												+ s_id + "';");
								stmt5.setInt(1, tot_cred);
								stmt5.execute();
								stmt5.close();
								PreparedStatement stmt6 = conn
										.prepareStatement("UPDATE teaches SET p_nop = ? WHERE course_id = '"
												+ c_id + "';");
								stmt6.setInt(1, p_nop);
								stmt6.execute();
								stmt6.close();
								String sql = "INSERT INTO takes VALUES(?,?)";
								ps = conn.prepareStatement(sql);
								ps.setString(1, s_id);
								ps.setString(2, c_id);
								ps.executeUpdate();

							}
						}

					}
				}
			}
		} catch (Exception e) {
			out.println(e);

		} finally {
			ConnUtil.close(ps, conn);
		}
		response.sendRedirect("menu1.jsp");
	} else {
%>
<script>
	alert("�������� �ʴ� �����Դϴ�.");
	history.go(-1);
</script>
<%
	}
%>


