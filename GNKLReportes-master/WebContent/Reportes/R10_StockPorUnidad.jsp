<%@ page language="java" session="true" import="modelo.Brepor10" contentType="text/html; charset=ISO-8859-1"
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
<title>REPORTE 10 STOCK POR UNIDAD</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../ServletControl?menu=10&caso=1">Regresar al menú</a>
	<table border="1" style="width: 100%"  id="tbl">
		<thead>
			<tr>
				<th>CLAVE</th>
				<th>MEDICAMENTO(DESCRIPCION SAL)/MATERIAL DE CURACIÓN</th>
				<th>EXISTENCIAS</th>
				<th>STOCK MINIMO</th>
				<th>STOCK MAXIMO</th>
			</tr>
		</thead>
		<tbody>
			<%
				int stock=0;
				int stock_min=0;
				int stock_max=0;
				for(int i=0; i<tabla.getTabla().size(); i++){
					Brepor10 aux=(Brepor10)tabla.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getClave() + "</td>");
					out.println("<td>" + aux.getDescripcion() +"</td>");
					out.println("<td>" + aux.getExistencia() +"</td>");
					out.println("<td>" + aux.getStock_min() +"</td>");
					out.println("<td>" + aux.getStock_max() +"</td>");
					out.println("</tr>");
					stock += aux.getExistencia();
					stock_min += aux.getStock_min();
					stock_max += aux.getStock_max();
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">TOTAL DE PIEZAS:</td>
				<td><% out.println(stock); %></td>
				<td><% out.println(stock_min); %></td>
				<td><% out.println(stock_max); %></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>