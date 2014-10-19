<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>人员管理</title>

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
<body onload="user_addcheck()">
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home_index">iMiss小组办公自动化系统</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="loginout_logout">登出</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<s:iterator value="#session.topPrivileg">
						<li><a href="${url}">${name}</a>
						</li>
					</s:iterator>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">用户管理</h1>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>用户名</th>
								<th>性别</th>
								<th>真实姓名</th>
								<th>生日</th>
								<th>联系方式</th>
								<th>邮箱</th>
								<th width="30%">角色</th>
								<th>修改</th>
								<th>设置角色</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="userList">
								<tr id="${id}">
									<s:hidden name="id"></s:hidden>
									<td><s:property value="loginName"/></td>
									<td><s:property value="gender" /></td>
									<td><s:property value="name" /></td>
									<td><s:property value="birthday"/></td>
									<td><s:property value="phone"/></td>
									<td><s:property value="email"/></td>
									<td><s:iterator value="roles">
						   				${name}
						   			</s:iterator></td>
								 		<td class="edit">
								 			<button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#myModal3">修改</button>
								 		</td>
										<td class="setRoleUI">
								 			<button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#myModal4">设置角色</button>
								 		</td>
									<tr/>
	   </s:iterator>
   
            </table>
								
            <div class="btm">
            	<button type="button" class="btn btn-sm btn-primary"
							data-toggle="modal" data-target="#myModal2">增加成员</button>
						<span></span>
            </div>
          </div>
        </div>
      </div>
    </div>

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
        <h4 class="modal-title" id="myModalLabel">增加新成员</h4>
      </div>
      <div class="modal-body">
          <s:form  id="userForm" action ="user_add" cssClass="form-horizontal" role="form">
              <s:token></s:token>
                <div class="form-group">
                  <label class="col-sm-4 control-label">用户名*：</label>
                  <div class="col-sm-6">
                  	<s:textfield name="loginName" id="loginName" cssClass="form-control" placeholder="填入用户名" onclick="user_addcheck()" onblur="user_addcheck()"></s:textfield>
                  </div>
                </div>
                 
                <div class="form-group">
                  <label class="col-sm-4 control-label">真实姓名：</label>
                  <div class="col-sm-6">
                    <input name="name" id="name" type="text" class="form-control"
									placeholder="姓名">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">性别：</label>
                    <div class="col-sm-6">
                  <s:radio list="{'男','女'}" name="gender" id="inlineRadio1" ></s:radio>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">生日日期：</label>
                  <div class="input-group date form_date col-sm-6"
								data-date="" data-date-format="yyyy-mm-dd"
								data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input name="birthday" class="form-control" size="16" type="text"
									value="" readonly>
                    <span class="input-group-addon"><span
									class="glyphicon glyphicon-remove"></span>
								</span>
                    <span class="input-group-addon"><span
									class="glyphicon glyphicon-calendar"></span>
								</span>
                </div>
                 <input type="hidden" id="dtp_input2" value="" />
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">目前学历：</label>
                    <div class="col-sm-6">
                    <s:radio list="{'老师','本科','研究生','博士'}" cssClass="radio-inline" name="education"></s:radio>
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-sm-4 control-label">联系方式：</label>
                  <div class="col-sm-6">
                    <input type="text" id="phone" name="phone" class="form-control"
									placeholder="手机号">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">邮箱：</label>
                  <div class="col-sm-6">
                    <input type="email" id="email" name="email" class="form-control"
									placeholder="常用邮箱">
                  </div>
                </div>

 	    <div class="modal-footer">
        <button type="submit" class="btn btn-primary">确定添加</button>
        <button type="button" class="btn btn-default"
						data-dismiss="modal">取消</button>
        
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
        <h4 class="modal-title" id="myModalLabel">修改成员信息</h4>
      </div>
      <div class="modal-body">
          <s:form cssClass="form-horizontal" role="form" action="user_editManager">
          		<s:hidden id="user_id" name="id" value=""></s:hidden>
                <div class="form-group">
                  <label class="col-sm-4 control-label">用户名*：</label>
                  <div class="col-sm-6">
                    <s:textfield id="user_loginName" name="loginName" type="text" cssClass="form-control"  disabled="disabled"></s:textfield>
                    </div>
                </div>
             
                 
                <div class="form-group">
                  <label class="col-sm-4 control-label">真实姓名：</label>
                  <div class="col-sm-6">
                    <s:textfield id="user_name" name="name" type="text" cssClass="form-control" placeholder="" ></s:textfield>
                  </div>
                </div>
              <div class="form-group">
                  <label class="col-sm-4 control-label">性别：</label>
                    <div class="col-sm-6">
                  	<s:radio  list="{'男','女'}" name="gender" id="inlineRadio1"></s:radio>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">生日日期：</label>
                  <div class="input-group date form_date col-sm-6" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input name="birthday" id="user_birthday" class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">目前学历：</label>
                    <div class="col-sm-6">
                    <s:radio list="{'老师','本科','研究生','博士'}" cssClass="radio-inline" name="education"></s:radio>
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-sm-4 control-label">联系方式：</label>
                  <div class="col-sm-6">
                    <s:textfield id="user_phone" name="phone" type="text" cssClass="form-control" placeholder="手机号"></s:textfield>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">邮箱：</label>
                  <div class="col-sm-6">
                    <s:textfield id="user_email" name="email" type="email" cssClass="form-control" placeholder="常用邮箱"></s:textfield>
                  </div>
                </div>
                
	                <div class="modal-footer">
	        			<button type="submit" class="btn btn-primary">修改信息</button>
	        			<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			      </div>
              </s:form>
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
      <s:form action="user_setRole">
      	<s:hidden name="id" value="" id="user_setRole_id"></s:hidden>
      <div class="modal-body">
         	<div>
         		<table cellpadding="0" cellspacing="0" class="mainForm">
         			<tbody>
         					<s:iterator value="#roleList">
         				<tr align="LEFT" valign="MIDDLE" id="TableTitle">
         					<td>
								<input type="checkbox" name="roleId" value="${id}" id="cb_${id}"   
									<s:property value="%{id in roleId ? 'checked' : ''}"/>
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
    <script src="js/jquery-1.11.1.min.js"></script>
   	<script src="js/jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/form-validation.js"></script>
    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript"
		src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script> 
    <script type="text/javascript"
		src="js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
     <script>
						$(function() {
							$('.form_date').datetimepicker({
								language : 'zh-CN',
								weekStart : 1,
								todayBtn : 1,
								autoclose : 1,
								todayHighlight : 1,
								startView : 2,
								minView : 2,
								forceParse : 0
							});

						})
						
 
					</script>
					<script type="text/javascript">
					$(function(){
    		$('.main .edit').click(function(){
    			var $parent = $(this).parents();
    			var id = $parent.attr('id')
    			$.post("user_editUI",{'id':id},function(data,textStatus){
    				$("#user_loginName").attr('value',data.loginName);
    				$("#user_name").attr("value",data.name);
    				$("#user_birthday").attr("value",data.birthday);
    				$("#user_phone").attr("value",data.phone);
    				$("#user_email").attr("value",data.email);
    				$("#user_id").attr("value",data.id);
    			});
    		});
			$('.setRoleUI').click(function(){
	  	 		var id = $(this).parents().attr("id");
	  	 		$("#user_setRole_id").attr("value",id);
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