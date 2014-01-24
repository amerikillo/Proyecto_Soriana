function validarInicio(){
	var usuario = document.forms["frmLogin"]["txtUser"].value;
	var pass = document.forms["frmLogin"]["txtPass"].value;
	if(usuario == null || usuario == "" || pass == null || pass== ""){
		alert("Existen campos vacios");
		return false;
	}
}

function validarSubirArchivo(){
	var seleccion=document.getElementById("uploadFile").value;
	if(seleccion == "" || seleccion == null){
		alert('Ningún archivo ha sido seleccionado');
		return false;
	}
}

function validarMenuPrincipal(){
	var seleccion=document.getElementById("caso").value;
	if(seleccion == 0){
		alert('Seleccion una opcion');
		return false;
	}
}

function ocultarForm_gestionUsuarios(){
	ocultaetiquetasGestionUser();
	document.getElementById("frmGestionUser").style.visibility="hidden";
}

function mostrarForm_gestionUsuarios(){
	document.getElementById("frmGestionUser").style.visibility="";
}

function ocultaetiquetasGestionUser(){
	document.getElementById("lblUs").style.visibility="hidden";
	document.getElementById("lblRol").style.visibility="hidden";
	document.getElementById("lblPass1").style.visibility="hidden";
	document.getElementById("lblPass2").style.visibility="hidden";
}

function validarGestionUsuarios(){
	var user=document.getElementById("txtUser").value;
	var rol=document.getElementById("cmbRol").value;
	var pass1=document.getElementById("txtPass").value;
	var pass2=document.getElementById("txtPassC").value;
	ocultaetiquetasGestionUser();
	if(user == "" || user == null){
		document.getElementById("lblUs").style.visibility="";
	}
	if(rol == 0){
		document.getElementById("lblRol").style.visibility="";
	}
	if(pass1 == "" || pass1 == null){
		document.getElementById("lblPass1").style.visibility="";
	}
	if(pass2 == "" || pass2 == null){
		document.getElementById("lblPass2").style.visibility="";
	}
	if(pass2 != pass1){
		alert("Las Contraseñas no coinciden");
		return false;
	}
	if(user == "" || user == null || rol == 0 || pass1 == "" || pass1 == null || pass2 == "" || pass2 == null){
		alert("Faltan llenar algunos campos");
		return false;
	}
}

function validarMenu2(){
	var jur=document.getElementById("cmbJur").value;
	var muni=document.getElementById("cmbMunicipio").value;
	var unidad=document.getElementById("cmbUnidad").value;
	var fechaini=document.getElementById("dateIni").value;
	var fechafin=document.getElementById("dateFin").value;
	var programa=document.getElementById("cmbPrograma").value;
	ocultaEtiquetas();
	if(jur == 0){
		document.getElementById("lblJur").style.visibility="";
	}
	if(muni == 0){
		document.getElementById("lblMun").style.visibility="";
	}
	if(unidad == 0){
		document.getElementById("lblUni").style.visibility="";
	}
	if(programa == 0){
		document.getElementById("lblPro").style.visibility="";
	}
	if(fechaini == "" || fechaini ==  null){
		document.getElementById("lblFini").style.visibility="";
	}
	if(fechafin == "" || fechafin == null){
		document.getElementById("lblFfin").style.visibility="";
	}
	if( (fechafin != "" && fechafin != "") || (fechafin != null && fechafin != null)){
		if(!validaFechas()){
			alert("Fechas invalidas");
			return false;
		}
	}
	if(fechafin == "" || fechafin == null || fechafin == "" || fechafin == null || programa == 0 || jur == 0 || muni == 0|| unidad == 0 ){
		alert("Faltan llenar algunos campos");
		return false;
	}
}

function validarMenu3(){
	var jur=document.getElementById("cmbJur").value;
	var muni=document.getElementById("cmbMunicipio").value;
	var unidad=document.getElementById("cmbUnidad").value;
	var fechaini=document.getElementById("dateIni").value;
	var fechafin=document.getElementById("dateFin").value;
	ocultaEtiquetas_menu3();
	if(jur == 0){
		document.getElementById("lblJur").style.visibility="";
	}
	if(muni == 0){
		document.getElementById("lblMun").style.visibility="";
	}
	if(unidad == 0){
		document.getElementById("lblUni").style.visibility="";
	}
	if(fechaini == "" || fechaini ==  null){
		document.getElementById("lblFini").style.visibility="";
	}
	if(fechafin == "" || fechafin == null){
		document.getElementById("lblFini").style.visibility="";
	}
	if( (fechafin != "" && fechafin != "") || (fechafin != null && fechafin != null)){
		if(!validaFechas()){
			alert("Fechas invalidas");
			return false;
		}
	}
	if(fechafin == "" || fechafin == null || fechafin == "" || fechafin == null || jur == 0 || muni == 0|| unidad == 0 ){
		alert("Faltan llenar algunos campos");
		return false;
	}
}

