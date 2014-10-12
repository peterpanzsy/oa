<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="UTF-8">
  <title>专利成果</title>
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
      <a href="patent_list" class="btn btn-sm btn-warning" style="position:absolute; right:30px;top:14px;">添加专利</a>
        <div class="info_top resource_top">
          <p>
            <strong>专利成果</strong>
            <span>Patent</span>
          </p>
        </div>
        <div class="info_content resource_content">
        
 <!--服务器信息-->  
  <div class="book server">
        <form action="patent_search" class="form-horizontal" role="form" style="height:30px;">
       	 <button class="btn btn-primary btn-sm rt" type="submit">查询</button>
        <div class="input-group input-group-sm col-sm-4 rt">
          <span class="input-group-addon "><i class="glyphicon glyphicon-search"></i></span>
          <input name="searchContent" type="search" class="form-control" placeholder="请输入查询内容">          
        </div>
   		</form>
           <table style="margin-top:30px;" class="table table-striped">
            <tr>
              	<th>专利名称</th>
                <th>发明人</th>
                <th>授权公告号</th>
                <th>类型</th>
                <th>备注</th>
            </tr>
                 <s:iterator value="recordList">
                            <tr>
                                <td>
                                    <s:property value="name"/>
                                </td>
                                <td>
                                    <s:iterator value="invertors">
                                    	<s:property value="name"/>
                                    </s:iterator>
                                </td>
                                <td>
                                    <s:property value="authorizationNumber"/>
                                </td>
                                <td>
                                    <s:property value="type"/>
                                </td>
                                <td>
                                    <s:property value="description"/>
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
                                    <option value="${num}">${num}</option>
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


    
     <!-- <div class="col-md-4">
        <div class="link1"><a href="http://www.xjtu.edu.cn" target="blank"><img width="100" src="images/xjtu_logo.jpg" alt=""><br>西安交通大学<br><span>www.xjtu.edu.cn</span></a></div>
        <div class="link2"><a href="http://nskeylab.xjtu.edu.cn" target="blank"><p>智能网络与网络安全教育部重点实验室</p><p class="bottom"><span>http://nskeylab.xjtu.edu.cn</span><img src="images/go.png" alt=""></p></a></div>
        <div class="link3"><a href="http://www.sei.xjtu.edu.cn/" target="blank"><p>系统工程研究所<br><span>http://www.sei.xjtu.edu.cn/</span></p><img src="images/go.png" alt=""></a></div>
        <div class="link4"><a href="http://www.cfins.au.tsinghua.edu.cn" target="blank"><p>智能与网络化系统研究中心<br><span>http://www.cfins.au.tsinghua.edu.cn</span></p><img src="images/go.png" alt=""></a></div>
      </div>-->

  
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
               window.location.href = "patent_index.action?pageNum=" + pageNum;
           };
    </script>
</body>
</html>