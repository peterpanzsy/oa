<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="UTF-8">
  <title>小组成员</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
 <!--导航部分-->
    <s:include value="/WEB-INF/jsp/Navi-bar/Navi-bar.jsp"/>
    
<!--公告列表-->
  <div class="container infowrap" style="position:relative;">
    <!-- <div class="row">
      <div class="col-md-8">-->
      <div class="year_option">
      	<s:form action="member_search">
	      <label for="">请选择年份：</label>
		      <select name="year" id="">
		      	<option value="2014">2014</option>
		      	<option value="2015">2015</option>
		      	<option value="2016">2016</option>
		      </select>
		      <input type="submit"/>
	    </s:form>
      </div>
        <div class="info_top resource_top">
          <p>
            <strong>小组成员</strong>
            <span>Member</span>
          </p>
        </div>
        <s:if test="#memberList == null || #memberList.size() == 0">
      	  <div class="member_content">
      	  	这一年木有新人
      	  </div>
        </s:if><s:else>
        
        
        <div class="member_content">
        	<div class="docter">
        	  <p>
	            <strong>博士生</strong>
	            <span>docter</span>
	          </p>  
	          <ul>
	          <s:iterator value="#memberList">
	          <s:if test="education=='博士'">
	          <li class="user_click"><s:hidden value="%{id}"/><a data-toggle="modal" data-target="#myModal2"><img src="member_showImage?imageUrl=${portrait.uploadRealName}" alt=""><br></a><a href="#">${name}</a></li>
	          </s:if>
	          </s:iterator>

	          </ul>
	        </div> 
	        <div class="master">
        	  <p>
	            <strong>硕士生</strong>
	            <span>master</span>
	          </p>  
	          <ul>
	          <s:iterator value="#memberList">
	          <s:if test=" education == '研究生'">
	          		<li class="user_click"><s:hidden value="%{id}"/><a data-toggle="modal" data-target="#myModal2"><img src="member_showImage?imageUrl=${portrait.uploadRealName}" alt=""><br></a><a href="#">${name}</a></li>
	          </s:if>
	          </s:iterator>
	          </ul>
	        </div> 
	         <div class="practice">
        	  <p>
	            <strong>实习生</strong>
	            <span>practice</span>
	          </p>  
	          <ul>
	          	 <s:iterator value="#memberList">
	          <s:if test="education=='本科'">
	          <li class="user_click"><s:hidden value="%{id}"/><a data-toggle="modal" data-target="#myModal2"><img src="member_showImage?imageUrl=${portrait.uploadRealName}" alt=""><br></a><a href="#">${name}</a></li>
	          </s:if>
	          </s:iterator>
	          </ul>
	        </div> 
        </div>  
    </s:else>  

    
     <!-- <div class="col-md-4">
        <div class="link1"><a href="http://www.xjtu.edu.cn" target="blank"><img width="100" src="images/xjtu_logo.jpg" alt=""><br>西安交通大学<br><span>www.xjtu.edu.cn</span></a></div>
        <div class="link2"><a href="http://nskeylab.xjtu.edu.cn" target="blank"><p>智能网络与网络安全教育部重点实验室</p><p class="bottom"><span>http://nskeylab.xjtu.edu.cn</span><img src="images/go.png" alt=""></p></a></div>
        <div class="link3"><a href="http://www.sei.xjtu.edu.cn/" target="blank"><p>系统工程研究所<br><span>http://www.sei.xjtu.edu.cn/</span></p><img src="images/go.png" alt=""></a></div>
        <div class="link4"><a href="http://www.cfins.au.tsinghua.edu.cn" target="blank"><p>智能与网络化系统研究中心<br><span>http://www.cfins.au.tsinghua.edu.cn</span></p><img src="images/go.png" alt=""></a></div>
      </div>-->
    </div>  
  