function validarMenu4(){
	var jur=document.getElementById("cmbJur").value;
	var muni=document.getElementById("cmbMunicipio").value;
	var unidad=document.getElementById("cmbUnidad").value;
	var fechaini=document.getElementById("dateIni").value;
	var fechafin=document.getElementById("dateFin").value;
	var programa=document.getElementById("cmbPrograma").value;
	ocultaEtiquetas_menu4();
	if(jur == 0){
		document.getElementById("lblJur").style.visibility="";
	}
	if(muni == 0){
		document.getElementById("lblMun").style.visibility="";
	}
	if(unidad == 0){
		document.getElementById("lblUni").style.visibility="";
	}
	if(programa == 0){
		document.getElementById("lblPro").style.visibility="";
	}
	if(fechaini == "" || fechaini ==  null){
		document.getElementById("lblFini").style.visibility="";
	}
	if(fechafin == "" || fechafin == null){
		document.getElementById("lblFini").style.visibility="";
	}
	if( (fechafin != "" && fechafin != "") || (fechafin != null && fechafin != null)){
		if(!validaFechas()){
			alert("Fechas invalidas");
			return false;
		}
	}
	if(fechafin == "" || fechafin == null || fechafin == "" || fechafin == null || programa == 0 || jur == 0 || muni == 0|| unidad == 0 ){
		alert("Faltan llenar algunos campos");
		return false;
	}
}

function validarMenu5(){
	var jur=document.getElementById("cmbJur").value;
	var muni=document.getElementById("cmbMunicipio").value;
	var unidad=document.getElementById("cmbUnidad").value;
	var fechaini=document.getElementById("dateIni").value;
	var fechafin=document.getElementById("dateFin").value;
	var programa=document.getElementById("cmbPrograma").value;
	var receta=document.getElementById("cmbReceta").value;
	var serv=document.getElementById("cmbServicio").value;
	ocultaEtiquetas();
	if(jur == 0){
		document.getElementById("lblJur").style.visibility="";
	}
	if(muni == 0){
		document.getElementById("lblMun").style.visibility="";
	}
	if(unidad == 0){
		document.getElementById("lblUni").style.visibility="";
	}
	if(programa == 0){
		document.getElementById("lblPro").style.visibility="";
	}
	if(receta == 0){
		document.getElementById("lblRec").style.visibility="";
	}
	if(serv == 0){
		document.getElementById("lblSer").style.visibility="";
	}
	if(fechaini == "" || fechaini ==  null){
		document.getElementById("lblFini").style.visibility="";
	}
	if(fechafin == "" || fechafin == null){
		document.getElementById("lblFfin").style.visibility="";
	}
	if( (fechafin != "" && fechafin != "") || (fechafin != null && fechafin != null)){
		if(!validaFechas()){
			alert("Fechas invalidas");
			return false;
		}
	}
	if(fechafin == "" || fechafin == null || fechafin == "" || fechafin == null || programa == 0 || jur == 0 || muni == 0|| unidad == 0 || receta == 0 || serv == 0){
		alert("Faltan llenar algunos campos");
		return false;
	}
}

function validarMenu6(){
	var jur=document.getElementById("cmbJur").value;
	var muni=document.getElementById("cmbMunicipio").value;
	var unidad=document.getElementById("cmbUnidad").value;
	var fechaSem=document.getElementById("dateSem").value;
	var programa=document.getElementById("cmbPrograma").value;
	var receta=document.getElementById("cmbReceta").value;
	var serv=document.getElementById("cmbServicio").value;
	ocultaEtiquetas_menu6();
	if(jur == 0){
		document.getElementById("lblJur").style.visibility="";
	}
	if(muni == 0){
		document.getElementById("lblMun").style.visibility="";
	}
	if(unidad == 0){
		document.getElementById("lblUni").style.visibility="";
	}
	if(programa == 0){
		document.getElementById("lblPro").style.visibility="";
	}
	if(receta == 0){
		document.getElementById("lblRec").style.visibility="";
	}
	if(serv == 0){
		document.getElementById("lblSer").style.visibility="";
	}
	if(fechaSem == "" || fechaSem ==  null){
		document.getElementById("lblSem").style.visibility="";
	}
	if(fechaSem == "" || fechaSem == null || programa == 0 || jur == 0 || muni == 0|| unidad == 0 || receta == 0 || serv == 0){
		alert("Faltan llenar algunos campos");
		return false;
	}
}

