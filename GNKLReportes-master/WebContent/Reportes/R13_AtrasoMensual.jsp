<%@ page language="java" session="true" import="modelo.Brepor13" contentType="text/html; charset=ISO-8859-1"
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
	<title>REPORTE 13</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../ServletControl?menu=13&caso=1">Regresar al menú</a>
	<table border="1" id="tbl" style="width: 100%">
		<thead>
			<tr>
				<th>FOLIO DE RECETA</th>
				<th>CLAVE</th>
				<th>DESCRIPCION</th>
				<th>CANTIDAD</th>
				<th>FECHA DE SOLICITUD</th>
				<th>FECHA DE ABASTO</th>
				<th>DIAS DE ATRASO</th>
				<th>ORIGEN</th>
				<th>PRECIO UNITARIO</th>
				<th>IMPORTE</th>
			</tr>
		</thead>
		<tbody>
			<%
				float precio=0, importe=0;
				for(int i=0; i<tabla.getTabla().size(); i++){
					Brepor13 aux=(Brepor13)tabla.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + "<a href=\"../ServletControl?caso=2&folio=" + aux.getFolio() + "\">" + aux.getFolio() +"</a></td>");
					out.println("<td>" + aux.getClave() + "</td>");
					out.println("<td>" + aux.getDescripcion() +"</td>");
					out.println("<td>" + aux.getCantidad() + "</td>");
					out.println("<td>" + aux.getFecha_solicitud() + "</td>");
					out.println("<td>" + aux.getFecha_abasto() + "</td>");
					out.println("<td>" + aux.getDias_atraso() + "</td>");
					out.println("<td>" + aux.getOrigen() + "</td>");
					out.println("<td>" + aux.getPrecio() + "</td>");
					out.println("<td>" + aux.getImporte() + "</td>");
					out.println("</tr>");
					precio += aux.getPrecio();
					importe += aux.getImporte();
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="10">
					<br></br>
				</td>
			</tr>
			<tr>
				<td colspan="8">TOTAL DE PROGRAMA</td>
				<td><% out.println("$ " + precio); %></td>
				<td><% out.println("$ " + importe); %></td>
			</tr>
			<tr>
				<td colspan="8">SUBTOTAL</td>
				<td><% out.println("$ " + precio); %></td>
				<td><% out.println("$ " + importe); %></td>
			</tr>
			<tr>
				<td colspan="8">IMPUESTO</td>
				<td></td>
				<td>$ 0.00</td>
			</tr>
			<tr>
				<td colspan="8">TOTAL GENERAL</td>
				<td><% out.println("$ " + precio); %></td>
				<td><% out.println("$ " + importe); %></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>