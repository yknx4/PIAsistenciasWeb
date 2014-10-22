$(function() {

  
    Morris.Donut({
        element: 'morris-donut-chart',
        data: [{
            label: "Asistencias",
            value: 125
        }, {
            label: "Retardos",
            value: 30
        }, {
            label: "Faltas",
            value: 10
        }, {
            label: "Justificaciones",
            value: 7
        }],
        resize: true
    });

    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            y: '2014-10-1',
            a: 100,
            b: 90,
            c: 250,
            d:35
        }, {
            y: '2014-10-2',
            a: 100,
            b: 90,
            c: 250,
            d:35
        }],
        xkey: 'y',
        ykeys: ['a', 'b', 'c', 'd'],
        labels: ['Asistencias', 'Retardos','Faltas', 'Justificaciones'],
        hideHover: 'auto',
        resize: true
    });

    reshape();

});


$(document).ready(function() {
    reshape();
    
});

function reshape(){
    var boxes = $('.panel .well');
    maxHeight = Math.max.apply(
            Math, boxes.map(function() {
                return $(this).height();
            }).get());
    boxes.height(maxHeight);
}