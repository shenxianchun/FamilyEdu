$(function(){
	var add=0;
	$(window).scroll(function (){
	add = $(this).scrollTop();
	 console.log(add);
	});
    var myli=$("#xxjj");
   //myli.css("display","none");
   // alert(myli.attr("id"));
    var xiaoxue=$(".xiaoxue");
  	$("#xxjj").mouseleave(function(event){
  		   // alert("离开");
    		var mouseX=event.clientX;
    		//alert("mouseX: "+mouseX);
    		var mouseY=event.clientY+add;
    	   //alert("mouseY: "+mouseY);
    		var myLeft1=getPosition(this).left;//li的左边
    		//alert("myLeft1: "+myLeft1);
    		var myLeft2=getPosition(this).left+this.offsetWidth;//div的左边也是里li的右边
    		//alert("dsasd++++："+myli[0]);
    		var myRight=getPosition(xiaoxue[0]).left+xiaoxue[0].offsetWidth;//div的右边
    		//alert("myRight: "+myRight);
    		//console.log(myRight);
    		
    		var myTop1=getPosition(this).top;//li的上边
    		//alert("myTop1: "+myTop1);
    		var myTop2=getPosition(this).top+this.offsetHeight;//li的下边
    		var myBottom=getPosition(xiaoxue[0]).top+xiaoxue[0].offsetHeight;//div的下边
    		//alert("myButtom: "+myBottom);
    		if(myLeft1>mouseX||myTop1>mouseY){ //小于最左边，小于最上边
    			xiaoxue.css("display","none");
    			//alert("左||上");
    		}
    		else if((myLeft2<=mouseX&&myRight>=mouseX)&&(myTop1<=mouseY&&myBottom>=mouseY)){//大于最下边，大于最右边
    			//alert("进入该li");
    		     $(".xiaoxue").mouseleave(function(event){
    				xiaoxue.css("display","none");
    			})
    			//alert("右||下");
    		}
    		else if(myLeft2>=mouseX&&myTop2<=mouseY){//小于div左边，大于li下边
    			xiaoxue.css("display","none");
    			//alert("左||下");
    		}
  	})
  	var zhongxue=$(".zhongxue");
  	$("#czjj").mouseleave(function(event){
		 //alert("离开");
 		var mouseX=event.clientX;
 		//alert("mouseX: "+mouseX);
 		var mouseY=event.clientY+add;
 	   //alert("mouseY: "+mouseY);
 		var myLeft1=getPosition(this).left;//li的左边
 		//alert("myLeft1: "+myLeft1);
 		var myLeft2=getPosition(this).left+this.offsetWidth;//div的左边也是里li的右边
 		var myRight=getPosition(zhongxue[0]).left+zhongxue[0].offsetWidth;//div的右边
 		var myTop1=getPosition(this).top;//li的上边
 		//alert("myTop1: "+myTop1);
 		var myTop2=getPosition(this).top+this.offsetHeight;//li的下边
 		var myBottom=getPosition(zhongxue[0]).top+zhongxue[0].offsetHeight;//div的下边
 		//alert("myButtom: "+myBottom);
 		if(myLeft1>mouseX||myTop1>mouseY){ //小于最左边，小于最上边
 			zhongxue.css("display","none");
 			//alert("左||上");
 		}
 		else if((myLeft2<=mouseX&&myRight>=mouseX)&&(myTop1<=mouseY&&myBottom>=mouseY)){//大于最下边，大于最右边
 			//alert("进入该li");
 		     $(".zhongxue").mouseleave(function(event){
 				zhongxue.css("display","none");
 			})
 			//alert("右||下");
 		}
 		else if(myLeft2>=mouseX&&myTop2<=mouseY){//小于div左边，大于li下边
 			zhongxue.css("display","none");
 			//alert("左||下");
 		}
	})
	var gaozhong=$(".gaozhong");
  	$("#gzjj").mouseleave(function(event){
		// alert("离开");
		var mouseX=event.clientX;
		//alert("mouseX: "+mouseX);
		var mouseY=event.clientY+add;
	   //alert("mouseY: "+mouseY);
		var myLeft1=getPosition(this).left;//li的左边
		//alert("myLeft1: "+myLeft1);
		var myLeft2=getPosition(this).left+this.offsetWidth;//div的左边也是里li的右边
		var myRight=getPosition(gaozhong[0]).left+gaozhong[0].offsetWidth;//div的右边
		var myTop1=getPosition(this).top;//li的上边
		//alert("myTop1: "+myTop1);
		var myTop2=getPosition(this).top+this.offsetHeight;//li的下边
		var myBottom=getPosition(gaozhong[0]).top+gaozhong[0].offsetHeight;//div的下边
		//alert("myButtom: "+myBottom);
		if(myLeft1>mouseX||myTop1>mouseY){ //小于最左边，小于最上边
			gaozhong.css("display","none");
			//alert("左||上");
		}
		else if((myLeft2<=mouseX&&myRight>=mouseX)&&(myTop1<=mouseY&&myBottom>=mouseY)){//大于最下边，大于最右边
			//alert("进入该li");
		     $(".gaozhong").mouseleave(function(event){
				gaozhong.css("display","none");
			})
			//alert("右||下");
		}
		else if(myLeft2>=mouseX&&myTop2<=mouseY){//小于div左边，大于li下边
			gaozhong.css("display","none");
			//alert("左||下");
		}
	})
   
})
 function getPosition(node){
	var myleft = node.offsetLeft;
	var mytop = node.offsetTop;
	var parent=node.offsetParent;
	while(parent!=null){
		myleft+=parent.offsetLeft;
		mytop+=parent.offsetTop;
		parent=parent.offsetParent;
		}
		return {"left":myleft,"top":mytop};
	}