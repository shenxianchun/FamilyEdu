
  //------图片轮播  start--------------------------------------------------
      var curIndex = 0;
      var arr = new Array(); 
      arr[0] = "image/4.jpg"; 
      arr[1] = "image/5.jpg"; 
      arr[2] = "image/6.jpg"; 
      arr[3] = "image/7.jpg";

      setInterval(changeImg,3000); 
      function changeImg() {
       var img = document.getElementById("img"); 
       var number=document.getElementById("number");
       var n=number.getElementsByTagName("li");
       
       if (curIndex == arr.length-1) {
        curIndex = 0;
        //alert(n[curIndex].innerHTML);
        n[curIndex].style.background="#40E6DF";
        for(var j=1;j<4;j++){
           n[j].style.background="none transparent scroll repeat 0% 0%";
        }
       } else {
        curIndex += 1; 
        //alert(n[curIndex].innerHTML);
        n[curIndex].style.background="#40E6DF";
        n[0].style.background="none transparent scroll repeat 0% 0%";//将背景设置为透明
          if(curIndex==1){
            n[2].style.background="none transparent scroll repeat 0% 0%";
            n[3].style.background="none transparent scroll repeat 0% 0%";
          }
          if(curIndex==2){
            n[1].style.background="none transparent scroll repeat 0% 0%";
            n[3].style.background="none transparent scroll repeat 0% 0%";
          }
           if(curIndex==3){
            n[1].style.background="none transparent scroll repeat 0% 0%";
            n[2].style.background="none transparent scroll repeat 0% 0%";
          }
         } 
       img.src = arr[curIndex]; 
      }
//------图片轮播    end--------------------------------------------------

//----固定显示广告 回到顶部------------------------------------------
  function window_onscroll() {
        var gg=document.getElementById("gg");
        var top1=document.getElementById("top");
        var backtop=document.getElementById("gotop");

        top1.style.top=parseInt(document.body.scrollTop)+"px";
        top1.style.display="block";//登陆注册栏一直显示
        //alert(document.body.scrollTop);
        if(parseInt(document.body.scrollTop)>167){
            gg.style.display="block";//广告显示
            gg.style.top=parseInt(document.body.scrollTop)+280+"px";
            backtop.style.display="block";
            backtop.onclick=function(){
                document.body.scrollTop=0;//点击回到顶部
            } 
        }else{
            gg.style.display="none";//未滚动网页时广告隐藏
            backtop.style.display="none";//回到顶部图标隐藏
        }
        
    }
    //------关闭广告------------------------------------
    function closes(){
        var gg=document.getElementById("gg");
         gg.style.display="none";
    }
    //--左边导航选项卡切换------------------------------------------------
    function teache(e){
        var lrc=document.getElementById("lrc");
        var li=lrc.getElementsByTagName("li");
        //alert("aa");
        for(var i=0;i<li.length;i++){
               if(e.id=="xxjj" && i==0){
                 li[0].style.display="block";
                 li[1].style.display="none";
                 li[2].style.display="none";
                }
             else if(e.id=="czjj" && i==1){
                li[1].style.display="block";
                li[0].style.display="none";
                li[2].style.display="none";
                
            }
            else if(e.id=="gzjj" && i==2){
                li[2].style.display="block";
                li[0].style.display="none";
                li[1].style.display="none";
            }
             else{
                li[i].style.display="none";
            }
        }
    }
    //--左边导航选项卡消失------------------------------------------------
    function teacheout(){
    	//alert("aa");
        var lrc=document.getElementById("lrc");
        var li=lrc.getElementsByTagName("li");
        for(var i=0;i<li.length;i++){
            li[i].style.display="none";
        }
    }
   function dh(e){
        var nav=document.getElementById("nav");
        var ahref=nav.getElementsByTagName("a");
        var sy=document.getElementById("sy");//首页
        var time=document.getElementById("time");//时间轴
        var word=document.getElementById("word");//反馈
        if(e.innerHTML=="网站首页"){
                sy.style.display="block";
                time.style.display="none";
                word.style.display="none";
            }
        if(e.innerHTML=="家教历程"){
                time.style.display="block";
                sy.style.display="none";
                word.style.display="none";
            }
        if(e.innerHTML=="反馈"){
                word.style.display="block";
                sy.style.display="none";
                time.style.display="none";
            }
   }