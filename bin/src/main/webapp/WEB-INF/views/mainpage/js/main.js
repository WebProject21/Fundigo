$(function(){
/*  var $serchBtn = $('.shopping_nav .search_btn'),
	  $searchForm = $('header form');

  $searchBtn.click(function(){
	$searchForm.toggleClass('active')
	});*/
	
	$('.main_slides ul').bxSlider({
		controls: false,
		mode: 'vertical',
		auto: true,
		tickerHover: false,
	});
});//document ready function

function linkMethod(num){
	switch(num){
		case 1: location.href = "http://www.naver.com"; break;
		case 2: location.href = "http://www.youtube.com"; break;
		case 3: location.href = "http://www.google.com"; break;		
	}
}