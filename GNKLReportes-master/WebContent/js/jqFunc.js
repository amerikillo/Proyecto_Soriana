function ocultarTotales_reporte5(){
	$("#tblTotales").hide();
};

function folio_receta(){
    $('#folio').val($('#txtf_foliore').val());
};

$(document).ready(function(){
  $("#btnVer").click(function(){
	if($("#btnVer").val() == "Ver Totales"){
		$("#btnVer").val("Ocultar Totales");
		$("#tblTotales").show();
	}else{
		$("#btnVer").val("Ver Totales");
		$("#tblTotales").hide();
	}
  });
});
//menu 17
$(document).ready(function(){
  $("#btnRecetaFar").click(function(){
	$("#casoReceta").val('1');
  });
});

$(document).ready(function(){
  $("#btnRecetaCol").click(function(){
	$("#casoReceta").val('2');
  });
});

$(document).ready(function(){
  $("#cmbClave").change(function(){
	$("#combo1").val($("#cmbClave").val());
	$("#caso").val('2000');
	$("#casosql").val('7');
  });
});

$(document).ready(function(){
	$("#cmbClave").change(function(){
		var combo1 = $("#combo1").val();
		var caso = $("#caso").val();
		var casosql = $("#casosql").val();
		$.ajax({
			data: {combo1:combo1,caso:caso,casosql:casosql},
			dataType: 'json',
			url: '../ServletControl',
			type: 'POST',
			success: function(data){
				//llenar datos
				$("#txtId").val('');
				$("#txtLab").val('');
				$("#txtDes").val('');
				$("#txtPres").val('');
				$.each(data.Dato,function(indice,valor) {
					$("#txtId").val(valor.clave);
					$("#txtLab").val(valor.lab);
					$("#txtDes").val(valor.des);
					$("#txtPres").val(valor.pres);
				});
			},
			error: function(){
				alert('error');
				$("#txtId").val('');
				$("#txtLab").val('');
				$("#txtDes").val('');
				$("#txtPres").val('');
			}
		});
	});
});

$(document).ready(function(){
  $("#cmbJur").change(function(){
    $("#combo1").val($("#cmbJur").val());
	$("#caso").val('2000');
	$("#casosql").val('2');
	$("#cmbUnidad").html("");
	$("#cmbUnidad").append("<option value= 0 >-- Seleccione --</option>");
  });
});

$(document).ready(function(){
	$("#cmbJur").change(function(){
		var cmbJur = $("#combo1").val();
		var caso = $("#caso").val();
		var casosql = $("#casosql").val();
		$.ajax({
			data: {combo1:cmbJur,caso:caso,casosql:casosql},
			dataType: 'json',
			url: '../ServletControl',
			type: 'POST',
			success: function(data){
				//llenar el combo
				$("#cmbMunicipio").html("");
				$("#cmbMunicipio").append("<option value= 0 >-- Seleccione --</option>");
				$.each(data.Dato,function(indice,valor) {
					$("#cmbMunicipio").append("<option value='"+valor.id+"'>"+valor.nombre+"</option>");
				});
			},
			error: function(){
				$("#cmbMunicipio").html("");
				$("#cmbMunicipio").append("<option value= 0 >-- Seleccione --</option>");
			}
		});
	});
});

$(document).ready(function(){
  $("#cmbMunicipio").change(function(){
    $("#combo1").val($("#cmbMunicipio").val());
	$("#caso").val('2000');
	$("#casosql").val('3');
  });
});

$(document).ready(function(){
	$("#cmbMunicipio").change(function(){
		var cmbMunicipio = $("#combo1").val();
		var caso = $("#caso").val();
		var casosql = $("#casosql").val();
		$.ajax({
			data: {combo1:cmbMunicipio,caso:caso,casosql:casosql},
			dataType: 'json',
			url: '../ServletControl',
			type: 'POST',
			success: function(data){
				//llenar el combo
				$("#cmbUnidad").html("");
				$("#cmbUnidad").append("<option value= 0 >-- Seleccione --</option>");
				$.each(data.Dato,function(indice,valor) {
					$("#cmbUnidad").append("<option value='"+valor.id+"'>"+valor.nombre+"</option>");
				});
			},
			error: function(){
				$("#cmbUnidad").html("");
				$("#cmbUnidad").append("<option value= 0 >-- Seleccione --</option>");
			}
		});
	});
});

