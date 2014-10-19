/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function IsEmail(email) {
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email);
}

var dia;
var horario;
var maestro;
var grupo;
var materia;
var salon;



$('.tooltipCheckbox').tooltip({/*or use any other selector, class, ID*/
    placement: "right",
    trigger: "hover",
    animated: 'fade',
    container: 'body'
});


//$.post( "./getData.do?type=horario",{ type: "horario", second : "troll"}, function( data ) {
//  console.log("success: "+data);
//});


$.ajax({
    type: 'POST',
    url: './getData.do',
    data: {type: "horarios"},
    success: function(result) {
        horario = -1;
        $("select[name=horarios]").html('<option value="-1"></option>');
        result.output.forEach(function(entry) {
            ///*console.log("id "+entry.id);
            //console.log("inicio "+entry.inicio);

            $("select[name=horarios]").append($('<option>', {
                value: entry.id,
                text: entry.inicio
            }));

        });
        console.log(result);

    },
    error: function(e) {
        console.log("error:" + JSON.stringify(e));
    }

});




$('select[name=dias]').change(function() {
    var property = $("select[name=dias] option:selected").text();
    var value = $("select[name=dias]").val();
    console.log("Dias changed to " + property + " with val " + value);
    dia = value;
    if (value == -1) {
        $('select[name=horarios]').prop('disabled', true);
        $('select[name=horarios]').val(-1);
        $('select[name=horarios]').change();
    } else {
        $('select[name=horarios]').prop('disabled', false);
    }

});

$('select[name=horarios]').change(function() {
    var property = $("select[name=horarios] option:selected").text();
    var value = $("select[name=horarios]").val();
    console.log("horarios changed to " + property + " with val " + value);
    horario = value;

    $.ajax({
        type: 'POST',
        url: './getData.do',
        data: {type: "maestro", dia: dia, horario: horario},
        success: function(result) {
            maestro = -1;
            $("select[name=maestros]").html('<option value="-1"></option>');
            result.output.forEach(function(entry) {
                ///*console.log("id "+entry.id);
                //console.log("inicio "+entry.inicio);

                $("select[name=maestros]").append($('<option>', {
                    value: entry.id,
                    text: entry.name
                }));

            });
            console.log(result);

        },
        error: function(e) {
            console.log("error:" + JSON.stringify(e));
        }

    });

    $.ajax({
        type: 'POST',
        url: './getData.do',
        data: {type: "salones", dia: dia, horario: horario},
        success: function(result) {
            salon = -1;
            $("select[name=salones]").html('<option value="-1"></option>');
            result.output.forEach(function(entry) {
                ///*console.log("id "+entry.id);
                //console.log("inicio "+entry.inicio);

                $("select[name=salones]").append($('<option>', {
                    value: entry.id,
                    text: entry.nombre
                }));

            });
            console.log(result);

        },
        error: function(e) {
            console.log("error:" + JSON.stringify(e));
        }

    });


    if (value == -1) {
        $('select[name=maestros]').prop('disabled', true);
        $('select[name=maestros]').val(-1);
        $('select[name=maestros]').change();
    } else {
        $('select[name=maestros]').prop('disabled', false);
    }

});

$('select[name=maestros]').change(function() {
    var property = $("select[name=maestros] option:selected").text();
    var value = $("select[name=maestros]").val();
    console.log("maestros changed to " + property + " with val " + value);
    maestro = value;

    $.ajax({
        type: 'POST',
        url: './getData.do',
        data: {type: "grupos", dia: dia, horario: horario},
        success: function(result) {
            grupo = -1;
            $("select[name=grupos]").html('<option value="-1"></option>');
            result.output.forEach(function(entry) {
                ///*console.log("id "+entry.id);
                //console.log("inicio "+entry.inicio);

                $("select[name=grupos]").append($('<option>', {
                    value: entry.id,
                    text: entry.full
                }));

            });
            console.log(result);

        },
        error: function(e) {
            console.log("error:" + JSON.stringify(e));
        }

    });


    if (value == -1) {
        $('select[name=grupos]').prop('disabled', true);
        $('select[name=grupos]').val(-1);
        $('select[name=grupos]').change();
    } else {
        $('select[name=grupos]').prop('disabled', false);
    }

});

$('select[name=grupos]').change(function() {
    var property = $("select[name=grupos] option:selected").text();
    var value = $("select[name=grupos]").val();
    console.log("grupos changed to " + property + " with val " + value);
    grupo = value;


    $.ajax({
        type: 'POST',
        url: './getData.do',
        data: {type: "materias", grupo: grupo},
        success: function(result) {
            materia = -1;
            $("select[name=materias]").html('<option value="-1"></option>');
            result.output.forEach(function(entry) {
                ///*console.log("id "+entry.id);
                //console.log("inicio "+entry.inicio);

                $("select[name=materias]").append($('<option>', {
                    value: entry.id,
                    text: entry.nombre
                }));

            });
            console.log(result);

        },
        error: function(e) {
            console.log("error:" + JSON.stringify(e));
        }

    });


    if (value == -1) {
        $('select[name=materias]').prop('disabled', true);
        $('select[name=materias]').val(-1);
        $('select[name=materias]').change();
    } else {
        $('select[name=materias]').prop('disabled', false);
    }

});

