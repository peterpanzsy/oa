<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>科研管理</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
 
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
          <h1 class="page-header">奖项管理</h1>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                 <th>获奖等级</th>
                <th>获奖项目名称</th>
                <th>获奖者姓名</th>
                <th>奖项名称</th>
                <th>获奖时间</th>
                <th>研究方向</th>
                  <th>修改</th>
                  <th>删除</th>
                </tr>
              </thead>
              <tbody>
                 <s:iterator value="recordList">
                	<tr id="${id}">
						<td>
							<s:property value="grade"/> 
						</td>     
						<td>
							<s:property value="programName"/> 
						</td>       
						<td>
							<s:property value="user.name"/> 
						</td>   
						<td>
							<s:property value="name"/> 
						</td>   
						<td>
							<s:property value="date" />
						</td>   
						<td>
							<s:property value="researchInterests"/>
						</td>    
						<td class="edit"><button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#myModal3">修改</button></td>
                 		<td><s:a href="award_delete?id=%{id}">
                 				<button type="button" class="btn btn-xs btn-primary">删除</button>
                 			</s:a>
                 		</td>		
                	</tr>
                </s:iterator>          
              </tbody>
            </table>
            <div class="btm">
            	<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal2">添加新的获奖</button><span></span>
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

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">添加新获奖</h4>
      </div>
      <div class="modal-body">
          <s:form action="award_add" cssClass="form-horizontal" role="form">
               <s:token></s:token>
                <div class="form-group">
                  <label class="col-sm-4 control-label">获奖等级：</label>
                  <div class="col-sm-6">
                    <s:radio name="grade" list="{'国家级','省级','校级','其他'}" value="'0'"></s:radio>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">获奖项目名称：</label>
                  <div class="col-sm-6">
                    <input name="programName" type="text" class="form-control" placeholder="填入获奖名称" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">获奖者姓名：</label>
                  <div class="col-sm-6">
                    <input name="username" type="text" class="form-control" placeholder="以空格为间隔" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">奖项名称：</label>
                  <div class="col-sm-6">
                    <input name="name" type="text" class="form-control" placeholder="填入奖项名称" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">获奖时间：</label>
                 <div class="input-group date form_date col-sm-6" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input name="date" class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">研究方向：</label>
                  <div class="col-sm-6">
                    <input name="researchInterests" type="text" class="form-control" placeholder="填入研究方向" >
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
        <h4 class="modal-title" id="myModalLabel">修改获奖信息</h4>
      </div>
     <div class="modal-body">
          <form action="award_edit"  class="form-horizontal" role="form">
                <s:hidden name="id" value="0" id="award_id"></s:hidden>
                <div class="form-group">
                  <label class="col-sm-4 control-label">获奖等级：</label>
                  <div class="col-sm-6">
                    <s:radio id="award_grade" name="grade" list="#{'国家级':'国家级','省级':'省级','校级':'校级','其他':'其他'}" value="'国家级'"></s:radio>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">获奖项目名称：</label>
                  <div class="col-sm-6">
                    <input id="award_programName" name="programName" type="text" class="form-control" placeholder="填入获奖名称" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">获奖者姓名：</label>
                  <div class="col-sm-6">
                    <input id="award_username" name="username" type="text" class="form-control" placeholder="以空格为间隔" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">奖项名称：</label>
                  <div class="col-sm-6">
                    <input id="award_name" name="name" type="text" class="form-control" placeholder="填入奖项名称" >
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">获奖时间：</label>
                 <div class="input-group date form_date col-sm-6" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input name="date" id="award_date" class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">研究方向：</label>
                  <div class="col-sm-6">
                    <input name="researchInterests" id="award_researchInterests" type="text" class="form-control" placeholder="填入研究方向" >
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

        });
       /**
          * 跳到指定的页码
          */
         function gotoPage(pageNum){
             window.location.href = "award_list1.action?pageNum=" + pageNum;
         };

    </script>
     <script>
    	$(function(){
    		$('.edit').click(function(){
    			var id = $(this).parents().attr("id");
    			alert(id);
    				$.post("award_editUI",{"id":id},function(data,textStatus){
    				$("#award_grade").attr("value",data.grade);
    				$("#award_name").attr("value",data.name);
    				$("#award_programName").attr("value",data.programName);
    				$("#award_researchInterests").attr("value",data.researchInterests);
    				$("#award_date").attr("value",data.date);
    				$("#award_username").attr("value",data.username);
    				$("#award_id").attr("value",id);
    			}); 
    			});
    		})
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