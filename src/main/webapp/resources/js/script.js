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


}(jQuery));


function getParameter(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

$('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
// 선택되는 요소를 오브젝트화 한다.
$this = $(e.target);
// data-load가 false의 경우는 content에 data-load를 한다.
if(!$this.data("load")) {
// tab-content의 id를 취득한다.
var id = $this.attr("href");
// 페이지 로드를 한다.
$(id).load($this.data("url"));
// data-load를 true로 변환하여 중복 로딩이 없게 한다.
$this.data("load", true);
}
});

$(window).resize(function () {

    var currentViewPortHeight = $(window).height();
    var currentViewPortWidth = $(window).width();

    $('a[data-toggle="tab"]').css({
        "height": currentViewPortHeight
    }, {
        "width": currentViewPortWidth
    });
});


$(document).ready(function () {
$('html, body').animate({
scrollTop: $('#contents').offset().top
}, 'slow');
});

var searchForm = $("#searchForm");
var actionForm = $("#actionForm");

$("#searchButton").on("click", function(e){
	if(!searchForm.find("input[name = 'keyword']").val()){
		$(".myAlert-top").show();
	    setTimeout(function(){$(".myAlert-top").hide();}, 2000);
		return false;
	}
	
	searchForm.find("input[name = 'pageNum']").val("1");
	searchForm.find("input[name = 'amount']").val("10");
	
	e.preventDefault();
	
	searchForm.submit();
});


$(".page-item a").on("click", function(e){
	e.preventDefault();
	
	console.log("click");
	actionForm.find("input[name = 'pageNum']").val($(this).attr("href"));
	actionForm.submit();
});


$(document).ready(function () {
$('.radio-group .radio').click(function () {
	
	$('.radio').removeClass('selected');
	$(this).addClass('selected');

	var price = $(this).children('.fundPrice').val();
	alert(price);
	$('#priceText').text(price);
});
});


$("#purchaseButton").on("click",function(e){
	
e.preventDefault();
	
var code = $('.selected').children('input[name="code"]').val();
alert(code);

actionForm.find("input[name = 'code']").val(code);
actionForm.submit();
});

$("#purchaseButton").on("click",function(e){
	
e.preventDefault();
	
var code = $('.selected').children('input[name="code"]').val();
alert(code);

actionForm.find("input[name = 'code']").val(code);
actionForm.submit();
});

$("#optionButton").on("click",function(e){
	alert("무야호");
	 $('.option').append (                        
                   	'<tr> <td>옵션</td> <td><input type="text" class="form-control" name="title" placeholder="옵션 이름 입력"></td>	</tr> <tr> <td>옵션 설명</td> <td><input type="text" class="form-control" name="contents" placeholder="옵션 설명 입력"></td> </tr> <tr> <td>옵션 가격</td> <td><input type="text" class="form-control" name="price" placeholder="옵션 금액 입력"></td> </tr>'                
                );

});
