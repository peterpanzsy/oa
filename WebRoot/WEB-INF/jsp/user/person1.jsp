<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>个人信息管理</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">
<link rel="stylesheet" href="css/jquery.Jcrop.css" type="text/css" />
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
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">iMiss小组办公自动化系统</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">登出</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="admin_member.html">个人信息管理</a>
					</li>
					<li><a href="admin_member.html">人员管理</a>
					</li>
					<li><a href="admin_info.html">通知发布</a>
					</li>
					<li><a href="admin_info.html">项目管理</a>
					</li>
					<li><a href="admin_economy.html">财务管理</a>
					</li>
					<li><a href="#">活动管理</a>
					</li>
					<li><a href="admin_resource.html">资源管理</a>
					</li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">个人信息管理</h1>
				<div class="table-responsive">
					<table class="table table-bordered">
						<caption>个人信息修改</caption>
						<!--三种颜色循环，直到结束，不够再循环-->
						<tr>
							<td width="10%"><strong>头像 *</strong>
							</td>
							<td><img id="pict" src="member_showImage?imageUrl =${u.portrait.uploadRealName}"
								style="border:1px solid #ccc; width:100px; height:100px; padding:5px;margin-right:12px;" />
								<button class="btn btn-success" data-toggle="modal"
									data-target="#myModal2">更换头像</button></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>




	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">更换头像</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<form id="form2" method="post" enctype="multipart/form-data">  
							<strong class="col-sm-3">选择头像：</strong>
							<input class="col-sm-7"	type="file" id="fileupload" name="fileupload" onchange="uploadImage()">
						</form>
					</div>
					<div class="col-sm-8" id='box' style="width:900px;height:900px;overflow:scroll;">预览：
						<img id="lalalalal"/>
					</div>
					
					    <form action="member_cutPicture.action" method="post">  
					        点击  8
					        <input type="hidden" name="image_filePath" id="filePath"/>  
					        <input type="hidden" name="image_x" id="x"/>  
					        <input type="hidden" name="image_y" id="y"/>  
					        <input type="hidden" name="image_width" id="w"/>  
					        <input type="hidden" name="image_height" id="h"/>  
					        <input type="submit" value="确定" />  
					        ，设置完成。  
					 </form>  
					
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success">确定修改</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/jquery.Jcrop.js"></script>
   	<script src="js//jquery-form.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script> 
	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
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
		$('#pict').Jcrop();
        })

    </script>

	<!--图片预览-->
	<script>  
 	function updatePreview(c)
	      {
           	$("#x").attr("value",c.x);
		 	$("#y").attr("value",c.y);
		  	$("#w").attr("value",c.w);
		  	$("#h").attr("value",c.h);
		  	console.log(c.w);
		  	//alert(c.x);
	        /* if (parseInt(c.w) > 0)
	        {
	        
	          var rx = 100 / c.w;
	          var ry = 100 / c.h;
	
	          $('#preview').css({
	            width: Math.round(rx * boundx) + 'px',
	            height: Math.round(ry * boundy) + 'px',
	            marginLeft: '-' + Math.round(rx * c.x) + 'px',
	            marginTop: '-' + Math.round(ry * c.y) + 'px'
	          });
	        } */
	      };
    	</script>
<script type="text/javascript">  
		function uploadImage() {  
		
		    $(document).ready(  
                    function() {  
                        var options = {  
                        	url : "member_uploadFile",
                            type : "POST",  
                           	dataType : "json",  
                            success : function(map) {
                           		alert(map.newFileName);
                           		//alert("bbb");
                           		//var jsonobj=eval('('+map+')');
                           		//alert(jsonobj.newFileName);
                               // if (msg.indexOf("#") > 0) {  
                                 //   var data = msg.split("#");  
                                    //$("#tipDiv").html(data[0]); 
                                   // alert(data[1]); 
                                   
                                  $("#lalalalal").attr("src","member_showImage?imageUrl="+map.newFileName);
                                  $("#preview").attr("src","member_showImage?imageUrl="+map.newFileName);
                                   //$("#filePath").attr("value",data[1]);
                                   // $("#showImage").html("<img id='lalalalal' src='test_showImage?imageUrl="+data[1]+"'/>");  
									//$("#picture2").html("<img id='preview' src='test_showImage?imageUrl="+data[1]+"'/>");  
		     						$("#filePath").attr("value",map.newFileName);
								
								 $('#lalalalal').Jcrop({
							        onChange: updatePreview,
							    	onSelect: updatePreview,
							        aspectRatio: 1,
							        setSelect: [0,0,264,264],
							        allowSelect : false,
							       // allowMove : true,
							        allowResize : false
							        
							      },function(){
							        // Use the API to get the real image size
							        var bounds = this.getBounds();
							        boundx = bounds[0];
							        boundy = bounds[1];
							       
							        // Store the API in the jcrop_api variable
							        jcrop_api = this;
							        //jcrop_api.setOptions({allowResize:false;});
							      });   
								},
     error: function(e) {
			alert(e);
			alert('aaa');
		} 
                       
          }; 
          $("#form2").ajaxSubmit(options);  
          return false; 
      }); 
	}  ;
</script>
</body>
</html>