$(document).ready(function(){
  $("#cmbUnidad").change(function(){
    $("#combo1").val($("#cmbUnidad").val());
	$("#caso").val('2000');
	$("#casosql").val('4');
  });
});

$(document).ready(function(){
	$("#cmbUnidad").change(function(){
		var cmbUnidad = $("#combo1").val();
		var caso = $("#caso").val();
		var casosql = $("#casosql").val();
		$.ajax({
			data: {combo1:cmbUnidad,caso:caso,casosql:casosql},
			dataType: 'json',
			url: '../ServletControl',
			type: 'POST',
			success: function(data){
				//llenar el combo
				$("#cmbServicio").html("");
				$("#cmbServicio").append("<option value= 0 >-- Seleccione --</option>");
				$.each(data.Dato,function(indice,valor) {
					$("#cmbServicio").append("<option value='"+valor.id+"'>"+valor.nombre+"</option>");
				});
				$("#cmbServicio").append("<option value= 200 >Todos</option>");
			},
			error: function(){
				$("#cmbServicio").html("");
				$("#cmbServicio").append("<option value= 0 >-- Seleccione --</option>");
			}
		});
	});
});

$(document).ready(function(){
  $("#dateIni").change(function(){
    $("#fechaI").val($("#dateIni").val());
	$("#caso").val('2000');
	$("#casosql").val('5');
  });
});

$(document).ready(function(){
  $("#dateFin").change(function(){
    $("#fechaF").val($("#dateFin").val());
	$("#caso").val('2000');
	$("#casosql").val('5');
  });
});

$(document).ready(function(){
	$("#dateIni").change(function(){
		var fechaI = $("#fechaI").val();
		var fechaF = $("#fechaF").val();
		var cmbUnidad = $("#cmbUnidad").val();
		var caso = $("#caso").val();
		var casosql = $("#casosql").val();
		if(fechaI != "" && fechaF != ""){
			$.ajax({
				data: {fechaI:fechaI,fechaF:fechaF,caso:caso,casosql:casosql,cmbUnidad:cmbUnidad},
				dataType: 'json',
				url: '../ServletControl',
				type: 'POST',
				success: function(data){
					//llenar el combo
					$("#cmbMedico").html("");
					$("#cmbMedico").append("<option value= 0 >-- Seleccione --</option>");
					$.each(data.Dato,function(indice,valor) {
						$("#cmbMedico").append("<option value='"+valor.id+"'>"+valor.nombre+"</option>");
					});
					$("#cmbMedico").append("<option value= 9999999 >TODOS</option>");
				},
				error: function(){
					$("#cmbMedico").html("");
					$("#cmbMedico").append("<option value= 0 >-- Seleccione --</option>");
				}
			});
		}
	});
});

$(document).ready(function(){
	$("#dateFin").change(function(){
		var fechaI = $("#fechaI").val();
		var fechaF = $("#fechaF").val();
		var cmbUnidad = $("#cmbUnidad").val();
		var caso = $("#caso").val();
		var casosql = $("#casosql").val();
		if(fechaI != "" && fechaF != ""){
			$.ajax({
				data: {fechaI:fechaI,fechaF:fechaF,caso:caso,casosql:casosql,cmbUnidad:cmbUnidad},
				dataType: 'json',
				url: '../ServletControl',
				type: 'POST',
				success: function(data){
					//llenar el combo
					$("#cmbMedico").html("");
					$("#cmbMedico").append("<option value= 0 >-- Seleccione --</option>");
					$.each(data.Dato,function(indice,valor) {
						$("#cmbMedico").append("<option value='"+valor.id+"'>"+valor.nombre+"</option>");
					});
					$("#cmbMedico").append("<option value= 9999999 >TODOS</option>");
				},
				error: function(){
					$("#cmbMedico").html("");
					$("#cmbMedico").append("<option value= 0 >-- Seleccione --</option>");
				}
			});
		}
	});
});

