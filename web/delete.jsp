<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script language="javascript">
	function deleteCheck() {
		var form = document.deleteform;
		if (!form.password.value) {
			alert("Enter the password");
			form.password.focus();
			return;
		}
		form.submit();
	}
</script>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Delete post</title>
</head>
<body>
	<table>
		<form name="deleteform" method=post
			action="delete_ok.jsp?idx=<%=idx%>">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr
							style="background: url('img/table_mid.jpg') repeat-x; text-align: center;">
							<td width="5"><img src="img/table_left.jpg" width="5"
								height="30" /></td>
							<td>Delete</td>
							<td width="5"><img src="img/table_right.jpg" width="5"
								height="30" /></td>
						</tr>
					</table>
					<table>
						<tr>
							<td>&nbsp;</td>
							<td align="center">Password</td>
							<td><input name="password" type="password" size="50"
								maxlength="100"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr align="center">
							<td>&nbsp;</td>
							<td colspan="2">
							<input type=button value="Delete" onclick="javascript:deleteCheck();"> 
							<input type=button value="Cancel" onclick="javascript:history.back(-1)">
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>
