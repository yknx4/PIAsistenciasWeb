/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



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








function loadUser(input){
    
    $('#inpte').val(input.email);
    $('input[name=name]').val(input.name);
    $('input[name=isMaestro]').prop('checked', (input.permission & 2) == 2);   ////2
    $('input[name=isPersonal]').prop('checked', (input.permission & 1) == 1);
    $('input[name=isAdmin]').prop('checked', (input.permission & 4) == 4);

}

$('select[name=maestros]').change(function() {
    var id =  $(this).val();
    
     $.ajax({
        type: 'POST',
        url: './getData.do',
        data: {type: "usuario", metodo: "obtener", id:id},
        success: function(result) {
            var data = {type: "usuario", metodo: "obtener", id:id};
            console.log(data);
            console.log(result);
            if (!result.error) {
                loadUser(result.output);
                $('button[name=btnupdateuser]').prop('disabled', false);
               // clearUserForm();
                
            }
            else {
//                var message = "Error al registrar Usuario";
//                $('#signupalert span').html(message);
//                $('#signupalert span').show();
//                clearUserForm();
            }



        },
        error: function(e) {
            var message = JSON.stringify(e);
            console.log("error:" + message);

            
            $('#signupalert span').html(message);
            $('#signupalert span').show();
            clearUserForm();
        }

    });
    

});




function clearUserForm() {
    $('button[name=btnupdateuser]').prop('disabled', true);
    $('#inpte').val("");
    $('input[name=name]').val("");
    $('select[name=maestros]').val(-1);
    $('input[name=isMaestro]').prop('checked', false);   ////2
    $('input[name=isPersonal]').prop('checked', false);
    $('input[name=isAdmin]').prop('checked', false);
    $('.pruebaClass').removeClass("input-group");
    $('.pruebaClass span').removeClass("input-group-addon");
    $('.pruebaClass span i').removeClass();
    //btnadduser
    $('pruebaClass span').hide();

}






function getPermissions(){
    var perm = 0;
    var prof = $('input[name=isMaestro]').is(':checked');   ////2
    var pers = $('input[name=isPersonal]').is(':checked');   ///1
    var admn = $('input[name=isAdmin]').is(':checked');  /////4
    if(prof) perm = perm | 2;
    if(pers) perm = perm | 1;
    if(admn) perm = perm | 4;
    return perm;
}

$('button[name=btnupdateuser]').click(function() {
    console.log("Intento registro");
    var email = $('#inpte').val();
    var nombre = $('input[name=name]').val();
    var permisos = getPermissions();

    var id = $('select[name=maestros]').val();
    
    if(nombre== null || nombre == "" || nombre.length <4){
        $('input[name=firstname]').focus();
        return;
    }
   
   
    if(permisos==0){
        return;
    }
    

    $.ajax({
        type: 'POST',
        url: './getData.do',
        data: {type: "usuario", id:id, metodo: "actualizar", email:email, nombre:nombre, permisos:permisos,activo:1},
        success: function(result) {
            var data = {type: "usuario", metodo: "actualizar", email:email, nombre:nombre, permisos:permisos,activo:1};
            console.log(data);
            console.log(result);
            if (!result.error) {
                alert("Usuario actualizado con éxito.");
                location.reload(true);
                clearUserForm();
            }
            else {
                var message = "Error al actualizar Usuario";
                $('#signupalert span').html(message);
                $('#signupalert span').show();
                clearUserForm();
            }



        },
        error: function(e) {
            var message = JSON.stringify(e);
            console.log("error:" + message);

            
            $('#signupalert span').html(message);
            $('#signupalert span').show();
            clearUserForm();
        }

    });


});