function validarMenu7(){
	var jur=document.getElementById("cmbJur").value;
	var muni=document.getElementById("cmbMunicipio").value;
	var unidad=document.getElementById("cmbUnidad").value;
	var fechaini=document.getElementById("dateIni").value;
	var fechafin=document.getElementById("dateFin").value;
	var medico=document.getElementById("cmbMedico").value;
	ocultaEtiquetas();
	if(jur == 0){
		document.getElementById("lblJur").style.visibility="";
	}
	if(muni == 0){
		document.getElementById("lblMun").style.visibility="";
	}
	if(unidad == 0){
		document.getElementById("lblUni").style.visibility="";
	}
	if(medico == 0){
		document.getElementById("lblPro").style.visibility="";
	}
	if(fechaini == "" || fechaini ==  null){
		document.getElementById("lblFini").style.visibility="";
	}
	if(fechafin == "" || fechafin == null){
		document.getElementById("lblFfin").style.visibility="";
	}
	if( (fechafin != "" && fechafin != "") || (fechafin != null && fechafin != null)){
		if(!validaFechas()){
			alert("Fechas invalidas");
			return false;
		}
	}
	if(fechafin == "" || fechafin == null || fechafin == "" || fechafin == null || medico == 0 || jur == 0 || muni == 0|| unidad == 0 ){
		alert("Faltan llenar algunos campos");
		return false;
	}
}

function validarMenu8(){
	var jur=document.getElementById("cmbJur").value;
	var muni=document.getElementById("cmbMunicipio").value;
	var unidad=document.getElementById("cmbUnidad").value;
	var fechaini=document.getElementById("dateIni2").value;
	var fechafin=document.getElementById("dateFin2").value;
	var beneficiario=document.getElementById("cmbBeneficiario").value;
	ocultaEtiquetas();
	if(jur == 0){
		document.getElementById("lblJur").style.visibility="";
	}
	if(muni == 0){
		document.getElementById("lblMun").style.visibility="";
	}
	if(unidad == 0){
		document.getElementById("lblUni").style.visibility="";
	}
	if(beneficiario == ''){
		document.getElementById("lblPro").style.visibility="";
	}
	if(fechaini == "" || fechaini ==  null){
		document.getElementById("lblFini").style.visibility="";
	}
	if(fechafin == "" || fechafin == null){
		document.getElementById("lblFfin").style.visibility="";
	}
	if( (fechafin != "" && fechafin != "") || (fechafin != null && fechafin != null)){
		if(!validaFechas2()){
			alert("Fechas invalidas");
			return false;
		}
	}
	if(fechafin == "" || fechafin == null || fechafin == "" || fechafin == null || beneficiario == '' || jur == 0 || muni == 0|| unidad == 0 ){
		alert("Faltan llenar algunos campos");
		return false;
	}
}

function validarMenu10(){
	var jur=document.getElementById("cmbJur").value;
	var muni=document.getElementById("cmbMunicipio").value;
	var unidad=document.getElementById("cmbUnidad").value;
	var fechaini=document.getElementById("dateMon").value;
	ocultaEtiquetas_menu10();
	if(jur == 0){
		document.getElementById("lblJur").style.visibility="";
	}
	if(muni == 0){
		document.getElementById("lblMun").style.visibility="";
	}
	if(unidad == 0){
		document.getElementById("lblUni").style.visibility="";
	}
	if(fechaini == "" || fechaini ==  null){
		document.getElementById("lblMon").style.visibility="";
	}
	if(fechaini == "" || fechaini == null || jur == 0 || muni == 0|| unidad == 0 ){
		alert("Faltan llenar algunos campos");
		return false;
	}
}

