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
<body onload="book_checker()">
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
          <h1 class="page-header">图书管理</h1>
          <div class="table-responsive necescroll">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>图书名称</th>
                  <th>作者</th>
                  <th>书柜号</th>
                  <th>出版社</th>
                  <th>出版年份</th>
                  <th>删除</th>
                  <th>修改</th>
                </tr>
              </thead>
              <tbody>
              
              <s:iterator value="recordList">
                            <tr id="${id}">
                                <td>
                                    <s:property value="name"/>
                                </td>
                                <td>
                                    <s:property value="author"/>
                                </td>
                                <td>
                                    <s:property value="bookcase"/>
                                </td>
                                <td>
                                    <s:property value="publish"/>
                                </td>
                                <td>
                                    <s:property value="time"/>
                                </td>
                                <td>
                                    <s:a href="book_delete?id=%{id}">
                   
                         				<button type="button" class="btn btn-xs btn-primary">删除</button>
                     				</s:a>
				                 </td>
				                 <td  class="edit">
				                     <button type="button" class="btn btn-xs btn-primary"  data-toggle="modal" data-target="#myModal3">修改</button>
				                 </td>
                            </tr>
                        </s:iterator>
              
              </tbody>
            </table>
            
            
          </div>
            <div class="btm">
            	<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal2">增加新图书</button><span></span>
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
        <h4 class="modal-title" id="myModalLabel">增加新图书</h4>
      </div>
      <div class="modal-body">
          <s:form cssClass="form-horizontal" id="bookForm" name="bookForm" role="form" action="book_add" >
                <s:token></s:token>
                <div class="form-group">
                  <label class="col-sm-4 control-label">*图书名：</label>
                  <div class="col-sm-6">
                    <s:textfield name="name" id="name" cssClass="form-control" placeholder="请填写图书名称" onclick="book_checker()" onblur="book_checker()"></s:textfield>
                  </div>
                  
                </div>            
                 
                <div class="form-group">
                  <label class="col-sm-4 control-label">*作者：</label>
                  <div class="col-sm-6">
                    <s:textfield name="author" id="author" cssClass="form-control" placeholder="填入作者" ></s:textfield>
                  </div>
                </div>               
        
                <div class="form-group">
                  <label class="col-sm-4 control-label">*书柜号：</label>
                  <div class="col-sm-6">
                    <s:textfield name="bookcase"  id="bookcase" cssClass="form-control" placeholder="填入书柜号" ></s:textfield>
                  </div>
                </div>   

                <div class="form-group">
                  <label class="col-sm-4 control-label">出版社：</label>
                  <div class="col-sm-6">
                    <s:textfield name="publish" id="publish" cssClass="form-control" placeholder="填入出版社" ></s:textfield>
                  </div>
                </div>      
               
               <div class="form-group">
                  <label class="col-sm-4 control-label">出版年份：</label>
                  <div class="col-sm-6">
                    <s:textfield name="time" id="time" cssClass="form-control" placeholder="填入出版年份"></s:textfield>
                  </div>
                </div> 
		              
		      <div class="modal-footer">
		        <input type="submit" class="btn btn-primary" id="formsub" value="添加"  ></input>
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
        <h4 class="modal-title" id="myModalLabel">修改图书信息</h4>
      </div>
      <div class="modal-body">
          <form class="form-horizontal" id="editBook" role="form" action="book_edit">
          		<s:hidden name="id"  id="book_id" value=""></s:hidden>
                <div class="form-group">
                  <label class="col-sm-4 control-label">图书名：</label>
                  <div class="col-sm-6">
                    <input id="book_name" name="name" type="text" class="form-control" placeholder="" >
                  </div>
                </div>            
                 
                <div class="form-group">
                  <label class="col-sm-4 control-label">作者：</label>
                  <div class="col-sm-6">
                    <input id="book_author" name="author" type="text" class="form-control" placeholder="">
                  </div>
                </div>               
        
                <div class="form-group">
                  <label class="col-sm-4 control-label">书柜号：</label>
                  <div class="col-sm-6">
                    <input id="book_bookcase" name="bookcase" type="text" class="form-control" placeholder="" >
                  </div>
                </div>   

                <div class="form-group">
                  <label class="col-sm-4 control-label">出版社：</label>
                  <div class="col-sm-6">
                    <input id="book_publish" name="publish" type="text" class="form-control" placeholder="" >
                  </div>
                </div>      
               
               <div class="form-group">
                  <label class="col-sm-4 control-label">出版年份：</label>
                  <div class="col-sm-6">
                    <input id="book_time" name="time" type="text" class="form-control" placeholder="" >
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
    <script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/jquery.validate.js" type="text/javascript"></script>
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
            window.location.href = "book_list.action?id=${id}&pageNum=" + pageNum;
        };
    </script>
     <script>
    	$(function(){
    		$('.main .edit').click(function(){
    			var id = $(this).parents().attr("id");
				$.post("book_editUI",{"id":id},function(data,textStatus){
					$("#book_id").attr("value",id);	
					$("#book_name").attr("value",data.book.name);	
					$("#book_publish").attr("value",data.book.publish);
					$("#book_bookcase").attr("value",data.book.bookcase);
					$("#book_author").attr("value",data.book.author);
					$("#book_time").attr("value",data.book.time);
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
    
    <!-- javascript to validate form containing function checker() -->
    <script type="text/javascript" src="js/form-validation.js"></script>
</body>
</html>