$(document).ready(function(){
  $("#cmbFecha").change(function(){
    $("#valorFecha").val($("#cmbFecha").val());
  });
});

$(document).ready(function(){
  $("#cmbFecha").change(function(){
    if($("#valorFecha").val() == 1){
		$("#dateIni").val("2012-01-01");
		$("#dateFin").val("2012-01-31");
	}else if($("#valorFecha").val() == 2){
		$("#dateIni").val("2012-02-01");
		$("#dateFin").val("2012-02-29");
	}else if($("#valorFecha").val() == 3){
		$("#dateIni").val("2012-03-01");
		$("#dateFin").val("2012-03-31");
	}else if($("#valorFecha").val() == 4){
		$("#dateIni").val("2012-04-01");
		$("#dateFin").val("2012-04-30");
	}else if($("#valorFecha").val() == 5){
		$("#dateIni").val("2012-05-01");
		$("#dateFin").val("2012-05-31");
	}else if($("#valorFecha").val() == 6){
		$("#dateIni").val("2012-06-01");
		$("#dateFin").val("2012-06-30");
	}else if($("#valorFecha").val() == 7){
		$("#dateIni").val("2012-07-01");
		$("#dateFin").val("2012-07-31");
	}else if($("#valorFecha").val() == 8){
		$("#dateIni").val("2012-08-01");
		$("#dateFin").val("2012-08-31");
	}else if($("#valorFecha").val() == 9){
		$("#dateIni").val("2012-09-01");
		$("#dateFin").val("2012-09-30");
	}else if($("#valorFecha").val() == 10){
		$("#dateIni").val("2012-10-01");
		$("#dateFin").val("2012-10-31");
	}else if($("#valorFecha").val() == 11){
		$("#dateIni").val("2012-11-01");
		$("#dateFin").val("2012-11-30");
	}else if($("#valorFecha").val() == 12){
		$("#dateIni").val("2012-12-01");
		$("#dateFin").val("2012-12-31");
	}else if($("#valorFecha").val() == 13){
		$("#dateIni").val("2012-01-01");
		$("#dateFin").val("2012-12-31");
	}
  });
});

$(document).ready(function(){
  $("#cmbFecha_21").change(function(){
    $("#valorFecha").val($("#cmbFecha_21").val());
  });
});

$(document).ready(function(){
  $("#cmbFecha_21").change(function(){
    if($("#valorFecha").val() == 1){
		$("#dateIni_21").val("2012-01-01");
		$("#dateFin_21").val("2012-01-31");
	}else if($("#valorFecha").val() == 2){
		$("#dateIni_21").val("2012-02-01");
		$("#dateFin_21").val("2012-02-29");
	}else if($("#valorFecha").val() == 3){
		$("#dateIni_21").val("2012-03-01");
		$("#dateFin_21").val("2012-03-31");
	}else if($("#valorFecha").val() == 4){
		$("#dateIni_21").val("2012-04-01");
		$("#dateFin_21").val("2012-04-30");
	}else if($("#valorFecha").val() == 5){
		$("#dateIni_21").val("2012-05-01");
		$("#dateFin_21").val("2012-05-31");
	}else if($("#valorFecha").val() == 6){
		$("#dateIni_21").val("2012-06-01");
		$("#dateFin_21").val("2012-06-30");
	}else if($("#valorFecha").val() == 7){
		$("#dateIni_21").val("2012-07-01");
		$("#dateFin_21").val("2012-07-31");
	}else if($("#valorFecha").val() == 8){
		$("#dateIni_21").val("2012-08-01");
		$("#dateFin_21").val("2012-08-31");
	}else if($("#valorFecha").val() == 9){
		$("#dateIni_21").val("2012-09-01");
		$("#dateFin_21").val("2012-09-30");
	}else if($("#valorFecha").val() == 10){
		$("#dateIni_21").val("2012-10-01");
		$("#dateFin_21").val("2012-10-31");
	}else if($("#valorFecha").val() == 11){
		$("#dateIni_21").val("2012-11-01");
		$("#dateFin_21").val("2012-11-30");
	}else if($("#valorFecha").val() == 12){
		$("#dateIni_21").val("2012-12-01");
		$("#dateFin_21").val("2012-12-31");
	}else if($("#valorFecha").val() == 13){
		$("#dateIni_21").val("2012-01-01");
		$("#dateFin_21").val("2012-12-31");
	}
  });
});

