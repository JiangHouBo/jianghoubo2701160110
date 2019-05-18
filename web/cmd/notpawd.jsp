<%--
  Created by IntelliJ IDEA.
  User: 江厚波
  Date: 2019/5/10
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style type="text/css">
        body{
            background-color:antiquewhite;
            text-align: center;
        }
        #cul{
            list-style-type: none;
        }
        #utext{
            width:300px;
            height: 23px;
        }
        #upss{
            width:100px;
            height: 23px;
            margin-top:30px;
        }
        #showd{
            position:relative;
            margin-top:70px;;
        }
        #sub{
            position:relative;
            right:76px;
            top:16px;
            width:100px;
            height:30px;
        }
        #uli{
            margin-right:200px;
        }
        #spancode{
            margin-left:40px;
            position: relative;
            bottom:30px;
            font-size: 20px;
        }
    </style>
    <script type="text/javascript">
        function testCode(){
            var code=Math.floor(Math.random()*9000+1000);
            var span=document.getElementById("spancode");
            span.innerHTML=code;
        }
        function  testCodepwd() {
            var upss=document.getElementById("upss").value;
            var span=document.getElementById("spancode");
            var spaned=document.getElementById("codespan");
            if(upss==""||upss==null){
                spaned.innerHTML="验证码不能为空";
                spaned.style.color="red";
                return false;
            }else if(upss==span.innerHTML){
                spaned.innerHTML="";
                return true;
            }else{
                spaned.innerHTML="验证码错误";
                spaned.style.color="goldenrod";
                return false;
            }
        }
        function testPhone(){
            var utext=document.getElementById("utext").value;
            var span=document.getElementById("showspan");
            var reg=/^1\d{10}$/;
            if(utext==""||utext==null){
                span.innerHTML="手机号不能为空";
                span.style.colot="red";
                return false;
            }else if(reg.test(utext)){
                span.innerHTML="";
                return true;
            }else{
                span.innerHTML="密码格式不正确";
                span.style.color="goldenrod";
                return false;
            }
        }
        function testAll(){
            testPhone();
            testCodepwd();
            return testPhone()&&testCodepwd();
        }
    </script>
</head>
<body onload="testCode();">
<div id="showd">
    <form action="tijiao.jsp" method="post">
    <ul id="cul">
        <li><lable>手机号:</lable><input type="text" name="utext" id="utext" onblur="testPhone();"/></li><span id="showspan"></span>
        <li id="uli"><lable>验证码:</lable><input type="text" name="upss" id="upss" onblur=" testCodepwd();"/></li><span id="spancode" style="background-image: url(../img/coderad.jpg);" onclick="testCode();"></span><br/><span id="codespan"></span>
        <li><input type="submit" name="" id="sub" value="确定" onclick="return testAll();"/></li>
    </ul>
    </form>
</div>
</body>
</html>
