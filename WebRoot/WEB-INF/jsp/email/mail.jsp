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
    <!--<link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">-->
   
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
 <!--导航部分-->
    <nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">iMiss小组办公自动化系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav mynav">
            <li><a href="index.html">首页</a></li>
            <li><a href="#">小组项目</a></li>
            <li class="active"><a href="#">邮件群发</a></li>
            <li><a href="#">财务信息</a></li>
            <li><a href="#">活动信息</a></li>
           <li class="dropdown">
	         			<a href="#" class="dropdown-toggle" data-toggle="dropdown">小组资源 <span class="caret"></span></a>
	          			<ul class="dropdown-menu" role="menu">
	            		<li><a href="home_resource">图书资源</a></li>
	            		<li><a href="server_list">服务器资源</a></li>	            
	          			</ul>
	        			</li>
            <li><a href="#">关于网站</a></li>            
          </ul>         
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#" data-toggle="modal" data-target="#myModal">个人设置</a></li>            
            <li><a href="admin.html">后台管理</a></li>            
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
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
        <div class="info_content">
	          <form class="form-horizontal" role="form">
				  <div class="form-group">
				    <label class="col-sm-2 control-label">收件人</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="inputEmail3" placeholder="收件人">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">主题</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="inputPassword3" placeholder="主题">
				    </div>
				  </div>
				 <div class="form-group">
				    <label class="col-sm-2 control-label">正文</label>
				    <div class="col-sm-10">
				      	<div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
					      <div class="btn-group">
					        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font" data-original-title="Font"><i class="icon-font"></i><b class="caret"></b></a>
					        <ul class="dropdown-menu">
					        </ul>
					      </div>
					      <div class="btn-group">
					        <a class="btn dropdown-toggle" data-toggle="dropdown" title="" data-original-title="Font Size"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
					          <ul class="dropdown-menu">
					          <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
					          <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
					          <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
					          </ul>
					      </div>
					      <div class="btn-group">
					        <a class="btn" data-edit="bold" title="" data-original-title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
					        <a class="btn" data-edit="italic" title="" data-original-title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
					        <a class="btn" data-edit="strikethrough" title="" data-original-title="Strikethrough"><i class="icon-strikethrough"></i></a>
					        <a class="btn" data-edit="underline" title="" data-original-title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
					      </div>
					      <div class="btn-group">
					        <a class="btn" data-edit="insertunorderedlist" title="" data-original-title="Bullet list"><i class="icon-list-ul"></i></a>
					        <a class="btn" data-edit="insertorderedlist" title="" data-original-title="Number list"><i class="icon-list-ol"></i></a>
					        <a class="btn" data-edit="outdent" title="" data-original-title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
					        <a class="btn" data-edit="indent" title="" data-original-title="Indent (Tab)"><i class="icon-indent-right"></i></a>
					      </div>
					      <div class="btn-group">
					        <a class="btn" data-edit="justifyleft" title="" data-original-title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
					        <a class="btn" data-edit="justifycenter" title="" data-original-title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
					        <a class="btn" data-edit="justifyright" title="" data-original-title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
					        <a class="btn" data-edit="justifyfull" title="" data-original-title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
					      </div>
					      <div class="btn-group">
							  <a class="btn dropdown-toggle" data-toggle="dropdown" title="" data-original-title="Hyperlink"><i class="icon-link"></i></a>
							    <div class="dropdown-menu input-append">
								    <input class="span2" placeholder="URL" type="text" data-edit="createLink">
								    <button class="btn" type="button">Add</button>
					        </div>
					        <a class="btn" data-edit="unlink" title="" data-original-title="Remove Hyperlink"><i class="icon-cut"></i></a>

					      </div>
					      <div class="btn-group">
					        <a class="btn" title="" id="pictureBtn" data-original-title="Insert picture (or just drag &amp; drop)"><i class="icon-picture"></i></a>
					        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" >
					      </div>
					      <div class="btn-group">
					        <a class="btn" data-edit="undo" title="" data-original-title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
					        <a class="btn" data-edit="redo" title="" data-original-title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
					      </div>
					      <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="" style="display: none;">
					    </div>				    
					    

					    <div id="editor" contenteditable="true">
					      Go ahead…
					    </div>
					    <!--文件上传-->
				 		 <div style="margin-top:12px;">
						    <span class="btn btn-primary fileinput-button">
						        <i class="icon-plus icon-white"></i>
						        <span>选择上传文件</span>
						        <input id="fileupload" type="file" name="files[]" multiple>
						    </span>
						    <br>
						    <br>
						    <!-- 进度条 -->
						    <div id="progress" class="progress progress-success progress-striped">
						        <div class="bar"></div>
						    </div>
						    <!-- 已经上传的文件列表 -->
						    <table role="presentation" class="table table-striped">
						      <tbody class="files" data-toggle="modal-gallery" data-target="#modal-gallery">
						      </tbody>
						    </table>  
						</div>
				    </div>
				  </div>
				
				 
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-primary" style="float:right">发送</button>
				    </div>
				  </div>
				</form>
        </div>
      </div>
      <div class="col-md-4">
        <div class="link1"><a href="http://www.xjtu.edu.cn" target="blank"><img width="100" src="images/xjtu_logo.jpg" alt=""><br>西安交通大学<br><span>www.xjtu.edu.cn</span></a></div>
        <div class="link2"><a href="http://nskeylab.xjtu.edu.cn" target="blank"><p>智能网络与网络安全教育部重点实验室</p><p class="bottom"><span>http://nskeylab.xjtu.edu.cn</span><img src="images/go.png" alt=""></p></a></div>
        <div class="link3"><a href="http://www.sei.xjtu.edu.cn/" target="blank"><p>系统工程研究所<br><span>http://www.sei.xjtu.edu.cn/</span></p><img src="images/go.png" alt=""></a></div>
        <div class="link4"><a href="http://www.cfins.au.tsinghua.edu.cn" target="blank"><p>智能与网络化系统研究中心<br><span>http://www.cfins.au.tsinghua.edu.cn</span></p><img src="images/go.png" alt=""></a></div>
      </div>
    </div>  
  </div>
  