<!--footer部分-->
  <footer class="footer">
    <div class="ftbq">
      版权所有© 2014-2015 西安交通大学智能网络与网络安全教育部重点实验室iMiss小组
    </div>
  </footer>

 <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">成员信息详情</h4>
      </div>
      <div class="modal-body">
         <div class="container" style="width:100%">
         	<div class="row">
         	<p class="title"><span>&nbsp基本信息&nbsp</span></p>
         	</div>
         	<div class="row">
         	<div class="col-md-4">
         	<img id="user_touxiang" src="" alt="">
         	</div>
         	<div class="col-md-8">
         	<p><strong>姓名：</strong><span id="u_name"></span></p>
         	<p><strong>性别：</strong><span id="u_gender"></span></p>
         	<p><strong>学历：</strong><span id="u_education"></span></p>
         	<p><strong>专业：</strong><span id="u_major"></span></p>
         	<p><strong>学号：</strong><span id="u_studentno"></span></p>
         	<p><strong>班级：</strong><span id="u_classno"></span></p>
         	<p><strong>出生日期：</strong><span id="u_birth"></span></p>
         	<p><strong>联系方式：</strong><span id="u_phone"></span></p>
         	<p><strong>QQ：</strong><span id="u_qq"></span></p>
         	<p><strong>YY：</strong><span id="u_yy"></span></p>
         	<p><strong>Skype：</strong><span id="u_skype"></span></p>
         	<p><strong>邮箱：</strong><span id="u_email"></span></p>
         	<p><strong>加入年份：</strong><span id="u_recruit"></span></p>
 	        <p><strong>紧急联系人：</strong><span id="u_contactor"></span></p>
 	        <p><strong>紧急联系电话：</strong><span id="u_ephone"></span></p>
         	
         	</div>
         	</div>
         	
         	<div class="row">
         	<p class="title"><span>&nbsp个人经历&nbsp</span></p>
         	</div>
         	
         	<div class="row"><p id="u_resume"></p></div>
         	
         	<div class="row">
         	<p class="title"><span>&nbsp项目经历&nbsp</span></p>
         	</div>
         	
         	<div class="row" id="u_program"></div>
         	
         	<div class="row">
         	<p class="title"><span>&nbsp论文、专利与获奖&nbsp</span></p>
         	</div>
         	
         	<div class="row"  id="u_reward"></div>
         	
         	
         	
         	<div class="row">
         	<p class="title"><span>&nbsp毕业后去向&nbsp</span></p>
         	</div>
         	<div class="row"><p id="u_graduation"></p></div>
         </div>
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
    <script>
    $(function(){
    $('.user_click').click(
    function (){
    	
    	
    	
    	id=$(this).find('input').attr('value');
    	$.post("user_showdetail",{id:id},function(data){
    		$("#u_name").text(data.name);
    		$("#u_gender").text(data.gender);
    		$("#u_education").text(data.education);
    		$("#u_major").text(data.major);
    		$("#u_studentno").text(data.studentno);
    		$("#u_classno").text(data.classno);
    		$("#u_birth").text(data.birthday);
    		$("#u_phone").text(data.phone);
    		$("#u_qq").text(data.QQaccount);
    		$("#u_yy").text(data.YYaccount);
    		$("#u_skype").text(data.skypeaccount);
    		$("#u_email").text(data.email);
    		$("#u_recruit").text(data.recruit);
    		$("#u_contactor").text(data.contactor);
    		$("#u_ephone").text(data.ephone);
    		$("#u_resume").text(data.resume);
    		$("#u_program").text("");
    		$("#u_reward").text("");
    		$("#u_graduation").text(data.graduation);

    		$("#user_touxiang").attr("src","member_showImage?imageUrl ="+data.portraitName);

    		for(var i=0;i<data.program.length;i++){
				var $p = $("<p class=\"u_programs\"></p>");
				$p.text(data.program[i]);
				$("#u_program").append($p);
			}
    		
    		for(var i=0;i<data.reward.length;i++){
				var $p = $("<p class=\"u_rewards\"></p>");
				$p.text(data.reward[i]);
				$("#u_reward").append($p);
			}
    	})
    }		
    )
    })
    
    
    
    
    
    </script>
</body>
</html>