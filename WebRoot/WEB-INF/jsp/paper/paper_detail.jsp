<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="UTF-8">
  <title>论文成果</title>
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
  <div class="container infowrap" style="position:relative;">
    <!-- <div class="row">
      <div class="col-md-8">-->
<!--       <a href="paper_list" class="btn btn-sm btn-warning" style="position:absolute; right:30px;top:14px;">添加论文</a>
 -->        <div class="info_top resource_top">
          <p>
            <strong>论文成果</strong>
            <span>Paper</span>
          </p>
        </div>
        <div class="info_content">
     
 <!--论文详情-->  
  <div class="book server paper">       
           <table class="table table-bordered table-striped table-hover">
              <caption>论文详细信息</caption>
                <!--三种颜色循环，直到结束，不够再循环-->
                <tr>
                  <td width="10%"><strong>论文类型 *</strong></td>
                  <td>${type}</td>                  
                </tr>
               <tr>
                  <td width="10%"><strong>状态 *</strong></td>
                  <td>${state}</td>                  
                </tr>
                <tr>
                  <td width="10%"><strong>作者 *</strong></td>
                  <td>
                  	     <!-- <s:iterator value="authors">
                        	<s:property value="name"/>
                     	 </s:iterator> -->
                     	 ${username}
                  </td>                  
                </tr>
                <tr>
                  <td width="10%"><strong>题名 *</strong></td>
                  <td>${name}</td>                  
                </tr>
                <tr>
                  <td width="10%"><strong>刊名 *</strong></td>
                  <td>${magazineName}</td>                  
                </tr>
                <tr>
                  <td width="10%"><strong>发表日期 *</strong></td>
                  <td>${publishTime}</td>                  
                </tr>
                <tr>
                  <td width="10%"><strong>卷</strong></td>
                  <td>${juan}</td>                  
                </tr>
                <tr>
                  <td width="10%"><strong>期</strong></td>
 					<td>${qi}</td>
                </tr>
                <tr>
                  <td width="10%"><strong>页码</strong></td>
					<td>${pagination}</td>
	                </tr>

				<tr>
                  <td width="10%"><strong>sci索引号</strong></td>
					<td>${SCIIndex}</td>
                </tr>

				<tr>
                  <td width="10%"><strong>ei索引号</strong></td>
					<td>${EIIndex}</td>
                </tr>
                <tr>
                  <td width="10%"><strong>是否国内重要期刊</strong></td>
                  <td>
                 	<s:if test="homeImportantArticle==0">
                 		
                 	</s:if>
                 	<s:else>
                 		是
                 	</s:else>
                  </td>                  
                </tr>

<tr>
                  <td width="10%"><strong>是否国内核心期刊</strong></td>
				<td>
                 	<s:if test="homeCoreArtile==0">
                 		
                 	</s:if>
                 	<s:else>
                 		是
                 	</s:else>
                  </td>
                </tr>

<tr>
                  <td width="10%"><strong>关键字</strong></td>
                  <td>
                  	${theme}
                  </td>                  
                </tr>

<tr>
                  <td width="10%"><strong>摘要</strong></td>
                  <td>${summary}</td>                  
                </tr>


<tr>
                  <td width="10%"><strong>sci被引次数</strong></td>
                  <td>${SCIQuote}</td>                  
                </tr>

<tr>
                  <td width="10%"><strong>ei被引次数</strong></td>
                  <td>${EIQuote}</td>                  
                </tr>
				<s:if test=" file !=null">
	                 <tr>
	                  <td width="10%"><strong>附件</strong></td>
	                  <td><a href="filedown_download?id=${file.id}">点击下载</a></td>                  
	                </tr>
   				 </s:if>
            </table>  
        
<br>	
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

        })

    </script>
</body>
</html>