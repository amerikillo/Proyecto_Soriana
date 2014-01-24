<%@ page language="java" session="true" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
<jsp:useBean id="combo" scope="session" class="modelo.Bcombo"></jsp:useBean>
<script type="text/javascript" src="../js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="../js/funciones.js"></script>
<script type="text/javascript" src="../js/jqFunc.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MENU 17</title>
</head>
<body onload="ocultaElementos_menu17()">
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../menus/menu.jsp">Regresar al menú</a>
	<br></br>
	<input type="hidden" id="caso" name="caso" value="" />
	<input type="hidden" id="combo1" name="combo1" value="" />
	<input type="hidden" id="casosql" name="casosql" value="" />
	<input type="hidden" id="valorFecha" name="valorFecha" value="" />
	
	<input type="button" id="btnRecetaFar" name="btnRecetaFar" onclick="mostrarElementos_menu17()" value="REPORTE MENSUAL RECETA POR FARMACIA" />
	<br></br>
	<input type="button" id="btnRecetaCol" name="btnRecetaCol" onclick="mostrarElementos_menu17()" value="REPORTE MENSUAL RECETA COLECTIVA" />
	<br></br>
	
	<form name="frmMenu17" action="../ServletControl" method="post" onsubmit="return validarMenu17()">
		<input type="hidden" name="caso" value="170" />
		<input type="hidden" name="casoReceta" id="casoReceta" value="" />
		
		<label id="lblJur2">Jurisdicción</label>
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
		
		<label id="lblMun2">Municipio</label>
		<select name="cmbMunicipio" id="cmbMunicipio">
			<option value="0">-- Seleccione --</option>
		</select>
		<label id="lblMun" style="color: red;">*</label>
		<br></br>
		
		<label id="lblUni2">Unidad de atención:</label> 
		<select name="cmbUnidad" id="cmbUnidad">
			<option value="0">-- Seleccione --</option>
		</select>
		<label id="lblUni" style="color: red;">*</label>
		<br></br>
		
		<label id="lblOrigen2">Origen:</label>
		<select name="cmbOrigen" id="cmbOrigen">
			<option value="0">-- Seleccione --</option>
			<option value="1">1</option>
			<option value="2">2</option>
		</select>
		<label id="lblOrigen" style="color: red;">*</label>
		<br></br>
		
		<input type="date" name="dateIni" id="dateIni" />
		<label id="lblFini" style="color: red;">*</label>
		<input type="date" name="dateFin" id="dateFin" />
		<label id="lblFfin" style="color: red;">*</label>
		<br></br>
		
		<label id="lblFechas">Rango de fechas:</label> 
		<select name="cmbFecha" id="cmbFecha">
			<option value="0">-- Seleccione --</option>
			<option value="1">Rango de Fechas de Enero</option>
			<option value="2">Rango de Fechas de Febrero</option>
			<option value="3">Rango de Fechas de Marzo</option>
			<option value="4">Rango de Fechas de Abril</option>
			<option value="5">Rango de Fechas de Mayo</option>
			<option value="6">Rango de Fechas de Junio</option>
			<option value="7">Rango de Fechas de Julio</option>
			<option value="8">Rango de Fechas de Agosto</option>
			<option value="9">Rango de Fechas de Septiembre</option>
			<option value="10">Rango de Fechas de Octubre</option>
			<option value="11">Rango de Fechas de Noviembre</option>
			<option value="12">Rango de Fechas de Diciembre</option>
		</select>
		<br></br>
		
		<input type="submit" id="btnEnviar" name="btnEnviar" value="Enviar"/>
	</form>
</body>
</html>