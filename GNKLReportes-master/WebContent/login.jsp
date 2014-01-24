<%@ page language="java" session="true" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:useBean id="error" scope="session" class="modelo.Berror"></jsp:useBean>
<script type="text/javascript" src="js/funciones.js"></script>
<title>Login</title>
</head>
<body>
<form name="frmLogin" action="ServletControl" onsubmit="return validarInicio()" method="post">
	<input type="hidden" name="caso" value="1000" />
	<table>
	<tr>
		<td align="right">Usuario: </td>
		<td align="left"><input type="text" name="txtUser" id="txtUser"/></td>
	</tr>
	<tr>
		<td align="right">Password: </td>
		<td align="left"><input type="password" name="txtPass" id="txtPass"/></td>
	</tr>
	<tr>
		<td align="center" colspan="2"><input type="submit" name="btnEntrar" value="Entrar"/></td>
	</tr>
</table>
</form>
<%
	if(!error.getError().equals("")){
		out.println("<label id = lblJur style = \" color : red ; \" >" + error.getError() + "</label>");
	}
%>
</body>
</html>