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
          <h1 class="page-header">项目管理</h1>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>项目名称</th>
                  <th>项目负责人</th>
                  <th>小组成员</th>
                  <th>最新进展</th>
                  <th>是否结题</th>
                  <th>
                  	<s:if test="end == 0">
			             	创立时间
			        </s:if>
			        <s:else>
			        	结题时间
			         </s:else>
					</th>
                  <th>修改</th>
                  <th>资料上传</th>
                  <th>删除</th>
                  <th>结题</th>
                </tr>
              </thead>
              <tbody>
              		<s:iterator value="recordList">
              			<tr id="${id}">
              				 <td class="name">${name}</td>
			                  <td class="leader_name" name="leader_name">${leader.name}</td>
			                  <td class="aaausers">
			                  	<%-- <s:iterator value="users">
			                  		${name}
			                  	</s:iterator> --%>
			                  	${users_names} 
			                  </td>
			                  <td>${currentTrend.content}</td>                  
			                  <td>
			                  	<s:property value="end==0?'正在进行时':'已结束'"/>
			                  </td>                  
			                  <td><s:if test="end == 0">
			                  		<s:date name="%{startTime}" format="yyyy-MM-dd"/>
			                  	</s:if>
			                  	<s:else>
			                  		<s:date name="%{endTime}" format="yyyy-MM-dd"/>
			                 	 </s:else>
			                  </td>                  
			                  <td class="edit"><a type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#myModal">修改</a></td>
			                  <td class="upload"><a type="button" class="btn btn-xs btn-success" data-toggle="modal" data-target="#myModal3" >资料上传</a></td>
			                  <td><s:a type="button" cssClass="btn btn-xs btn-danger" href="program_delete?id=%{id}" onclick='return confirm("你确定要删除?")'>删除</s:a></td>
			                  <td class="report"><a type="button" class="btn btn-xs btn-success" data-toggle="modal" data-target="#myModal2" >结题</a></td>
              			</tr>
              		</s:iterator>
              </tbody>
            </table>
            
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

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">修改项目信息</h4>
      </div>
      <div class="modal-body">
          <form class="form-horizontal" role="form" action="program_edit">
          		<input type="hidden" name='id' value="0" id="project_hidden" />
                <div class="form-group">
                  <label class="col-sm-4 control-label">项目名称：</label>
                  <div class="col-sm-6">
                    <input name="name" id="project_name" type="text" class="form-control" placeholder="" disabled="disabled">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">项目负责人：(登录名)</label>
                  <div class="col-sm-6">
                    <input id="project_leader" type="text" class="form-control" placeholder=""  disabled="disabled">
                  </div>
                </div>
				
                <div class="form-group">
                  <label class="col-sm-4 control-label">小组成员：(登录名)</label>
                  <div class="col-sm-6">
                    <input name="usernames" id="project_users" type="text" class="form-control" placeholder=""  disabled="disabled">
                  </div>
                </div>
				
                <div class="form-group">
                  <label class="col-sm-4 control-label">添加项目日志</label>
                  <div class="col-sm-6">
                    <input name="content" type="text" class="form-control" placeholder="请填入最新项目日志">
                  </div>
                </div>              
                <div class="form-group">
                  <label class="col-sm-4 control-label">更新进度：</label>
                    <div class="col-sm-6">
                    <div>
              
		                  <label class="radio-inline" >
		                    <input type="radio" name="proceeding" checked="checked" value="立项阶段"> 立项阶段
		                  </label>
		                  <label class="radio-inline"  >
		                    <input type="radio" name="proceeding" value="准备阶段"> 准备阶段
		                  </label>
		                  <label class="radio-inline" >
		                    <input type="radio" name="proceeding" value="开发前期"> 开发前期
		                  </label>
		              </div>
		              <div>
		                  <label class="radio-inline" >
		                    <input type="radio" name="proceeding" value="开发中期"> 开发中期
		                  </label>
		                  <label class="radio-inline" >
		                    <input type="radio" name="proceeding" value="开发后期"> 开发后期
		                  </label>
		                  <label class="radio-inline" >
		                    <input type="radio" name="proceeding" value="整合结题"> 整合结题
		                  </label>
		              </div>
                  </div>
                </div>
                           <div class="modal-footer">
						        <button type="submit" class="btn btn-primary">修改信息</button>
						        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
     						</div>
               
              </form>
      </div>

    </div>
  </div>
</div>

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">提交结题报告</h4>
      </div>
      <div class="modal-body">
          <s:form cssClass="form-horizontal" role="form" action="program_end" enctype="multipart/form-data">
          		<s:token></s:token>
          		<input type="hidden" name='id' value="" id="project_report_hidden" />
          		<div class="panel panel-default">
          		<div class="panel-heading">
                  <h3 class="panel-title">提交结题报告</h3>
                </div>
                 <div class="panel-body">  
                <div class="form-group">
                  <label class="col-sm-4 control-label">请提交结题报告：</label>
                  <div class="col-sm-6" style="padding-top:7px;">
                    <input name="upload" type="file">
                  </div>
                </div>
                </div>
               </div>
                           <div class="modal-footer">
						        <button type="submit" class="btn btn-primary">提交</button>
						        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
     						</div>
               
              </s:form>
              
      </div>
    </div>
  </div>
  </div>
  
  <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">上传资料</h4>
      </div>
      <div class="modal-body">
          <s:form cssClass="form-horizontal" role="form" action="program_uploadFile" enctype="multipart/form-data">
          		<s:token></s:token>
          		<input type="hidden" name='id' value="" id="project_upload_hidden" />
          		<div class="panel panel-default">
          		<div class="panel-heading">
                  <h3 class="panel-title">上传项目资料</h3>
                </div>
                 <div class="panel-body">  
                <div class="form-group">
                  <label class="col-sm-4 control-label">请选择文件：</label>
                  <div class="col-sm-6" style="padding-top:7px;">
                    <input name="uploadFiles" id="zhouyao" type="file"  multiple="multiple">
                  </div>
                </div>
                </div>
               </div>
                           <div class="modal-footer">
						        <button type="submit" class="btn btn-primary">提交</button>
						        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
     						</div>
               
              </s:form>
              
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

        })

    </script>
    <script>
    	$(function(){
    		$('.main .edit').click(function(){
    			var $parent = $(this).parents();
				$("#project_name").attr("value",$parent.children('.name').text());
				$("#project_leader").attr("value",$parent.children('.leader_name').text());
				var users =$parent.children('.aaausers').text()/* .replace(/[\r\n]/g,"") */;
				users = users.replace(/\ +/g," ");
				users = users.replace(/[\t]/g,"").trim();
				$("#project_users").attr("value",users);
				$("#project_hidden").attr("value",$parent.attr('id'));
    		});
    		
    		$('.main .report').click(function(){
    			var $parent = $(this).parents();
				var id = $parent.attr("id");
				$("#project_report_hidden").attr("value",id);
			});
			
			$('.main .upload').click(function(){
    			var $parent = $(this).parents();
				var id = $parent.attr("id");
				$("#project_upload_hidden").attr("value",id);
				
			});
			
			
    	})
   /**
     * 跳到指定的页码
     */
     function gotoPage(pageNum){
         window.location.href = "program_show.action?id=${id}&pageNum=" + pageNum;
     };
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