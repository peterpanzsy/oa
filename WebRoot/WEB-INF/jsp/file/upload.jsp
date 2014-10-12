<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>文件上传</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body>
	<s:form action="fileup_upload" enctype="multipart/form-data">
		<table>
			<tr>
				<td>上传文件</td>
				<td>标题：<input type="text" name="uploadFileName" /> <input
					type="file" name="upload" /><br /> 标题：<input type="text"
					name="uploadFileName" /> <input type="file" name="upload" /><br />
					标题：<input type="text" name="uploadFileName" /> <input type="file"
					name="upload" /><br /> 标题：<input type="text" name="uploadFileName" />
					<input type="file" name="upload" /><br /> 标题：<input type="text"
					name="uploadFileName" /> <input type="file" name="upload" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="提交" />
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
