function randomCode(){
	$CODE = Math.floor(Math.random()*90000)+1000;
};
function changecode(){
	randomCode();
	$("#code1").text($CODE);
};
function funA(){
	changecode();
	setTimeout('funA()', 15000); 
};
funA();
$(function(){

	changecode();
	
	$("#sublog").on("click",function(){
		if($("#nicname").val()=="" || $("#pass").val()=="" || $("#incode").val()==""){
			alert("请输入完整信息");
			return false;
		}
		var nicname = $("#nicname").val(),pass = hex_md5($("#pass").val()),incode = $("#incode").val();
		if($CODE!=incode){
			alert("验证码错误");
			changecode();
			return false;
		}
		$.post($path+"/login/checkLogin.do",{"username":nicname, "password":pass},function(data){
			if(data.resultCode == "0000"){
				window.location.href=$path+"/system/index/toMain.do";
				// alert("success");
			}else{
				changecode();
				alert(data.resultDesc);
			}
		},"json");
		
	});
	
	$("#subchange").on("click",function(){
		if($("#ypass").val()=="" || $("#npass1").val()=="" || $("#npass2").val()==""){
			$.messager.alert("消息","请输入完整信息","warning");
			changecode();
			return false;
		}
		var ypass = hex_md5($("#ypass").val()),npass1 = hex_md5($("#npass1").val()),npass2 = hex_md5($("#npass2").val()),incode = $("#incode").val();
		if($CODE!=incode){
			$.messager.alert("消息","验证码错误","warning");
			changecode();
			return false;
		}
		if(npass1!=npass2){
			$.messager.alert("消息","两遍新口令不一致","warning");
			changecode();
			return false;
		}
		$.post($webURI+"/system/sysuser/changeKL.action",{urmsg:ypass,pass:npass1},function(data){
			if(data.code>0){
				$.post($webURI+"/system/index/quitlog.action",function(data){
					alert("修改成功，需重新登陆");
					top.location.href=$webURI;
		    	});
			}else{
				changecode();
				$.messager.alert("消息",data.msg,"warning");
			}
		},"json");
		
	});
	
});