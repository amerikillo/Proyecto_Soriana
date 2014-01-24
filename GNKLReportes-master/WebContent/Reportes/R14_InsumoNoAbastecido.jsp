<%@ page language="java" session="true" import="modelo.Brepor14" contentType="text/html; charset=ISO-8859-1"
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
	<title>REPORTE 14</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../ServletControl?menu=14&caso=1">Regresar al menú</a>
	<table border="1" id="tbl" style="width: 100%">
		<thead>
			<tr>
				<th>UNIDAD</th>
				<th>FOLIO</th>
				<th>CLAVE</th>
				<th>MEDICAMENTO (DESCRIPCION SAL)</th>
				<th>FECHA DE SOLICITUD</th>
				<th>CANTIDAD NO DISPENSADA</th>
				<th>PRECIO UNITARIO</th>
				<th>IMPORTE</th>
			</tr>
		</thead>
		<tbody>
			<%
				float precio=0, importe=0;
				for(int i=0; i<tabla.getTabla().size(); i++){
					Brepor14 aux=(Brepor14)tabla.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getUnidad() + "</td>");
					out.println("<td>" + aux.getFolio() +"</td>");
					out.println("<td>" + aux.getClave() + "</td>");
					out.println("<td>" + aux.getDescripcion() + "</td>");
					out.println("<td>" + aux.getFecha_solicitud() + "</td>");
					out.println("<td>" + aux.getCant_no_dispensada() + "</td>");
					out.println("<td>" + aux.getPrecio() + "</td>");
					out.println("<td>" + aux.getImporte() + "</td>");
					out.println("</tr>");
					precio += aux.getPrecio();
					importe += aux.getPrecio();
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6">TOTAL DE PROGRAMA</td>
				<td><% out.println("$ " + precio); %></td>
				<td><% out.println("$ " + importe); %></td>
			</tr>
			<tr>
				<td colspan="6">SUBTOTAL</td>
				<td><% out.println("$ " + precio); %></td>
				<td><% out.println("$ " + importe); %></td>
			</tr>
			<tr>
				<td colspan="6">IMPUESTO</td>
				<td></td>
				<td>$ 0.00</td>
			</tr>
			<tr>
				<td colspan="6">TOTAL GENERAL</td>
				<td><% out.println("$ " + precio); %></td>
				<td><% out.println("$ " + importe); %></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>