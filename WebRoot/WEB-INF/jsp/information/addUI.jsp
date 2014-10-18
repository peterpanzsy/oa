<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>通知发布</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="css/editor.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/jquery.fileupload.css">
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
          <h1 class="page-header">发布通知</h1>
          <s:form cssClass="form-horizontal" action="info_add" enctype="multipart/form-data" method="post" role="form">
          <div class="form-group">
            <label class="col-sm-1 control-label">主题</label>
            <div class="col-sm-11">
              <input id="info_title" type="text" name="title" class="form-control" placeholder="主题" required>
            </div>
          </div>
         
         <div class="form-group">
            <label class="col-sm-1 control-label">正文</label>
            <div class="col-sm-11">
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
                <!--  
                <div class="btn-group">
                  <a class="btn" title="" id="pictureBtn" data-original-title="Insert picture (or just drag &amp; drop)"><i class="icon-picture"></i></a>
                  <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" >
                </div>
                -->
                <div class="btn-group">
                  <a class="btn" data-edit="undo" title="" data-original-title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
                  <a class="btn" data-edit="redo" title="" data-original-title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
                </div>
                <input type="text" name="content" data-edit="inserttext" id="voiceBtn" x-webkit-speech="" style="display: none;">
              </div>            
              

              <div id="editor" contenteditable="true"  >
               
              </div>
              	<!-- 这个是自己加的 -->
              	<s:hidden name="content" id="info_content"></s:hidden>
              
              
              <!--文件上传-->
             <div style="margin-top:12px;">
                <span class="btn btn-primary fileinput-button">
                    <i class="icon-plus icon-white"></i>
                    <span>选择上传文件</span>
                    <input name="attachment" id="fileupload" type="file" name="files[]" multiple>
                </span>
                <br>
                <br>
                <!-- 进度条 
                <div id="progress" class="progress progress-success progress-striped">
                    <div class="bar"></div>
                </div>
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
              <button id="info_submit" type="submit" class="btn btn-primary" style="float:right">发布</button>
            </div>
          </div>
          <s:token></s:token>
        </s:form>
          
        </div>
      </div>
    </div>




<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js//jquery-1.11.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
     <script src="js/bootstrap-wysiwyg.js"></script>
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
		//提交添加单击事件
		$("#info_submit").click(function(){
			//进行验证
			//var title = $("#info_title").val();
			var content =$("#editor").html();
			$("#info_content").val(content);
		});
        });

    </script>
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
    
    <script>
    $(function(){
          	$("a:contains('通知发布')").parent().attr('class',"active");
    });
    </script>


</body>
</html>