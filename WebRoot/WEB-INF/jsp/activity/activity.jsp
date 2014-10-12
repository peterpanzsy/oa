<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="UTF-8">
  <title>活动信息</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/photopile.css">
    <link href="css/kendo.common.min.css" rel="stylesheet" />
    <link href="css/kendo.default.min.css" rel="stylesheet" />
    <link href="css/kendo.dataviz.min.css" rel="stylesheet" />
    <link href="css/kendo.dataviz.default.min.css" rel="stylesheet" /> 
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=6hzVTKs2yIdfyvCYS7OkGgaj"></script>   
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
 <s:include value="/WEB-INF/jsp/Navi-bar/Navi-bar.jsp"/>
<!--公告列表-->
  <div class="container infowrap">
    <!-- <div class="row">
      <div class="col-md-8">-->
        <div class="info_top">
          <p>
            <strong>活动信息</strong>
            <span>Activities</span>
          </p>
        </div>
        <div class="activity_content">
          <h1>活动照片墙</h1>
          <div class="photopile-wrapper">
            <ul class="photopile">
              <!-- <li>
                <a href="images/paojie.jpg">
                  <img src="images/paojie.jpg" alt="Barton Dam, Ann Arbor, Michigan" width="133" height="100" />
                </a>
              </li> -->
             
            </ul>
          </div>
          <div id="activity_calendar">
            <div id="title">活动日历</div>
            <div id="calendar" class="col-sm-5"></div>
            <div id="calendar_events" class="col-md-7">
              <h2>活动事件详情</h2>
              <div class="col-md-4">
                  <p><strong>活动名称：</strong><span id="activityTitle"></span></p>
                  <p><strong>活动地点：</strong><span id="activityPlace"></span></p>
                  <p><strong>活动简介：</strong><span id="activitySummary"></span></p>
                  <p><strong>活动人数：</strong><span id="activityNumber"></span></p>
                  <p><strong>活动类别：</strong><span id="activityType"></span></p>
              </div>
              <div class="col-md-8">
                <div id="baidu_map"></div>
              </div>
            </div>
          </div>
        </div>  
  </div>
  <s:iterator  value="#activitylist">
	          	 <div id="ac${id}" style="display:none">
	          	  <p class="ac_id" >${id}</p>
	          	  <p class="ac_date">${date}</p>
	          	  </div>
          	</s:iterator> 
<!--footer部分-->
  <footer class="footer">
    <div class="ftbq">
      版权所有© 2014-2015 西安交通大学智能网络与网络安全教育部重点实验室iMiss小组
    </div>
  </footer>

    <script src="js//jquery-1.11.1.min.js"></script>
    <script> 
      $(function(){
        $('.container .infomation li').mouseover(function(){
          $(this).addClass('active');
        }).mouseout(function(){
          $(this).removeClass('active');
        });
      })   
    </script>
     <script src="js/bootstrap.min.js"></script>
     <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/photopile.js"></script>
    <script src="js/angular.min.js"></script>
    <script src="js/kendo.all.min.js"></script>
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
    <!--活动日历-->
    <script>
            $(document).ready(function() {
            //activityid和activitydate分别用于存放获取到的activity信息，位置一一对应 	
            var i=0;
            var activityid=new Array();
            var activitydate=new Array();
            //获取valuestacks内的activitylist数据
            <s:iterator value="#activitylist">
            activityid[i]=${id};
            activitydate[i]='${date}';
            i=i+1;
            	</s:iterator>
            	
                 var today = new Date();//设定默认时间为今天
                 var events = [ ];//事件数组
                    
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
                 var bool_today=0;
                 
                 //今天是否有事件？有事件则直接显示
                 if(calendar.value().toDateString()==today.toDateString()){
			console.log(today.toDateString());
                 	var value = calendar.value();
 					
 					//匹配日期时间
 					for(var k=0;k<activitydate.length;k++){
 					if(value.toDateString()==activitydate[k].toDateString())
 					{matcharrayid=k;bool_today=1;};
 					};
 					matchid=activityid[matcharrayid];
 					
 					if(bool_today){
 					//ajax请求数据
 					$.post("activity_showDetail",{id:matchid},function(data){
 						$("#activityTitle").text(data.title);
 						$("#activityPlace").text(data.place);
 						$("#activitySummary").text(data.summary);
 						$("#activityNumber").text(data.number);
 						$("#activityType").text(data.type);
  						localsearch(data.place);
 					
 					});
 					};
                 };
                 
                 
                 //当选中日期变化时触发函数
		calendar.bind("change", function() {
		var value = this.value();
		
		//匹配日期时间
		for(var k=0;k<activitydate.length;k++){
		if(value.toDateString()==activitydate[k].toDateString())
		{matcharrayid=k;};
		};
		
		matchid=activityid[matcharrayid];
		
		//ajax请求数据
		$.post("activity_showDetail",{id:matchid},function(data){
			$("#activityTitle").text(data.title);
			$("#activityPlace").text(data.place);
			$("#activitySummary").text(data.summary);
			$("#activityNumber").text(data.number);
			$("#activityType").text(data.type);
				localsearch(data.place);
		});
		});
	});
            </script>

    <!--百度地图-->
    <script type="text/javascript">
      
    var local=0;
      //初始化百度地图
    $(function(){
          var map = new BMap.Map("baidu_map");          // 创建地图实例  
			var point = new BMap.Point(108.99059,34.25248);  // 创建点坐标  
			map.centerAndZoom(point, 15);                 // 初始化地图，设置中心点坐标和地图级别  
			map.addControl(new BMap.NavigationControl());
			local = new BMap.LocalSearch("西安市", {renderOptions:{map: map,autoViewport: true},pageCapacity:6});
    });
      //搜索函数
      function localsearch(place)
      {
    	  local.search(place);
      };
    </script>  
</body>
</html>