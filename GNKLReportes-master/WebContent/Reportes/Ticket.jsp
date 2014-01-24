<%@ page language="java" session="true" import="modelo.Binsumo" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
<jsp:useBean id="receta" scope="session" class="modelo.Breceta"></jsp:useBean>
<LINK href="../css/cs_ticket.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TICKET</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<table width="384" height="490"  border="3" align="left" cellpadding="2">
	  <tr>
	    <td width="372" height="92"><table width="370" border="0" cellpadding="2">
	      <tr>
	        <td class="style7"><a href="javascript:history.back(1)" class="style2">Regresar a Men&uacute;</a> </td>
	      </tr>
	      <tr>
	        <td width="362" class="style7"><div align="center"><strong><span class="style5">TIENDAS SORIANA  S.A DE C.V.* </span></strong></div></td>
	      </tr>
	      <tr>
	        <td class="style7"><div align="center"><strong><span class="style5">AV. HEROICO COLEGIO MILITAR Y AV. 20 DE NOVIEMBRE #109 COL. NUEVA VIZCAYA</span></strong><strong><span class="style5"></span></strong></div></td>
	      </tr>
	      <tr>
	        <td class="style7"><div align="center">DURANGO, DGO C.P. 34080 </div></td>
	      </tr>
	      <tr>
	        <td class="style7"><div align="center">NOMBRE UNIDAD DE ATENCION<br /></div>
	          <br />
	        <center>TICKET DE RECETA FARMACIA</center>
	        </td>
	      </tr>
	    </table></td>
	  </tr>
	  <tr>
	    <td height="254"><table width="370" border="0" cellpadding="2">
	      <tr>
	        <td width="364"><div align="right" class="style6 style8">FECHA DE VENTA:&nbsp;&nbsp; &nbsp;  </div></td>
	      </tr>
	      <tr>
	        <td><table width="364" border="0" cellpadding="2">
	          <tr>
	            <td width="196" class="style8">FOLIO:
	              <%out.println(receta.getTipo_receta()); %>&nbsp;-&nbsp;<%out.println(receta.getId_unidad()); %>&nbsp;-&nbsp;<%out.println(receta.getFolio()); %></td>
	            <td width="77" class="style8"><%out.println(receta.getFecha()); %></td>
	            <td width="71" class="style8">
	              00:00 HRS</td>
	          </tr>
	        </table></td>
	      </tr>
	      <tr>
	        <td><span class="style8">CLIENTE:
	           <%out.println(receta.getPrograma()); %></span></td>
	      </tr>
	      <tr>
	        <td class="style8">SUB-CLIENTE: 
	          SERVICIOS DE SALUD DE DURANGO</td>
	      </tr>
	      
	      <tr>
	        <td class="style8"><table width="352" border="0" cellpadding="2">
	          <tr>
	            <td width="89" class="style8">BENEFICIARIO:</td>
	            <td width="249" class="style8"> <%out.println(receta.getBeneficiario()); %>
	            </td>
	          </tr>
	          <tr>
	            <td>&nbsp;</td>
	            <td class="style8">FOLIO REFERENCIA: 
	              FOLIO SP</td>
	          </tr>
	          <tr>
	            <td>&nbsp;</td>
	            <td class="style8">RECETA: 
	              <%out.println(receta.getFolio()); %></td>
	          </tr>
	          <tr>
	            <td>&nbsp;</td>
	            <td class="style8">FECHA DE RECETA: 
	              <%out.println(receta.getFecha()); %></td>
	          </tr>
	          <tr>
	            <td class="style8">PROGRAMA:</td>
	            <td class="style8"><%out.println(receta.getPrograma()); %></td>
	          </tr>
	          <tr>
	            <td class="style8">SUB-PROGRAMA:</td>
	            <td class="style8"><%out.println(receta.getPrograma()); %></td>
	          </tr>
	        </table></td>
	      </tr>
	
	    </table></td>
	  </tr>
	  <tr>
	    <td height="25"><table width="375" border="0" cellpadding="2">
	      <tr>
	        <td width="263" class="style8">DESCRIPCION</td>
	        <td width="52" class="style8"><div align="center">CANTIDAD</div></td>
	        <td width="40" class="style8"><div align="center">ORIGEN</div></td>
	      </tr>
		  
		  <%
				for(int i=0; i<receta.getContenido().size(); i++){
					Binsumo aux = receta.getContenido().get(i);
					out.println("<tr>");
					out.println("<td class = style8 height = 21 >" + aux.getClave() + " - " + aux.getDescripcion() + "</td>");
					out.println("<td class = style8 align = center >" + aux.getCant_surtida() + "</td>");
					out.println("<td class = style8 height = 21 align = center >" + aux.getId_origen() + "</td>");
					out.println("</tr>");
				}
			%>	
	    </table></td>
	  </tr>
	  
	  <tr>
	    <td height="77"><table width="369" border="0" cellpadding="2">
	      <tr>
	        <td width="361"></td>
	      </tr>
	      <tr>
	        <td class="style8"><div align="center">FIRMA DE RECIBIDO </div></td>
	      </tr>
	      <tr>
	        <td class="style8">ENCARGADO(A): 
	          ENCARGADO</td>
	      </tr>
	      <tr>
	        <td class="style8">FECHA DE IMPRESION: 
	          <% out.println(receta.getFecha()); %>&nbsp;-&nbsp;00:00 HRS</td>
	      </tr>
	    </table></td>
	  </tr>
	  
	</table>
</body>
</html>