<%@ page language="java" session="true" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="../js/jqFunc.js"></script>
<script type="text/javascript" src="../js/funciones.js"></script>
<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
<jsp:useBean id="combo" scope="session" class="modelo.Bcombo"></jsp:useBean>
<jsp:useBean id="programa" scope="session" class="modelo.Bcombo"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>6- REPORTE DETALLADO SEMANAL</title>
</head>
<body onload="ocultaEtiquetas_menu6()">
<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
	response.sendRedirect("../login.jsp");
} %>
<a href="../menus/menu.jsp">Regresar al menú</a>
<input type="hidden" id="caso" name="caso" value="" />
<input type="hidden" id="combo1" name="combo1" value="" />
<input type="hidden" id="casosql" name="casosql" value="" />
<input type="hidden" id="valorFecha" name="valorFecha" value="" />

<form name="frmMenu2" action="../ServletControl" onsubmit="return validarMenu6()" method="post">
	<input type="hidden" name="caso" value="60" />
	
	Jurisdicción:
	<select name="cmbJur" id="cmbJur">
		<option value="0">-- Seleccione --</option>
		<%
			if(combo.getDatos().size()>0){
				for(int i=0; i<combo.getDatos().size(); i++){
					out.println("<option value = " + combo.getId().get(i) + ">" + combo.getDatos().get(i) + "</option>");
				}
			}
		%>
	</select>
	<label id="lblJur" style="color: red;">*</label>
	<br></br>
	
	Municipio:
	<select name="cmbMunicipio" id="cmbMunicipio">
		<option value="0">-- Seleccione --</option>
		
	</select>
	<label id="lblMun" style="color: red;">*</label>
	<br></br>
	
	Unidad de atención: 
	<select name="cmbUnidad" id="cmbUnidad">
		<option value="0">-- Seleccione --</option>
	</select>
	<label id="lblUni" style="color: red;">*</label>
	<br></br>
	
	Fecha por Semana:
	<input type="week" name="dateSem" id="dateSem"  />
	<label id="lblSem" style="color: red;">*</label>
	<br></br>
	
	Programa: 
	<select name="cmbPrograma" id="cmbPrograma">
		<option value="0">-- Seleccione --</option>
		<%
			if(programa.getDatos().size()>0){
				for(int i=0; i<programa.getDatos().size(); i++){
					out.println("<option value = " + programa.getId().get(i) + ">" + programa.getDatos().get(i) + "</option>");
				}
			}
		%>
		<option value="10">Todos</option>
	</select>
	<label id="lblPro" style="color: red;">*</label>
	<br></br>
	
	Tipo de Receta: 
	<select id="cmbReceta" name="cmbReceta">
		<option value="0">-- Seleccione --</option>
		<option value="Receta Colectiva">Receta Colectiva</option>
		<option value="Receta Farmacia">Receta Farmacia</option>
	</select>
	<label id="lblRec" style="color: red;">*</label>
	<br></br>
	
	Servicio: 	
	<select id="cmbServicio" name="cmbServicio">
		<option value="0">-- Seleccione --</option>
	</select>
	<label id="lblSer" style="color: red;">*</label>
	<br></br>
	
	<input type="submit" name="btnEnviar" value="Enviar"/>
</form>
</body>
</html>