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
						<li><a href="${url}">${name}</a>
						</li>
					</s:iterator>
				</ul>
			</div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">         
          <h1 class="page-header">论文管理</h1>
        <s:form action="paper_add" cssClass="form-horizontal" role="form" enctype="multipart/form-data">
          <s:token></s:token>
          <div class="table-responsive">
            <table class="table table-bordered">
              <caption>论文详细信息</caption>
                <!--三种颜色循环，直到结束，不够再循环-->
                <tr>
                  <td width="10%"><strong>论文类型 *</strong></td>
                  <td>
                  	<s:checkboxlist name="type" list="{'国际期刊','国际会议','国内期刊','国内期刊'}" value="'国际期刊'"></s:checkboxlist>
                  </td>
                </tr>
                <tr>
                  <td width="10%"><strong>作者 *</strong></td>
                  <td><input name="username" class="form-control" type="text" placeholder="请填入作者的姓名，用;号隔开" required></td>                  
                </tr>
       			 <tr>
                  <td width="10%"><strong>状态*</strong></td>
                  <td>
                  <s:radio name="state" list="{'已发表','审核中'}" value="'已发表'" ></s:radio>               
                </td>
                </tr>
                <tr>
                  <td width="10%"><strong>题名 *</strong></td>
                  <td><input name="name" class="form-control" type="text" required></td>                  
                </tr>
                <tr>
                  <td width="10%"><strong>刊名 *</strong></td>
                  <td><input name="magazineName" class="form-control" type="text" required></td>                  
                </tr>
                <tr>
                  <td width="10%"><strong>出版日期 *</strong></td>
                  <td><input name="publishTime" class="form-control" type="text" required></td>                  
                </tr>

                <tr>
                  <td width="10%"><strong>卷</strong></td>
                  <td><input name="juan" class="form-control" type="text"></td>                  
                </tr>
                <tr>
                  <td width="10%"><strong>期</strong></td>
                  <td><input name="qi" class="form-control" type="text"></td>                  
                </tr>
                <tr>
                  <td width="10%"><strong>所属项目	：</strong></td>
                  <td><input name="programName" placeholder="填入所属项目名称" class="form-control" type="text"></td>                  
                </tr>
                <tr>
                  <td width="10%"><strong>页码</strong></td>
                  <td><input name="pagination" class="form-control" type="text"></td>                  
                </tr>
                <tr>
                  <td width="10%"><strong>sci索引号</strong></td>
                  <td><input name="SCIIndex" class="form-control" type="text"></td>                  
                </tr>

<tr>
                  <td width="10%"><strong>ei索引号</strong></td>
                  <td><input name="EIIndex" class="form-control" type="text"></td>                  
                </tr>
                <tr>
                  <td width="10%"><strong>是否国内重要期刊</strong></td>
                  <td>
                  	<s:radio name="homeImportantArticle" list="#{0:'不是',1:'是'}" value="'1'"></s:radio>
                  		<!--  <input class="form-control" type="text">-->
                  </td>                  
                </tr>

<tr>
                  <td width="10%"><strong>是否国内核心期刊</strong></td>
                  <td>
                 	 <s:radio name="homeCoreArtile" list="#{0:'不是',1:'是'}" value="'1'"></s:radio>
                  	<!--  <input class="form-control" type="text">-->
                  	</td>                  
                </tr>

<tr>
                  <td width="10%"><strong>关键字</strong></td>
                  <td><input name="theme" class="form-control" type="text"></td>                  
                </tr>

<tr>
                  <td width="10%"><strong>摘要</strong></td>
                  <td><textarea name="summary" class="form-control" name="" id="" cols="30" rows="5"></textarea></td>                  
                </tr>


<tr>
                  <td width="10%"><strong>sci被引次数</strong></td>
                  <td><input name="SCIQuote" class="form-control" type="text"></td>                  
                </tr>

<tr>
                  <td width="10%"><strong>ei被引次数</strong></td>
                  <td><input name="EIQuote" class="form-control" type="text"></td>                  
                </tr>

     

                <tr>
                  <td width="10%"><strong>备注</strong></td>
                  <td><input name="description" class="form-control" type="text"></td>                  
                </tr>
                 <tr>
                  <td width="10%"><strong>附件</strong></td>
                  <td><input type="file" name="upload"></td>                  
                </tr>

            </table>  
            <p align="center">
             <button class="btn btn-primary" type="submit">确认修改</button>
             <!-- <button class="btn" >返回</button> -->
             </p>
           
          </div>
          </s:form>
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
          	$("a:contains('论文管理')").parent().attr('class',"active");
    });
    </script>
</body>
</html>