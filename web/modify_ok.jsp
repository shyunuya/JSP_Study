<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Class.forName("org.postgresql.Driver");
String url = "jdbc:postgresql://localhost/board";
String id = "EdwardMac";
String pass = "";
String password="";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
	request.setCharacterEncoding("euc-kr");
    int idx = Integer.parseInt(request.getParameter("idx"));
	String title=request.getParameter("idx");
	String passwd = request.getParameter("password");
	String content = request.getParameter("content");
	
	conn = DriverManager.getConnection(url,id,pass);
	stmt = conn.createStatement();
	String sql = "SELECT PASSWORD FROM bbs WHERE NUMBER=" + idx;
	rs = stmt.executeQuery(sql);
	
	if (rs.next()) {
		password = rs.getString(1);
	}
	
	if (password.equals(passwd)) {
		sql = "UPDATE bbs SET TITLE='"+ title + "', CONTENT='" + content +"' WHERE NUMBER=" + idx;
		stmt.execute(sql);
		%>
<script language="javascript">
		self.window.alert("Updated successfully");
		location.href="view.jsp?idx=<%=idx %>";
		</script>
<%
	} else {
		%>
<script language="javascript">
		self.window.alert("Wrong password");
		location.href="javascript:history.back()";
		</script>
<%
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
