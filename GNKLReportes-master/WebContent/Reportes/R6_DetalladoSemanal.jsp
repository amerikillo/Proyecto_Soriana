<%@ page language="java" session="true" import="modelo.Brepor6" contentType="text/html; charset=ISO-8859-1"
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
	<title>REPORTE 6 - REPORTE DETALLADO SEMANAL</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../ServletControl?menu=6&caso=1">Regresar al menú</a>
	<table border="1" id="tbl" style="width: 100%">
		<thead>
			<tr>
				<th>CLAVE CUADRO BASICO</th>
				<th>DESCRIPCIÓN</th>
				<th>UNIDAD (CAJA)</th>
				<th>PRECIO UNITARIO</th>
				<th>LUNES</th>
				<th>MARTES</th>
				<th>MIERCOLES</th>
				<th>JUEVES</th>
				<th>VIERNES</th>
				<th>SABADO</th>
				<th>DOMINGO</th>
				<th>TOTAL</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=0; i<tabla.getTabla().size(); i++){
					Brepor6 aux=(Brepor6)tabla.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getClave() + "</td>");
					out.println("<td>" + aux.getDescripcion() +"</td>");
					out.println("<td>" + aux.getCantidad() +"</td>");
					out.println("<td>" + "$ " + aux.getPrecio() +"</td>");
					out.println("<td>" + aux.getCant1() +"</td>");
					out.println("<td>" + aux.getCant2() +"</td>");
					out.println("<td>" + aux.getCant3() +"</td>");
					out.println("<td>" + aux.getCant4() +"</td>");
					out.println("<td>" + aux.getCant5() +"</td>");
					out.println("<td>" + aux.getCant6() +"</td>");
					out.println("<td>" + aux.getCant7() +"</td>");
					out.println("<td>" + "$" + " " + aux.getImporte() + "</td>");
					out.println("</tr>");
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4" align="right">TOTAL MEDICAMENTO</td>
				<%
					for(int k=7; k<14; k++){
						out.println("<td>" + tabla.getCantidades()[k] +"</td>");
					}
					out.println("<td>" + "$ " + tabla.getImp_medi() +"</td>");
				%>
			</tr>
			<tr>
				<td colspan="4" align="right">TOTAL MATERIAL</td>
				<%
					for(int k=0; k<7; k++){
						out.println("<td>" + tabla.getCantidades()[k] +"</td>");
					}
					out.println("<td>" + "$ " + tabla.getImp_material() +"</td>");
				%>
			</tr>
		</tfoot>
	</table>
</body>
</html>