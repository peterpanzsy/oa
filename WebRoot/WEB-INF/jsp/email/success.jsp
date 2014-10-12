<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="UTF-8">
  <title>发送成功</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--<link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">-->
   
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="text-align:center; background:url(images/success.png) no-repeat 50% -5%; background-size:50%; ">
 <p style="margin-top:12%; font-family:'微软雅黑'; font-size:36px; color:red;">恭喜您，邮件已经发送成功！</p>
 <p style="margin-top:30px;"><a href="email_index" type="button" class="btn btn-success">再发一封</a>
 <a href="home_index" type="button" class="btn btn-warning">返回页面</a></p>
    
    <script src="js//jquery-1.11.1.min.js"></script>   
    <script src="js/bootstrap.min.js"></script>
    

</body>
</html>
