<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DemoPage</title>
</head>
<body>
	<%
	String username = (String) request.getAttribute("username");
	if (null == username) {
		username = "";
	}
	%>
	<form action="demoAction" method="post">
		<table border="0" align="center">

			<tr>
				<td align="right">userId:</td>
				<td><input type="text" name="userId" /></td>
			</tr>

			<tr>
				<td colspan="2" style="width: 100px; height: 50px;"><span
					id="msg"> </span> <input type="submit" value="login"
					style="width: 100px" /></td>
			</tr>
		</table>

		the user from db is :
		<%=username%>
	</form>

</body>
</html>