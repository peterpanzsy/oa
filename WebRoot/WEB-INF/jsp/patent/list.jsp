<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>科研管理</title>

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
          <h1 class="page-header">专利管理</h1>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                <th>专利名称</th>
                <th>发明人</th>
                <th>授权公告号</th>
                <th>类型</th>
                <th>备注</th>
                <th>修改</th>
                <th>删除</th>
                </tr>
              </thead>
              <tbody>
                <s:iterator value="recordList">
                            <tr id="${id}">
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
                                 <td class="edit">
	                                	 <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#myModal3">修改</button>
                                </td>
                                  
				                  <td>
				                  		<a href="patent_delete?id=${id}">
					                  		<button type="button" class="btn btn-xs btn-primary">删除</button>
				                		</a>
				                  </td>
                            </tr>
                        </s:iterator>
            </table>  
             <div class="btm">
            	<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal2">添加专利</button><span></span>
           </div>
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
                                    <option value="${num}">${num}</option>
                                </s:iterator>
                            </select>页 
                            <button class="btn btn-xs btn-primary" type="submit" value="GO">
                                GO
                            </button>
                        </div>
        
        
        
      </div>
            

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">添加专利</h4>
      </div>
      <div class="modal-body">
          <s:form action="patent_add" cssClass="form-horizontal" role="form" enctype="multipart/form-data">
                <s:token></s:token>
                <div class="form-group">
                  <label class="col-sm-4 control-label">专利名称：</label>
                  <div class="col-sm-6">
                    <input name="name" type="text" class="form-control" placeholder="填入专利名称" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">发明人：</label>
                  <div class="col-sm-6">
                    <input name="username" type="text" class="form-control" placeholder="发明人的登录名，用;号隔开"" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">授权公告号：</label>
                  <div class="col-sm-6">
                  <!-- 个人所属项目的列表，用列表的形式来展示 -->
                    <input name="authorizationNumber" type="text" class="form-control" placeholder="授权公告号" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">类型：</label>
                  <div class="col-sm-6">
                 	<s:radio name="type" list="{'发明公布','发明授权','使用新型','外观设计'}" ></s:radio>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">备注：</label>
                  <div class="col-sm-6">
                    <input name="description" type="text" class="form-control" placeholder="备注" >
                  </div>
                </div>
            	<div class="modal-footer">
			        <button type="submit" class="btn btn-primary">确定添加</button>
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
        <h4 class="modal-title" id="myModalLabel">修改论文信息</h4>
      </div>
      <div class="modal-body">
          <s:form action="patent_edit" cssClass="form-horizontal" role="form" enctype="multipart/form-data">
              	<s:hidden name="id" value="" id="patent_id"></s:hidden>
                <div class="form-group">
                  <label class="col-sm-4 control-label">专利名称：</label>
                  <div class="col-sm-6">
                    <input id="patent_name" name="name" type="text" class="form-control" placeholder="填入专利名称" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">发明人：</label>
                  <div class="col-sm-6">
                    <input id="patent_username" name="username" type="text" class="form-control" placeholder="发明人的登录名，用;号隔开"" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">授权公告号：</label>
                  <div class="col-sm-6">
                  <!-- 个人所属项目的列表，用列表的形式来展示 -->
                    <input id="patent_authorizationNumber"  name="authorizationNumber" type="text" class="form-control" placeholder="授权公告号" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">类型：</label>
                  <div class="col-sm-6">
                 	<s:radio id="patent_type"  name="type" list="{'发明公布','发明授权','使用新型','外观设计'}" ></s:radio>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">备注：</label>
                  <div class="col-sm-6">
                    <input id="patent_description" name="description" type="text" class="form-control" placeholder="备注" >
                  </div>
                </div>
            	<div class="modal-footer">
			        <button type="submit" class="btn btn-primary">确定修改</button>
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
    			var id = $(this).parents().attr("id");
    			$.post("patent_editUI",{"id":id},function(data,textStatus){
    				$("#patent_id").attr("value",id);
    				$("#patent_name").attr("value",data.name);
    				$("#patent_username").attr("value",data.username);
    				$("#patent_authorizationNumber").attr("value",data.authorizationNumber);
    				$("#patent_description").attr("value",data.description);
    				//$("#patent_type").attr("checked",data.type);
    				if(data.type=='发明公布'){
    					$("#patent_type")[0].checked =true;
    				}else if(data.type=='发明授权'){
    					$("#patent_type")[1].checked =true;
    				}else if(data.type=='使用新型'){
    					$("#patent_type")[2].checked =true;
    				}else if(data.type=='外观设计'){
    					$("#patent_type")[3].checked =true;
    				};
    			});
			});
		});
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