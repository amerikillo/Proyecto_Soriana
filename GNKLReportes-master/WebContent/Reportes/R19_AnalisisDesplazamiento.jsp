<%@ page language="java" session="true" import="modelo.Brepor19" contentType="text/html; charset=ISO-8859-1"
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
	<title>REPORTE 19</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../ServletControl?menu=19&caso=1">Regresar al menú</a>
	<table border="1" id="tbl" style="width: 100%">
		<thead>
			<tr>
				<th>TIPO</th>
				<th>CLAVE</th>
				<th>NOMBRE GENERICO</th>
				<th>DESCRIPCION</th>
				<th>PRESENTACION</th>
				<th>TOTAL SOLICITADO</th>
				<th>TOTAL SURTIDO</th>
				<th>DESPLAZAMIENTO</th>
				<th>PORCENTAJE %</th>
				<th>OBSERVACIONES</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=0; i<tabla.getTabla().size(); i++){
					Brepor19 aux=(Brepor19)tabla.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getTipo() + "</td>");
					out.println("<td>" + aux.getClave() + "</td>");
					out.println("<td>" + aux.getNombre_generico() + "</td>");
					out.println("<td>" + aux.getDescripcion() + "</td>");
					out.println("<td>" + aux.getPresentacion() + "</td>");
					out.println("<td>" + aux.getTotal_solicitado() + "</td>");
					out.println("<td>" + aux.getTotal_surtido() + "</td>");
					out.println("<td>" + aux.getDesplazamiento() + "</td>");
					out.println("<td>" + aux.getProcentaje() + "</td>");
					out.println("<td>" + aux.getObservaciones() + "</td>");
					out.println("</tr>");
				}
			%>
		</tbody>
	</table>
</body>
</html>