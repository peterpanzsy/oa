<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>配置权限</title>
</head>
<body>

<!--显示表单内容-->
<div id=MainArea>

    <s:form action="role_setPrivilege">
		<s:hidden name="id"></s:hidden>
        	 正在为【${name}】配置权限
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
					<!--表头-->
					<thead>
						<tr align="LEFT" valign="MIDDLE" id="TableTitle">
							<td width="300px" style="padding-left: 7px;">
								<input type="checkbox" id="cbSelectAll" onclick="  $('input[name=privilegeIds]').attr('checked', this.checked)  "/>
								<label for="cbSelectAll">全选</label>

							</td>
						</tr>
					</thead>
			   		<!--显示数据列表-->
					<tbody id="TableData">
						<tr class="TableDetail1">
							<!-- 显示权限树 -->
							<td>


<%-- 显示为树状结构（使用<ul>标签） --%>
<ul id="tree">
	<%-- 第一层 --%>
	<s:iterator value="privilegeList">
	<li>
		<input type="checkbox" name="privilegeIds" value="${id}" id="cb_${id}" <s:property value="%{id in privilegeIds ? 'checked' : ''}"/> />
		<label for="cb_${id}"><span class="folder">${name}</span></label>
		<ul>
			<%-- 第二层 --%>
			<s:iterator value="children">
			<li>
				<input type="checkbox" name="privilegeIds" value="${id}" id="cb_${id}" <s:property value="%{id in privilegeIds ? 'checked' : ''}"/> />
				<label for="cb_${id}"><span class="folder">${name}</span></label>
				<ul>
					<%-- 第三层 --%>
					<s:iterator value="children">
					<li>
						<input type="checkbox" name="privilegeIds" value="${id}" id="cb_${id}" <s:property value="%{id in privilegeIds ? 'checked' : ''}"/> />
						<label for="cb_${id}"><span class="folder">${name}</span></label>
					</li>
					</s:iterator>
				</ul>
			</li>
			</s:iterator>
		</ul>
	</li>
	</s:iterator>
</ul>


<script type="text/javascript">

</script>
							
							
							</td>
						</tr>
					</tbody>
                </table>
            </div>
        </div>
        
        <!-- 表单操作 -->
	<s:submit value="提交"></s:submit>
    </s:form>
</div>



</body>
</html>
	