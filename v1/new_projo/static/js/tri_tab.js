/**
 * Created with PyCharm.
 * User: nmtsylla
 * Date: 25/06/13
 * Time: 21:41
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function(){





    $('#tri_themes').change(function(event){
       var select = $(this);
       var val = select.val();
       if(val == ''){
           $('.filter_table tr').show();
           $('.filter_table tr').removeClass('highlighted');
           $('.filter_table tr:not(.highlighted)').show();
           return true;
       }
       var regexp = '\\b(.*)';
       regexp += '('+val+')';
       regexp +='(.*)\\b';
       $('.filter_table').find('tr').each(function(){
            var tr = $(this);
            var resultats = '';
            tr.find('td[class="theme"]').each(function(){
                var td = $(this);
                resultats = td.text().match(new RegExp(regexp, 'i'));
                if(resultats){
                    console.log(resultats);
                    tr.addClass('highlighted');
                }
            });
       });
       $('.filter_table tr:not(.highlighted)').hide();
       $('.filter_table tr[class="highlighted"]').show();
    });

    function colorie(){
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
    });
});