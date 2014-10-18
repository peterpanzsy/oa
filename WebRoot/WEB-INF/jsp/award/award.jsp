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
</head>
<body>
 <s:include value="/WEB-INF/jsp/Navi-bar/Navi-bar.jsp"/>
<!--公告列表-->
  <div class="container infowrap" style="position:relative;">
    <!-- <div class="row">
      <div class="col-md-8">-->
<!--       <a href="admin_paper.html" class="btn btn-sm btn-warning" style="position:absolute; right:30px;top:14px;">添加我的获奖</a>
 -->        <div class="info_top resource_top">
          <p>
            <strong>获奖</strong>
            <span>award</span>
          </p>
        </div>
        <div class="info_content resource_content">
        
 <!--服务器信息-->  
  <div class="book server">
        <form action="award_search" class="form-horizontal" role="form" style="height:30px;">
        	<button class="btn btn-primary btn-sm rt" type="submit">查询</button>
		        <div class="input-group input-group-sm col-sm-4 rt">
		          <span class="input-group-addon "><i class="glyphicon glyphicon-search"></i></span>
		          <input name="searchContent" type="search" class="form-control" placeholder="请输入查询内容">          
		        </div>
   		</form>
           <table style="margin-top:30px;" class="table table-striped">
              <tr>
              	<th>获奖等级</th>
                <th>获奖项目名称</th>
                <th>获奖者姓名</th>
                <th>奖项名称</th>
                <th>获奖时间</th>
                <th>研究方向</th>
              </tr>
                <s:iterator value="recordList">
                	<tr>
						<td>
							<s:property value="grade"/> 
						</td>     
						<td>
							<s:property value="programName"/> 
						</td>       
						<td>
							<s:property value="username"/> 
						</td>   
						<td>
							<s:property value="name"/> 
						</td>   
						<td>
							<s:property value="date" />
						</td>   
						<td>
							<s:property value="researchInterests"/>
						</td>    		
                	</tr>
                </s:iterator>
            </table>  
       <!--这是新加的东东-->
                    <div class="pages">
                        <ul class="pagination col-sm-8">
                            <li>
                                <a href="javascript:gotoPage(1)">首页</a>
                            </li>
                            <s:iterator begin="%{beginPageIndex}" end="%{endPageIndex}" var="num">
                            <li>
                            <!-- 当前页无链接，非当前页面有链接 -->
                            <s:if test=" #num == currentPage">
                                <span>${num}</span>
                            </s:if>
                            <s:else>
                                <span  onclick="gotoPage(${num});">${num}</span>
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
		/**
          * 跳到指定的页码
          */
         function gotoPage(pageNum){
             window.location.href = "award_index.action?pageNum=" + pageNum;
         };
    </script>
</body>
</html>