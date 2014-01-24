<%@ page language="java" session="true" import="modelo.Brepor3" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
	<jsp:useBean id="tabla" scope="session" class="modelo.Btabla"></jsp:useBean>
	<jsp:useBean id="tablaSor" scope="session" class="modelo.Btabla"></jsp:useBean>
	<link rel="stylesheet" href="../css/demo_table.css" />
	<script type="text/javascript" src="../js/Paginar/jquery.js"></script>
	<script type="text/javascript" src="../js/Paginar/jquery.dataTables.js"></script>
	<script type="text/javascript" src="../js/Paginar/funcionPaginar.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>4- CONCENTRADO MENSUAL UNIDAD Y PROGRAMA</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../ServletControl?menu=4&caso=1">Regresar al menú</a>
	<table border="1" id="tbl" style="width: 100%">
		<thead>
			<tr>
				<th>CLAVE</th>
				<th>DESCRIPCION</th>
				<th>PRESENTACION</th>
				<th>PRECIO UNITARIO</th>
				<th>IMPORTE</th>
				<th>ENE</th>
				<th>FEB</th>
				<th>MAR</th>
				<th>ABR</th>
				<th>MAY</th>
				<th>JUN</th>
				<th>JUL</th>
				<th>AGO</th>
				<th>SEP</th>
				<th>OCT</th>
				<th>NOV</th>
				<th>DIC</th>
				<th>TOTAL</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=0; i<tabla.getTabla().size(); i++){
					Brepor3 aux=(Brepor3)tabla.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getClave() + "</td>");
					out.println("<td>" + aux.getDesc() +"</td>");
					out.println("<td>" + aux.getPresentacion() +"</td>");
					out.println("<td>" + "$ " + aux.getPrecio() +"</td>");
					out.println("<td>" + "$ " + aux.getImporte() +"</td>");
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
					out.println("<td>" + aux.cantTotal() + "</td>");
					out.println("</tr>");
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">TOTAL DE MEDICAMENTO:</td>
				<td></td>
				<%
					int suma=0;
					for(int i=0; i<12; i++){
						out.println("<td>" + tabla.getCantidades()[i] + "</td>");
						suma +=tabla.getCantidades()[i];
					}
					out.println("<td>" + suma + "</td>");
				%>
			</tr>
			<tr>
				<td colspan="4">TOTAL DE MATERIAL DE CURACION:</td>
				<td></td>
				<%
					int suma2=0;
					for(int i=12; i<24; i++){
						out.println("<td>" + tabla.getCantidades()[i] + "</td>");
						suma2 +=tabla.getCantidades()[i];
					}
					out.println("<td>" + suma2 + "</td>");
				%>
			</tr>
			<tr>
				<td colspan="4">TOTAL OTROS (INSUMOS  SOLO DESPLAZADOS):</td>
				<td></td>
				<%
					int suma3=0;
					for(int i=24; i<36; i++){
						out.println("<td>" + tabla.getCantidades()[i] + "</td>");
						suma3 +=tabla.getCantidades()[i];
					}
					out.println("<td>" + suma3 + "</td>");
				%>
			</tr>
			<tr>
				<td colspan="4">TOTAL GENERAL:</td>
				<td></td>
				<%
					int suma4=0;
					for(int i=0; i<12; i++){
						int aux=tabla.getCantidades()[i] + tabla.getCantidades()[i+12] + tabla.getCantidades()[i+24];
						out.println("<td>" + aux + "</td>");
						suma4 +=aux;
					}
					out.println("<td>" + suma4 + "</td>");
				%>
			</tr>
		</tfoot>
	</table>
	<br></br>
	<br></br>
	<table border="1" id="tbl2" style="width: 100%">
		<thead>
			<tr>
				<th>CLAVE</th>
				<th>DESCRIPCION</th>
				<th>PRESENTACION</th>
				<th>PRECIO UNITARIO</th>
				<th>IMPORTE</th>
				<th>ENE</th>
				<th>FEB</th>
				<th>MAR</th>
				<th>ABR</th>
				<th>MAY</th>
				<th>JUN</th>
				<th>JUL</th>
				<th>AGO</th>
				<th>SEP</th>
				<th>OCT</th>
				<th>NOV</th>
				<th>DIC</th>
				<th>TOTAL</th>
			</tr>
		</thead>
		<tbody> 
			<%
				for(int i=0; i<tablaSor.getTabla().size(); i++){
					Brepor3 aux=(Brepor3)tablaSor.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getClave() + "</td>");
					out.println("<td>" + aux.getDesc() +"</td>");
					out.println("<td>" + aux.getPresentacion() +"</td>");
					out.println("<td>" + "$ " + aux.getPrecio() +"</td>");
					out.println("<td>" + "$ " + aux.getImporte() +"</td>");
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
					out.println("<td>" + aux.cantTotal() + "</td>");
					out.println("</tr>");
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">TOTAL DE MEDICAMENTO:</td>
				<td></td>
				<%
					int suma_=0;
					for(int i=0; i<12; i++){
						out.println("<td>" + tablaSor.getCantidades()[i] + "</td>");
						suma_ +=tablaSor.getCantidades()[i];
					}
					out.println("<td>" + suma_ + "</td>");
				%>
			</tr>
			<tr>
				<td colspan="4">TOTAL DE MATERIAL DE CURACION:</td>
				<td></td>
				<%
					int suma2_=0;
					for(int i=12; i<24; i++){
						out.println("<td>" + tablaSor.getCantidades()[i] + "</td>");
						suma2_ +=tablaSor.getCantidades()[i];
					}
					out.println("<td>" + suma2_ + "</td>");
				%>
			</tr>
			<tr>
				<td colspan="4">TOTAL OTROS (INSUMOS  SOLO DESPLAZADOS):</td>
				<td></td>
				<%
					int suma3_=0;
					for(int i=24; i<36; i++){
						out.println("<td>" + tablaSor.getCantidades()[i] + "</td>");
						suma3_ +=tablaSor.getCantidades()[i];
					}
					out.println("<td>" + suma3_ + "</td>");
				%>
			</tr>
			<tr>
				<td colspan="4">TOTAL GENERAL:</td>
				<td></td>
				<%
					int suma4_=0;
					for(int i=0; i<12; i++){
						int aux=tablaSor.getCantidades()[i] + tablaSor.getCantidades()[i+12] + tablaSor.getCantidades()[i+24];
						out.println("<td>" + aux + "</td>");
						suma4_ +=aux;
					}
					out.println("<td>" + suma4_ + "</td>");
				%>
			</tr>
			<tr>
				<td colspan="18"><br></br></td>
			</tr>
			<tr>
				<td colspan="4">TOTAL DE PIEZAS</td>
				<td></td>
				<%
					int sumaT=0;
					for(int i=0; i<12; i++){
						int aux=tabla.getCantidades()[i] + tabla.getCantidades()[i+12] + tabla.getCantidades()[i+24]+ tablaSor.getCantidades()[i] + tablaSor.getCantidades()[i+12] + tablaSor.getCantidades()[i+24];
						out.println("<td>" + aux + "</td>");
						sumaT +=aux;
					}
					out.println("<td>" + sumaT + "</td>");
				%>
			</tr>
		</tfoot>
	</table>
</body>
</html>