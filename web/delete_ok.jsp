<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("euc-kr");

Class.forName("org.postgresql.Driver");
String url = "jdbc:postgresql://localhost/board";
String id = "EdwardMac";
String pass = "";
String password=null;

int idx = Integer.parseInt(request.getParameter("idx"));
String passwd = request.getParameter("password");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
	conn = DriverManager.getConnection(url, id, pass);
	stmt = conn.createStatement();
	String sql = "SELECT PASSWORD FROM bbs WHERE NUMBER=" + idx;
	rs = stmt.executeQuery(sql);
	if (rs.next()){
		password=rs.getString(1);
	}
	
	if(password.equals(passwd)){
		sql = "DELETE FROM bbs WHERE NUMBER=" +idx;
		stmt.execute(sql);
%>
<script language=javascript>
    self.window.alert("Item deleted");
    location.href="list.jsp";
</script>
<%
	} else {
%>
<script language=javascript>
self.window.alert("Wrong Password");
location.href="javascript:history.back()";
</script>
<%
	}
} catch (SQLException e) {
	 out.println(e.toString());
} finally {
	if (rs != null){
		rs.close();
	}
	if (stmt != null){
		stmt.close();
	}
	if (conn != null){
		conn.close();
	}
}

%>
