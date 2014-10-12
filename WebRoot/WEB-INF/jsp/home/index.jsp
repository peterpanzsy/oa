<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>iMiss小组办公自动化系统</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css">
    <link href="css/kendo.common.min.css" rel="stylesheet" />
    <link href="css/kendo.default.min.css" rel="stylesheet" />
    <link href="css/kendo.dataviz.min.css" rel="stylesheet" />
    <link href="css/kendo.dataviz.default.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/grumble.min.css">
    <link href="css/opentip.css" rel="stylesheet" type="text/css" />

  </head>
  <body>
  <!-- 导航栏部分 -->
  <s:include value="/WEB-INF/jsp/Navi-bar/Navi-bar.jsp"/>
  
<!--banner部分-->
  <div class="banner">
    <ul>
        <li class="one">
        <div class="container">
          <div class="col-md-4">
              <p class="title"><strong>项目信息</strong></p>
              <p class="des">可随时观察项目动态</p>
              <p class="des">项目完成更加高效、轻松</p>
          </div>
          <div class="col-md-8">
            <a ><img src="images/one.png" alt=""></a>
          </div>
          </div>
        </li>
        <li class="two">
          <div class="container">
          <div class="col-md-4">
              <p class="title"><strong>邮件群发</strong></p>
              <p class="des">向小组内成员任意发送邮件</p>
              <p class="des">通知信息更加便捷、高效</p>
          </div>
          <div class="col-md-8">
            <a><img src="images/two.png" alt=""></a>
          </div>
          </div>
        </li>
        <li class="three">
          <div class="container">
          <div class="col-md-4">
              <p class="title"><strong>活动信息</strong></p>
              <p class="des">温馨舒适的照片墙</p>
              <p class="des">小组感情更加浓厚、坚强</p>
          </div>
          <div class="col-md-8">
            <a ><img src="images/three.png" alt=""></a>
          </div>
          </div>
        </li>
    </ul>
  </div>

<!--info部分-->
  <div class="info">
    <div class="container">
        
      <div class="row">
         <div class="col-md-4">
         <div class="title">
          <img src="images/i1.png" alt="">
          <h1>通知公告</h1>
        </div>
      <ul>
        <s:iterator value="#topInfo">
       	  <s:hidden value="id"></s:hidden>
           <li><s:a href="info_show?id=%{id}"><s:property value="title"/></s:a>
           <span><s:date name="date" format="yyyy-MM-dd" /></span></li>
       	</s:iterator>
      </ul>

            <a class="btn btn-success rido btn-sm" href="info_showmore">查看更多</a>
          </div>
          <div class="col-md-4">
           <div class="title">
             <img src="images/i2.png" alt="">
              <h1 class="two">活动信息</h1>
           </div>
          <div id="calendar"></div>
          </div>
           
  <div class="col-md-4">
            <div class="title">
             <img src="images/i3.png" alt="">
              <h1 class="three">图书资源</h1>
             </div>
             <table class="table table-striped">
             <tr>
	              <th>书名</th>
	              <th>作者</th>
	              <th>书柜号</th>
	              <th>出版社</th>
              </tr>          
          	<s:iterator value="#topBook">
	          	<tr>
	               <td>
              			<s:property value="name"/>
                 	</td>
	              	<td>
              			<s:property value="author"/>
                 	</td>
	                	<td>
              			<s:property value="bookcase"/>
                 	</td>     
                 	<td>
              			<s:property value="publish"/>
                 	</td>
	             </tr>
          	</s:iterator>
             </table>
             <a class="btn btn-warning rido btn-sm" href="home_resource">查看更多</a>
         </div>

  </div>
</div>
</div>

<!--footer部分-->
  <footer class="footer">
    <div class="ftbq">
      版权所有© 2014-2015 西安交通大学智能网络与网络安全教育部重点实验室iMiss小组
    </div>
  </footer>

  

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js//jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/unslider.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <script src="js/angular.min.js"></script>
    <script src="js/kendo.all.min.js"></script>
    <script src="js/jquery.grumble.min.js"></script>
    <script src="js/opentip-jquery.js"></script>
    
    <script>
    $(function() {
     $('.banner').unslider({
          speed: 500,               //  The speed to animate each slide (in milliseconds)
          delay: 3000,              //  The delay between slide animations (in milliseconds)
          dots: true,               //  Display dot navigation
          fluid: true             //  Support responsive design. May break non-responsive designs
        });
        });
    </script>

    <script>
    $(function(){
        $('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
        });

        })
    </script>
    <!--首页日历-->
   <script>

   $(document).ready(function() {
	/* var myOpentip=new Opentip("#calendar",{target: "#calendar",tipJoint: "bottom" ,style:"dark"});

	myOpentip.setContent("请点击你想要查看的事件"); */
  //activityid和activitydate分别用于存放获取到的activity 	
  var i=0;
  var activityid=new Array();
  var activitydate=new Array();
  var activitytype=new Array();
  //获取valuestacks内的activitylist数据
  <s:iterator value="#topActivity">
  activityid[i]=${id};
  activitydate[i]='${date}';
  activitytype[i]='${type}';
  i=i+1;
  	</s:iterator>
  	
  	
       var today = new Date(),//设定默认时间为今天
           events = [ ];//事件数组
          
           //将事件转换格式插入事件数组内
           for(var k=0;k<activitydate.length;k++)
           { 
 				
           activitydate[k]=new Date(parseInt(activitydate[k].substr(0,4)),
           				parseInt(activitydate[k].substr(5,2))-1,
           				parseInt(activitydate[k].substr(8,2)));
               events.push(+activitydate[k]);
               
           }
           
           //创建kendocalendar
       $("#calendar").kendoCalendar({
    	   value: today,
           dates: events,
           month: {
               //事件模版
               content: '# if ($.inArray(+data.date, data.dates) != -1) { #' +
                           '<div class="party">'+'#= data.value #'+'</div>' +
                              '#} else { #' + '<div>'+'#= data.value #'+'</div>' + '#}#'
           },
           footer: false
       });
       
       
			 //准备calendar数据
       var calendar = $("#calendar").data("kendoCalendar");
       var matcharrayid=0;
       var matchid=0;
      //当选中日期变化时触发函数
 		
 		bubblecreate();
		calendar.bind("navigate",bubblecreate);
		 function bubblecreate(){
				$('.party').each(function(){
					var myOpentip=new Opentip($(this),{fixed:"true" ,tipJoint: "bottom" ,style:"dark"});
					$(this).mouseover(function(){
						value=$(this).parent().attr('data-value');
						valuearray=value.split("/");
						overdate=new Date(parseInt(valuearray[0]),
		           				parseInt(valuearray[1]),
		           				parseInt(valuearray[2]));
						for(var k=0;k<activitydate.length;k++){
							if(overdate.toDateString()==activitydate[k].toDateString())
							{matcharrayid=k;};};
							
							matchid=activityid[matcharrayid];
							$.post("activity_showDetail",{id:matchid},function(data){
								myOpentip.setContent(data.title); 
								
							});
					});
				});
				};
	});
  		
       
            </script>
  </body>
</html>