$(document).ready(function(){
  $("#cmbFecha").change(function(){
    if($("#valorFecha").val() == 1){
		$("#txtMes").val("Enero");
	}else if($("#valorFecha").val() == 2){
		$("#txtMes").val("Febrero");
	}else if($("#valorFecha").val() == 3){
		$("#txtMes").val("Marzo");
	}else if($("#valorFecha").val() == 4){
		$("#txtMes").val("Abril");
	}else if($("#valorFecha").val() == 5){
		$("#txtMes").val("Mayo");
	}else if($("#valorFecha").val() == 6){
		$("#txtMes").val("Junio");
	}else if($("#valorFecha").val() == 7){
		$("#txtMes").val("Julio");
	}else if($("#valorFecha").val() == 8){
		$("#txtMes").val("Agosto");
	}else if($("#valorFecha").val() == 9){
		$("#txtMes").val("Septiembre");
	}else if($("#valorFecha").val() == 10){
		$("#txtMes").val("Octubre");
	}else if($("#valorFecha").val() == 11){
		$("#txtMes").val("Noviembre");
	}else if($("#valorFecha").val() == 12){
		$("#txtMes").val("Diciembre");
	}else if($("#valorFecha").val() == 13){
		$("#txtMes").val("Enero - Diciembre");
	}
  });
});

$(document).ready(function(){
  $("#cmbFecha").change(function(){
	$("#fechaF").val($("#dateFin").val());
	$("#fechaI").val($("#dateIni").val());
	$("#caso").val('2000');
	$("#casosql").val('5');
  });
});

$(document).ready(function(){
	$("#cmbFecha").change(function(){
		var fechaI = $("#fechaI").val();
		var fechaF = $("#fechaF").val();
		var cmbUnidad = $("#cmbUnidad").val();
		var caso = $("#caso").val();
		var casosql = $("#casosql").val();
		if(fechaI != "" && fechaF != ""){
			$.ajax({
				data: {fechaI:fechaI,fechaF:fechaF,caso:caso,casosql:casosql,cmbUnidad:cmbUnidad},
				dataType: 'json',
				url: '../ServletControl',
				type: 'POST',
				success: function(data){
					//llenar el combo
					$("#cmbMedico").html("");
					$("#cmbMedico").append("<option value= 0 >-- Seleccione --</option>");
					$.each(data.Dato,function(indice,valor) {
						$("#cmbMedico").append("<option value='"+valor.id+"'>"+valor.nombre+"</option>");
					});
					$("#cmbMedico").append("<option value= 9999999 >TODOS</option>");
				},
				error: function(){
					$("#cmbMedico").html("");
					$("#cmbMedico").append("<option value= 0 >-- Seleccione --</option>");
				}
			});
		}
	});
});

$(document).ready(function(){
  $("#cmbFecha2").change(function(){
    $("#valorFecha").val($("#cmbFecha2").val());
  });
});

