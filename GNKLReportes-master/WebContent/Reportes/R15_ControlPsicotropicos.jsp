<%@ page language="java" session="true" import="modelo.Brepor15" contentType="text/html; charset=ISO-8859-1"
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
	<title>REPORTE 15</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../ServletControl?menu=15&caso=1">Regresar al menú</a>
	<table border="1" id="tbl" style="width: 100%">
		<thead>
			<tr>
				<th>NUM PROGRESIVO</th>
				<th>NOMBRE DEL MEDICO</th>
				<th>CEDULA PROFESIONAL</th>
				<th>DOMICILIO</th>
				<th>FECHA ENTRADA</th>
				<th>No FACTURA</th>
				<th>DOMICILIO PROVEEDOR</th>
				<th>ENTRADA</th>
				<th>SALIDA</th>
				<th>SALDO</th>
				<th>OBSERVACION</th>
			</tr>
		</thead>
		<tbody>
			<%
				String medico="";
				for(int i=0; i<tabla.getTabla().size(); i++){
					Brepor15 aux=(Brepor15)tabla.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getNum() + "</td>");
					out.println("<td>" + aux.getMedico() + "</td>");
					out.println("<td>" + aux.getCedula() + "</td>");
					out.println("<td>" + aux.getDomicilio() + "</td>");
					out.println("<td>" + aux.getFecha_entrada() + "</td>");
					out.println("<td>" + aux.getNo_factura() + "</td>");
					out.println("<td>" + aux.getDomicilio_proveedor() + "</td>");
					out.println("<td>" + aux.getEntrada() + "</td>");
					out.println("<td>" + aux.getSalida() + "</td>");
					out.println("<td>" + aux.getSaldo() + "</td>");
					out.println("<td>" + aux.getObservacion() + "</td>");
					out.println("</tr>");
					medico=aux.getMedico();
				}
			%>
		</tbody>
	</table>
	<br></br>
	<table border="1">
		<tr>
			<td><b>Medico</b></td>
			<td><% out.println(medico); %></td>
		</tr>
		<tr>
			<td><b>Cargo</b></td>
			<td></td>
		</tr>
		<tr>
			<td><b>Cargo</b></td>
			<td></td>
		</tr>
	</table>
</body>
</html>