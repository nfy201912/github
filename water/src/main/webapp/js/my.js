$(function(){
	$("#navbar ul li").on("mousemove",function(){
		$(this).addClass("active");
	}).on("mouseleave",function(){
		//alert(222);
		$(this).removeClass("active");
	});
});
