<%@ page language="java" session="true" import="modelo.Binsumo" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
<jsp:useBean id="receta" scope="session" class="modelo.Breceta"></jsp:useBean>
<script type="text/javascript" src="../js/jquery-2.0.2.js"></script>
<script type="text/javascript" src="../js/jqFunc.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<LINK href="../css/cs.css" rel="stylesheet" type="text/css">
<title>RECETA ELECTRÓNICA</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="javascript:history.back(1)" class="style2">REGRESAR A REPORTE</a>
	<table width="893" height="574" border="3" align="center" cellpadding="2">
	  <tr>
	    <td width="877" height="114"><table width="864" border="0" align="center" cellpadding="2">
	      <tr>
	        <td width="201" height="59"><div align="center"><img src="../imagenes/logo_salud.jpg" width="75" height="55" />&nbsp;</div></td>
	        <td width="417"><div align="center" class="style7">SERVICIO DE SALUD DE DURANGO<br />
	        RECETA "RECETA FARMACIA"
	          
	          </div>
	          <span class="style13"><span class="Estilo1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span class="style2"><strong>&nbsp;BIENVENIDOS:</strong><span class="Estilo4">&nbsp;</span></span></td>
	        <td width="226"><div align="center"><img src="../imagenes/logo_dgo.jpg" width="108" height="76" />&nbsp;</div>
	        </td>
	      </tr>
	    </table>
	      <table width="877" height="59" border="0" align="center" cellpadding="2">
	        <tr>
	          <td width="381" height="55" class="style2">
	            NO. DE FOLIO:
	              <input name="txtf_foliore" id="txtf_foliore" type="text" class="style13" onkeyup="folio_receta()" value="<% out.print(receta.getFolio()); %>" size="15" />&nbsp;&nbsp;</td>
	          <td width="171"><table width="167" height="0%" border="0" cellpadding="2">
	            <tr>
	              <td width="225" height="100%" class="style2">HORA:
	                <input name="reloj" type="text" class="style13" size="15" value="00:00 hrs" readonly ></td>
	            </tr>
	          </table>          </td>
	          <td width="305" align="center" class="style2">
	            FECHA:
	                  <input name="txtf_t1" type="text" id='txtf_t1' value="<% out.print(receta.getFecha()); %>" size="10"/>
	                  <table width="152" height="0%" border="0" align="right" cellpadding="2">
	            
	          </table></td>
	        </tr>
	    </table>    </td>
	  </tr>
	        <tr>
	           
	        </tr>
	        <tr>
	          <td height="41" colspan="3" class="style4"><table width="710" border="0" align="center" cellpadding="2">
	            <tr>
	              <td width="533" class="style2">UNIDAD DE SALUD
	              <textarea name="txtf_unidadmed" cols="60" readonly="readonly" class="style13" colspan="3"><% out.print(receta.getUnidad()); %></textarea></td>
	              <td width="170"><table width="170" border="0" align="left" cellpadding="2">
	                <tr>
	                  <td width="162" align="center"><div align="center" class="style2">JURISDICCION&nbsp;&nbsp;<input name="txtf_njuris" type="text" class="style13" value="<% out.print(receta.getJurisdiccion()); %>" size="1" />
	                  </div></td>
	                </tr>
	              </table></td>
	            </tr>
	            
	          </table></td>
	        </tr>
	  <tr>
	          <td height="62" colspan="3" class="style4"><table width="753" border="0" align="center" cellpadding="2">
	            <tr>
	              <td width="602" height="52" class="style2">NOMBRE DEL PACIENTE:
	                <label> </label>
	                <span class="style5">
	                <label> </label>
	                <input name="txtf_paciente" type="text" class="style13" value="<% out.print(receta.getBeneficiario()); %>" size="55" />
	                </span>
	                <label><span class="style2"> Carnet:&nbsp;
	                <input name="txtf_carnet" type="text" class="style13" value="CARNET" size="8" />
	                <br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;APELLIDO PATERNO </span><span class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;APELLIDO MATERNO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NOMBRE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></label></td>
	              <td width="137"><table width="137" border="0" align="right" cellpadding="2">
	                <tr>
	                  <td width="129"><div align="right"><span class="style2">
	                    <input name="txtf_edad" type="text" class="style13" value="<% out.print(receta.getEdad()); %>" size="5" />
	                    <br />
	                    EDAD</span></div></td>
	                </tr>
	              </table></td>
	            </tr>
	          </table>          </td>
	        </tr>
	        <tr>
	          <td height="82" colspan="3" class="style4"><table width="733" border="0" align="center" cellpadding="2">
	            <tr>
	              <td width="87"  class="style2"><div align="center">POBLACION ABIERTA </div></td>
	              <td width="135" class="style2"><div align="center">OPORTUNIDADES</div></td>
	              <td width="140" class="style2"><div align="center">SEGURO POPULAR </div></td>
	              <td width="345" class="style2"><div align="center">No. DE FOLIO S.P. </div></td>
	            </tr>
	            <tr>
	              <td class="style11"><label> <br />
	              </label></td>
	              <td class="style11"><label><img src="../imagenes/oportunidades.jpg" width="107" height="32" /></label></td>
	              <td class="style11"><label><img src="../imagenes/salud_seguro_popu.jpg" width="107" height="32" /></label></td>
	              <td class="style11"><input name="txtf_foliosp" type="text" class="style13" value="<% out.print(receta.getNum_seguro()); %>" size="50" /></td>
	            </tr>
	            
	          </table></td>
	        </tr>
	        <tr>
	          <td height="38" colspan="3" class="style4"><table width="763" border="0" align="center" cellpadding="2">
	            <tr>
	              <td width="755" class="style2">
	              NOMBRE M&Eacute;DICO:
	                <input name="txtf_nomed" type="text" class="style13" value="<%out.print(receta.getNombre_medico()); %>" size="35"  />
	              <span class="style2">C&Eacute;DULA: 
	              <input name="txtf_cedu" id="a" type="text" class="style13" value="<% out.print(receta.getCedula()); %>" size="10"  />
	              CAUSES:
	              <input name="txtf_cause" type="text" class="style13" value="<% out.print(receta.getCauses()); %>" size="8" />
	              </span></td>
	            </tr>
	            <!-- AQUILES -->
	        
	            
	            
	          </table></td>
	        </tr>
	  <tr>
	          <td  colspan="3" class="style4"><table width="763" border="0" align="center" cellpadding="2">
	            <tr>
	              <td class="style11">&nbsp;</td>
	              <td colspan="5" class="style11">&nbsp;</td> 
	            </tr>
				
	            <tr>
	              <td class="style11" align="center"><span class="style2">CLAVE</span></td>
	              <td class="style11" align="center"><span class="style2">DESCRIPCI&Oacute;N</span></td>
	              <td class="style11" align="center"><span class="style2">CANT. SOL</span></td>
	              <td class="style11" align="center"><span class="style2">CANT. SUR </span></td>
	              <td class="style11" align="center"><span class="style2">SE SURTI&Oacute;</span></td>
	              <td class="style11">&nbsp;</td>
	            </tr>
	            
	            <%
					for(int i=0; i<receta.getContenido().size(); i++){
						Binsumo aux = receta.getContenido().get(i);
						out.println("<tr>");
						out.println("<td class = style11 align = center > <span class = style2 >" + aux.getClave() + "</span></td>");
						out.println("<td class = style11 align = center > <span class = style2 >" + aux.getDescripcion() + "</span></td>");
						out.println("<td class = style11 align = center > <span class = style2 >" + aux.getCant_solicitada() + "</span></td>");
						out.println("<td class = style11 align = center > <span class = style2 >" + aux.getCant_surtida() + "</span></td>");
						
						if(aux.isSurtio()){
							out.println("<td class = style11 align = center > <span class = style2 > Si </span></td>");
						}else{
							out.println("<td class = style11 align = center > <span class = style2 > No </span></td>");
						}
						out.println("</tr>");
					}
				%>				
	            <tr>
	              <td height="28" class="style11">&nbsp;</td>
	              <td class="style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	              <label>              </label></td>
	              <td class="style11">&nbsp;</td>
	              <td class="style11">&nbsp;</td>
	              <td colspan="2" class="style11">
	              	<form name="frmReceta" action="../ServletControl" method="post">
	              		<input type="hidden" name="folio" id="folio" value= "<% out.print(receta.getFolio()); %>" />
	              		<input type="hidden" name="caso" id="caso" value= "2222" />
	              		<input name="Submit" type="submit" class="subHeader" value="Ver Ticket" />
	              	</form>
	              </td>
	            </tr>
	          </table></td>
	  </tr>
	</table>
	
	<p>&nbsp;</p>
	<%
		if(receta.getError() != null){
			if(!receta.getError().equals("")){
				out.println("<label id = lblJur style = \" color : red ; \" >" + receta.getError() + "</label>"); 
			} 
		}
	%>
</body>
</html>