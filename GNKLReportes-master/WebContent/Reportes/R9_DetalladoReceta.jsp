<%@ page language="java" session="true" import="modelo.Brepor9" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
	<jsp:useBean id="tabla" scope="session" class="modelo.Btabla"></jsp:useBean>
	<script type="text/javascript" src="../js/jquery-2.0.2.js"></script>
	<script type="text/javascript" src="../js/jqFunc.js"></script>
	<link rel="stylesheet" href="../css/demo_table.css" />
	<script type="text/javascript" src="../js/Paginar/jquery.js"></script>
	<script type="text/javascript" src="../js/Paginar/jquery.dataTables.js"></script>
	<script type="text/javascript" src="../js/Paginar/funcionPaginar.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>REPORTE 9 REPORTE DETALLADO POR RECETA</title>
</head>
<body onload="ocultarTotales_reporte5()">
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../ServletControl?menu=9&caso=1">Regresar al menú</a>
	<table border="1" id="tbl" style="width: 100%">
		<thead>
			<tr>
				<th>FOLIO RECIBO ENTREGA</th>
				<th>FOLIO RECETA</th>
				<th>FECHA</th>
				<th>BENEFICIARIO</th>
				<th>MEDICAMENTO/MATERIAL DE CURACIÓN</th>
				<th>ORIGEN</th>
				<th>CANTIDAD SURTIDA</th>
				<th>IMPORTE</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=0; i<tabla.getTabla().size(); i++){
					Brepor9 aux=(Brepor9)tabla.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getId() + "</td>");
					out.println("<td>" + "<a href=\"../ServletControl?caso=2&folio=" + aux.getFolio() + "\">" + aux.getFolio() +"</a></td>");
					out.println("<td>" + aux.getFecha() +"</td>");
					out.println("<td>" + aux.getBeneficiario() +"</td>");
					out.println("<td>" + aux.getDescripcion() +"</td>");
					out.println("<td>" + aux.getOrigen() + "</td>");
					out.println("<td>" + aux.getCantidad() + "</td>");
					out.println("<td>" + "$" + " " + aux.getImporte() + "</td>");
					out.println("</tr>");
				}
			%>
		</tbody>
	</table>
	<br></br>
	<input type="button" id="btnVer" name="btnVer" value="Ver Totales" onclick=""/>
	<table id="tblTotales" border="1">
		<tr>
			<th colspan="3">TOTALES</th>
		</tr>
		<tr>
			<td></td>
			<td>PIEZAS</td>
			<td>IMPORTES</td>
		</tr>
		<tr>
			<td>TOTAL MEDICAMENTO:</td>
			<td><% out.println(tabla.getCant_medi()); %></td>
			<td><% out.println("$ " + tabla.getImp_medi()); %></td>
		</tr>
		<tr>
			<td>TOTAL MATERIAL DE CURACIÓN:</td>
			<td><% out.println(tabla.getCant_material()); %></td>
			<td><% out.println("$ " + tabla.getImp_material()); %></td>
		</tr>
		<tr>
			<td>TOTAL OTROS (INSUMOS SOLO DESPLAZADOS):</td>
			<td><% out.println(tabla.getCant_otros()); %></td>
			<td><% out.println("$ " + tabla.getImp_otro()); %></td>
		</tr>
		<tr>
			<td>SUBTOTAL:</td>
			<td></td>
			<td><% out.println("$ " + tabla.getImp_general()); %></td>
		</tr>
		<tr>
			<td>IMPUESTO:</td>
			<td></td>
			<td>$ 0.00</td>
		</tr>
		<tr>
			<td>TOTAL GENERAL:</td>
			<td><% out.println(tabla.getCant_general()); %></td>
			<td><% out.println("$ " + tabla.getImp_general()); %></td>
		</tr>
	</table>
</body>
</html>