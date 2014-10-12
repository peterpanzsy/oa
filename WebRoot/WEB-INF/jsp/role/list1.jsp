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
          <h1 class="page-header">岗位管理</h1>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>编号</th>
                  <th>岗位名称</th>
                  <th width=30%>岗位描述</th>
                  <th width=20%>权限</th>
                  <th>修改</th>
                  <th>删除</th>
                  <th>设置权限</th>
                </tr>
              </thead>
              <tbody>
              
               <s:iterator value="roleList">
	   	<tr id="${id}">
	   		<td class="roleid"><s:property value="id"/></td>
	   		<td class="name"><s:property value="name"/></td>
	   		<td class="description"><s:property value="description"/></td>
	   		<td>
	   			<s:iterator value="privileges">
	   				${name}
	   			</s:iterator>
	   		</td>
	   		<td><s:a href="role_delete?id=%{id}" onClick="return confirm('确定要删除吗？')">
				 <button type="button" class="btn btn-xs btn-primary">删除</button>
			</s:a></td>
	   		<td class="edit"><s:a href="#id=%{id}">
	   		<button type="button" id="modify" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#myModal3" >修改</button>
	   			
	   		</s:a></td>
	   		<!-- 这里还没做 -->
	   		<td class="setPrivilegeUI">
	   			<button  type="button" class="btn btn-xs btn-primary"  data-toggle="modal" data-target="#myModal4">设置权限</button>
	   		</td>
	   	<tr/>
	   </s:iterator>
              </tbody>
            </table>
            <div class="btm">
            	<a type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal2">添加新岗位</a><span></span>
            </div>
          </div>
        </div>
      </div>
    </div>

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">添加新岗位</h4>
      </div>
      <div class="modal-body">
          <form action ="role_add" class="form-horizontal" role="form">
               <s:token></s:token>
                <div class="form-group">
                  <label class="col-sm-4 control-label">岗位名称*：</label>
                  <div class="col-sm-6">
                    <input type="text" id="name"  name="name" class="form-control" placeholder="岗位名称" >
                  </div>
                </div>
 
                <div class="form-group">
                  <label class="col-sm-4 control-label">岗位描述：</label>
                  <div class="col-sm-6">
                    <input name="description" id="description"  type="text" class="form-control" placeholder="岗位描述" >
                  </div>
                </div>    
                <div class="modal-footer">
        <button type="submit" class="btn btn-primary">确定添加</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        
      </div>
              </form>
      </div>
      
    </div>
  </div>
</div>

<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">修改岗位信息</h4>
      </div>
      <div class="modal-body">
          <form action="role_edit"  class="form-horizontal" role="form" >
          <input type="hidden" name='id' value="0" id="roleId" />
          <div class="form-group">
                  <label class="col-sm-4 control-label">岗位名称*：</label>
                  <div class="col-sm-6">
                    <input type="text" id="roleName"  name="name" class="form-control" placeholder="岗位名称"  >
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-sm-4 control-label">岗位描述：</label>
                  <div class="col-sm-6">
                    <input type="text" id="roleDescription" name="description"   class="form-control" placeholder="岗位描述" >
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


<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">权限设置</h4>
      </div>
      <s:debug></s:debug>
      <s:form action="role_setPrivilege">
      <s:token></s:token>
      	<s:hidden name="id" value="" id="role_setPrivilege_id"></s:hidden>
      <div class="modal-body">
         	<div>
         		<table cellpadding="0" cellspacing="0" class="mainForm">
         			<tbody>
         					<s:iterator value="#topPrivilege">
         				<tr align="LEFT" valign="MIDDLE" id="TableTitle">
         					<td>
								<input type="checkbox" name="privilegeIds" value="${id}" id="cb_${id}"   
									<s:property value="%{id in privilegeIds ? 'checked' : ''}"/>
								/>
								<label for="cb_${id}">${name}</label>
							</td>
         				</tr>
						</s:iterator>
         			</tbody>
         		</table>
         	</div>
	      
	      
	      
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-primary">设置权限</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	      </div>
      </div>
         </s:form> 
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
	   $('.edit').click(function(){
	   var $parent = $(this).parents();
	   $("#roleId").attr('value',$parent.attr('id'));
	   $("#roleName").attr('value',$parent.children('.name').text());
	   $("#roleDescription").attr('value',$parent.children('.description').text());
  	 });
  	 	$('.setPrivilegeUI').click(function(){
  	 		var id = $(this).parents().attr("id");
  	 		$("#role_setPrivilege_id").attr("value",id);
  	 		/*$.post("role_setPrivilegeUI",{id:id},function(data,textStatus){
  	 		});*/
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