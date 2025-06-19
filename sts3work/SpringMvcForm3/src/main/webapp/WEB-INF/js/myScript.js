/**
 * 
 */
$(function(){
	$("#myimg").attr("src","../image/logoImg/img3.gif");
	
	$("#myimg").hover(function(){
	
		$(this).attr("src","../image/logoImg/img3.gif");
	},function(){
		$(this).attr("src","../image/logoImg/img4.gif");
	});
	
});