$('select[name=materias]').change(function() {
    var property = $("select[name=materias] option:selected").text();
    var value = $("select[name=materias]").val();
    console.log("Materias changed to " + property + " with val " + value);
    materia = value;
    if (value == -1) {
        $('select[name=salones]').prop('disabled', true);
        $('select[name=salones]').val(-1);
        $('select[name=salones]').change();
    } else {
        $('select[name=salones]').prop('disabled', false);
    }

});

$('select[name=salones]').change(function() {
    var property = $("select[name=salones] option:selected").text();
    var value = $("select[name=salones]").val();
    console.log("Salones changed to " + property + " with val " + value);
    salon = value;
    if (value != -1) {
        var valid = true;
        valid = valid && dia != -1;
        valid = valid && horario != -1;
        valid = valid && maestro != -1;
        valid = valid && grupo != -1;
        valid = valid && materia != -1;
        valid = valid && salon != -1;

        if (valid)
            $.ajax({
                type: 'POST',
                url: './getData.do',
                data: {type: "validate", dia: dia, horario: horario, maestro: maestro, grupo: grupo, materia: materia, salon: salon},
                success: function(result) {
                    var data = {type: "validate", dia: dia, horario: horario, maestro: maestro, grupo: grupo, materia: materia, salon: salon};
                    console.log(data);
                    console.log(result);
                    if (!result.error) {
                        $('button[name=btnsignup]').prop('disabled', false);
                    }
                    else {
                        var html = '<div class="alert alert-danger alert-dismissable" hidden="true"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>' + e.message + '</div>';
                        $('#clasePanel').prepend(html);
                    }

                },
                error: function(e) {
                    var message = JSON.stringify(e);
                    console.log("error:" + message);

                    var html = '<div class="alert alert-danger alert-dismissable" hidden="true"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>' + message + '</div>';
                    $('#clasePanel').prepend(html);
                }

            });
        else {
            var message = "Holo";
            var html = '<div class="alert alert-warning alert-dismissable" hidden="true"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>' + message + '</div>';
            $('#clasePanel').prepend(html);
            //TODO: handle validation error
        }
    }
});

$('select').change(function() {
    var name = $(this).prop('name');
    $('button[name=btnsignup]').prop('disabled', true);
    if (name != "salones") {
        $('select[name=salones]').val(-1);
    }

});

function clearForm() {
    $('select').val(-1);
    $('select').change();
    $('button[name=btnsignup]').prop('disabled', true);
}


$('button[name=btnsignup]').click(function() {

    $.ajax({
        type: 'POST',
        url: './getData.do',
        data: {type: "insert", dia: dia, horario: horario, maestro: maestro, grupo: grupo, materia: materia, salon: salon},
        success: function(result) {
            var data = {type: "insert", dia: dia, horario: horario, maestro: maestro, grupo: grupo, materia: materia, salon: salon};
            console.log(data);
            console.log(result);
            if (!result.error) {
                alert("Clase registrada con éxito.");
                clearForm();
            }
            else {
                var message = "Error al registrar clase";
                var html = '<div class="alert alert-danger alert-dismissable" hidden="true"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>' + message + '</div>';
                $('#clasePanel').prepend(html);
                clearForm();
            }



        },
        error: function(e) {
            var message = JSON.stringify(e);
            console.log("error:" + message);

            var html = '<div class="alert alert-danger alert-dismissable" hidden="true"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>' + message + '</div>';
            $('#clasePanel').prepend(html);
            clearForm();
        }

    });


});

$('#inpte').keyup(function() {
    console.log("Email changed.");
    $('.pruebaClass').addClass("input-group");
    $('.pruebaClass span').addClass("input-group-addon");
    $('.pruebaClass span i').addClass("fa fa-circle-o-notch fa-spin");
    $('pruebaClass span').show();


    var email = $(this).val();


    if (IsEmail(email)) {
        
        $.ajax({
            type: 'POST',
            url: './getData.do',
            data: {type: "usuario", metodo: "validar", email:email},
            success: function(result) {
                console.log(result);
                
                if (result.error) {
                    $('.pruebaClass span i').removeClass();
                    $('.pruebaClass span i').addClass("fa fa-times");
                } else {
                    $('.pruebaClass span i').removeClass();
                    $('.pruebaClass span i').addClass("fa fa-check");
                }

            },
            error: function(e) {
                console.log("error:" + JSON.stringify(e));
                $(this).prop('disabled', false);
                 $('.pruebaClass span i').removeClass();
                    $('.pruebaClass span i').addClass("fa fa-times");
            }

        });

    } 
    if (email.length == 0) {
        $('.pruebaClass').removeClass("input-group");
        $('.pruebaClass span').removeClass("input-group-addon");
        $('.pruebaClass span i').removeClass();
        $('pruebaClass span').hide();
    }

});