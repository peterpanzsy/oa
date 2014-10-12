<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- <title>iMiss小组办公自动化系统</title> -->

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
    
    

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <!--导航部分-->
    <nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="home_index">iMiss小组办公自动化系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav mynav">
            <li ><a href="home_index">首页</a></li>
            <li><a href="program_list">小组项目</a></li>
             <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">科研成果 <span class="caret"></span></a>
	            <ul class="dropdown-menu" role="menu">
		            <li><a href="paper_index">论文成果</a></li>
		            <li><a href="patent_index">专利成果</a></li>
		             <li><a href="award_index">获奖状况</a></li>
		      </ul>	
		      </li>            
             <li><a href="email_index">邮件群发</a></li>
             <li><a href="user_exhibition">小组成员</a></li>
            <li><a href="economy_index">财务信息</a></li>
            <li><a href="activity_list">活动信息</a></li>
             <li class="dropdown">
	         <a href="#" class="dropdown-toggle" data-toggle="dropdown">小组资源 <span class="caret"></span></a>
	          <ul class="dropdown-menu" role="menu">
	            <li><a href="home_resource">图书资源</a></li>
	            <li><a href="server_list">服务器资源</a></li>	            
	          </ul>
	        </li>
            <li><a href="#">关于网站</a></li>
            
          </ul>         
          <ul class="nav navbar-nav navbar-right">
            <li><a href="user_person">后台管理</a></li>            
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
    </body>
    </html>
 