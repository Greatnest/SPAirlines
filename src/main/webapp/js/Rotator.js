$(document).ready(function(){
	$(".list1").hide();
  $(".sidenavTitle1").click(function(){
    $(".list1").slideToggle("slow");
	$(".arrow1").toggleClass("rotated",5000);
  });
});

$(document).ready(function(){
	$(".list2").hide();
  $(".sidenavTitle2").click(function(){
    $(".list2").slideToggle("slow");
	$(".arrow2").toggleClass("rotated",5000);
  });
});

$(document).ready(function(){
	$(".list3").hide();
  $(".sidenavTitle3").click(function(){
    $(".list3").slideToggle("slow");
	$(".arrow3").toggleClass("rotated",5000);
  });
});