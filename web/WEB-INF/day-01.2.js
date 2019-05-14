function codeNum(){
				code=Math.floor(Math.random()*9000+1000);
				var codespan=document.getElementById("codespan");
				codespan.innerHTML=code;
			}
			function unameSpan(){
				var uname=document.getElementById("uname").value;
				var span=document.getElementById("unamespan");
				var reg=/^\d{6,16}$/;
				if(uname==""||uname==null){
					span.innerHTML="用户名不能为空";
					span.style.color="red";
					return false;
				}else if(reg.test(uname)){
					span.innerHTML="用户名正确";
					span.style.color="goldenrod";
					return true;
				}else{
					span.innerHTML="用户名不符合规则";
					span.style.color="burlywood";
					return false;
				}
			}
			function checkPwd(){
				var pwd=document.getElementById("pwd").value;
				var span=document.getElementById("pwdspan");
				var reg=/^[a-z]\w{5,15}$/;
				if(pwd==""||pwd==null){
					span.innerHTML="密码不能为空";
					span.style.color="red";
					return false;
				}else if(reg.test(pwd)){
					span.innerHTML="密码正确";
					span.style.color="goldenrod";
					return true;
				}else{
					span.innerHTML="密码格式不正确";
					span.style.color="burlywood";
					return false;
				}
			}
			function  checkCode(){
				var code=document.getElementById("code").value;
				var span=document.getElementById("codespan");
				var spaned=document.getElementById("spaned");
				if(code==""||code==null){
					spaned.innerHTML="验证码为空";
					spaned.style.color="red";
					return false;
				}else if(code===span.innerHTML){
					spaned.innerHTML="";
					return true;
				}else{
					spaned.innerHTML="验证码不正确";
					spaned.style.color="burlywood";
					return false;
				}
			}
			function checkAll(){
				unameSpan();
				checkPwd();
				checkCode();
				return unameSpan()&&checkPwd()&&checkCode();
			}