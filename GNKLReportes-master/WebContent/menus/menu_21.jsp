<%@ page language="java" session="true" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
<script type="text/javascript" src="../js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="../js/funciones.js"></script>
<script type="text/javascript" src="../js/jqFunc.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>21- 50 CLAVES MAYOR MOVIMIENTO</title>
</head>
<body onload="ocultaElementos_menu21()">
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../menus/menu.jsp">Regresar al menú</a>
	<form name="frmMenu21" action="../ServletControl" method="post" onsubmit="return validarMenu21()">
		<input type="hidden" id="caso" name="caso" value="210"/>
		<input type="hidden" id="combo1" name="combo1" value="" />
		<input type="hidden" id="casosql" name="casosql" value="" />
		<input type="hidden" id="valorFecha" name="valorFecha" value="" />
		
		Menú de opciones:
		<select id="cmbCaso" name="cmbCaso" onchange="mostrarElementos_menu21()">
			<option value="0">-- Seleccione --</option>
			<option value="1">Todas las Unidades</option>
			<option value="2">Por jurisdiccion</option>
			<option value="3">Por Unidad</option>
		</select>
		<br></br>
		
		<label id="lblJur2">Jurisdicción</label>
		<select id="cmbJur_21" name="cmbJur_21">
			<option value="0">-- Seleccione --</option>
		</select>
		<label id="lblJur" style="color: red;">*</label>
		<br></br>
		
		<label id="lblMun2">Municipio</label>
		<select name="cmbMunicipio_21" id="cmbMunicipio_21">
			<option value="0">-- Seleccione --</option>
		</select>
		<label id="lblMun" style="color: red;">*</label>
		<br></br>
		
		<label id="lblUni2">Unidad de atención:</label>
		<select name="cmbUnidad_21" id="cmbUnidad_21">
			<option value="0">-- Seleccione --</option>
		</select>
		<label id="lblUni" style="color: red;">*</label>
		<br></br>
		
		<input type="date" name="dateIni_21" id="dateIni_21" />
		<label id="lblFini" style="color: red;">*</label>
		<input type="date" name="dateFin_21" id="dateFin_21" />
		<label id="lblFfin" style="color: red;">*</label>
		<br></br>
		
		<label id="lblFechas">Rango de fechas:</label>
		<select name="cmbFecha_21" id="cmbFecha_21">
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
			<option value="13">Todas</option>
		</select>
		<br></br>
		
		<input type="submit" id="btnGenerar" name="btnGenerar" value="Generar"/>
	</form>
</body>
</html>