<%@ page language="java" import="modelo.Brepor2" session="true" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
	<jsp:useBean id="tabla" scope="session" class="modelo.Btabla"></jsp:useBean>
	<jsp:useBean id="tablaS" scope="session" class="modelo.Btabla"></jsp:useBean>
	<link rel="stylesheet" href="../css/demo_table.css" />
	<script type="text/javascript" src="../js/Paginar/jquery.js"></script>
	<script type="text/javascript" src="../js/Paginar/jquery.dataTables.js"></script>
	<script type="text/javascript" src="../js/Paginar/funcionPaginar.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Concentrado de Salidas</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../ServletControl?menu=2&caso=1">Regresar al menú</a>
	<h3 align="center" >Concentrando de salidas</h3>
	<br></br>
	<table border="1" style="width: 100%" id="tbl">
		<thead>
			<tr>
				<th>CLAVE</th>
				<th>DESCRIPCION</th>
				<th>PRESENTACION</th>
				<th>CANTIDAD</th>
				<th>PRECIO UNITARIO (TRES DIGITOS)</th>
				<th>IMPORTE</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=0; i<tabla.getTabla().size(); i++){
					Brepor2 aux=(Brepor2)tabla.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getClave() + "</td>");
					out.println("<td>" + aux.getDesc() +"</td>");
					out.println("<td>" + aux.getPresentacion() +"</td>");
					out.println("<td>" + aux.getCantidad() +"</td>");
					out.println("<td>" + "$ " + aux.getPrecio() +"</td>");
					out.println("<td>" + "$ " + aux.getImporte() +"</td>");
					out.println("</tr>");
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3" align="center">TOTAL MEDICAMENTO</td>
				<td><% out.println(tabla.getCant_medi()); %></td>
				<td></td>
				<td><% out.println("$ " + tabla.getImp_medi()); %></td>
			</tr>
			<tr>
				<td colspan="3" align="center">TOTAL METERIAL DE CURACION</td>
				<td><% out.println(tabla.getCant_material()); %></td>
				<td></td>
				<td><% out.println("$ " + tabla.getImp_material()); %></td>
			</tr>
			<tr>
				<td colspan="3" align="center">TOTAL OTROS (INSUMOS DESPLAZADOS)</td>
				<td><% out.println(tabla.getCant_otros()); %></td>
				<td></td>
				<td><% out.println("$ " + tabla.getImp_otro()); %></td>
			</tr>
			<tr>
				<td colspan="3" align="center">TOTAL GENERAL:</td>
				<td><% out.println(tabla.getCant_general()); %></td>
				<td></td>
				<td><% out.println("$ " + tabla.getImp_general()); %></td>
			</tr>
		</tfoot>
	</table>
	<br></br>
	<br></br>
	<table border="1" style="width: 100%" id="tbl2">
		<thead>
			<tr>
				<th>CLAVE</th>
				<th>DESCRIPCION</th>
				<th>PRESENTACION</th>
				<th>CANTIDAD</th>
				<th>PRECIO UNITARIO (TRES DIGITOS)</th>
				<th>IMPORTE</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=0; i<tablaS.getTabla().size(); i++){
					Brepor2 aux=(Brepor2)tablaS.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getClave() + "</td>");
					out.println("<td>" + aux.getDesc() +"</td>");
					out.println("<td>" + aux.getPresentacion() +"</td>");
					out.println("<td>" + aux.getCantidad() +"</td>");
					out.println("<td>" + "$ " + aux.getPrecio() +"</td>");
					out.println("<td>" + "$ " + aux.getImporte() +"</td>");
					out.println("</tr>");
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3" align="center">TOTAL MEDICAMENTO</td>
				<td><% out.println(tablaS.getCant_medi()); %></td>
				<td></td>
				<td><% out.println("$ " + tablaS.getImp_medi()); %></td>
			</tr>
			<tr>
				<td colspan="3" align="center">TOTAL METERIAL DE CURACION</td>
				<td><% out.println(tablaS.getCant_material()); %></td>
				<td></td>
				<td><% out.println("$ " + tablaS.getImp_material()); %></td>
			</tr>
			<tr>
				<td colspan="3" align="center">TOTAL OTROS (INSUMOS DESPLAZADOS)</td>
				<td><% out.println(tablaS.getCant_otros()); %></td>
				<td></td>
				<td><% out.println("$ " + tablaS.getImp_otro()); %></td>
			</tr>
			<tr>
				<td colspan="3" align="center">TOTAL GENERAL:</td>
				<td><% out.println(tablaS.getCant_general()); %></td>
				<td></td>
				<td><% out.println("$ " + tablaS.getImp_general()); %></td>
			</tr>
		</tfoot>
	</table>
	<br></br>
	<br></br>
	<div style=""></div>
	<table border="1">
		<tr>
			<td>TOTAL DE PIEZAS (SSD + SORIANA)</td>
			<td><% out.println(tabla.getCant_general() + tablaS.getCant_general()); %></td>
			<td><% out.println("$ " + tabla.getImp_general() + tablaS.getImp_general()); %></td>
		</tr>
	</table>
</body>
</html>