function validarMenu11(){
	var jur=document.getElementById("cmbJur").value;
	var muni=document.getElementById("cmbMunicipio").value;
	var unidad=document.getElementById("cmbUnidad").value;
	var fechaini=document.getElementById("dateIni").value;
	var fechafin=document.getElementById("dateFin").value;
	ocultaEtiquetas_menu11();
	if(jur == 0){
		document.getElementById("lblJur").style.visibility="";
	}
	if(muni == 0){
		document.getElementById("lblMun").style.visibility="";
	}
	if(unidad == 0){
		document.getElementById("lblUni").style.visibility="";
	}
	if(fechaini == "" || fechaini ==  null){
		document.getElementById("lblFini").style.visibility="";
	}
	if(fechafin == "" || fechafin == null){
		document.getElementById("lblFini").style.visibility="";
	}
	if( (fechaini != "" && fechaini != "") || (fechafin != null && fechafin != null)){
		if(!validaFechas()){
			alert("Fechas invalidas");
			return false;
		}
	}
	if(fechaini == "" || fechaini == null || fechafin == "" || fechafin == null || jur == 0 || muni == 0|| unidad == 0 ){
		alert("Faltan llenar algunos campos");
		return false;
	}
}

function validarMenu12(){
	var jur=document.getElementById("cmbJur").value;
	var muni=document.getElementById("cmbMunicipio").value;
	var unidad=document.getElementById("cmbUnidad").value;
	var fechaini=document.getElementById("dateIni").value;
	var fechafin=document.getElementById("dateFin").value;
	ocultaEtiquetas_menu12();
	if(jur == 0){
		document.getElementById("lblJur").style.visibility="";
	}
	if(muni == 0){
		document.getElementById("lblMun").style.visibility="";
	}
	if(unidad == 0){
		document.getElementById("lblUni").style.visibility="";
	}
	if(fechaini == "" || fechaini ==  null){
		document.getElementById("lblFini").style.visibility="";
	}
	if(fechafin == "" || fechafin == null){
		document.getElementById("lblFfin").style.visibility="";
	}
	if( (fechaini != "" && fechaini != "") || (fechafin != null && fechafin != null)){
		if(!validaFechas()){
			alert("Fechas invalidas");
			return false;
		}
	}
	if(fechaini == "" || fechaini == null || fechafin == "" || fechafin == null || jur == 0 || muni == 0|| unidad == 0 ){
		alert("Faltan llenar algunos campos");
		return false;
	}
}

function validarMenu13(){
	var jur=document.getElementById("cmbJur").value;
	var muni=document.getElementById("cmbMunicipio").value;
	var unidad=document.getElementById("cmbUnidad").value;
	var fecha=document.getElementById("cmbFecha").value;;
	ocultaEtiquetas_menu13();
	if(jur == 0){
		document.getElementById("lblJur").style.visibility="";
	}
	if(muni == 0){
		document.getElementById("lblMun").style.visibility="";
	}
	if(unidad == 0){
		document.getElementById("lblUni").style.visibility="";
	}
	if(fecha == 0){
		document.getElementById("lblFecha").style.visibility="";
	}
	if(fecha == 0 || jur == 0 || muni == 0|| unidad == 0 ){
		alert("Faltan llenar algunos campos");
		return false;
	}
}

function validarMenu15(){
	var jur=document.getElementById("cmbJur_15").value;
	var muni=document.getElementById("cmbMunicipio_15").value;
	var unidad=document.getElementById("cmbUnidad_15").value;
	var medico=document.getElementById("cmbMedico_15").value;;
	ocultaEtiquetas_menu15();
	if(jur == 0){
		document.getElementById("lblJur_15").style.visibility="";
	}
	if(muni == 0){
		document.getElementById("lblMun_15").style.visibility="";
	}
	if(unidad == 0){
		document.getElementById("lblUni_15").style.visibility="";
	}
	if(medico == 0){
		document.getElementById("lblMec_15").style.visibility="";
	}
	if(medico == 0 || jur == 0 || muni == 0|| unidad == 0 ){
		alert("Faltan llenar algunos campos");
		return false;
	}
}

