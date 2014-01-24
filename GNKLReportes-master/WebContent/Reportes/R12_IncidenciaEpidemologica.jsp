<%@ page language="java" session="true" import="modelo.Brepor12" contentType="text/html; charset=ISO-8859-1"
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
	<title>REPORTE 12 INCIDENCIA EPIDEMIOLÓGICA</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../ServletControl?menu=12&caso=1">Regresar al menú</a>
	<table border="1" id="tbl" style="width: 100%">
		<thead>
			<tr>
				<th>CIE-10</th>
				<th>DESCRIPCIÓN</th>
				<th>INCIDENCIAS</th>
			</tr>
		</thead>
		<tbody>
			<%
				int totales=0;
				for(int i=0; i<tabla.getTabla().size(); i++){
					Brepor12 aux=(Brepor12)tabla.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getClave() + "</td>");
					out.println("<td>" + aux.getDescripcion() +"</td>");
					out.println("<td>" + aux.getIncidencias() + "</td>");
					out.println("</tr>");
					totales += aux.getIncidencias();
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">TOTAL</td>
				<td><% out.println(totales); %></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>