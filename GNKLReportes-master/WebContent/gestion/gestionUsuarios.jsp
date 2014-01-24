<%@ page language="java" session="true" import="modelo.Busuario"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/funciones.js"></script>
<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
<jsp:useBean id="res" scope="session" class="modelo.Bbien"></jsp:useBean>
<jsp:useBean id="tabla" scope="session" class="modelo.Btabla"></jsp:useBean>
<title>Insert title here</title>
</head>
<body onload="ocultarForm_gestionUsuarios()">
	<%
	if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	}
	if(res.isRespuesta()){
		res.setRespuesta(false);
		out.println("<script>alert(\"Operación realizada con éxito\");</script>");
	}else if(res.isError()){
		res.setError(false);
		out.println("<script>alert(\"Error en la operación\");</script>");
	}
	%>
	<a href="../menus/menuPrincipal.jsp">Regresar al menú</a>
	<br><br/>
	<table border="1" id="tblUsers">
		<tr>
			<th>Nombre de Usuario</th>
			<th>Rol</th>
			<th>Acción</th>
		</tr>
		<%
		for(int i=0; i<tabla.getTabla().size(); i++){
			Busuario aux=(Busuario)tabla.getTabla().get(i);
			out.println("<tr>");
			out.println("<form name = frm"+ aux.getId() +" action = \"../ServletControl \" method = post >");
			out.println("<input type = hidden name = caso  value = 1113 />");
			out.println("<input type = hidden name = id  value = " + aux.getId() + " />");
			out.println("<td>" + aux.getUsuario() + "</td>");
			out.println("<td>" + aux.getRoll() +"</td>");
			out.println("<td><input type = submit name = btnEliminar value = Eliminar /></td>");
			out.println("</form>");
			out.println("</tr>");
		}
		%>
	</table>
	<br>
	<input type="button" name="btnAgregar" id="btnAgregar" value="Agregar" onclick="mostrarForm_gestionUsuarios()"/>
	<br><br/>
	
	<form name="frmGestionUser" id="frmGestionUser" action="../ServletControl" onsubmit="return validarGestionUsuarios()" method="post">
		<input type="hidden" name="caso" value="1111" />
		
		Usuario:
		<input type="text" name="txtUser" id="txtUser"/>
		<label id="lblUs" style="color: red;">*</label>
		<br><br/>
		
		Rol:
		<select name="cmbRol" id="cmbRol">
			<option value="0">-- Seleccione --</option>
			<option value="administrador">Administrador</option>
			<option value="usuario">Usuario Simple</option>
		</select>
		<label id="lblRol" style="color: red;">*</label>
		<br><br/>
		
		Password:
		<input type="password" name="txtPass" id="txtPass" />
		<label id="lblPass1" style="color: red;">*</label>
		<br><br/>
		
		Confirmar password:
		<input type="password" name="txtPassC" id="txtPassC" />
		<label id="lblPass2" style="color: red;">*</label>
		<br><br/>
		
		<input type="submit" name="btnEnviar" value="Enviar" />
		<input type="button" name="btnOcultar" value="Ocultar" onclick="ocultarForm_gestionUsuarios()"/>
	</form>
	
</body>
</html>