<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="UTF-8">
  <title>小组项目</title>
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
      <a class="btn btn-warning rt" data-toggle="modal" data-target="#myModal2">建立项目</a>
        <div class="info_top resource_top">
          <p>
            <strong>小组项目</strong>
            <span>Project</span>
          </p>
        </div>
        <div class="info_content resource_content project_content">
        <div class="row">
       
		<s:iterator value="recordList">
		 <div class="col-sm-6 col-md-4"">
		    <div class="thumbnail">      
		      <div class="caption" id="${id}">
		        <h3>${name}</h3>
		        <p><strong>结题状态：</strong>
		        <s:if test="end==0">
		        	<span class="label label-danger">正在进行时</span>
		        </s:if>
		        <s:else>
		       		 <span class="label label-success">已结题</span>
		        </s:else>
		        <!--  
		        <span class="label label-success">
					<s:property value="%{end==0?'正在进行时':'已结束'}"/>
				</span>
				-->
				</p>
		        <p><strong>负责人：</strong>${leader.name}</p>
		        <p><strong>小组成员：</strong>
		        	<s:iterator value="users">
		        		<s:property value="name"/>
		        	</s:iterator>
		        </p>
		        <p><strong>项目最新进展：${currentTrend.content}</strong>
		        </p>		        
		        <p><strong>项目进度：</strong></p>
				<s:if test="%{proceeding==('立项阶段')}">
			         <div class="progress">
					  <div class="progress-bar progress-bar-danger progress-bar-striped active" style="width: 5%">
					    <span class="sr-only">立项阶段</span>
					  </div>
					  </div>
				  </s:if>
				   <s:elseif test="%{proceeding==('准备阶段')}">
				   <div class="progress">
					   			<div class="progress-bar progress-bar-warning progress-bar-striped active" style="width: 15%">
				   					 <span class="sr-only">准备阶段</span>
				 				 </div>
						  </div>
				  </s:elseif>
				  <s:elseif test="%{proceeding==('开发前期')}">
				   <div class="progress">
					   		 <div class="progress-bar progress-bar-info progress-bar-striped active" style="width: 30%">
							    <span class="sr-only">开发前期</span>
							  </div>
						  </div>
				  </s:elseif>
				  <s:elseif test="%{proceeding==('开发中期')}">
				   <div class="progress">
					   <div class="progress-bar progress-bar-info progress-bar-striped active" style="width: 50%">
				    		<span class="sr-only">开发中期</span>
				 		 </div>
					  </div>
				  </s:elseif>
				  <s:elseif test="%{proceeding==('开发后期')}">
				   		<div class="progress">
					   		<div class="progress-bar progress-bar-info progress-bar-striped active" style="width: 80%">
					    		<span class="sr-only">开发后期</span>
					 		 </div>
					  </div>
				  </s:elseif>
				  <s:elseif test="%{proceeding==('整合结题')}">
				   		<div class="progress">
					   		<div class="progress-bar progress-bar-success progress-bar-striped active" style="width: 100%">
					    		<span class="sr-only">整合结题</span>
					 		 </div>
					  </div>
				  </s:elseif>
		        <div class="button"><button class="btn btn-warning" data-toggle="modal" data-target=".bs-example-modal-lg">查看详细 </button></div>
		      </div>
		    </div>
		  </div>
		</s:iterator>
		
		</div>
		
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
                        <div class="col-sm-4 right"><span>跳转至 </span><select id="pn" onchange="gotoPage(this.value)">
						  <s:iterator begin="1" end="%{pageCount}" var="num">
                            		<s:if test=" #num == currentPage">
                                   	 <option value="${num}"  selected='selected'>${num}</option>
                                    </s:if>
                                    <s:else>
                                      <option value="${num}">${num}</option>
                                    </s:else>
                                </s:iterator>
					</select>页 <button class="btn btn-xs btn-primary" type="submit" value="GO">GO</button></div>
          </div>
                    </div>
                </div>
  
<!--footer部分-->
  <footer class="footer">
    <div class="ftbq">
      版权所有© 2014-2015 西安交通大学智能网络与网络安全教育部重点实验室iMiss小组
    </div>
  </footer>

