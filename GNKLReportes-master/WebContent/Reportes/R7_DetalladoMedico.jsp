<%@ page language="java" session="true" import="modelo.Brepor7" contentType="text/html; charset=ISO-8859-1"
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
	<title>REPORTE 7 REPORTE DETALLADO POR MEDICO</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../ServletControl?menu=7&caso=1">Regresar al menú</a>
	<table border="1" id="tbl" style="width: 100%">
		<thead>
			<tr>
				<th>FOLIO RECIBO ENTREGA</th>
				<th>FOLIO RECETA</th>
				<th>FECHA</th>
				<th>BENEFICIARIO</th>
				<th>MEDICAMENTO/MATERIAL DE CURACIÓN</th>
				<th>ORIGEN</th>
				<th>COSTO UNITARIO</th>
				<th>CANTIDAD SURTIDA</th>
				<th>IMPORTE</th>
			</tr>
		</thead>
		<tbody>
			<%
				int surtido=0;
				int import_total=0;
				for(int i=0; i<tabla.getTabla().size(); i++){
					Brepor7 aux=(Brepor7)tabla.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + "SSD-" + aux.getFolio() + "</td>");
					out.println("<td>" + "<a href=\"../ServletControl?caso=2&folio=" + aux.getFolio() + "\">" + aux.getFolio() +"</a></td>");
					out.println("<td>" + aux.getFecha() +"</td>");
					out.println("<td>" + aux.getNombre() +"</td>");
					out.println("<td>" + aux.getDescripcion() +"</td>");
					out.println("<td>" + aux.getOrigen() +"</td>");
					out.println("<td>" + "$ " + aux.getPrecio() +"</td>");
					out.println("<td>" + aux.getCantidad() +"</td>");
					out.println("<td>" + "$ " + aux.getImporte() +"</td>");
					out.println("</tr>");
					surtido += aux.getCantidad();
					import_total += aux.getImporte();
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5" align="right">TOTAL SURTIDO</td>
				<td colspan="3" align="right"><% out.println(surtido); %></td>
				<td><% out.println("$ " + import_total); %></td>
			</tr>
			<tr>
				<td colspan="5" align="right">TOTAL</td>
				<td colspan="3" align="right"><% out.println(surtido); %></td>
				<td><% out.println("$ " + import_total); %></td>
			</tr>
			<tr>
				<td colspan="5" align="right">SUBTOTAL</td>
				<td colspan="3" align="right"><% out.println(surtido); %></td>
				<td><% out.println("$ " + import_total); %></td>
			</tr>
			<tr>
				<td colspan="5" align="right">IMPUESTOS</td>
				<td colspan="3" align="right"></td>
				<td>$ 0.00</td>
			</tr>
			<tr>
				<td colspan="5" align="right">TOTAL GENERAL</td>
				<td colspan="3" align="right"><% out.println(surtido); %></td>
				<td><% out.println("$ " + import_total); %></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>