function validarMenu16(){
	var clave=document.getElementById("cmbClave").value;
	var jur=document.getElementById("cmbJur").value;
	var muni=document.getElementById("cmbMunicipio").value;
	var unidad=document.getElementById("cmbUnidad").value;
	var fechaini=document.getElementById("dateIni").value;
	var fechafin=document.getElementById("dateFin").value;
	ocultaEtiquetas_menu16();
	if(clave == 0){
		document.getElementById("lblClave").style.visibility="";
	}
	if(jur == 0){
		document.getElementById("lblJur").style.visibility="";
	}
	if(muni == 0){
		document.getElementById("lblMun").style.visibility="";
	}
	if(unidad == 0){
		document.getElementById("lblUni").style.visibility="";
	}
	if(fechaini == "" || fechaini ==  null){
		document.getElementById("lblFini").style.visibility="";
	}
	if(fechafin == "" || fechafin == null){
		document.getElementById("lblFfin").style.visibility="";
	}
	if( (fechafin != "" && fechafin != "") || (fechafin != null && fechafin != null)){
		if(!validaFechas()){
			alert("Fechas invalidas");
			return false;
		}
	}
	if(fechafin == "" || fechafin == null || fechafin == "" || fechafin == null || jur == 0 || muni == 0|| unidad == 0 || clave == 0){
		alert("Faltan llenar algunos campos");
		return false;
	}
}

function validarMenu17(){
	var jur=document.getElementById("cmbJur").value;
	var muni=document.getElementById("cmbMunicipio").value;
	var unidad=document.getElementById("cmbUnidad").value;
	var fechaini=document.getElementById("dateIni").value;
	var fechafin=document.getElementById("dateFin").value;
	var origen=document.getElementById("cmbOrigen").value;
	ocultaEtiquetas_menu17();
	if(jur == 0){
		document.getElementById("lblJur").style.visibility="";
	}
	if(muni == 0){
		document.getElementById("lblMun").style.visibility="";
	}
	if(unidad == 0){
		document.getElementById("lblUni").style.visibility="";
	}
	if(origen == 0){
		document.getElementById("lblOrigen").style.visibility="";
	}
	if(fechaini == "" || fechaini ==  null){
		document.getElementById("lblFini").style.visibility="";
	}
	if(fechafin == "" || fechafin == null){
		document.getElementById("lblFfin").style.visibility="";
	}
	if( (fechaini != "" && fechaini != "") || (fechafin != null && fechafin != null)){
		if(!validaFechas()){
			alert("Fechas invalidas");
			return false;
		}
	}
	if(fechaini == "" || fechaini == null || fechafin == "" || fechafin == null || jur == 0 || muni == 0|| unidad == 0 || origen == 0){
		alert("Faltan llenar algunos campos");
		return false;
	}
}

function validarMenu18(){
	var jur=document.getElementById("cmbJur").value;
	var muni=document.getElementById("cmbMunicipio").value;
	var unidad=document.getElementById("cmbUnidad").value;
	var fechaini=document.getElementById("dateIni").value;
	var fechafin=document.getElementById("dateFin").value;
	ocultaEtiquetas_menu18();
	if(jur == 0){
		document.getElementById("lblJur").style.visibility="";
	}
	if(muni == 0){
		document.getElementById("lblMun").style.visibility="";
	}
	if(unidad == 0){
		document.getElementById("lblUni").style.visibility="";
	}
	if(fechaini == "" || fechaini ==  null){
		document.getElementById("lblFini").style.visibility="";
	}
	if(fechafin == "" || fechafin == null){
		document.getElementById("lblFfin").style.visibility="";
	}
	if( (fechaini != "" && fechaini != "") || (fechafin != null && fechafin != null)){
		if(!validaFechas()){
			alert("Fechas invalidas");
			return false;
		}
	}
	if(fechaini == "" || fechaini == null || fechafin == "" || fechafin == null || jur == 0 || muni == 0|| unidad == 0 ){
		alert("Faltan llenar algunos campos");
		return false;
	}
}

function validarMenu21(){
	var combo= document.getElementById("cmbCaso").value;
	document.getElementById("caso").value='210';
	if(combo == 2){
		var jur=document.getElementById("cmbJur_21").value;
		document.getElementById("lblJur").style.visibility="hidden";
		if(jur == 0){
			document.getElementById("lblJur").style.visibility="";
			alert("Faltan llenar algunos campos");
			return false;
		}
	}else if(combo == 3){
		var jur=document.getElementById("cmbJur_21").value;
		var muni=document.getElementById("cmbMunicipio_21").value;
		var unidad=document.getElementById("cmbUnidad_21").value;
		var fechaini=document.getElementById("dateIni_21").value;
		var fechafin=document.getElementById("dateFin_21").value;
		ocultaEtiquetas_menu21();
		if(jur == 0){
			document.getElementById("lblJur").style.visibility="";
		}
		if(muni == 0){
			document.getElementById("lblMun").style.visibility="";
		}
		if(unidad == 0){
			document.getElementById("lblUni").style.visibility="";
		}
		if(fechaini == "" || fechaini ==  null){
			document.getElementById("lblFini").style.visibility="";
		}
		if(fechafin == "" || fechafin == null){
			document.getElementById("lblFfin").style.visibility="";
		}
		if( (fechaini != "" && fechaini != "") || (fechafin != null && fechafin != null)){
			if(!validaFechas3()){
				alert("Fechas invalidas");
				return false;
			}
		}
		if(fechaini == "" || fechaini == null || fechafin == "" || fechafin == null || jur == 0 || muni == 0|| unidad == 0 ){
			alert("Faltan llenar algunos campos");
			return false;
		}
	}
}