<!-- 建立项目 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">建立项目</h4>
      </div>
      <div class="modal-body">
          <form class="form-horizontal" role="form" action="program_add">
              <s:token></s:token>
                <div class="form-group">
                  <label class="col-sm-4 control-label">项目名称：</label>
                  <div class="col-sm-6">
                    <input name="name" type="text" class="form-control" placeholder="填入项目名称" >
                  </div>
                </div>
          		<div class="form-group">
                  <label class="col-sm-4 control-label">小组成员：</label>
                  <div class="col-sm-6">
                    <input name="usernames" type="text" class="form-control" placeholder="输入小组成员loginName，以分号分隔" >
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-sm-4 control-label">项目简介：</label>
                  <div class="col-sm-6">
                    <textarea name="description" class="form-control" rows="5" placeholder="填入项目简介"></textarea>
                  </div>
                </div>                
            <div class="modal-footer">
		        <s:submit cssClass="btn btn-warning" value="建立项目"></s:submit>
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        
      		</div>
              </form>
      </div>

    </div>
  </div>
</div>

<!--项目详细信息弹框-->
<div id="detailprogram" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">详细信息</h4>
      </div>
      <div class="modal-body">
        <div class="caption">
		        <p id="poj_name"><strong>项目名称：</strong><span id="projectName"></span></p>
		        <p ><strong>负责人：</strong><span id="projectLeader"></span></p>
		        <p><strong>小组成员：</strong><span id="projectUsers"></span></p>
		        <p><strong>项目最新进展：</strong><span id="currentTrend"></span></p>
		        <p><strong>项目简介：</strong>
		        	<span id="projectdescription">
		       		</span>
		        </p>		        
		        <p><strong>项目进度：</strong></p>
				
		         <div id="progressbar" class="progress"></div>
		        <p><strong>项目日志：</strong></p>
		        <div class="rizhi" id="program_rizhi">
		        		
		        </div>
		        <p><strong id="program_isEnd"></strong></p>
		      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
    
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
   <script>
   
   $(function(){
   	$('.caption .button').click(function(){
   		var id = $(this).parents().attr('id');
		
		$.post("program_showDetail",{id:id},function(data,textStatus){
			$("#progressbar").children().remove();
			$("#program_isEnd").text("");
			$("#program_isEnd").children().remove();
			$(".trendsproject").remove();
			$("#projectName").text(data.name);
			$("#projectLeader").text(data.leader);
			$("#projectUsers").text(data.username);
			$("#currentTrend").text(data.currentTrend);
			$(projectdescription).text(data.description);
		
			for(var i=0;i<data.trends.length;i++){
				var $p = $("<p class=\"trendsproject\"></p>");
				$p.text(data.trends[i]);
				$("#program_rizhi").append($p);
			}
			if(data.end==1){
				//说明已经结题
				
				$("#program_isEnd").text("结题报告:");
				
				var $a =$("<a></a>");
				$a.attr("href","filedown_download?id="+data.fileId);
				$a.text(data.report);
				$("#program_isEnd").append($a);
			}
			var proceeding = data.proceeding;
			
			var $a =$("<div></div>");
			$a.attr("class","progress-bar progress-bar-striped active");
			var $s =$("<span></span>");
			$s.attr("class","sr-only");
			if(proceeding == '立项阶段'){
				$a.attr("style","width: 5%");
				$a.addClass("progress-bar-danger");
				$s.text('立项阶段');
			}else if(proceeding == '准备阶段'){
				$a.attr("style","width: 15%");
				$a.addClass("progress-bar-warning");
				$s.text('准备阶段');
			}else if(proceeding == '开发前期'){
				$a.attr("style","width: 30%");
				$a.addClass("progress-bar-info");
				$s.text('开发前期');
			}else if(proceeding == '开发中期'){
				$a.attr("style","width: 50%");
				$a.addClass("progress-bar-info");
				$s.text('开发中期');
			}else if(proceeding == '开发后期'){
				$a.attr("style","width: 80%");
				$a.addClass("progress-bar-info");
				$s.text('开发后期');
			}else if(proceeding == '整合结题'){
				$a.attr("style","width: 100%");
				$a.addClass("progress-bar-success");
				$s.text('整合结题');
			}
			$a.append($s);
			
			$("#progressbar").append($a);
		});
		
   	});
   });
    /**
     * 跳到指定的页码
     */
     function gotoPage(pageNum){
         window.location.href = "program_list.action?id=${id}&pageNum=" + pageNum;
     };
   </script>
</body>
</html>