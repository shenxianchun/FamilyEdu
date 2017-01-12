$(function(){
	$(".feature .content ul li").hover(function(){
		$(this).find(".img1").hide();
		$(this).find(".img2").show();
		$(this).find("span").css({"color":"#fff"});
	},function(){
		$(this).find(".img1").show();
		$(this).find(".img2").hide();
		$(this).find("span").css({"color":"#646464"});
	});
});