<!--footer部分-->
  <footer class="footer">
    <div class="ftbq">
      版权所有© 2014-2015 西安交通大学智能网络与网络安全教育部重点实验室iMiss小组
    </div>
  </footer>

   <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">个人信息修改</h4>
      </div>
      <div class="modal-body">
          <form class="form-horizontal" role="form">
                <div class="form-group">
                  <label class="col-sm-4 control-label">用户名：</label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control" disabled="disabled" placeholder="user1" >
                  </div>
                </div>
                <!--修改密码-->
                <div class="panel panel-default">
                <div class="panel-heading">
                  <h3 class="panel-title">修改密码</h3>
                </div>
                  <div class="panel-body">   
                <div class="form-group">
                  <label class="col-sm-4 control-label">原密码：</label>
                  <div class="col-sm-6">
                    <input type="password" class="form-control" placeholder="填入你的密码">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">新密码：</label>
                  <div class="col-sm-6">
                    <input type="password" class="form-control" placeholder="填入新的密码">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">确认新密码：</label>
                  <div class="col-sm-6">
                    <input type="password" class="form-control" placeholder="再次填入新的密码">
                  </div>
                </div>
              </div>
            </div>
            
            <div class="panel panel-default">
                <div class="panel-heading">
                  <h3 class="panel-title">修改个人信息</h3>
                </div>
                  <div class="panel-body">   
                <div class="form-group">
                  <label class="col-sm-4 control-label">真实姓名：</label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control" placeholder="姓名1">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">性别：</label>
                    <div class="col-sm-6">
                  <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked="checked"> 男
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 女
                  </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">生日日期：</label>
                  <div class="input-group date form_date col-sm-6" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                 <input type="hidden" id="dtp_input2" value="" />
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">目前学历：</label>
                    <div class="col-sm-6">
                  <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions2" id="inlineRadio3" value="option1"> 本科
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions2" id="inlineRadio4" value="option2" checked="checked"> 硕士
                  </label>
                   <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions2" id="inlineRadio5" value="option2"> 博士
                  </label>
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-sm-4 control-label">联系方式：</label>
                  <div class="col-sm-6">
                    <input type="text" class="form-control" placeholder="手机号码">
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-sm-4 control-label">邮箱：</label>
                  <div class="col-sm-6">
                    <input type="email" class="form-control" placeholder="常用邮箱">
                  </div>
                </div>

              </div>
            </div>
                
               
              </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">保存修改</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        
      </div>
    </div>
  </div>
</div>
    
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
    <script src="js/jquery.fileupload.js"></script>
    <script src="js/jquery.iframe-transport.js"></script>
    <script src="js/jquery.tmpl.min.js"></script>
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
	
	<script>
		$(function () {
	//列表项模板
    var template = '<tr class="template-upload fade in">'+
        '<td>'+
            '<span class="preview"><canvas width="46" height="80"></canvas></span>'+
        '</td>'+
        '<td>'+
           ' <p class="name">${fileName_}</p>  '+          
        '</td>'+
        '<td>'+
        '    <p class="size">${fileSize_} KB</p>'+
        '    <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="bar" style="width:0%;"></div></div>'+
        '</td>'+
        '<td>'+
        '    <button class="btn btn-primary start">'+
        '       <i class="icon-upload icon-white"></i>'+
        '       <span>Start</span>'+
        '    </button>'+
        '    <button class="btn btn-warning cancel">'+
        '       <i class="icon-ban-circle icon-white"></i>'+
        '       <span>Cancel</span>'+
        '    </button>        '+    
        '</td>'+
    '</tr>';
    var url = 'email_send';
    var currentData = {};
    $('#fileupload').fileupload({autoUpload: true,
        url: url,
        dataType: 'json',
        add: function (e, data) {
    	   var templateImpl = $.tmpl(template,{"fileName_":data.files[0].name,"fileSize_":(data.files[0].size/1000).toFixed(2)}).appendTo( ".files" );
    	   data.content = templateImpl;
    	   $(".start", templateImpl).click(function () {
    		    currentData.bar = templateImpl;    		    
                $('<p/>').text('Uploading...').addClass("uploading").replaceAll($(this));
                data.submit();//上传文件
           });
    	   $(".cancel", templateImpl).click(function () {
                $('<p/>').text('cancel...').replaceAll($(this));
                data.abort();//取消上传
                $(templateImpl).remove();
    	   });
        },

        done: function (e, data) {
        	$(".uploading", data.content).text('上传成功');
        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('.bar', currentData.bar).css(
                'width',
                progress + '%'
            );
        }
    });
});
	</script>


</body>
</html>