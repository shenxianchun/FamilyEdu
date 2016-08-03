// jquery代码
$(function(){
    
	  function  fadeOne(){
	  	 $("#one").css({"background-color":"#fff"});
		 $("#two").css({"background-color":"transparent"});
		 $("#three").css({"background-color":"transparent"});
		 $("#photo-two").fadeOut();
		 $("#photo-three").fadeOut();
		 $("#photo-one").fadeIn(500);
	  }
	  function fadeTwo(){
	  	 $("#one").css({"background-color":"transparent"});
		 $("#two").css({"background-color":"#fff"});
		 $("#three").css({"background-color":"transparent"});
		 $("#photo-one").fadeOut();
		 $("#photo-three").fadeOut();
		 $("#photo-two").fadeIn(500);
	  }
	  function fadeThree(){
	  	 $("#one").css({"background-color":"transparent"});
		 $("#two").css({"background-color":"transparent"});
		 $("#three").css({"background-color":"#fff"});
		 $("#photo-one").fadeOut();
		 $("#photo-two").fadeOut();
		 $("#photo-three").fadeIn(500);
	  }

      var photo = $("#photo");
      var list_li = photo.find("ul li");

      var setTime = 0;
      var liNow = 0;

      list_li.on("click",function(){
      	  var index = $(this).index();
      	  liNow = index;
      	  if(liNow == 0){
      	  	  clearInterval(setTime);
      	  	  fadeOne();
      	  }else if(liNow == 1){
      	  	  clearInterval(setTime);
              fadeTwo();
      	  }else if(liNow == 2){
      	  	   clearInterval(setTime);
      	  	   fadeThree();
      	  }
      	  fade();
      });

      function  fade(){
         setTime = setInterval(function(){
      	    liNow++;
      	    if(liNow > list_li.length-1){
      	 	   liNow = 0;
      	    }
      	    list_li.eq(liNow).trigger("click");
         },3000)
      }
      fade();


      // 科目出现与隐藏
      // 小学
      	 $(".small").hover(function(){
      	   $(".object-content").show();
      	   $(".small-object").show();
      	   middle_list_hide();
      	   high_list_hide();
      	   small_list_show();
      	   small_content();
         },function(){
           $(".object-content").hide();
           $(".small-object").hide();
           small_list_hide();
         });

      // 初中
      $(".middle").hover(function(){
      	   $(".object-content").show();
      	   $(".middle-object").show();
      	   small_list_hide();
      	   high_list_hide();
      	   middle_list_show();
      	   middle_content();
      },function(){
           $(".object-content").hide();
           $(".middle-object").hide();
           middle_list_hide();
      });


      // 高中
      $(".high").hover(function(){
      	   $(".object-content").show();
      	   $(".high-object").show();
      	   high_content();
      	   middle_list_hide();
      	   small_list_hide();
      	   high_list_show();
      },function(){
           $(".object-content").hide();
           $(".high-object").hide();
           high_list_hide();
      });


      function small_content(){
           $(".object-content").hover(function(){ 
           middle_list_hide();
      	   high_list_hide(); 
           small_list_show();
           $(".middle-object").hide();
      	   $(".high-object").hide();
      	   $(".object-content").show();
      	   $(".small-object").show();
        },function(){
           $(".object-content").hide();
           $(".small-object").hide();
           small_list_hide();
        });
      }

      function middle_content(){
           $(".object-content").hover(function(){
           $(".small-object").hide();
      	   $(".high-object").hide();
      	   $(".object-content").show();
      	   $(".middle-object").show();
      	   small_list_hide();
      	   high_list_hide();
      	   middle_list_show();
      },function(){
           $(".object-content").hide();
           $(".middle-object").hide();
           middle_list_hide();
      });
      }

      function high_content(){
           $(".object-content").hover(function(){
           $(".middle-object").hide();
      	   $(".small-object").hide();
      	   $(".object-content").show();
      	   $(".high-object").show();
      	   middle_list_hide();
      	   small_list_hide();
      	   high_list_show();
         },function(){
           $(".object-content").hide();
           $(".high-object").hide();
           high_list_hide();
         });
      }
       
      function small_list_show(){
      	 $(".small").css({"background-color":"#00BEB7"});
      	 $(".small a").css({"color":"#fff"});
      	 $(".small i").css({"background-image":"url(../images/9.png) no-repeat"});
      }
       function small_list_hide(){
      	 $(".small").css({"background-color":"#fff"});
      	 $(".small a").css({"color":"gray"});
      	 $(".small .stage").css({"color":"black"});
      	 $(".small i").css({"background-image":"url(../images/6.png) no-repeat"});
      }

      function middle_list_show(){
      	 $(".middle").css({"background-color":"#00BEB7"});
      	 $(".middle a").css({"color":"#fff"});
      	 $(".middle i").css({"background-image":"url(../images/9.png) no-repeat"});
      }
       function middle_list_hide(){
      	 $(".middle").css({"background-color":"#fff"});
      	 $(".middle a").css({"color":"gray"});
      	 $(".middle .stage").css({"color":"black"});
      	 $(".middle i").css({"background-image":"url(../images/6.png) no-repeat"});
      }

       function high_list_show(){
      	 $(".high").css({"background-color":"#00BEB7"});
      	 $(".high a").css({"color":"#fff"});
      	 $(".high i").css({"background-image":"url(../images/9.png) no-repeat"});
      }
       function high_list_hide(){
      	 $(".high").css({"background-color":"#fff"});
      	 $(".high a").css({"color":"gray"});
      	 $(".high .stage").css({"color":"black"});
      	 $(".high i").css({"background-image":"url(../images/6.png) no-repeat"});
      }

});

