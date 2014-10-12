<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>科研管理</title>

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
          <h1 class="page-header">论文管理</h1>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>论文名称</th>
                  <th>作者</th>
                  <th>所属项目</th>
                  <th>出版刊物</th>
                  <th>发表时间</th>
                  <th>备注</th>
                  <th>修改</th>
                  <th>删除</th>
                </tr>
              </thead>
              <tbody>
                <s:iterator value="recordList">
                            <tr id="${id}">
                                <td>
                                    <s:property value="name"/>
                                </td>
                                <td>
                                    <s:iterator value="authors">
                                    	<s:property value="name"/>
                                    </s:iterator>
                                </td>
                                <td>
                                    <s:property value="program.name"/>
                                </td>
                                <td>
                                    <s:property value="magazineName"/>
                                </td>
                                <td>
                                    <s:property value="publishTime"/>
                                </td>
                                <td>
                                    <s:property value="description"/>
                                </td>
                                 <td >
                                 	<a href="paper_editUI?id=${id}">
	                                	 <button type="button" class="btn btn-xs btn-primary">修改</button>
                                	</a>
                                </td>
				                  
				                  <td>
				                  		<a href="paper_delete?id=${id}">
					                  		<button type="button" class="btn btn-xs btn-primary">删除</button>
				                		</a>
				                  </td>
                                
                            </tr>
                        </s:iterator>
            </table>  
             <div class="btm"><a href="paper_addUI">
            		<button type="button" class="btn btn-sm btn-primary" >添加新论文</button><span></span>
            	</a>
            </div>
            

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">添加新论文</h4>
      </div>
      <div class="modal-body">
          <s:form action="paper_add" cssClass="form-horizontal" role="form" enctype="multipart/form-data">
                <div class="form-group">
                  <label class="col-sm-4 control-label">论文名称：</label>
                  <div class="col-sm-6">
                    <input name="name" type="text" class="form-control" placeholder="填入论文名称" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">关键字：</label>
                  <div class="col-sm-6">
                    <input name="theme" type="text" class="form-control" placeholder="填入关键字" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">所属项目：</label>
                  <div class="col-sm-6">
                  <!-- 个人所属项目的列表，用列表的形式来展示 -->
                    <input name="programName" type="text" class="form-control" placeholder="填入所属项目" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">其他作者：</label>
                  <div class="col-sm-6">
                  <!-- 个人所属项目的列表，用列表的形式来展示 -->
                    <input name="username" type="text" class="form-control" placeholder="其他作者的登录名，用;号隔开" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">出版刊物：</label>
                  <div class="col-sm-6">
                    <input name="magazineName" type="text" class="form-control" placeholder="填入出版刊物" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">出版时间：</label>
                  <div class="col-sm-6">
                    <input name="publishTime" type="text" class="form-control" placeholder="填入出版时间：例2014" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">备注：</label>
                  <div class="col-sm-6">
                    <input name="description" type="text" class="form-control" placeholder="填入备注" >
                  </div>
                </div>
               <div class="form-group">
                  <label class="col-sm-4 control-label">摘要：</label>
                  <div class="col-sm-6">
                    <s:textarea name="summary" type="text" cssClass="form-control" placeholder="填入论文摘要" ></s:textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">论文上传：</label>
                  <div class="col-sm-6">
                    <input name="upload" type="file">
                  </div>
                </div>
            	<div class="modal-footer">
		        <button type="submit" class="btn btn-primary">确定添加</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        
		      </div>
              </s:form>
      </div>
    
    </div>
  </div>
</div>

<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">修改论文信息</h4>
      </div>
      <div class="modal-body">
           <form  action="paper_edit" class="form-horizontal" role="form">
               <s:hidden id="paper_id" name="id" value=""></s:hidden>
               <div class="form-group">
                  <label class="col-sm-4 control-label">论文名称：</label>
                  <div class="col-sm-6">
                    <input id="paper_name" name="name" type="text" class="form-control" placeholder="填入论文名称" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">关键字：</label>
                  <div class="col-sm-6">
                    <input id="paper_theme" name="theme" type="text" class="form-control" placeholder="填入关键字" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">所属项目：</label>
                  <div class="col-sm-6">
                  <!-- 个人所属项目的列表，用列表的形式来展示 -->
                    <input id="paper_programName" name="programName" type="text" class="form-control" placeholder="填入所属项目" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">作者：</label>
                  <div class="col-sm-6">
                  <!-- 个人所属项目的列表，用列表的形式来展示 -->
                    <input id="paper_username" name="username" type="text" class="form-control" placeholder="其他作者的登录名，用;号隔开" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">出版刊物：</label>
                  <div class="col-sm-6">
                    <input id="paper_magazineName" name="magazineName" type="text" class="form-control" placeholder="填入出版刊物" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">出版时间：</label>
                  <div class="col-sm-6">
                    <input id="paper_publishTime" name="publishTime" type="text" class="form-control" placeholder="填入出版时间：例2014" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">备注：</label>
                  <div class="col-sm-6">
                    <input id="paper_description" name="description" type="text" class="form-control" placeholder="填入备注" >
                  </div>
                </div>
               <div class="form-group">
                  <label class="col-sm-4 control-label">摘要：</label>
                  <div class="col-sm-6">
                    <input id="paper_summary" name="summary" type="text" class="form-control" placeholder="填入论文摘要" >
                  </div>
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