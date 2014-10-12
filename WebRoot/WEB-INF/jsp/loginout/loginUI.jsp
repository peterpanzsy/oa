<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>登录</title>
  <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
   <div class="title">iMiss小组办公自动化系统<span>高效、简洁、舒适</span></div>
   <div class="login">
   <s:form cssClass="form-horizontal" role="form" action="loginout_login" method="post">
      <div class="form-group">
        <label class="col-sm-2 control-label">用户名：</label>
        <div class="col-sm-8">
         <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> <input type="text" class="form-control" id="inputEmail3" placeholder="登录名" name="loginName"></div>
        </div>
      </div>
      <br/>
      <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">密码：</label>
        <div class="col-sm-8">
          <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span><input type="password" class="form-control" id="inputPassword3" placeholder="密码" name="password"></div>
        </div>
      </div>    
      <br/>
      <!-- 我改了一个div -->
      <div class="form-group">
      		<label for="inputPassword3" class="col-sm-2 control-label">验证码：</label>
      		 <div class="col-sm-8">
          <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-flag"></i></span><input type="text" class="form-control" id="inputPassword3" placeholder="请输入验证码" name="securityCode"></div>
        </div>
            <img src="securityCodeImageAction" id="Verify"  style="cursor:pointer;" alt="看不清，换一张"/>  
      </div>    
      <br/>
      <!-- 到这里 -->
      
      
      
      <div class="form-group">
        <div class="login_btn">
          <button type="submit" class="btn btn-lg btn-success">登录 <span class="glyphicon glyphicon-chevron-right"></span></button>
        </div>
      </div>
    </s:form>
    <s:if test="%{fieldErrors.login!=null}">
	    <!-- 错误信息回显 -->
	     <div class="alert alert-warning alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			  <strong>
			  	<s:fielderror>${login}</s:fielderror>
			  </strong> 
		</div>
	</s:if>
    </div>
</body>
<script src="js//jquery-1.11.1.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {    
          //点击图片更换验证码  
        $("#Verify").click(function(){  
                $(this).attr("src","securityCodeImageAction?timestamp="+new Date().getTime());  
            });  
         });  
</script>
</html>