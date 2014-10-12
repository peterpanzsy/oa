jQuery.validator.addMethod("isip", function(value, element) {    
      return this.optional(element) || /^(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.)(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.){2}([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))$/.test(value);    
    }, "请填写正确的IP地址。");
jQuery.validator.addMethod("isTel", function(value,element) {   
    var length = value.length;   
    var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;   
    var tel = /^(\d{3,4}-?)?\d{7,9}$/g;       
    return this.optional(element) || tel.test(value) || (length==11 && mobile.test(value));   
}, "请正确填写您的联系方式"); 
jQuery.validator.addMethod("isChinese", function(value, element) {       
    return this.optional(element) || /^[\u0391-\uFFE5]+$/.test(value);       
}, "只能包含中文字符。");      
jQuery.validator.addMethod("userCheck", function(value, element) {   
	  return  /^[\u0391-\uFFE5\w]+$/.test(value);   
	}, "只能包括中文字、英文字母、数字和下划线");   
jQuery.validator.addMethod("passCheck", function(value, element) {
	var kongge = /.*[\s]+.*$/;
	  return !kongge.test(value);   
	}, "密码不能包含空格"); 
function book_checker() {
 $("#bookForm").validate({
   rules: 
   {
   name: {
    required: true,
    maxlength:25
   },
   author: {
    required: true,
    maxlength:25	
   },
   bookcase: {
    required: true,
    maxlength:5
   },
   publish:{
	maxlength:20
   },
   time:{
	maxlength:4,
	digits:true
   }
   },
   messages: {
   name: {
    required: "请填写书名",
    maxlength:"图书的名字不能超过25字符"
   },
   author: {
    required: "请填写作者名",
    maxlength:"作者的名字不能超过25字符"
   },
   bookcase: {
    required: "请填写书柜名",
    maxlength:"书柜的名字不能超过5字符"
   },
   publish:{
	maxlength:"出版社的名称不能超过20字符"
   },
   time:{
		maxlength:"请填写正确的年份",
		digits:"请填写正确的年份"
	   }
   },
   }
 );};
 
 function server_checker(){
$("#serverForm").validate({
	 rules:
	 	 {
		 address:{
			 maxlength:25
		 },
		 ip:{
			 required:true ,
			 isip:true
		 },
		 system:{
			 maxlength:20
		 },
		 configure:{
			 maxlength:50
		 },
		 username:{
			 isChinese:true,
			 maxlength:10
		 },
		 description:{
			 maxlength:100
		 },
		 purpose:{
			 maxlength:50
		 }
	 	 },
	 	messages:{
	 		address:{
				 maxlength:"地址不能超过25字符"
			 },
	 	 	ip:{
	 	 		required:"ip地址是必填的"
	 	 	},
	 	 	system:{
				 maxlength:"系统名称不能超过20字符"
			 },
			 configure:{
				 maxlength:"配置描述不能超过50字符"
			 },
			 username:{
				 isChinese:"请填写正确的中文姓名",
				 maxlength:"姓名不允许超过10字符"
			 },
			 description:{
				 maxlength:"描述不能超过100字符"
			 },
			 purpose:{
				 maxlength:"用途不能超过50字符"
			 }
	 	 	
			 
	 	}
	 	 
		 }
	 
 );};
 
  function user_addcheck(){
	  $("#userForm").validate({
		  rules:{
			  loginName:{
				 userCheck:true,
				 required:true
			  },
			  password:{
				  required:true,
				  passCheck:true,
				  minlength:6,
				  maxlength:16
			  },
			  name:{
				  isChinese:true,
				  maxlength:10
			  },
			  phone:{
				  isTel:true
			  },
			  email:{
				  email:true
			  }},
		messages:{
				  loginName:{
					 required:"必须填写用户名"
				  },
				  password:{
					  required:"必须填写密码",
					  passCheck:"用户名为6位到16位的字符组合，不能包含空格",
					  minlength:"用户名为6位到16位的字符组合，不能包含空格",
					  maxlength:"用户名为6位到16位的字符组合，不能包含空格"
				  },
				  name:{
					  isChinese:"请填写正确的姓名",
					  maxlength:"请填写正确的姓名"
				  },
				  phone:{
					  isTel:"请填写正确的联系方式"
				  },
				  email:{
					  email:"请填写正确的邮箱地址"
				  }}
	  });
  }
  
  
 