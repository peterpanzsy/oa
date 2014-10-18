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
    <link rel="stylesheet" href="css/bootstrap-date nntimepicker.min.css">
    <link href="css/bootstrapValidator.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body onload="person_check()">
	  <s:include value="/WEB-INF/jsp/Navi-bar/Navi-bar(admin).jsp"></s:include>
	  <s:debug></s:debug>
	  <s:hidden value="%{#u.id}"></s:hidden>
	  <div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<s:iterator value="#session.topPrivileg">
						<li><a href="${url}">${name}</a>
						</li>
					</s:iterator>
				</ul>
			</div>
			
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">         
          <h1 class="page-header">个人信息管理</h1>
          <div class="table-responsive">
             
             <form id="defaultForm"  action="user_edit">
           
            <table class="table table-bordered">
              <caption>个人信息修改</caption>
                <s:hidden name="id" value="%{#u.id}"></s:hidden>
                <!--三种颜色循环，直到结束，不够再循环-->
                <tr>
                  <td width="10%"><strong>头像 *</strong></td>
                 <td><img id="pict" src="member_showImage?imageUrl =${u.portrait.uploadRealName}"
								style="border:1px solid #ccc; width:100px; height:100px; padding:5px;margin-right:12px;" />
								<button type="button" class="btn btn-success" data-toggle="modal"
									data-target="#myModal2">更换头像</button></td>          
                </tr>
                <tr>
                  <td width="10%"><strong>用户名 *</strong></td>
                  <td><input type="text" disabled="disabled" name="username" placeholder  ="用户名" class="form-control" value="${u.loginName}">
                  </td>           
                </tr>
                <tr>
                  <td width="10%"><strong>修改密码</strong></td>
                  <td>
                   <table cellpadding="10">
                     <tr><td>输入原密码：</td><td><input type="password"  name="password" class="form-control" placeholder="填入你的密码"></td></tr>
                     <tr><td>输入新密码：</td><td><input type="password" name="newpassword1" class="form-control" placeholder="填入新的密码"></td></tr>
                     <tr><td>确认新密码:</td><td><input type="password" name="newpassword2" class="form-control" placeholder="再次填入新的密码"></td></tr>
                   </table>
                  </td>    

                </tr>
                <tr>
                  <td width="10%"><strong>真实姓名： *</strong></td>
                  <td><input type="text" name="name"   placeholder  ="" class="form-control" value="${u.name }" required>
                  </td>           
                </tr>
                <tr>
                  <td width="10%"><strong>性别： *</strong></td>
                  <td>
				<s:if test='%{#u.gender=="女"}'>
                  <label class="radio-inline">
                    <input type="radio" name="gender"name="inlineRadioOptions" id="inlineRadio1" value="男"  > 男
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="gender" name="inlineRadioOptions" id="inlineRadio2" value="女" checked="checked"> 女
                  </label>
                  </s:if>
                  <s:else>
                  <label class="radio-inline">
                    <input type="radio" name="gender" id="inlineRadio1" value="男"   checked="checked"> 男
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="gender" id="inlineRadio2" value="女"> 女
                  </label>
                  </s:else>
                  
                  </td>           
                </tr>
                <tr>
                  <td width="10%"><strong>专业： *</strong></td>
                  <td><input type="text" name="major"  placeholder  ="" class="form-control" value="${u.major}" >
                  </td>           
                </tr>
                <tr>
                  <td width="10%"><strong>生日：*</strong></td>
                  <td><div class="input-group date form_date col-sm-6" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="16" type="text" name="birthday" value="${u.birthday}" readonly >
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                  </td>           
                </tr>
                <tr>
                  <td width="10%"><strong>目前学历：*</strong></td>
                  <td>
                  <s:radio name="education" list="%{#{'博士':'博士','硕士':'硕士','本科':'本科'}}" value="#u.education" theme="simple"></s:radio>
                  </td>           
                </tr> 

                <tr>
                  <td width="10%"><strong>联系方式： *</strong></td>
                  <td><input placeholder  ="" name="phone" class="form-control" value="${u.phone }"   pattern="[0-9]{11}" title="请输入正确的手机格式!">
                  </td>           
                </tr>
                <tr>
                  <td width="10%"><strong>紧急联系人和联系方式 *</strong></td>
                  <td><table><tr><td>紧急联系人：</td><td><input type="text" name="contactor"value="${u.contactor }"  class="form-control" ></td><td>&nbsp;&nbsp;&nbsp;</td><td>联系方式：</td><td><input type="text" class="form-control" name="ephone" value="${u.ephone }"  pattern="[0-9]{11}" title="请输入正确的手机格式!"></td></tr></table>
                  </td>           
                </tr>
                <tr>
                  <td width="10%"><strong>常用邮箱： *</strong></td>
                  <td><input type="email" name="email" placeholder  ="" class="form-control" value="${u.email }" >
                  </td>           
                </tr>
                <tr>
                  <td width="10%"><strong>起始工作日期 *</strong></td>
                  <td><input type="text" name="recruitment"class="form-control" value="${u.recruitment }"  pattern="[0-9]{4}" title="请输入正确的年份">
                  </td>           
                </tr>
                <tr>
                  <td width="10%"><strong>个人经历（重点项目经历） *</strong></td>
                  <td><textarea name="resume" id="" name="resume"cols="30" rows="5" class="form-control"  >${u.resume}</textarea></td>           
                </tr>
                <tr>
                  <td width="10%"><strong>毕业后去向（想法） *</strong></td>
                  <td><textarea name="graduation" id="" name="graduation"cols="30" rows="5" class="form-control" >${u.graduation }</textarea>
                  </td>           
                </tr>
				
              </table>
              	<p align="center">
                <button type="submit" class="btn btn-primary">提交修改</button>
                <!-- <button class="btn">取消</button> -->
              </p>
              </form>
           </div>
        </div>
      </div>
    </div>

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">更换头像</h4>
      </div>
      <div class="modal-body">
      		<div class="form-group">
				<!-- 从这里开始是我改的 -->
					<form id="form2" method="post" enctype="multipart/form-data">
						<strong class="col-sm-3">选择头像：</strong> <input class="col-sm-7"
							type="file" id="fileupload" name="fileupload"
							onchange="uploadImage()">
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
					         <input type="hidden" name="fileuploadFileName" id="fileuploadFileName"/>
					          <input type="hidden" name="fileRealName" id="fileRealName"/>  
					           <input type="hidden" name="fileuploadContentType" id="fileuploadContentType"/>    
					         </div>
      <div class="modal-footer" style="clear:both">
        <button type="submit" class="btn btn-success">确定修改</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        
      </div>
			</form> 
			<!-- 到这结束 -->
					 <!-- 这个是原来版本的 
					<div class="form-group"><strong class="col-sm-3">选择头像：</strong>
			          <input class="col-sm-7" type="file" onchange="loadImage(this)"></div>
          <div class="col-sm-8"id='box'>预览图片：
            <img src="" alt="">
          </div>  
          <div class="col-sm-4">裁剪预览：
            <img src="" alt="">
          </div> 
          			-->
    
    </div>
  </div>
</div>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/jquery.Jcrop.js"></script>
   	<script src="js//jquery-form.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <%-- <script src="js/bootstrapValidator.js"></script> --%>
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
<!--表单验证-->
  <script>
    /* $(function(){
    	$('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            newpassword1: {
                message: 'The newpassword1 is not valid',
                validators: {
                    regexp: {
                        regexp: /^[^ ]{6,16}$/,
                        message: '密码不能包含空格且大小为6-16'
                    }
                }
            },
            name: {
                message: 'The newpassword1 is not valid',
                validators: {
                    regexp: {
                        regexp: /^[^ ]{6,16}$/,
                        message: '密码不能包含空格且大小为6-16'
                    }
                }
            }
            }});
    }) */
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
   						$("#fileuploadContentType").attr("value",map.fileuploadContentType);
   						$("#fileuploadFileName").attr("value",map.fileuploadFileName);
				
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
    <!-- javascript to validate form containing function check() -->
    <script src="js/jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/form-validation.js"></script>
</body>
</html>