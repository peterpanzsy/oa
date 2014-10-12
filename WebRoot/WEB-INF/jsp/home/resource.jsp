<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="UTF-8">
  <title>小组资源</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
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
        <div class="info_top resource_top">
          <p>
            <strong>小组资源</strong>
            <span>Resource</span>
          </p>
        </div>
        <div class="info_content resource_content">
        <!--图书信息-->
        <div class="book">
        <p>图书资源</p>
        <form class="form-horizontal" role="form">
        <button class="btn btn-warning btn-sm rt" type="submit">图书查询</button>
        <div class="input-group input-group-sm col-sm-4 rt">
          <span class="input-group-addon "><i class="glyphicon glyphicon-search"></i></span>
          <input type="search" class="form-control" placeholder="请输入查询内容">          
        </div>
    </form>
	         <table class="table table-striped"> 
	         <tr>            
             	<th>书名</th>
                <th>作者</th>
                <th>书柜号</th>
                <th>出版社</th>
                <th>出版年份</th>
             </tr>
              <s:iterator value="recordList">
             	<s:hidden name="id"></s:hidden>
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
                 <td>
                     <s:property value="time"/>
                 </td>
               </tr>
             </s:iterator>
            </table>	
			</div>
			
			 <!-- 与分页有关的东东  -->
			<div>
				<div>
					页次:${currentPage}/${pageCount}页&nbsp;
					总记录数:${recordCount}条
				</div>
				<div>
					<a href="javascript:gotoPage(1)">首页</a>
					<s:iterator begin="%{beginPageIndex}" end="%{endPageIndex}" var="num">
						<!-- 当前页无链接，非当前页面有链接 -->
						<s:if test=" #num == currentPage">
							<span>${num}</span>
						</s:if>
						<s:else>
							<span onclick="gotoPage(${num});">${num}</span>
						</s:else>
					</s:iterator>
					
					<a href="javascript:gotoPage(${pageCount})">尾页</a>&nbsp;
					转到:
					<select id="pn" onchange="gotoPage(this.value)">
						<s:iterator begin="1" end="%{pageCount}" var="num">
							<option value="${num}">${num}</option>
						</s:iterator>
					</select>					
				</div>
			
			
          </div>  
 <!--服务器信息-->  
  <div class="book server">
        <p>服务器资源</p>
        <form class="form-horizontal" role="form">
        <button class="btn btn-primary btn-sm rt" type="submit">服务器查询</button>
        <div class="input-group input-group-sm col-sm-4 rt">
          <span class="input-group-addon "><i class="glyphicon glyphicon-search"></i></span>
          <input type="search" class="form-control" placeholder="请输入查询内容">          
        </div>
    </form>
           <table class="table table-striped">
             <tr>
              <th>位置</th>
                <th>ip</th>
                <th>操作系统</th>
                <th>配置</th>
                <th>当前用途</th>
                <th>负责人</th>
                <th>备注</th>
              </tr>
             <s:iterator value="serversList">
             	<s:hidden name="id"></s:hidden>
             <tr>
                 <td>
                     <s:property value="address"/>
                 </td>
                 <td>
                     <s:property value="ip"/>
                 </td>
                 <td>
                     <s:property value="system"/>
                 </td>
                 <td>
                     <s:property value="configure"/>
                 </td>
                 <td>
                     <s:property value="purpose"/>
                 </td>
                 <td>
                     <s:property value="username"/>
                 </td> 
                 <td>
                     <s:property value="description"/>
                 </td>
                 
                 <tr/>
		 	</s:iterator>
		 	
            </table>  

      </div>
    </div>  
  </div>
  
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

        });
        $("#pn").val("${currentPage}");
        /**
        * 跳到指定的页码
        */
		function gotoPage(pageNum){
			window.location.href ="home_resource.action?id=${id}&pageNum="+pageNum;
		};
    </script>
</body>
</html>