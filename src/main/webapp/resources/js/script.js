(function ($) {
	"use strict";

    jQuery(document).ready(function ($) {
        
        $(".thumb-image").find('img').bind("click", function() {
            var src = $(this).attr("src");
            // Check the beginning of the src attribute  
            var state = (src.indexOf("bw_") === 0) ? 'bw' : 'clr';
            // Modify the src attribute based upon the state var we just set
            (state === 'bw') ? src = src.replace('bw_', 'clr_') : src = src.replace('clr_', 'bw_');
            // Apply the new src attribute value  
            $(this).attr("src", src);

            // This is just for demo visibility
            $('.thumb-main-image img').attr("src", src);
            
            $('.thumb-image li.active').removeClass('active');
            
            $(this).parent().parent().addClass('active');
            
            

          return false;
        });
        
        var spins = document.getElementsByClassName("qt-area");
        for (var i = 0, len = spins.length; i < len; i++) {
            var spin = spins[i],
                span = spin.getElementsByTagName("i"),
                input = spin.getElementsByTagName("input")[0];

            input.onchange = function() { input.value = +input.value || 0; };
            span[0].onclick = function() { input.value = Math.max(0, input.value - 1); };
            span[1].onclick = function() { input.value -= -1; };
        }



    });


    jQuery(window).load(function(){

        
    });


}(jQuery));

function scriptQuery() {
    var script = document.getElementsByTagName('script');   
    script = script[script.length-1].src  
       .replace(/^[^\?]+\?/, '')           
       .replace(/#.+$/, '')                      
       .split('&');                                   
     var queries = {}                             
       , query;
     while(script.length){                      
          query = script.shift().split('=');    
          queries[query[0]] = query[1];   
     }
     return queries;
}

function getParameter(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

$('#menuTab a[href="#notice"]').on('click', function (e) {
  var pno = getParameter("pno");
 var url = "http://localhost:8181/product/notice?pno="+pno; 

  $('#notice').load(url) ;
})

