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
    <link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet">
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
          <a class="navbar-brand" href="index.html">iMiss小组办公自动化系统</a>
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
          <h1 class="page-header">iMiss小组人员情况</h1>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>用户名</th>
                  <th>真实姓名</th>
                  <th>性别</th>
                  <th>联系方式</th>
				  <th>生日</th>
                  <th>角色</th>
				  <th>学历</th>
                  <th>修改</th>
				  <th>删除</th>
                </tr>
              </thead>
              <tbody>
             <s:iterator value="userList">
             	<s:hidden name="id"></s:hidden>
             <tr>
                 <td>
                     <s:property value="loginName"/>
                 </td>
                 <td>
                     <s:property value="name"/>
                 </td>
                 <td>
                     <s:property value="gender"/>
                 </td>
				 <td>
                     <s:property value="phone"/>
                 </td>
				<td>
                     <s:property value="birthday"/>
                 </td>
                 <td>
                     <s:iterator value="roles">
                         ${name}
                     </s:iterator>
                 </td>
                 <td>
                     <s:property value="education"/>
                 </td>
                 <td>
                     <s:a href="user_delete?id=%{id}">
                         <button type="button" class="btn btn-xs btn-primary">删除</button>
                     </s:a>
                 </td>
                 <td>
                     <s:a href="user_delete?id=%{id}"></s:a>
                     <button type="button" class="btn btn-xs btn-primary">修改</button>
                 </td>
                 <tr/>
		 	</s:iterator>
            
              </tbody>
            </table>
            <div class="btm">
            	<button type="button" class="btn btn-sm btn-primary">增加成员</button><span></span>
            </div>
          </div>
        </div>
      </div>
    </div>

</body>
</html>