$(document).ready(function(){
  $("#cmbFecha2").change(function(){
    if($("#valorFecha").val() == 1){
		$("#dateIni2").val("2012-01-01");
		$("#dateFin2").val("2012-01-31");
	}else if($("#valorFecha").val() == 2){
		$("#dateIni2").val("2012-02-01");
		$("#dateFin2").val("2012-02-29");
	}else if($("#valorFecha").val() == 3){
		$("#dateIni2").val("2012-03-01");
		$("#dateFin2").val("2012-03-31");
	}else if($("#valorFecha").val() == 4){
		$("#dateIni2").val("2012-04-01");
		$("#dateFin2").val("2012-04-30");
	}else if($("#valorFecha").val() == 5){
		$("#dateIni2").val("2012-05-01");
		$("#dateFin2").val("2012-05-31");
	}else if($("#valorFecha").val() == 6){
		$("#dateIni2").val("2012-06-01");
		$("#dateFin2").val("2012-06-30");
	}else if($("#valorFecha").val() == 7){
		$("#dateIni2").val("2012-07-01");
		$("#dateFin2").val("2012-07-31");
	}else if($("#valorFecha").val() == 8){
		$("#dateIni2").val("2012-08-01");
		$("#dateFin2").val("2012-08-31");
	}else if($("#valorFecha").val() == 9){
		$("#dateIni2").val("2012-09-01");
		$("#dateFin2").val("2012-09-30");
	}else if($("#valorFecha").val() == 10){
		$("#dateIni2").val("2012-10-01");
		$("#dateFin2").val("2012-10-31");
	}else if($("#valorFecha").val() == 11){
		$("#dateIni2").val("2012-11-01");
		$("#dateFin2").val("2012-11-30");
	}else if($("#valorFecha").val() == 12){
		$("#dateIni2").val("2012-12-01");
		$("#dateFin2").val("2012-12-31");
	}else if($("#valorFecha").val() == 13){
		$("#dateIni2").val("2012-01-01");
		$("#dateFin2").val("2012-12-31");
	}
  });
});

$(document).ready(function(){
  $("#cmbFecha2").change(function(){
	$("#fechaF").val($("#dateFin2").val());
	$("#fechaI").val($("#dateIni2").val());
	$("#caso").val('2000');
	$("#casosql").val('6');
  });
});

$(document).ready(function(){
	$("#cmbFecha2").change(function(){
		var fechaI = $("#fechaI").val();
		var fechaF = $("#fechaF").val();
		var cmbUnidad = $("#cmbUnidad").val();
		var caso = $("#caso").val();
		var casosql = $("#casosql").val();
		if(fechaI != "" && fechaF != ""){
			$.ajax({
				data: {fechaI:fechaI,fechaF:fechaF,caso:caso,casosql:casosql,cmbUnidad:cmbUnidad},
				dataType: 'json',
				url: '../ServletControl',
				type: 'POST',
				success: function(data){
					//llenar el combo
					$("#cmbBeneficiario").html("");
					$("#cmbBeneficiario").append("<option value= '' >-- Seleccione --</option>");
					$.each(data.Dato,function(indice,valor) {
						$("#cmbBeneficiario").append("<option value='"+valor.id+"'>"+valor.nombre+"</option>");
					});
					$("#cmbBeneficiario").append("<option value= 0 >TODOS</option>");
				},
				error: function(){
					$("#cmbBeneficiario").html("");
					$("#cmbBeneficiario").append("<option value= '' >-- Seleccione --</option>");
				}
			});
		}
	});
});

$(document).ready(function(){
  $("#dateIni2").change(function(){
    $("#fechaI").val($("#dateIni2").val());
	$("#caso").val('2000');
	$("#casosql").val('6');
  });
});

$(document).ready(function(){
  $("#dateFin2").change(function(){
    $("#fechaF").val($("#dateFin2").val());
	$("#caso").val('2000');
	$("#casosql").val('6');
  });
});

$(document).ready(function(){
	$("#dateIni2").change(function(){
		var fechaI = $("#fechaI").val();
		var fechaF = $("#fechaF").val();
		var cmbUnidad = $("#cmbUnidad").val();
		var caso = $("#caso").val();
		var casosql = $("#casosql").val();
		if(fechaI != "" && fechaF != ""){
			$.ajax({
				data: {fechaI:fechaI,fechaF:fechaF,caso:caso,casosql:casosql,cmbUnidad:cmbUnidad},
				dataType: 'json',
				url: '../ServletControl',
				type: 'POST',
				success: function(data){
					//llenar el combo
					$("#cmbBeneficiario").html("");
					$("#cmbBeneficiario").append("<option value= '' >-- Seleccione --</option>");
					$.each(data.Dato,function(indice,valor) {
						$("#cmbBeneficiario").append("<option value='"+valor.id+"'>"+valor.nombre+"</option>");
					});
					$("#cmbBeneficiario").append("<option value= 0 >TODOS</option>");
					
				},
				error: function(){
					$("#cmbBeneficiario").html("");
					$("#cmbBeneficiario").append("<option value= '' >-- Seleccione --</option>");
				}
			});
		}
	});
});

