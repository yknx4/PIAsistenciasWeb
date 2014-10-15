/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function getUrlParameter(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] === sParam)
        {
            return sParameterName[1];
        }
    }
}

function removeParam(key, sourceURL) {
    var rtn = sourceURL.split("?")[0],
            param,
            params_arr = [],
            queryString = (sourceURL.indexOf("?") !== -1) ? sourceURL.split("?")[1] : "";
    if (queryString !== "") {
        params_arr = queryString.split("&");
        for (var i = params_arr.length - 1; i >= 0; i -= 1) {
            param = params_arr[i].split("=")[0];
            if (param === key) {
                params_arr.splice(i, 1);
            }
        }
        rtn = rtn + "?" + params_arr.join("&");
    }
    return rtn;
}

function insertParam(url, key, value)
{
    key = encodeURI(key);
    value = encodeURI(value);

    var kvp = url.substr(0).split('&');

    var i = kvp.length;
    var x;
    while (i--)
    {
        x = kvp[i].split('=');

        if (x[0] === key)
        {
            x[1] = value;
            kvp[i] = x.join('=');
            break;
        }
    }

    if (i < 0) {
        kvp[kvp.length] = [key, value].join('=');
    }

    //this will reload the page, it's likely better to store this until finished
    return kvp.join('&');
}


$('#titleContainer .input-group.date').datepicker({
    todayBtn: "linked",
    daysOfWeekDisabled: "0,6",
    autoclose: true,
    todayHighlight: true
});

$('#titleContainer .input-group.date').datepicker()
        .on("changeDate", function(e) {
            var url = window.location.href;
            var user = getUrlParameter("user");

            var fecha = e.date;
            console.log(fecha);

            url = removeParam("üser", url);
            url = removeParam("day", url);
            url = removeParam("month", url);
            url = removeParam("year", url);

            if (url.indexOf('?') > -1) {
                url += '';
            } else {
                url += '?';
            }


            if (typeof user !== 'undefined')
                url = insertParam(url, "user", user);
            url = insertParam(url, "year", fecha.getFullYear());
            url = insertParam(url, "month", fecha.getMonth());
            url = insertParam(url, "day", fecha.getDate());

            console.log(url);

            window.location.href = url;
        });

$('#dateText').hide();
