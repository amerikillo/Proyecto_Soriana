<%@ page language="java" session="true" import="modelo.Brepor17" contentType="text/html; charset=ISO-8859-1"
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
	<title>REPORTE 17</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../ServletControl?menu=17&caso=1">Regresar al menú</a>
	<table border="1" id="tbl" style="width: 100%">
		<thead>
			<tr>
				<th>CLAVE</th>
				<th>DESCRIPCION</th>
				<th>UM</th>
				<th>CAJAS</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=0; i<tabla.getTabla().size(); i++){
					Brepor17 aux=(Brepor17)tabla.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getClave() + "</td>");
					out.println("<td>" + aux.getDescripcion() + "</td>");
					out.println("<td>" + aux.getPresentacion() + "</td>");
					out.println("<td>" + aux.getCantidad() + "</td>");
					out.println("</tr>");
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<br></br>
			</tr>
			<tr>
				<td colspan="4">ADMINISTRADOR DE LA UNIDAD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ENCARGADO(A) DE LA FARMACIA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FILTRO DE LA SECRETARIA DE SALUD DE DURANGO</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>