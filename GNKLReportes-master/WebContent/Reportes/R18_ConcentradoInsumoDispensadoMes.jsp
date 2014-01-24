<%@ page language="java" session="true" import="modelo.Brepor18" contentType="text/html; charset=ISO-8859-1"
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
	<title>REPORTE 18</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../ServletControl?menu=18&caso=1">Regresar al menú</a>
	<table border="1" id="tbl" style="width: 100%">
		<thead>
			<tr>
				<th>CLAVE SSA</th>
				<th>DESCRIPCIÓN TÉCNICA</th>
				<th>PRECIO LICITADO</th>
				<th>ADMON</th>
				<th>PRECIO BASE</th>
				<th>AÑO</th>
				<th>Julio</th> <!-- AQUI VA A IR LA CANTIDAD -->
				<th>TOTAL</th>
				<th>INVENTARIO RECIBIDO</th>
				<th>(ORIGEN SSD) INV. A CONSIGNACIÓN</th>
				<th>(ORIGEN SORIANA) INV. A COBRO</th>
				<th>IMPORTE A PRECIO LICITACIÓN</th>
				<th>IMPORTE SERV. DE ADMON</th>
				<th>IMPORTE DE PRECIO BASE</th>
			</tr>
		</thead>
		<tbody>
			<%
				float t_impor_l=0, t_impor_a=0, t_impor_b=0;
				for(int i=0; i<tabla.getTabla().size(); i++){
					Brepor18 aux=(Brepor18)tabla.getTabla().get(i);
					out.println("<tr>");
					out.println("<td>" + aux.getClave() + "</td>");
					out.println("<td>" + aux.getDescripcion() + "</td>");
					out.println("<td>" + aux.getPrecio_licitado() + "</td>");
					out.println("<td>" + aux.getAdmon() + "</td>");
					out.println("<td>" + aux.getPrecio_base() + "</td>");
					out.println("<td>" + aux.getAño() + "</td>");
					out.println("<td>" + aux.getCantidad() + "</td>"); //sera
					out.println("<td>" + aux.getTotal() + "</td>");
					out.println("<td>" + aux.getInventario_recibido() + "</td>");
					out.println("<td>" + aux.getOrigen_ssd() + "</td>");
					out.println("<td>" + aux.getOrigen_soriana() + "</td>");
					out.println("<td>" + aux.getImporte_precio_licitacion() + "</td>");
					out.println("<td>" + aux.getImporte_serv_admon() + "</td>");
					out.println("<td>" + aux.getPrecio_base() + "</td>");
					out.println("</tr>");
					t_impor_l += aux.getImporte_precio_licitacion();
					t_impor_a += aux.getImporte_serv_admon();
					t_impor_b += aux.getPrecio_base();
				}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="11">SUBTOTAL</td>
				<td><% out.println(t_impor_l); %></td>
				<td><% out.println(t_impor_a); %></td>
				<td><% out.println(t_impor_b); %></td>
			</tr>
			<tr>
				<td colspan="11">I.V.A.</td>
				<td><% out.println(t_impor_l * 0.16); %></td>
				<td><% out.println(t_impor_a * 0.16); %></td>
				<td><% out.println(t_impor_b * 0.16); %></td>
			</tr>
			<tr>
				<td colspan="11">TOTAL</td>
				<td><% out.println((t_impor_l * 0.16) + t_impor_l); %></td>
				<td><% out.println((t_impor_a * 0.16) + t_impor_a); %></td>
				<td><% out.println((t_impor_b * 0.16) + t_impor_b); %></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>