function validaFechas2(){
	var fechaini=document.getElementById("dateIni2").value;
	var fechafin=document.getElementById("dateFin2").value;
	//2012-01-01
	var i_ano = parseInt(fechaini.substring(0,4));
	var f_ano = parseInt(fechafin.substring(0,4));
	var i_mes = parseInt(fechaini.substring(5,7));
	var f_mes = parseInt(fechafin.substring(5,7));
	var i_dia = parseInt(fechaini.substring(8));
	var f_dia = parseInt(fechafin.substring(8));
	if(i_ano > f_ano){
		return false;
	}else if(i_ano == f_ano){
		if(f_mes > i_mes){
			return true;
		}else if(f_mes == i_mes){
			if(i_dia > f_dia){
				return false;
			}else{
				return true;
			}
		}else{
			return false;
		}
	}else{
		return true;
	}
}

function validaFechas(){
	var fechaini=document.getElementById("dateIni").value;
	var fechafin=document.getElementById("dateFin").value;
	//2012-01-01
	var i_ano = parseInt(fechaini.substring(0,4));
	var f_ano = parseInt(fechafin.substring(0,4));
	var i_mes = parseInt(fechaini.substring(5,7));
	var f_mes = parseInt(fechafin.substring(5,7));
	var i_dia = parseInt(fechaini.substring(8));
	var f_dia = parseInt(fechafin.substring(8));
	if(i_ano > f_ano){
		return false;
	}else if(i_ano == f_ano){
		if(f_mes > i_mes){
			return true;
		}else if(f_mes == i_mes){
			if(i_dia > f_dia){
				return false;
			}else{
				return true;
			}
		}else{
			return false;
		}
	}else{
		return true;
	}
}

function validaFechas3(){
	var fechaini=document.getElementById("dateIni_21").value;
	var fechafin=document.getElementById("dateFin_21").value;
	//2012-01-01
	var i_ano = parseInt(fechaini.substring(0,4));
	var f_ano = parseInt(fechafin.substring(0,4));
	var i_mes = parseInt(fechaini.substring(5,7));
	var f_mes = parseInt(fechafin.substring(5,7));
	var i_dia = parseInt(fechaini.substring(8));
	var f_dia = parseInt(fechafin.substring(8));
	if(i_ano > f_ano){
		return false;
	}else if(i_ano == f_ano){
		if(f_mes > i_mes){
			return true;
		}else if(f_mes == i_mes){
			if(i_dia > f_dia){
				return false;
			}else{
				return true;
			}
		}else{
			return false;
		}
	}else{
		return true;
	}
}

function ocultaEtiquetas(){
	document.getElementById("lblJur").style.visibility="hidden";
	document.getElementById("lblMun").style.visibility="hidden";
	document.getElementById("lblUni").style.visibility="hidden";
	document.getElementById("lblFini").style.visibility="hidden";
	document.getElementById("lblFfin").style.visibility="hidden";
	document.getElementById("lblPro").style.visibility="hidden";
}

function ocultaEtiquetas_menu3(){
	document.getElementById("lblJur").style.visibility="hidden";
	document.getElementById("lblMun").style.visibility="hidden";
	document.getElementById("lblUni").style.visibility="hidden";
	document.getElementById("lblFini").style.visibility="hidden";
	document.getElementById("dateIni").style.visibility="hidden";
	document.getElementById("dateFin").style.visibility="hidden";
}

function ocultaEtiquetas_menu4(){
	document.getElementById("lblJur").style.visibility="hidden";
	document.getElementById("lblMun").style.visibility="hidden";
	document.getElementById("lblUni").style.visibility="hidden";
	document.getElementById("lblFini").style.visibility="hidden";
	document.getElementById("dateIni").style.visibility="hidden";
	document.getElementById("dateFin").style.visibility="hidden";
	document.getElementById("lblPro").style.visibility="hidden";
}

