<%@ page language="java" session="true" import="modelo.Brepor16" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
	<jsp:useBean id="tabla" scope="session" class="modelo.Btabla"></jsp:useBean>
	<link rel="stylesheet" href="../css/demo_table.css" />
	<script type="text/javascript" src="../js/Paginar/jquery.js"></script>
	<script type="text/javascript" src="../js/Paginar/jquery.dataTables.js"></script>
	<script type="text/javascript" src="../js/Paginar/funcionPaginar.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>REPORTE 16</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../ServletControl?menu=16&caso=1">Regresar al menú</a>
	<table border="1" id="tbl" style="width: 100%">
		<thead>
			<tr>
				<th>FECHA</th>
				<th>ENTRADA</th>
				<th>SALIDA</th>
				<th>DESCRIPCION DE MOVIMIENTO</th>
				<th>No. DE RECETA</th>
				<th>PACIENTE O BENEFICIARIO</th>
				<th>PRESCRIBE</th>
				<th>CEDULA PROFESIONAL</th>
				<th>RETIENE RECETA</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=0; i<tabla.getTabla().size(); i++){
					Brepor16 aux=(Brepor16)tabla.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getFecha() + "</td>");
					out.println("<td>" + aux.getEntrada() + "</td>");
					out.println("<td>" + aux.getSalida() + "</td>");
					out.println("<td>" + aux.getDescripcion() + "</td>");
					out.println("<td>" + "<a href=\"../ServletControl?caso=2&folio=" + aux.getNo_receta() + "\">" + aux.getNo_receta() +"</a></td>");
					out.println("<td>" + aux.getNombre_medico() + "</td>");
					out.println("<td>" + aux.getCedula() + "</td>");
					out.println("<td>" + aux.getRetiene() + "</td>");
					out.println("</tr>");
				}
			%>
		</tbody>
	</table>
	<br></br>
	<table border="1">
		<tr>
			<td><b>NOMBRE</b></td>
			<td>XXXXXXXXXXXXXXXX</td>
		</tr>
		<tr>
			<td><b>Cargo</b></td>
			<td>MÉDICO</td>
		</tr>
		<tr>
			<td><b>FIRMA</b></td>
			<td>XXXXXXXXXXXXXXXXXX</td>
		</tr>
	</table>
</body>
</html>