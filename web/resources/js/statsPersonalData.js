$(function() {


    var month = new Array();
    month[0] = "January";
    month[1] = "February";
    month[2] = "March";
    month[3] = "April";
    month[4] = "May";
    month[5] = "June";
    month[6] = "July";
    month[7] = "August";
    month[8] = "September";
    month[9] = "October";
    month[10] = "November";
    month[11] = "December";

    Morris.Line({
        element: 'morris-bar-chart',
        data: objDatos.datos,
        xkey: 'day',
        ykeys: ['attends', 'late', 'ausent', 'justifications'],
        labels: ['Asistencias', 'Retardos', 'Faltas', 'Justificaciones'],
        hideHover: 'auto',
        resize: true,
        stacked: true,
        xLabelFormat: function(x){return month[x.getMonth()] +" "+ x.getFullYear();},
        smooth : false,
        ymax : 150
    });

    reshape();

});


$(document).ready(function() {
    reshape();

});

function reshape() {
    var boxes = $('.panel .well');
    maxHeight = Math.max.apply(
            Math, boxes.map(function() {
                return $(this).height();
            }).get());
    boxes.height(maxHeight);
}