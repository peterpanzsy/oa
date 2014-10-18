<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="UTF-8">
  <title>群发邮件</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/editor.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <link rel="stylesheet" href="css/jquery.fileupload.css">
    <link href="skins/all.css" rel="stylesheet">
  
</head>
<body>
 <s:include value="/WEB-INF/jsp/Navi-bar/Navi-bar.jsp"/>
<!--公告列表-->
  <div class="container infowrap">
     <div class="row">
      <div class="col-md-8">
        <div class="info_top mail_top">
          <p>
            <strong>邮件群发</strong>
            <span>Mail</span>
          </p>
        </div>
        <s:debug></s:debug>
        <div class="info_content">
	          <s:form action="email_send" cssClass="form-horizontal" role="form" enctype="multipart/form-data">
		<s:token></s:token>				 
			<div class="form-group">
				    <label class="col-sm-2 control-label">收件人</label>
				    <div class="col-sm-10">
				      <s:textfield name="toAddress" type="text" cssClass="form-control" id="reciever" placeholder="收件人"></s:textfield>
				    </div>
				  </div>

				  <div class="form-group">
				    <label class="col-sm-2 control-label">主题</label>
				    <div class="col-sm-10">
				      <s:textfield name="subject" type="text" cssClass="form-control" id="inputPassword3" placeholder="主题"></s:textfield>
				    </div>
				  </div>
				 <div class="form-group">
				    <label class="col-sm-2 control-label">正文</label>
				   
				    <div class="col-sm-10">

					    <div id="editor" contenteditable="true">
					    </div>
					    
					     <!-- 这个是自己加的 -->
             		 	<s:hidden name="content" id="email_content"></s:hidden>
					    <!--文件上传-->
				 		 <div style="margin-top:12px;">
						    <span class="btn btn-primary fileinput-button">
						        <i class="icon-plus icon-white"></i>
						        <span>选择上传文件</span>
						        <input id="file_upload" type="file" name="upload" multiple onchange="javascript:getFileName();">
						    </span>
						    <br>
						  <strong>已选择的文件：</strong>
						  <span id="fileNameShow"></span>
						    <!-- 进度条 
							    <div id="progress" class="progress progress-success progress-striped">
							        <div class="bar"></div>
							    </div>
						    -->
						    <!-- 已经上传的文件列表 
						    <table role="presentation" class="table table-striped">
						      <tbody class="files" data-toggle="modal-gallery" data-target="#modal-gallery">
						      </tbody>
						    </table>  
						    -->
						</div>
				    </div>
				  </div>
				
				 
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button id="email_submit" type="submit" class="btn btn-primary" style="float:right">发送</button>
				    </div>
				  </div>
				</s:form>
        </div>
      </div>
      <div class="col-md-4">
        <div class="slider_r">
        	<p>
        		<strong>联系人</strong><span>Contacts</span>
        	</p>
        	
        	<ul>
        		<li id="all">       				
        			<input type="checkbox">
        			<label><strong>全部联系人</strong></label>
        		</li>	

        		<div class="contacts">

	        			<s:iterator value="#userList">  
	        			<li>
	        				<input type="checkbox" />
	        				<s:property value="name"/>
	        				<label >
	        					<s:hidden name="email"></s:hidden>
	        				</label>
	        				<!--  <label ><s:property value="name"/></label>
	        				<s:hidden value="email"></s:hidden>
	        				-->
	        			</li>
	        		</s:iterator>
        		</div>
   
        	</ul>        	 
        </div>
      </div>
    </div>  
  </div>
  
<!--footer部分-->
  <footer class="footer">
    <div class="ftbq">
      版权所有© 2014-2015 西安交通大学智能网络与网络安全教育部重点实验室iMiss小组
    </div>
  </footer>

     
    
    <script src="js//jquery-1.11.1.min.js"></script>
    <script> 
      $(function(){
        $('.container .infomation li').mouseover(function(){
          $(this).addClass('active');
        }).mouseout(function(){
          $(this).removeClass('active');
        });
      })   
    </script>
     <script src="js/bootstrap.min.js"></script>
     <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <script src="js/jquery.ui.widget.js"></script>
    <!--  <script src="js/jquery.fileupload.js"></script>
    <script src="js/jquery.iframe-transport.js"></script>
    <script src="js/jquery.tmpl.min.js"></script>-->
    <script src="js/icheck.js"></script>
    <!--datetime配置-->
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
    <script src="js/bootstrap-wysiwyg.js"></script>
<!--文本编辑器配置-->
    <script>
	  $(function(){
	    function initToolbarBootstrapBindings() {
	      var fonts = ["宋体","微软雅黑","黑体",'Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
	            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
	            'Times New Roman', 'Verdana'],
	            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
	      $.each(fonts, function (idx, fontName) {
	          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
	      });
	      $('a[title]').tooltip({container:'body'});
	    	$('.dropdown-menu input').click(function() {return false;})
			    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
	        .keydown('esc', function () {this.value='';$(this).change();});

	      $('[data-role=magic-overlay]').each(function () { 
	        var overlay = $(this), target = $(overlay.data('target')); 
	        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
	      });
	      $('#voiceBtn').hide();
	      // if ("onwebkitspeechchange"  in document.createElement("input")) {
	      //   var editorOffset = $('#editor').offset();
	      //   $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
	      // } else {
	      //   $('#voiceBtn').hide();
	      // }
	    };
	    initToolbarBootstrapBindings();  
	    $('#editor').wysiwyg();
	    window.prettyPrint && prettyPrint();
	  });
	</script>
	<script src="js/jquery.hotkeys.js"></script>


<!--icheck配置-->
<script>
	$(document).ready(function(){
	$('#reciever').val('');
	$('.col-md-4 .slider_r .contacts input').iCheck('uncheck');
            $('.col-md-4 .slider_r input').iCheck({
              checkboxClass: 'icheckbox_square-blue',
              radioClass: 'iradio_square-blue',
              increaseArea: '20%'
            });
            $('#all input').on('ifChecked',function(event){
            	$('.col-md-4 .slider_r .contacts input').iCheck('check');
            }).on('ifUnchecked',function(event){
            	$('.col-md-4 .slider_r .contacts input').iCheck('uncheck');
            });
            $('.col-md-4 .slider_r input').on('ifChecked', function(event){
            	//$('#reciever').val($('#reciever').val()+$(this).parent().parent().find("label").text()+';');
            	 $('#reciever').val($('#reciever').val()+$(this).parent().parent().find("label").find('input').attr('value')+';');
            	//alert();
            })
            $('.col-md-4 .slider_r input').on('ifUnchecked', function(event){
            	$('#reciever').val($('#reciever').val().replace($(this).parent().parent().find("label").find('input').attr('value')+';',""));
            })
        
          
          
          $("#email_submit").click(function(){
			//进行验证
			var content = $("#editor").html();
			//alert(content);
			$("#email_content").val(content);
		});
		  });
</script>
<script>
	
		function getFileName() {
			var f = document.getElementById("file_upload").files;
			for (var i=0;i<f.length;i++)
				$('#fileNameShow').text($('#fileNameShow').text()+f[i].name+" ");
		}
		

</script>

</body>
</html>