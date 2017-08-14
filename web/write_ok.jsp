<%--
  Created by IntelliJ IDEA.
  User: EdwardMac
  Date: 2017. 8. 12.
  Time: 오후 7:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.sql.*" %>

<html>
<head>
    <title>Write_OK</title>
</head>
<body>
<%
    request.setCharacterEncoding("euc-kr"); //받아오는 값들을 한글로 인코딩합니다.

    Class.forName("org.postgresql.Driver");

    String url = "jdbc:postgresql://localhost/board";
    String id = "EdwardMac";
    String pass = "";


    String name = request.getParameter("name"); //write.jsp에서 name에 입력한 데이터값
    String password = request.getParameter("password");//write.jsp에서 password에 입력한 데이터값
    String title = request.getParameter("title"); //write.jsp에서 title에 입력한 데이터값
    String content = request.getParameter("content"); //write.jsp에서 memo에 입력한 데이터값

    try {
        Connection conn = DriverManager.getConnection(url,id,pass);

        String sql = "INSERT INTO bbs(USERNAME,PASSWORD,TITLE,CONTENT) VALUES(?,?,?,?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, name);
        pstmt.setString(2, password);
        pstmt.setString(3, title);
        pstmt.setString(4, content);

        pstmt.execute();
        pstmt.close();

        conn.close();
    } catch(SQLException e) {
        out.println( e.toString() );
    }

%>

<script language=javascript>
    self.window.alert("입력한 글을 저장하였습니다.");
    location.href="list.jsp";
</script>

</body>
</html>
