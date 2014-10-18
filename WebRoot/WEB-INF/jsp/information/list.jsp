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
          <h1 class="page-header">通知发布</h1>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>id</th>
                  <th>标题</th>
                  <th>发布人</th>
                  <th>更新时间</th>
                  <th>修改</th>
                  <th>删除</th>
                </tr>
              </thead>
              <tbody>
              
                	<s:iterator value="recordList" status="vs">
                		  <tr>
                		 	 <s:hidden name="id"></s:hidden>
                		  	 <td><s:property value="#vs.count"/></td>
                		  	 <td><s:property value="title"/></td>
                			 <td><s:property value="author.name"/></td> 
                			 <td><s:date name="date" format="yyyy-MM-dd" /></td> 
                			 <td><s:a type="button" cssClass="btn btn-xs btn-primary" href="info_editUI?id=%{id}">修改</s:a></td>
                 			 <td><s:a type="button" cssClass="btn btn-xs btn-primary" href="info_delete?id=%{id}">删除</s:a></td>
                		 </tr>
                	</s:iterator>
    
              </tbody>
            </table>
            <div class="btm">
            	<a type="button" class="btn btn-sm btn-primary" href="info_addUI">发布新通知</a><span></span>
            </div>
            
            <!--分页  -->
            <div class="pages">
              <ul class="pagination col-sm-8">
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
    </div>

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">增加新成员</h4>
      </div>
      <div class="modal-body">
          <form class="form-horizontal" role="form">
                <div class="form-group">
                  <label class="col-sm-4 control-label">用户名*：</label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control" placeholder="填入用户名" >
                  </div>
                </div>
                <!--增加密码-->              
                 
                <div class="form-group">
                  <label class="col-sm-4 control-label">密码*：</label>
                  <div class="col-sm-6">
                    <input type="password" class="form-control" placeholder="填入密码">
                  </div>
                </div>               
        
                <div class="form-group">
                  <label class="col-sm-4 control-label">权限*：</label>
                    <div class="col-sm-6">
                  <label class="checkbox-inline">
                    <input type="checkbox" name="inlineCheckboxOptions" id="inlineCheckbox1" value="option1"> 财务管理员
                  </label>
                  <label class="checkbox-inline">
                    <input type="checkbox" name="inlineCheckboxOptions" id="inlineCheckbox2" value="option2"> 项目管理员
                  </label>
                  <br>
                   <label class="checkbox-inline">
                    <input type="checkbox" name="inlineCheckboxOptions" id="inlineCheckbox3" value="option3" > 活动管理员
                  </label>
                  <label class="checkbox-inline">
                    <input type="checkbox" name="inlineCheckboxOptions" id="inlineCheckbox4" value="option4"> 资源管理员
                  </label>
                  </div>
                </div>
               
                 
                <div class="form-group">
                  <label class="col-sm-4 control-label">真实姓名：</label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control" placeholder="姓名">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">性别：</label>
                    <div class="col-sm-6">
                  <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked="checked"> 男
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 女
                  </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">生日日期：</label>
                  <div class="input-group date form_date col-sm-6" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                 <input type="hidden" id="dtp_input2" value="" />
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">目前学历：</label>
                    <div class="col-sm-6">
                  <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions2" id="inlineRadio3" value="option1"> 本科
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions2" id="inlineRadio4" value="option2" checked="checked"> 硕士
                  </label>
                   <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions2" id="inlineRadio5" value="option2"> 博士
                  </label>
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-sm-4 control-label">联系方式：</label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control" placeholder="手机号">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">邮箱：</label>
                  <div class="col-sm-6">
                    <input type="email" class="form-control" placeholder="常用邮箱">
                  </div>
                </div>


                
               
              </form>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">确定添加</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        
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
          <form class="form-horizontal" role="form">
                <div class="form-group">
                  <label class="col-sm-4 control-label">用户名*：</label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control" placeholder="user" disabled="disabled">
                  </div>
                </div>
                <!--增加密码-->              
                 
                <div class="form-group">
                  <label class="col-sm-4 control-label">密码*：</label>
                  <div class="col-sm-6">
                    <input type="password" class="form-control" placeholder="psd">
                  </div>
                </div>               
        
                <div class="form-group">
                  <label class="col-sm-4 control-label">权限*：</label>
                    <div class="col-sm-6">
                  <label class="checkbox-inline">
                    <input type="checkbox" name="inlineCheckboxOptions" id="inlineCheckbox1" value="option1"> 财务管理员
                  </label>
                  <label class="checkbox-inline">
                    <input type="checkbox" name="inlineCheckboxOptions" id="inlineCheckbox2" value="option2"> 项目管理员
                  </label>
                  <br>
                   <label class="checkbox-inline">
                    <input type="checkbox" name="inlineCheckboxOptions" id="inlineCheckbox3" value="option3" > 活动管理员
                  </label>
                  <label class="checkbox-inline">
                    <input type="checkbox" name="inlineCheckboxOptions" id="inlineCheckbox4" value="option4"> 资源管理员
                  </label>
                  </div>
                </div>
               
                 
                <div class="form-group">
                  <label class="col-sm-4 control-label">真实姓名：</label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control" placeholder="姓名">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">性别：</label>
                    <div class="col-sm-6">
                  <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked="checked"> 男
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 女
                  </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">生日日期：</label>
                  <div class="input-group date form_date col-sm-6" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                 <input type="hidden" id="dtp_input2" value="" />
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">目前学历：</label>
                    <div class="col-sm-6">
                  <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions2" id="inlineRadio3" value="option1"> 本科
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions2" id="inlineRadio4" value="option2" checked="checked"> 硕士
                  </label>
                   <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions2" id="inlineRadio5" value="option2"> 博士
                  </label>
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-sm-4 control-label">联系方式：</label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control" placeholder="手机号">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">邮箱：</label>
                  <div class="col-sm-6">
                    <input type="email" class="form-control" placeholder="常用邮箱">
                  </div>
                </div>


                
               
              </form>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">修改信息</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        
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
    <script type="text/javascript">
			function gotoPage(pageNum){
		      	  window.location.href = "info_list.action?id=${id}&pageNum=" + pageNum;};
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