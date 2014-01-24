<%@ page language="java" session="true" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="../js/funciones.js"></script>
	<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
	<jsp:useBean id="msj" scope="session" class="modelo.Berror"></jsp:useBean>
	<link rel="stylesheet" href="../css/demo_table.css" />
	<script type="text/javascript" src="../js/Paginar/jquery.js"></script>
	<script type="text/javascript" src="../js/Paginar/jquery.dataTables.js"></script>
	<script type="text/javascript" src="../js/Paginar/funcionPaginar.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SUBIR EXCELL</title>
</head>
<body>
	<%if(usuario.getRoll().equals("") || usuario.getUsuario().equals("")){
		response.sendRedirect("../login.jsp");
	} %>
	<a href="../menus/menuPrincipal.jsp">Regresar al menú</a>
	<br>
     <form name="frmUpLoad" action="../ServletUpload" method="post" onsubmit="return validarSubirArchivo()" enctype="multipart/form-data">
     	<input type="hidden" name="caso" value="3333" />
     	<label id="lblarchivo" for="lblarchivo">Archivo: </label>
     	<br>
     	<input type="file" name="uploadFile" id="uploadFile"/>
     	<br>
     	<input type="submit" name="Subir" value="Subir Archivo" />
     </form>
     <br></br>
     <table border="1" id="tbl" style="width: 100%">
		<thead>
			<tr>
				<th>COLUMNA DEL ARCHIVO(POSIBLEMENTE ERRONEA)</th>
				<th>NUMERO DE FILA DEL ARCHIVO</th>
			</tr>
		</thead>
		<tbody>
	     <%
	     	if(msj.getMsj().size()!=0){
	     		for(int k=0; k<msj.getMsj().size(); k++){
	     			String[] aux= msj.getMsj().get(k);
	     			out.println("<tr>");
					out.println("<td>" + aux[0] + "</td>");
					out.println("<td>" + aux[1] + "</td>");
					out.println("</tr>");
	     		}
	     	}
	     %>
	    </tbody>
		<tfoot>
		</tfoot>
	</table>
</body>
</html>