<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="UTF-8">
  <title>财务信息</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
 <s:include value="/WEB-INF/jsp/Navi-bar/Navi-bar.jsp"/>
<!--公告列表-->
  <div class="container infowrap">
     <div class="row">
      <div class="col-md-8">
        <div class="info_top economy_top">
          <p>
            <strong>财务信息</strong>
            <span>Economy</span>
          </p>
        </div>
            <div class="info_content">
          <ul class="infomation">
            <s:iterator value="recordList">
            	 <li><a href="economy_show?id=${id}"><s:property value="title"/></a><span><s:date name="date" format="yyyy-MM-dd" /></span></li>
            </s:iterator>
          </ul>
         <!--这是新加的东东-->
                   		  <div class="pages">
              <ul class="pagination col-sm-9">
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
              <div class="col-sm-3 right">
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
              </div>
          </div>
            
        </div>
      </div>
      <div class="col-md-4">
        <div class="link1"><a href="http://www.xjtu.edu.cn" target="blank"><img width="100" src="images/xjtu_logo.jpg" alt=""><br>西安交通大学<br><span>www.xjtu.edu.cn</span></a></div>
        <div class="link2"><a href="http://nskeylab.xjtu.edu.cn" target="blank"><p>智能网络与网络安全教育部重点实验室</p><p class="bottom"><span>http://nskeylab.xjtu.edu.cn</span><img src="images/go.png" alt=""></p></a></div>
        <div class="link3"><a href="http://www.sei.xjtu.edu.cn/" target="blank"><p>系统工程研究所<br><span>http://www.sei.xjtu.edu.cn/</span></p><img src="images/go.png" alt=""></a></div>
        <div class="link4"><a href="http://www.cfins.au.tsinghua.edu.cn" target="blank"><p>智能与网络化系统研究中心<br><span>http://www.cfins.au.tsinghua.edu.cn</span></p><img src="images/go.png" alt=""></a></div>
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
              </script>
       <script type="text/javascript">
		function gotoPage(pageNum){
	      	  window.location.href = "economy_index.action?id=${id}&pageNum=" + pageNum;
	  	  };
       </script>

</body>
</html>