function ocultaEtiquetas_menu5(){
	document.getElementById("lblJur").style.visibility="hidden";
	document.getElementById("lblMun").style.visibility="hidden";
	document.getElementById("lblUni").style.visibility="hidden";
	document.getElementById("lblFini").style.visibility="hidden";
	document.getElementById("lblFfin").style.visibility="hidden";
	document.getElementById("lblPro").style.visibility="hidden";
	document.getElementById("lblSer").style.visibility="hidden";
	document.getElementById("lblRec").style.visibility="hidden";
}

function ocultaEtiquetas_menu6(){
	document.getElementById("lblJur").style.visibility="hidden";
	document.getElementById("lblMun").style.visibility="hidden";
	document.getElementById("lblUni").style.visibility="hidden";
	document.getElementById("lblSem").style.visibility="hidden";
	document.getElementById("lblPro").style.visibility="hidden";
	document.getElementById("lblRec").style.visibility="hidden";
	document.getElementById("lblSer").style.visibility="hidden";
}

function ocultaEtiquetas_menu10(){
	document.getElementById("lblJur").style.visibility="hidden";
	document.getElementById("lblMun").style.visibility="hidden";
	document.getElementById("lblUni").style.visibility="hidden";
	document.getElementById("lblMon").style.visibility="hidden";
}

function ocultaEtiquetas_menu11(){
	document.getElementById("lblJur").style.visibility="hidden";
	document.getElementById("lblMun").style.visibility="hidden";
	document.getElementById("lblUni").style.visibility="hidden";
	document.getElementById("lblFini").style.visibility="hidden";
	document.getElementById("dateIni").style.visibility="hidden";
	document.getElementById("dateFin").style.visibility="hidden";
}

function ocultaEtiquetas_menu12(){
	document.getElementById("lblJur").style.visibility="hidden";
	document.getElementById("lblMun").style.visibility="hidden";
	document.getElementById("lblUni").style.visibility="hidden";
	document.getElementById("lblFini").style.visibility="hidden";
	document.getElementById("lblFfin").style.visibility="hidden";
}

function ocultaEtiquetas_menu13(){
	document.getElementById("lblJur").style.visibility="hidden";
	document.getElementById("lblMun").style.visibility="hidden";
	document.getElementById("lblUni").style.visibility="hidden";
	document.getElementById("lblFecha").style.visibility="hidden";
	document.getElementById("dateIni").style.visibility="hidden";
	document.getElementById("dateFin").style.visibility="hidden";
}

function ocultaEtiquetas_menu15(){
	document.getElementById("lblJur_15").style.visibility="hidden";
	document.getElementById("lblMun_15").style.visibility="hidden";
	document.getElementById("lblUni_15").style.visibility="hidden";
	document.getElementById("lblMec_15").style.visibility="hidden";
}

function ocultaEtiquetas_menu16(){
	document.getElementById("lblJur").style.visibility="hidden";
	document.getElementById("lblMun").style.visibility="hidden";
	document.getElementById("lblUni").style.visibility="hidden";
	document.getElementById("lblClave").style.visibility="hidden";
	document.getElementById("lblFini").style.visibility="hidden";
	document.getElementById("lblFfin").style.visibility="hidden";
}

function mostrarElementos_menu17(){
	ocultaEtiquetas_menu17();
	document.getElementById("lblJur2").style.visibility="";
	document.getElementById("cmbJur").style.visibility="";
	document.getElementById("lblOrigen2").style.visibility="";
	document.getElementById("cmbOrigen").style.visibility="";
	document.getElementById("lblMun2").style.visibility="";
	document.getElementById("cmbMunicipio").style.visibility="";
	document.getElementById("lblUni2").style.visibility="";
	document.getElementById("cmbUnidad").style.visibility="";
	document.getElementById("dateIni").style.visibility="";
	document.getElementById("dateFin").style.visibility="";
	document.getElementById("lblFechas").style.visibility="";
	document.getElementById("cmbFecha").style.visibility="";
	document.getElementById("btnEnviar").style.visibility="";
}

