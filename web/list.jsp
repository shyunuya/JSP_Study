<%--
  Created by IntelliJ IDEA.
  User: EdwardMac
  Date: 2017. 8. 9.
  Time: 오후 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BBS</title>
</head>
<body>
	<%
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		String url = "jdbc:odbc:bbs_db";
		String id = "";
		String pass = "";
		int total = 0;
		
		try {
			Connection conn = DriverManager.getConnection(url,id,pass);
			Statement stmt = conn.createStatement();
			String sql = "SELECT COUNT(*) FROM board";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			rs.close();
			out.print("Total post : " + total);
			
			String sqlList = "SELECT NUM, USERNAME, TITLE, TIME, VIEWS FROM board ORDER BY NUM DESC";
			rs = stmt.executeQuery(sqlList);
		
	%>
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr height="5">
			<td width="5"></td>
		</tr>
		<tr
			style="background: url('img/table_img.jpg') repeat-x; text-align: center;">
			<td width="5"><img src="img/table_img.jpg" width="5" height="30" /></td>
			<td width="73">No.</td>
			<td width="379">Title</td>
			<td width="73">Author</td>
			<td width="164">Created</td>
			<td width="58">Views</td>
			<td width="7"><img src="img/table_img.jpg" width="5" height="30" /></td>
		</tr>
		<%
			if(total ==0 ) {
				
		%>

		<tr align="center" bgcolor="#FFFFFF" height="30">
			<td colspan="6">There is no post.</td>
		</tr>
		<%
			} else {
				while(rs.next()) {
					int idx = rs.getInt(1);
					String name = rs.getString(2);
					String title = rs.getString(3);
					String time = rs.getString(4);
					int views = rs.getInt(5);
		%>
		<tr height="25" align="center">
			<td>&nbsp;</td>
			<td><%=idx %></td>
			<td align="left"><%=title %></td>
			<td align="center"><%=name %></td>
			<td align="center"><%=time %></td>
			<td align="center"><%=views %></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#D2D2D2">
			<td colspan="6"></td>
		</tr>
		<%
				}
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch(SQLException e) {
			out.println(e.toString());
		}
		%>
		<tr height="1" bgcolor="#82b5df">
			<td colspan="6" width="752"></td>
		</tr>
	</table>

	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td colspan="4" height="5"></td>
		</tr>
	</table>
</body>
</html>
