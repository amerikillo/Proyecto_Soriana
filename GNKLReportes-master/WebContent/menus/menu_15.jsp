<%@ page language="java" session="true" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="../js/jqFunc.js"></script>
<script type="text/javascript" src="../js/funciones.js"></script>
<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
<jsp:useBean id="combo" scope="session" class="modelo.Bcombo"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>15- REPORTE CONTROL PSICOTROPICOS</title>
</head>
<body onload="ocultaEtiquetas_menu15()">
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../menus/menu.jsp">Regresar al menú</a>
	<input type="hidden" id="caso" name="caso" value="" />
	<input type="hidden" id="combo1" name="combo1" value="" />
	<input type="hidden" id="casosql" name="casosql" value="" />
	<input type="hidden" id="unidad" name="unidad" value="" />
	
	<form name="frmMenu15" action="../ServletControl" onsubmit="return validarMenu15()" method="post">
		<input type="hidden" name="caso" value="150" />
		
		Jurisdicción:
		<select name="cmbJur_15" id="cmbJur_15">
			<option value="0">-- Seleccione --</option>
			<%
				if(combo.getDatos().size()>0){
					for(int i=0; i<combo.getDatos().size(); i++){
						out.println("<option value = " + combo.getId().get(i) + ">" + combo.getDatos().get(i) + "</option>");
					}
				}
			%>
		</select>
		<label id="lblJur_15" style="color: red;">*</label>
		<br></br>
		
		Municipio:
		<select name="cmbMunicipio_15" id="cmbMunicipio_15">
			<option value="0">-- Seleccione --</option>
			
		</select>
		<label id="lblMun_15" style="color: red;">*</label>
		<br></br>
		
		Unidad de atención:
		<select name="cmbUnidad_15" id="cmbUnidad_15">
			<option value="0">-- Seleccione --</option>
		</select>
		<label id="lblUni_15" style="color: red;">*</label>
		<br></br>
		
		Médico:
		<select name="cmbMedico_15" id="cmbMedico_15">
			<option value="0">-- Seleccione --</option>
		</select>
		<label id="lblMec_15" style="color: red;">*</label>
		<br></br>
		
		<input type="submit" name="btnEnviar" value="Enviar"/>
	</form>
</body>
</html>