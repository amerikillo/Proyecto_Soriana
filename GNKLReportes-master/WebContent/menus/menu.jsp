<%@ page language="java" session="true" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="../js/funciones.js"></script>
<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
<title>MENU REPORTES</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="menuPrincipal.jsp">Regresar al menú</a>
	<br>
	
	<form name="frmMenu" action="../ServletControl" onsubmit="return validarMenuPrincipal()" method="post">
		<select name="caso" id="caso">
			<option value="0">-- Seleccione --</option>
			<option value="2">2- CONCENTRADO SALIDAS</option>
			<option value="3">3- CONCENTRADO MENSUAL</option>
			<option value="4">4- CONCENTRADO MENSUAL UNIDAD Y PROGRAMA</option>
			<option value="5">5- REPORTE DETALLADO FOLIO RECIBO</option>
			<option value="6">6- REPORTE DETALLADO SEMANAL</option>
			<option value="7">7- REPORTE RECETADO POR MEDICO</option>
			<option value="8">8- REPORTE POR BENEFICIARIO</option>
			<option value="9">9- REPORTE POR RECETA</option>
			<option value="10">10- REPORTE STOCK UNIDAD</option>
			<option value="11">11- REPORTE DESVIACION DE CONTINGENCIA</option>
			<option value="12">12- INCIDENCIA EPIDEMIOLOGICA</option>
			<option value="13">13- ATRASO MENSUAL EN ENTREGAS</option>
			<option value="14">14- REPORTE INSUMOS NO ABASTECIDOS</option>
			<option value="15">15- REPORTE CONTROL PSICOTROPICOS</option>
			<option value="16">16- FORMATO CONTROL DE ANTIBIOTICOS</option>
			<option value="17">17- REP VALID FACT X UNID Y PRO</option>
			<option value="18">18- REPORTE CONCENTRADO DE FACTURACION</option>
			<option value="19">19- FORMATO DE % ABASTO DIARIO</option>
			<option value="20">20- MOVIMIENTOS MINIMOS</option>
			<option value="21">21- 50 CLAVES MAYOR MOVIMIENTO</option>
		</select>
		<br/>
		<input type="submit" name="btnEntrar" value="Entrar" />
		<br/>
	</form>
</body>
</html>