$(document).ready(function(){
	$("#dateFin2").change(function(){
		var fechaI = $("#fechaI").val();
		var fechaF = $("#fechaF").val();
		var cmbUnidad = $("#cmbUnidad").val();
		var caso = $("#caso").val();
		var casosql = $("#casosql").val();
		if(fechaI != "" && fechaF != ""){
			$.ajax({
				data: {fechaI:fechaI,fechaF:fechaF,caso:caso,casosql:casosql,cmbUnidad:cmbUnidad},
				dataType: 'json',
				url: '../ServletControl',
				type: 'POST',
				success: function(data){
					//llenar el combo
					$("#cmbBeneficiario").html("");
					$("#cmbBeneficiario").append("<option value= '' >-- Seleccione --</option>");
					$.each(data.Dato,function(indice,valor) {
						$("#cmbBeneficiario").append("<option value='"+valor.id+"'>"+valor.nombre+"</option>");
					});
					$("#cmbBeneficiario").append("<option value= 0 >TODOS</option>");
				},
				error: function(){
					$("#cmbBeneficiario").html("");
					$("#cmbBeneficiario").append("<option value= '' >-- Seleccione --</option>");
				}
			});
		}
	});
});
//Menu 15
$(document).ready(function(){
  $("#cmbUnidad_15").change(function(){
	$("#caso").val('3000');
	$("#casosql").val('8');
	$("#unidad").val($("#cmbUnidad_15").val());
  });
});

$(document).ready(function(){
	$("#cmbUnidad_15").change(function(){
		var unidad = $("#unidad").val();
		var caso = $("#caso").val();
		var casosql = $("#casosql").val();
		$.ajax({
			data: {caso:caso,casosql:casosql,unidad:unidad},
			dataType: 'json',
			url: '../ServletControl',
			type: 'POST',
			success: function(data){
				//llenar el combo
				$("#cmbMedico_15").html("");
				$("#cmbMedico_15").append("<option value= '' >-- Seleccione --</option>");
				$.each(data.Dato,function(indice,valor) {
					$("#cmbMedico_15").append("<option value='"+valor.id+"'>"+valor.nombre+"</option>");
				});
			},
			error: function(){
				$("#cmbMedico_15").html("");
				$("#cmbMedico_15").append("<option value= '' >-- Seleccione --</option>");
			}
		});
	});
});

$(document).ready(function(){
  $("#cmbJur_15").change(function(){
    $("#combo1").val($("#cmbJur_15").val());
	$("#caso").val('2000');
	$("#casosql").val('2');
	$("#cmbUnidad_15").html("");
	$("#cmbUnidad_15").append("<option value= 0 >-- Seleccione --</option>");
  });
});

$(document).ready(function(){
	$("#cmbJur_15").change(function(){
		var cmbJur = $("#combo1").val();
		var caso = $("#caso").val();
		var casosql = $("#casosql").val();
		$.ajax({
			data: {combo1:cmbJur,caso:caso,casosql:casosql},
			dataType: 'json',
			url: '../ServletControl',
			type: 'POST',
			success: function(data){
				//llenar el combo
				$("#cmbMunicipio_15").html("");
				$("#cmbMunicipio_15").append("<option value= 0 >-- Seleccione --</option>");
				$.each(data.Dato,function(indice,valor) {
					$("#cmbMunicipio_15").append("<option value='"+valor.id+"'>"+valor.nombre+"</option>");
				});
			},
			error: function(){
				$("#cmbMunicipio_15").html("");
				$("#cmbMunicipio_15").append("<option value= 0 >-- Seleccione --</option>");
			}
		});
	});
});

$(document).ready(function(){
  $("#cmbMunicipio_15").change(function(){
    $("#combo1").val($("#cmbMunicipio_15").val());
	$("#caso").val('2000');
	$("#casosql").val('3');
  });
});

