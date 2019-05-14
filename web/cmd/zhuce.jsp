<%--
  Created by IntelliJ IDEA.
  User: 江厚波
  Date: 2019/5/11
  Time: 13:19
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
        h2{
            letter-spacing:10px;
            margin-right:80px;
        }
        #cul{
            list-style-type: none;
        }
        #uid{
            width:240px;
            height:23px;
            margin-left:26px;
        }
        #name{
            width:240px;
            height:23px;
            margin-left:21px;
            margin-top:16px;
        }
        #uage{
            width:240px;
            height:23px;
            margin-left:20px;
            margin-top:16px;
        }
        #uname{
            width:240px;
            height:23px;
            margin-left:10px;
            margin-top:16px;
        }
        #upwd{
            position: relative;
            width:240px;
            height:23px;
            margin-left:20px;
            bottom: 1px;;
        }
        #ubirth{
            width:240px;
            height:23px;
            margin-right:12px;
            margin-top:16px;
        }
        #upss{
            width:100px;
            height: 23px;
            margin-top:20px;
            margin-left:65px;
        }
        #lab{
            position: relative;
            left:60px;
        }
        #showd{
            position:relative;
            margin-top:70px;
            right:90px;
        }
        #sub{
            position:relative;
            right:43px;
            width:90px;
            height:30px;
        }
        #uli{
            margin-right:200px;
        }
        #spancode{
            margin-left:110px;
            position: relative;
            bottom:30px;
            font-size: 20px;
        }
        #sdiv{
            margin-left:390px;
            border: solid 1px cornflowerblue;
            width:550px;
            height:630px;
            background-image:url(../img/yanzheng.jpg);
            background-repeat:no-repeat;
            background-size:cover;
        }
        #yspan{
            margin-left:410px;
            position: relative;
            bottom:26px;
        }
        #pwdspan{
            margin-left:410px;
            position: relative;
            bottom:26px;
        }
        #sex{
            margin-right:170px;
        }
        #sexed{
            position:relative;
            right:150px;
        }
    </style>
    <script type="text/javascript">
        function testCode(){
            var code=Math.floor(Math.random()*9000+1000);
            var span=document.getElementById("spancode");
            span.innerHTML=code;
        }
        function testCheck(){
            var yh=document.getElementById("uname").value;
            var yspan=document.getElementById("yspan");
            var reg=/^\d{6,16}$/;
            if(yh==""||yh==null){
                yspan.innerHTML="用户名不能为空";
                yspan.style.color="red";
                return false;
            }else if(reg.test(yh)){
                yspan.innerHTML="";
                return true;
            }else{
                yspan.innerHTML="用户名不符合规则";
                yspan.style.color="orange";
                return false;
            }
        }
        function  testNum() {
            var num=document.getElementById("upwd").value;
            var pwd=document.getElementById("pwdspan");
            var reg=/^[a-z]\w{5,15}$/;
            if(num==""||num==null){
                pwd.innerHTML="密码不能为空";
                pwd.style.color="red";
                return false;
            }else if(reg.test(num)){
                pwd.innerHTML="";
                return true;
            }else{
                pwd.innerHTML="密码不符合规则";
                pwd.style.color="green";
                return false;
            }
        }
        function checkAll() {
            testCheck();
            testNum();
            return  testCheck()&&testNum();
        }
    </script>
</head>
<body onload="testCode();">
<div id="sdiv">
    <h2 align="center">用户注册界面</h2>
    <div id="showd">
        <form action="/user" method="post">
            <input type="hidden" name="oper" value="regist"/>
        <ul id="cul">
            <li><lable>&nbsp;&nbsp;&nbsp;&nbsp;ID:</lable><input type="text" name="uid" id="uid" value="" /></li>
            <li><lable>&nbsp;&nbsp;姓名:</lable><input type="text" name="name" id="name" /></li>
            <li><lable>&nbsp;用户名:</lable><input type="text" name="uname" id="uname" onblur="testCheck();"/></li><span id="yspan">*6-16位数字</span>
            <li><lable>&nbsp;&nbsp;密码:</lable><input type="password" name="upwd" id="upwd" onblur="testNum();"/></li><span id="pwdspan">*6-16位数字</span>
            <li><lable id="sex">&nbsp;&nbsp;性别:</lable> <span id="sexed"> <label>男<input type="radio" name="usex"  value="1" checked="checked"/></label> &nbsp;&nbsp; <label>女<input type="radio" name="usex" value="0"/></label></span></li>
            <li><lable>&nbsp;&nbsp;年龄:</lable><input type="text" name="uage" id="uage" value=""/></li>
            <li><lable>出生年月:&nbsp;&nbsp;</lable><input type="text" name="ubirth" id="ubirth" value=""/></li>
            <li id="uli"><lable id="lab">验证码:&nbsp;&nbsp;</lable><input type="text" name="upss" id="upss" /></li><span id="spancode" style="background-image: url(../img/coderad.jpg);" onclick="testCode();"></span>
            <li><input type="submit" name="" id="sub" value="确定" onclick="return checkAll()"/></li>
        </ul>
        </form>
    </div>
</div>
</body>
</html>

