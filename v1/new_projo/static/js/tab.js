$(document).ready(function(){
    $("#btn_signout").click(function(){
        var url = '/logout';
        $(location).attr('href',url);
    });
});


function masquerTab(tab,op,tableau) {
    switch(op){
           case 'mask':
           $("#"+tab).hide();
            $("#"+tableau).val('open'); 
           
           break;
           case 'open':
           $("#"+tab).show();  
            $("#"+tableau).val('mask'); 
           break;
    }
}

