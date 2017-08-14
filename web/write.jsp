<%--
  Created by IntelliJ IDEA.
  User: EdwardMac
  Date: 2017. 8. 11.
  Time: 오후 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script language="javascript"> // 자바 스크립트 시작

function writeCheck() {
    var form = document.writeform;

    if (!form.title.value) {
        alert("Enter the title");
        form.title.focus();
        return;
    }

    if (!form.name.value)   // form 에 있는 name 값이 없을 때
    {
        alert("Enter the name!"); // 경고창 띄움
        form.name.focus();   // form 에 있는 name 위치로 이동
        return;
    }

    if (!form.password.value) {
        alert("Enter the password");
        form.password.focus();
        return;
    }

    if (!form.content.value) {
        alert("Enter the content");
        form.content.focus();
        return;
    }

    form.submit();
}
</script>

<html>
<head>
    <title>Write</title>
</head>
<body>
<table>
    <form name=writeform method=post action="write_ok.jsp">
        <tr>
            <td>
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
                        <td width="5"><img src="img/table_left.gif" width="5" height="30"/></td>
                        <td>Create</td>
                        <td width="5"><img src="img/table_right.gif" width="5" height="30"/></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">Title</td>
                        <td><input name="title" size="50" maxlength="100"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd">
                        <td colspan="4"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">Author</td>
                        <td><input name="name" size="50" maxlength="50"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr height="1" bgcolor="#dddddd">
                        <td colspan="4"></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="center">Password</td>
                        <td><input name="password" size="50" maxlength="50"></td>
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
                        <td colspan="2"><input type=button value="Submit" OnClick="javascript:writeCheck();">
                            <input type=button value="Cancel" OnClick="javascript:history.back(-1)">
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
</form>
</table>
</td>
</tr>
</body>
</html>