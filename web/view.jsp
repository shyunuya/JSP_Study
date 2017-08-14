<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
  Class.forName("org.postgresql.Driver");
  String url = "jdbc:postgresql://localhost/board";
  String id = "EdwardMac";
  String pass = "";

	int idx = Integer.parseInt(request.getParameter("idx"));
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		conn = DriverManager.getConnection(url, id, pass);
		stmt = conn.createStatement();
		String sql = "SELECT USERNAME, TITLE, CONTENT, CREATED, VIEWS FROM bbs WHERE NUMBER=" + idx;
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			String name = rs.getString(1);
			String title = rs.getString(2);
			String content = rs.getString(3);
			String created = rs.getString(4);
			int views = rs.getInt(5);
			views++;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>View Post</title>
</head>
<body>
	<table>
		<tr>
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">

					<tr
						style="background: url('img/table_img.jpg') repeat-x; text-align: center;">
						<td width="5"><img src="img/table_img.jpg" width="5"
							height="30" /></td>
						<td>Content</td>
						<td width="5"><img src="img/table_img.jpg" width="5"
							height="30" /></td>
					</tr>
				</table>
				<table width="413">
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">Number</td>
						<td width="319"><%=idx%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">Views</td>
						<td width="319"><%=views%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">Author</td>
						<td width="319"><%=name%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">Created</td>
						<td width="319"><%=created%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">Title</td>
						<td width="319"><%=title%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td width="400" colspan="2" height="300"><%=content%></td>
					</tr>
					<%
						sql = "UPDATE bbs SET VIEWS=" + views + " WHERE NUMBER=" + idx;
								stmt.executeUpdate(sql);
							}
						} catch (SQLException e) {
							out.println(e.toString());
						} finally {
							if (rs != null) {
								rs.close();
							}
							if (stmt != null) {
								stmt.close();
							}
							if (conn != null) {
								conn.close();
							}
						}
					%>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4" width="407"></td>
					</tr>
					<tr align="center">
						<td width="0">&nbsp;</td>
						<td colspan="2" width="400"><input type=button value="Create"
							onclick="window.location='write.jsp'"> 
							<input type=button value="Reply"> 
							<input type=button value="List"	onclick="window.location='list.jsp'"> 
							<input type=button value="Update"> 
							<input type=button value="Delete" onclick="window.location='delete.jsp?idx=<%=idx %>'">
						<td width="0">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
