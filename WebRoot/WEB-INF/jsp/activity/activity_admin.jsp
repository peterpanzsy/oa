<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>活动管理</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	 	  <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="home_index">iMiss小组办公自动化系统</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="loginout_logout">登出</a></li>      
          </ul>
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
           <s:iterator value="#session.topPrivileg">
          		<li><a href="${url}">${name}</a></li>
          	</s:iterator>
          </ul>    
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">         
          <h1 class="page-header">活动管理</h1>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>活动名称</th>
                  <th>活动地点</th>
                  <th>活动简介</th>
                  <th>活动人数</th>
                  <th>活动类别</th>
                  <th>活动时间</th>
                  <th>修改</th>
                  <th>删除</th>
                </tr>
              </thead>
              <tbody>
                
                <s:iterator value="activitylist">
                <tr id="${id}">
                <td class="title"><s:property value="title"/></td>
                <td class="place"><s:property value="place"/></td>
                <td class="summary"><s:property value="sunmmary"/></td>
                <td class="number"><s:property value="number"/></td>
                <td class=type><s:property value="type"/></td>
                <td class="date"><s:date name="%{date}" format="yyyy-MM-dd"/></td>
                <td class="edit"><s:a href="#id=%{id}">
                <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#myModal3">修改</button></s:a></td>
                <td><s:a href="activity_delete?id=%{id}" onclick="return confirm('你确定要删除吗')">
                <button type="button" class="btn btn-xs btn-primary">删除</button></s:a></td>
                </tr>
                </s:iterator>
                
              </tbody>
            </table>
            <div class="btm">
            	<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal2">添加活动</button>
<!--             	<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal2">添加照片</button>
 -->            </div>
          </div>
        </div>
      </div>
    </div>

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">添加活动</h4>
      </div>
      <div class="modal-body">
          <form action="activity_add" class="form-horizontal" role="form">
          	<s:token></s:token>
                <div class="form-group">
                  <label class="col-sm-4 control-label">活动名称：</label>
                  <div class="col-sm-6">
                    <input type="text" name="title" class="form-control" placeholder="填入活动名称" required>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">活动地点：</label>
                  <div class="col-sm-6">
                    <input type="text" name="place" class="form-control" placeholder="不用加入省份和市名" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">活动简介：</label>
                  <div class="col-sm-6">
                    <textarea type="text" name="summary" class="form-control" placeholder="填入活动简介" ></textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">活动人数：</label>
                  <div class="col-sm-6">
                    <input type="text" name="number" class="form-control" placeholder="填入活动人数" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">活动类别：</label>
                  <div class="col-sm-6">
                     <label class="radio-inline">
                    <input type="radio" name="type" id="inlineRadio1" value="科研" checked="checked"> 科研
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="type" id="inlineRadio2" value="体育"> 体育
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="type" id="inlineRadio3" value="娱乐"> 娱乐
                  </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">活动时间：</label>
                  <div class="input-group date form_date col-sm-6" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form-control" name="date" size="16" type="text" value="" readonly required>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                 <input type="hidden" id="dtp_input2" value="" />
                </div>
				<div class="modal-footer">
        		<button type="submit" class="btn btn-primary">确定添加</button>
        		<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          </div>
              </form>
      
      
        
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">修改活动信息</h4>
      </div>
      <div class="modal-body">
          <form action="activity_edit" class="form-horizontal" role="form">
                <input type="hidden" name='id' value="0" id="activityId" />
                <div class="form-group">
                  <label class="col-sm-4 control-label">活动名称：</label>
                  <div class="col-sm-6">
                    <input type="text" name="title" id="activityTitle" class="form-control" placeholder="填入活动名称" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">活动地点：</label>
                  <div class="col-sm-6">
                    <input type="text" name="place" id="activityPlace" class="form-control" placeholder="填入活动地点" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">活动简介：</label>
                  <div class="col-sm-6">
                    <textarea type="text" name="summary" id="activitySum" class="form-control" placeholder="填入活动简介" ></textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">活动人数：</label>
                  <div class="col-sm-6">
                    <input type="text" name="number" id="activityNum" class="form-control" placeholder="填入活动人数" >
                  </div>
                </div>
                <div class="form-group activityType">
                  <label class="col-sm-4 control-label">活动类别：</label>
                  <div class="col-sm-6">
                     <label class="radio-inline">
                    <input type="radio" name="type" id="inlineRadio4" value="科研" > 科研
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="type" id="inlineRadio5" value="体育" > 体育
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="type" id="inlineRadio6" value="娱乐"> 娱乐
                  </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">活动时间：</label>
                  <div class="input-group date form_date col-sm-6" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form-control" name="date" id="activityDate" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                 <input type="hidden" id="dtp_input2" value="" />
                </div>
 				<div class="modal-footer">
        	<button type="submit" class="btn btn-primary">修改信息</button>
        	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        
      		</div>
          
              </form>
      </div>
      
    </div>
  </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js//jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
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
    
    <script>
    $(function(){
    	   $('.edit').click(function(){
    	   var $parent = $(this).parents();
    	   var type=$parent.children('.type').text();
    	   console.log(type);
    	   $("#activityId").attr('value',$parent.attr('id'));
    	   $("#activityTitle").attr('value',$parent.children('.title').text());
    	   $("#activityPlace").attr('value',$parent.children('.place').text());
    	   $("#activitySum").attr('value',$parent.children('.summary').text());
    	   $("#activityNum").attr('value',$parent.children('.number').text());
    	   $("#activityDate").attr('value',$parent.children('.date').text());
    	   if(type=="科研"){$("#inlineRadio4").attr('checked',"checked");}
    	   if(type=="体育"){$("#inlineRadio5").attr('checked',"checked");}
    	   if(type=="娱乐"){$("#inlineRadio6").attr('checked',"checked");}
    	   });
    	   });
    </script>
    
    <script>
    $(function(){
    var name=$('.page-header').text();
    console.log(name);
    <s:iterator value="#session.topPrivileg">
          	var PrivilegName='${name}';
          	if(name==PrivilegName){
          	$("a:contains("+PrivilegName+")").parent().attr('class',"active");
          	}
          	</s:iterator> 
    });
    </script>
    
</body>
</html>