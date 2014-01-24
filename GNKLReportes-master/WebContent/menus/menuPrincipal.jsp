<%@ page language="java" session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
<title>MENU PRINCIPAL</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="menu.jsp"><input type="button" name="btnReportes" value="Reportes"  /></a>
	<br>
	<form name="frmPrincipal" action="../ServletControl" method="post">
		<input type="hidden" name="caso" value="1112">
		<input type="submit" name="btnGestion" value="Gestion de Usuarios" />
	<br>
	</form>
	
	<a href="../upload/subirExcell.jsp"><input type="button" name="btnUpload" value="Subir Archivos" /></a>
	<br>
</body>
</html>