function ocultaElementos_menu17(){
	document.getElementById("lblJur2").style.visibility="hidden";
	document.getElementById("lblJur").style.visibility="hidden";
	document.getElementById("lblOrigen2").style.visibility="hidden";
	document.getElementById("lblOrigen").style.visibility="hidden";
	document.getElementById("cmbJur").style.visibility="hidden";
	document.getElementById("lblMun2").style.visibility="hidden";
	document.getElementById("lblMun").style.visibility="hidden";
	document.getElementById("cmbMunicipio").style.visibility="hidden";
	document.getElementById("lblUni2").style.visibility="hidden";
	document.getElementById("lblUni").style.visibility="hidden";
	document.getElementById("cmbUnidad").style.visibility="hidden";
	document.getElementById("dateIni").style.visibility="hidden";
	document.getElementById("lblFini").style.visibility="hidden";
	document.getElementById("lblFfin").style.visibility="hidden";
	document.getElementById("dateFin").style.visibility="hidden";
	document.getElementById("lblFechas").style.visibility="hidden";
	document.getElementById("cmbFecha").style.visibility="hidden";
	document.getElementById("cmbOrigen").style.visibility="hidden";
	document.getElementById("btnEnviar").style.visibility="hidden";
}
function ocultaEtiquetas_menu17(){
	document.getElementById("lblJur").style.visibility="hidden";
	document.getElementById("lblMun").style.visibility="hidden";
	document.getElementById("lblUni").style.visibility="hidden";
	document.getElementById("lblFini").style.visibility="hidden";
	document.getElementById("lblFfin").style.visibility="hidden";
	document.getElementById("lblOrigen").style.visibility="hidden";
}

function ocultaEtiquetas_menu18(){
	document.getElementById("lblJur").style.visibility="hidden";
	document.getElementById("lblMun").style.visibility="hidden";
	document.getElementById("lblUni").style.visibility="hidden";
	document.getElementById("lblFini").style.visibility="hidden";
	document.getElementById("lblFfin").style.visibility="hidden";
}

function mostrarElementos_menu21(){
	var caso=document.getElementById("cmbCaso").value;
	if(caso == 0){
		ocultaElementos_menu21();
	}else if(caso == 1){
		ocultaElementos_menu21();
		document.getElementById("btnGenerar").style.visibility="";
	}else if(caso == 2){
		ocultaElementos_menu21();
		document.getElementById("lblJur2").style.visibility="";
		document.getElementById("cmbJur_21").style.visibility="";
		document.getElementById("btnGenerar").style.visibility="";
		
		
	}else if(caso == 3){
		document.getElementById("lblJur").style.visibility="hidden";
		document.getElementById("lblJur2").style.visibility="";
		document.getElementById("cmbJur_21").style.visibility="";
		document.getElementById("lblMun2").style.visibility="";
		document.getElementById("cmbMunicipio_21").style.visibility="";
		document.getElementById("lblUni2").style.visibility="";
		document.getElementById("cmbUnidad_21").style.visibility="";
		document.getElementById("dateIni_21").style.visibility="";
		document.getElementById("dateFin_21").style.visibility="";
		document.getElementById("lblFechas").style.visibility="";
		document.getElementById("cmbFecha_21").style.visibility="";
		document.getElementById("btnGenerar").style.visibility="";
	}
}

function ocultaElementos_menu21(){
	document.getElementById("lblJur2").style.visibility="hidden";
	document.getElementById("lblJur").style.visibility="hidden";
	document.getElementById("cmbJur_21").style.visibility="hidden";
	document.getElementById("lblMun2").style.visibility="hidden";
	document.getElementById("lblMun").style.visibility="hidden";
	document.getElementById("cmbMunicipio_21").style.visibility="hidden";
	document.getElementById("lblUni2").style.visibility="hidden";
	document.getElementById("lblUni").style.visibility="hidden";
	document.getElementById("cmbUnidad_21").style.visibility="hidden";
	document.getElementById("dateIni_21").style.visibility="hidden";
	document.getElementById("lblFini").style.visibility="hidden";
	document.getElementById("lblFfin").style.visibility="hidden";
	document.getElementById("dateFin_21").style.visibility="hidden";
	document.getElementById("lblFechas").style.visibility="hidden";
	document.getElementById("cmbFecha_21").style.visibility="hidden";
	document.getElementById("btnGenerar").style.visibility="hidden";
}

function ocultaEtiquetas_menu21(){
	document.getElementById("lblJur").style.visibility="hidden";
	document.getElementById("lblMun").style.visibility="hidden";
	document.getElementById("lblUni").style.visibility="hidden";
	document.getElementById("lblFini").style.visibility="hidden";
	document.getElementById("lblFfin").style.visibility="hidden";
}