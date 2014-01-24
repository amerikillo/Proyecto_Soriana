<%@ page language="java" session="true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript" src="../js/jquery-2.0.2.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script>
		$(function (){
			$("#dialog-form").dialog({
				autoOpen:false,
				height: 300,
				width: 350,
				modal: true,
				buttons:{
					"Crear cuenta": function(){
						$(this).dialog("close");
					},
					Cancel : function(){
						$(this).dialog("close");
					}
				},
				close: function(){
					$("#name").val("");
					$("#email").val("");
					$("#password").val("");
				}
			});
			
			$( "#create-user" )
		      .button()
		      .click(function() {
		        $( "#dialog-form" ).dialog( "open" );
		      });
		});
	</script>
	<jsp:useBean id="usuario" scope="session" class="modelo.Busuario"></jsp:useBean>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Prueba Modal</title>
</head>
<body>
	<div id="dialog-form" title="Create new user" style="border: 5px;">
	  <p>All form fields are required.</p>
	 
	  <form>
	  <fieldset>
	    <label for="name">Name</label>
	    <input type="text" name="name" id="name"/>
	    <label for="email">Email</label>
	    <input type="text" name="email" id="email" value=""/>
	    <label for="password">Password</label>
	    <input type="password" name="password" id="password" value=""/>
	  </fieldset>
	  </form>
	</div>
<div id="users-contain">
	<h1>Existing Users:</h1>
	  <table id="users" border="1">
	    <thead>
	      <tr>
	        <th>Name</th>
	        <th>Email</th>
	        <th>Password</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td>John Doe</td>
	        <td>john.doe@example.com</td>
	        <td>johndoe1</td>
	      </tr>
	    </tbody>
	  </table>
</div>
	  <br></br>
	  <button id="create-user">Create new user</button>
</body>
</html>