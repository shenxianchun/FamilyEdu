$(document).ready(function(){
		$(".ui.dropdown").dropdown();
		
		
		
		$.ajax({
            type:"post",
            url:"RegionAction",//需要用来处理ajax请求的action,LoginAction为处理的方法名，JsonAction为action名 
            data:{//设置数据源 区域
            },
          	dataType:"json",//设置需要返回的数据类型 
           success:function(data){
               var d = eval("{"+data+"}");//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构 
               //得到的d是一个形如{"key":"value","key1":"value1"}的数据类型，然后取值出来 
               for(var i=0;i<d.length;i++){
               	$("#area_list").append("<div class='item' data-value='"+d[i]+"'>"+d[i]+"</div>");
               }
          },
        error:function(){ 
              alert("区域数据加载失败！");
            }//这里不要加"," 
       });
		 $.ajax({
            type:"post",
            url:"GradeAction",//需要用来处理ajax请求的action,LoginAction为处理的方法名，JsonAction为action名 
            data:{//设置数据源 年级
            },
          	dataType:"json",//设置需要返回的数据类型 
           success:function(data){
           	 var d = eval("{"+data+"}");//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构 
                //得到的d是一个形如{"key":"value","key1":"value1"}的数据类型，然后取值出来 
                for(var i=0;i<d.length;i++){
                	$("#grade_list").append("<div class='item' data-value='"+d[i]+"'>"+d[i]+"</div>");
                }
               
          }, 
        error:function(){ 
              alert("系统异常，请稍后重试！");
            }//这里不要加"," 
       });
		 $.ajax({
            type:"post",
            url:"SubjectAction",//需要用来处理ajax请求的action,LoginAction为处理的方法名，JsonAction为action名 
            data:{//设置数据源 科目
            },
          	dataType:"json",//设置需要返回的数据类型 
           success:function(data){
           	 var d = eval("{"+data+"}");//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构 
                //得到的d是一个形如{"key":"value","key1":"value1"}的数据类型，然后取值出来 
                for(var i=0;i<d.length;i++){
                	$("#subject_list").append("<div class='item' data-value='"+d[i]+"'>"+d[i]+"</div>");
                }
          }, 
        error:function(){ 
              alert("系统异常，请稍后重试！");
            }//这里不要加"," 
       });
		 $.ajax({
	            type:"post",
	            url:"SchoolAction!excute",//需要用来处理ajax请求的action,LoginAction为处理的方法名，JsonAction为action名 
	            data:{//设置数据源 科目
	            },
	          	dataType:"json",//设置需要返回的数据类型 
	           success:function(data){
	           	 var d = eval("{"+data+"}");//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构 
	                //得到的d是一个形如{"key":"value","key1":"value1"}的数据类型，然后取值出来 
	                for(var i=0;i<d.length;i++){
	                	$("#school_list").append("<div class='item' data-value='"+d[i]+"'>"+d[i]+"</div>");
	                }
	          }, 
	        error:function(){ 
	              alert("系统异常，请稍后重试！");
	            }//这里不要加"," 
	       });
		 var s_where="";
		 $("#save").click(function(){
				var id=$("#uid").val();
				var regId=new RegExp("^\\d{0,}$|^(\\d{0,}).(\\d{0,})$");
				var rsId=regId.test(id);
				if(rsId==false){
					alert("Id号无效");
					$("#uid").css("color","red");
					return;
				}else{
					$("#id").css("color","black");
				}
				alert(id);
				
				var subject=$("#grade").val()+$("#subject").val();
				var area=$("#area").val();
				var graduate_school=$("#school").val();
				var sex=$("#sex").val();
				
				if(!id==""){
					s_where+=" and u_id like'%"+id+"%' ";
				}
				if(!subject==""){
					 s_where+=" and subject like'%"+subject+"%' ";
				}
				if(!area==""){
					s_where+="and area='"+area+"' ";
				}
				if(!graduate_school==""){
					s_where+=" and graduate_school ='"+graduate_school+"' ";
				}
				if(!sex==""){
					s_where+=" and sex ='"+sex+"' ";
				}
				if(rsId){
					$.ajax({
						url:"SearchTeacherAction",
						data:{
							"s_where":s_where
						},
						success:function(response){
							alert("搜索成功");
							window.location="user/SearchTeacher.jsp";//重定向
						}
					});
				}
				
			});
		 
		 $("#go").click(function(){
				var pageNow=$("#pageNow").val();
				var pageCount=$("#pageCount").text();
				var regNow=new RegExp("^\\d{0,}$|^(\\d{0,}).(\\d{0,})$");
				var rsNow=regNow.test(pageNow);
				if(pageNow==""){
					alert("您还没有输入跳转的页数");
					return;
				}
				if(rsNow==false){
					alert("输入有误");
					$("#pageNow").css("color","red");
					return;
				}else{
					$("#pageNow").css("color","black");
				}
				if(pageNow>pageCount){
					alert("页数过大");
					return;
				}
				if(rsNow){
					window.location="TpageAction?pageNow="+pageNow;//重定向
				}
			});
		 
		 
		});