<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
	<head>
		<link href="css/jquery.Jcrop.css">
	</head>
	<body>
		<img alt="" src="images/i1.png" id="test">
		<script src="js//jquery-1.8.2.min.js"></script>
    <script src="js//jquery.Jcrop.js"></script>
   	 <script>
    	$(function(){
    		$('#test').Jcrop();
    	})
    </script>
  </body>
</html>