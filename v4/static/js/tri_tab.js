/**
 * Created with PyCharm.
 * User: nmtsylla
 * Date: 25/06/13
 * Time: 21:41
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function(){

    $("#tri_themes").change(function(){
        var tb = $("#op_table");
        if( $(this).val() != "") {
            tb.find("tbody>tr").hide();
            tb.find("td[class='theme']:contains-ci('" + $(this).val() + "')").parent("tr").show();
        }
        else {
            tb.find("tbody>tr").show();
        }
    });

    $("#tri_etat").change(function(){
        var tb = $("#op_table");
        if( $(this).val() != "") {
            tb.find("tbody>tr").hide();
            tb.find("td[class='soumission']:contains-ci('" + $(this).val() + "')").parent("tr").show();
        }
        else{
            tb.find("tbody>tr").show();
        }
    });

    // jQuery expression for case-insensitive filter
    $.extend($.expr[":"],
    {
        "contains-ci": function(elem, i, match, array)
        {
            return (elem.textContent || elem.innerText || $(elem).text() || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
        }
    });


    /*function colorie(){
        $("td[class='soumission']").each(function(){
            var td = $(this);
            var val = td.text();
            switch(val){
                case 'Validée':
                    td.parent().css('color', '#3ccb38');
                    break;
                case 'Rejettée':
                    td.parent().css('color', 'red');
                    break;
                case 'En attente':
                    td.parent().css('color', '#e9e127');
                    break;
            }
        });
    }

    function colorie_pas(){
        $("td[class='soumission']").each(function(){
            var td = $(this);
            var val = td.text();
            td.parent().css('background-color', '');
            td.parent().css('color', '');
        });
    }

    $('#filtre').change(function(){
        var t = $(this);
        if(t.val())
            colorie();
        else{
            colorie_pas()
        }
    });*/


/*

    $('#op_table').dataTable({
        "sPaginationType": "full_numbers",
        "sDom": '<"top"i>rt<"bottom"flp><"clear">'
    });
*/

    $("#tri_mois").change(function(){
        var mois = $(this).val();
        alert(mois);
        var date_op = $("td[class='date_operation']");
        console.log(date_op);
    });
});