<%@ page language="java" session="true" import="modelo.Brepor11" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
	<jsp:useBean id="tabla" scope="session" class="modelo.Btabla"></jsp:useBean>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="../css/demo_table.css" />
	<script type="text/javascript" src="../js/Paginar/jquery.js"></script>
	<script type="text/javascript" src="../js/Paginar/jquery.dataTables.js"></script>
	<script type="text/javascript" src="../js/Paginar/funcionPaginar.js"></script>
	<title>REPORTE 11 DE CONSUMO MENSUAL POR DESVIACION DE CONTINGENCIA</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../ServletControl?menu=11&caso=1">Regresar al menú</a>
	<table border="1" id="tbl" style="width: 100%">
		<thead>
			<tr>
				<th>CLAVE SSD</th>
				<th>CLAVE</th>
				<th>DESCRIPCIÓN (MEDICAMENTO Y MATERIAL DE CURACIÓN)</th>
				<th>1</th>
				<th>2</th>
				<th>3</th>
				<th>4</th>
				<th>5</th>
				<th>6</th>
				<th>7</th>
				<th>8</th>
				<th>9</th>
				<th>10</th>
				<th>11</th>
				<th>12</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=0; i<tabla.getTabla().size(); i++){
					Brepor11 aux=(Brepor11)tabla.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getClave_ssd() + "</td>");
					out.println("<td>" + aux.getClave() + "</td>");
					out.println("<td>" + aux.getDescripcion() +"</td>");
					out.println("<td>" + aux.getCant1() + "</td>");
					out.println("<td>" + aux.getCant2() + "</td>");
					out.println("<td>" + aux.getCant3() + "</td>");
					out.println("<td>" + aux.getCant4() + "</td>");
					out.println("<td>" + aux.getCant5() + "</td>");
					out.println("<td>" + aux.getCant6() + "</td>");
					out.println("<td>" + aux.getCant7() + "</td>");
					out.println("<td>" + aux.getCant8() + "</td>");
					out.println("<td>" + aux.getCant9() + "</td>");
					out.println("<td>" + aux.getCant10() + "</td>");
					out.println("<td>" + aux.getCant11() + "</td>");
					out.println("<td>" + aux.getCant12() + "</td>");
					out.println("</tr>");
				}
			%>
		</tbody>
	</table>
</body>
</html>