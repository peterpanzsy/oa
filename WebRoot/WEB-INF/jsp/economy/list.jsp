<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>财务管理</title>

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
          <h1 class="page-header">财务管理</h1>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>id</th>
                  <th>标题</th>
                  <th>发布人</th>
                  <th>更新时间</th>
                  <th>修改</th>
                  <th>删除</th>
                </tr>
              </thead>
              <tbody>
              
                 <s:iterator value="recordList" status="vs">
                            <s:hidden name="id">
                            </s:hidden>
                            <tr>
                            	<td>
                                    <s:property value="#vs.count"/>
                                </td>
                                <td>
                                    <s:property value="title"/>
                                </td>
                                <td>
                                    <s:property value="author.name"/>
                                </td>
                                <td>
                                    <s:date name="date" format="yyyy-MM-dd"/>
                                </td>
					            <td><s:a type="button" cssClass="btn btn-xs btn-primary" href="economy_editUI?id=%{id}">修改</s:a></td>
	                 			 <td><s:a type="button" cssClass="btn btn-xs btn-primary" href="economy_delete?id=%{id}">删除</s:a></td>
                            </tr>
                        </s:iterator>
      
              </tbody>
            </table>
            
          </div>
           
            <div class="btm">
            	<s:a type="button" cssClass="btn btn-sm btn-primary" href="economy_addUI">发布财务信息</s:a>
            </div>
         
            <!--这是新加的东东     -->
		  <div class="pages">
              <ul class="pagination col-sm-8">
                  <li>
                      <a href="javascript:gotoPage(1)">首页</a>
                  </li>
                  <s:iterator begin="%{beginPageIndex}" end="%{endPageIndex}" var="num">
                   <li>
                   <s:if test="#num == currentPage">
                       <span>${num}</span>
                   </s:if>
                   <s:else>
                       <span onclick="gotoPage(${num});">${num}</span>
                   </s:else>
                </li>
                  </s:iterator>
              <li>
                  <a href="javascript:gotoPage(${pageCount})">尾页</a>
              </li>
              </ul>
              <div class="col-sm-4 right">
                  <span>跳转至 </span>
                            <select id="pn" onchange="gotoPage(this.value)">
                            
                                <s:iterator begin="1" end="%{pageCount}" var="num">
                            		<s:if test=" #num == currentPage">
                                   	 <option value="${num}"  selected='selected'>${num}</option>
                                    </s:if>
                                    <s:else>
                                      <option value="${num}">${num}</option>
                                    </s:else>
                                </s:iterator>
                            </select>页 
                  <button class="btn btn-xs btn-primary" type="submit" value="GO">
                      GO
                  </button>
              </div>
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

    </script>
        <script type="text/javascript">
			function gotoPage(pageNum){
		      	  window.location.href = "economy_list.action?id=${id}&pageNum=" + pageNum;};
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