$(document).ready(function(){
	$("#cmbMunicipio_15").change(function(){
		var cmbMunicipio = $("#combo1").val();
		var caso = $("#caso").val();
		var casosql = $("#casosql").val();
		$.ajax({
			data: {combo1:cmbMunicipio,caso:caso,casosql:casosql},
			dataType: 'json',
			url: '../ServletControl',
			type: 'POST',
			success: function(data){
				//llenar el combo
				$("#cmbUnidad_15").html("");
				$("#cmbUnidad_15").append("<option value= 0 >-- Seleccione --</option>");
				$.each(data.Dato,function(indice,valor) {
					$("#cmbUnidad_15").append("<option value='"+valor.id+"'>"+valor.nombre+"</option>");
				});
			},
			error: function(){
				$("#cmbUnidad_15").html("");
				$("#cmbUnidad_15").append("<option value= 0 >-- Seleccione --</option>");
			}
		});
	});
});

///////////////////////////////////////Menu21
$(document).ready(function(){
  $("#cmbCaso").change(function(){
	$("#caso").val('3000');
	$("#casosql").val('9');
  });
});

$(document).ready(function(){
	$("#cmbCaso").change(function(){
		var caso = $("#caso").val();
		var casosql = $("#casosql").val();
		$.ajax({
			data: {caso:caso,casosql:casosql},
			dataType: 'json',
			url: '../ServletControl',
			type: 'POST',
			success: function(data){
				//llenar el combo
				$("#cmbJur_21").html("");
				$("#cmbJur_21").append("<option value= '' >-- Seleccione --</option>");
				$.each(data.Dato,function(indice,valor) {
					$("#cmbJur_21").append("<option value='"+valor.id+"'>"+valor.nombre+"</option>");
				});
			},
			error: function(){
				$("#cmbJur_21").html("");
				$("#cmbJur_21").append("<option value= '' >-- Seleccione --</option>");
			}
		});
	});
});

$(document).ready(function(){
  $("#cmbJur_21").change(function(){
	$("#caso").val('3000');
	$("#casosql").val('10');
	$("#combo1").val($("#cmbJur_21").val());
  });
});

$(document).ready(function(){
	$("#cmbJur_21").change(function(){
		var caso = $("#caso").val();
		var casosql = $("#casosql").val();
		var combo1 = $("#combo1").val();
		$.ajax({
			data: {caso:caso,casosql:casosql,combo1:combo1},
			dataType: 'json',
			url: '../ServletControl',
			type: 'POST',
			success: function(data){
				//llenar el combo
				$("#cmbMunicipio_21").html("");
				$("#cmbMunicipio_21").append("<option value= '' >-- Seleccione --</option>");
				$.each(data.Dato,function(indice,valor) {
					$("#cmbMunicipio_21").append("<option value='"+valor.id+"'>"+valor.nombre+"</option>");
				});
			},
			error: function(){
				$("#cmbMunicipio_21").html("");
				$("#cmbMunicipio_21").append("<option value= '' >-- Seleccione --</option>");
			}
		});
	});
});

$(document).ready(function(){
  $("#cmbMunicipio_21").change(function(){
	$("#caso").val('3000');
	$("#casosql").val('11');
	$("#combo1").val($("#cmbMunicipio_21").val());
  });
});

$(document).ready(function(){
	$("#cmbMunicipio_21").change(function(){
		var caso = $("#caso").val();
		var casosql = $("#casosql").val();
		var combo1 = $("#combo1").val();
		$.ajax({
			data: {caso:caso,casosql:casosql,combo1:combo1},
			dataType: 'json',
			url: '../ServletControl',
			type: 'POST',
			success: function(data){
				//llenar el combo
				$("#cmbUnidad_21").html("");
				$("#cmbUnidad_21").append("<option value= '' >-- Seleccione --</option>");
				$.each(data.Dato,function(indice,valor) {
					$("#cmbUnidad_21").append("<option value='"+valor.id+"'>"+valor.nombre+"</option>");
				});
			},
			error: function(){
				$("#cmbUnidad_21").html("");
				$("#cmbUnidad_21").append("<option value= '' >-- Seleccione --</option>");
			}
		});
	});
});