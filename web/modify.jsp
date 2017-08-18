<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<script language="javascript">

	function modifyCheck() {
		var form = document.modifyform;

		if (!form.title.value) {
			alert("Please enter the title");
			form.title.focus();
			return;
		}
		if (!form.password.value) {
			alert("Wrong password");
			form.password.focus();
			return;
		}
		if (!form.content.value) {
			alert("Please enter the content");
			form.content.focus();
			return;
		}

		form.submit();
	}
</script>

<%
  Class.forName("org.postgresql.Driver");
  String url = "jdbc:postgresql://localhost/board";
  String id = "EdwardMac";
  String pass = "";

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String name = "";
	String password = "";
	String title = "";
	String content = "";
	int idx = Integer.parseInt(request.getParameter("idx"));

	try {
		conn = DriverManager.getConnection(url, id, pass);
		stmt = conn.createStatement();
		String sql = "SELECT USERNAME, PASSWORD, TITLE, CONTENT FROM bbs WHERE NUMBER=" + idx;
		rs = stmt.executeQuery(sql);

		if (rs.next()) {
			name = rs.getString(1);
			password = rs.getString(2);
			title = rs.getString(3);
			content = rs.getString(4);
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Modify post</title>
</head>
<body>
	<table>
		<form name=modifyform method=post action="modify_ok.jsp?idx=<%=idx %>">
		<tr>
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr
						style="background: url('img/table_img.jpg') repeat-x; text-align: center;">
						<td width="5"><img src="img/table_img.jpg" width="5"
							height="30" /></td>
						<td>Update</td>
						<td width="5"><img src="img/table_img.jpg" width="5"
							height="30" /></td>
					</tr>
				</table>
				<table>
					<tr>
						<td>&nbsp;</td>
						<td align="center">Title</td>
						<td><input name="title" size="50" maxlength="100"
							value="<%=title%>"></td>
						<td>&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="center">Name</td>
						<td><%=name%><input type=hidden name=name size=50
							maxlength="100" value="<%=name%>"></td>
						<td>&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="center">Password</td>
						<td><input type=password name="password" id="pass" size="50"
							maxlength="50"></td>
						<td>&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="center">Content</td>
						<td><textarea name="content" cols="50" rows="13"></textarea></td>
						<td>&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4"></td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="4"></td>
					</tr>
					<tr align="center">
						<td>&nbsp;</td>
						<td colspan="2">
						<input type="button" value="Update"	onclick="javascript:modifyCheck();"> 
						<input type="button" value="Cancel" onclick="javascript:history.back(-1)">
						<td>&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	  </form>
	</table>
</body>
</html>
