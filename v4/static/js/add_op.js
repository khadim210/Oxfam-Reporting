/**
 * Created with PyCharm.
 * User: nmtsylla
 * Date: 03/07/13
 * Time: 20:23
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function(){
    //Masquer les details de l'operation avant qu'on ne choisisse le theme, l'activité et la ligne budget

    var theme = $("#id_theme");
    var select_rubrique = $("#id_rubrique");
    var select_ligne = $("#id_ligne");
    $('#dialog-message').hide();
    $("#valider").on('click', function(){
        if(theme.val() == "" || select_rubrique.val() == "" || select_ligne.val() == ""){
            $( "#dialog-message" ).dialog({
                modal: true,
                buttons: {
                    Ok: function() {
                        $( this ).dialog( "close" );
                    }
                }
            });
            return false;
        }else
            return true;
    });

    theme.change(function() {
        var theme_id = theme.val();
        var items = [];
        select_rubrique.empty();
        select_ligne.empty();

        items.push('<option value="" selected="selected">-- Liste rubriques  --</option>');
        select_rubrique.html(items.join(''));
        if (theme_id == "") {
            select_rubrique.attr({'disabled': 'disabled'});
            select_ligne.attr({'disabled': 'disabled'});
        } else {
            $.getJSON('get_activites/', {id: theme_id}, function (data) {
                $.each(data, function (index, val) {
                    items.push('<option value="' + val.id + '">' + val.activite + '</option>');
                });
                select_rubrique.html(items.join('')).removeAttr('disabled');
            });
        }
    });

    select_rubrique.change(function() {
        var activite_id = select_rubrique.val();
        var items = [];
        items.push('<option value="" selected="selected">-- Liste lignes budgétaires  --</option>');
        select_ligne.html(items.join(''));
        if (activite_id == "") {
            select_ligne.attr({'disabled': 'disabled'});
        } else {
            $.getJSON('get_lignes/', {id: activite_id}, function (data) {
                $.each(data, function (index, val) {
                    items.push('<option value="' + val.id + '">' + val.libelle + '</option>');
                    var span = "<span>"+val.restant+"</span>";
                    $('#rest_ligne').replaceWith(span);
                });
                select_ligne.html(items.join('')).removeAttr('disabled');

            });
        }
    });

    select_ligne.change(function(){
        $('#ligne').val($(this).val());
    });
});