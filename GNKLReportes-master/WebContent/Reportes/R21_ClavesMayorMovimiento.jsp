<%@ page language="java" session="true" import="modelo.Brepor21" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
	<jsp:useBean id="tabla" scope="session" class="modelo.Btabla"></jsp:useBean>
	<jsp:useBean id="tabla_Sor" scope="session" class="modelo.Btabla"></jsp:useBean>
	<link rel="stylesheet" href="../css/demo_table.css" />
	<script type="text/javascript" src="../js/Paginar/jquery.js"></script>
	<script type="text/javascript" src="../js/Paginar/jquery.dataTables.js"></script>
	<script type="text/javascript" src="../js/Paginar/funcionPaginar.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>REPORTE 21</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../ServletControl?menu=21&caso=1">Regresar al menú</a>
	<table border="1" id="tbl" style="width: 100%">
		<caption align="top">SSD</caption>
		<thead>
			<tr>
				<th>CLAVE INSUMO</th>
				<th>NOMBRE/DESCRIPCIÓN</th>
				<th>CANTIDAD</th>
				<th>PRECIO UNITARIO (TRES DÍGITOS)</th>
				<th>IMPORTE</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=0; i<tabla.getTabla().size(); i++){
					Brepor21 aux=(Brepor21)tabla.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getClave() + "</td>");
					out.println("<td>" + aux.getDescripcion() + "</td>");
					out.println("<td>" + aux.getCantidad() + "</td>");
					out.println("<td>" + aux.getPrecio() + "</td>");
					out.println("<td>" + aux.getImporte() + "</td>");
					out.println("</tr>");
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">TOTAL DE MEDICAMENTO</td>
				<td><% out.println(tabla.getCant_medi()); %></td>
				<td></td>
				<td><% out.println(tabla.getImp_medi()); %></td>
			</tr>
			<tr>
				<td colspan="2">TOTAL DE MATERIAL DE CURACIÓN</td>
				<td><% out.println(tabla.getCant_material()); %></td>
				<td></td>
				<td><% out.println(tabla.getImp_material()); %></td>
			</tr>
			<tr>
				<td colspan="2">TOTAL OTROS (INSUMOS SOLO DESPLAZADOS)</td>
				<td><% out.println(tabla.getCant_otros()); %></td>
				<td></td>
				<td><% out.println(tabla.getImp_otro()); %></td>
			</tr>
			<tr>
				<td colspan="2">TOTAL GENERAL</td>
				<td><% out.println(tabla.getCant_general()); %></td>
				<td></td>
				<td><% out.println(tabla.getImp_general()); %></td>
			</tr>
		</tfoot>
	</table>
	<br></br>
	<br></br>
	<table border="1" id="tbl2" style="width: 100%">
		<caption align="top">SORIANA</caption>
		<thead>
			<tr>
				<th>CLAVE INSUMO</th>
				<th>NOMBRE/DESCRIPCIÓN</th>
				<th>CANTIDAD</th>
				<th>PRECIO UNITARIO (TRES DÍGITOS)</th>
				<th>IMPORTE</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=0; i<tabla_Sor.getTabla().size(); i++){
					Brepor21 aux=(Brepor21)tabla_Sor.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getClave() + "</td>");
					out.println("<td>" + aux.getDescripcion() + "</td>");
					out.println("<td>" + aux.getCantidad() + "</td>");
					out.println("<td>" + aux.getPrecio() + "</td>");
					out.println("<td>" + aux.getImporte() + "</td>");
					out.println("</tr>");
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">TOTAL DE MEDICAMENTO</td>
				<td><% out.println(tabla_Sor.getCant_medi()); %></td>
				<td></td>
				<td><% out.println(tabla_Sor.getImp_medi()); %></td>
			</tr>
			<tr>
				<td colspan="2">TOTAL DE MATERIAL DE CURACIÓN</td>
				<td><% out.println(tabla_Sor.getCant_material()); %></td>
				<td></td>
				<td><% out.println(tabla_Sor.getImp_material()); %></td>
			</tr>
			<tr>
				<td colspan="2">TOTAL OTROS (INSUMOS SOLO DESPLAZADOS)</td>
				<td><% out.println(tabla_Sor.getCant_otros()); %></td>
				<td></td>
				<td><% out.println(tabla_Sor.getImp_otro()); %></td>
			</tr>
			<tr>
				<td colspan="2">TOTAL GENERAL</td>
				<td><% out.println(tabla_Sor.getCant_general()); %></td>
				<td></td>
				<td><% out.println(tabla_Sor.getImp_general()); %></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>