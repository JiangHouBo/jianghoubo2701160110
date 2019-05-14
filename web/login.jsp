<%--
  Created by IntelliJ IDEA.
  User: 江厚波
  Date: 2019/4/30
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户登录系统</title>
    <meta charset="UTF-8">
    <style type="text/css">
        #h1-d{
            text-align: center;
            margin-top: 110px;
        }
        table{
            position:relative;
            right:20px;
            margin:auto;
            color:black;
        }
        span{
            font-size: 14px;
        }
        #codespan{
            font-size:16px;
            font-weight:bold;
            font-family: "微软雅黑";
        }
        tr{
            height:40px;
        }
        #showdiv{
            border:solid 1px dodgerblue;
            border-radius:20px;
            width:500px;
            height:240px;
            margin:auto;
            margin-top:60px;
            background-image: url(img/tartb.jpg);
        }
        body{
            background-image: url(img/denglu.jpg);
            background-repeat:no-repeat;
            background-size:cover;
        }
        #cd{
            position: relative;
            left:5px;
            color: black;
        }
        #cd:hover{
            color:burlywood;
        }
        #upwd{
            height:25px;
            width:300px;
            border-radius:10px;
        }
        #uname{
            height:25px;
            width:300px;
            border-radius:10px;
        }
        #code{
            height:22px;
            margin-left:3px;
        }
        input[type=submit]{
            position:relative;
            left:82px;
            width:80px;
            font-size:17px;
            font-family: "微软雅黑";
            font-weight: bold;
            background-color:cornsilk;
        }
        input[type=button]{
            position:relative;
            left:95px;
            width:80px;
            font-size:17px;
            font-family: "微软雅黑";
            font-weight: bold;
            background-color:cornsilk;
        }

    </style>
   <script type="text/javascript">
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
                span.innerHTML="";
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
            var reg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;
            if(pwd==""||pwd==null){
                span.innerHTML="密码不能为空";
                span.style.color="red";
                return false;
            }else if(reg.test(pwd)){
                span.innerHTML="";
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
    </script>
</head>
<body onload="codeNum();">
<h1 id="h1-d">用户登录系统</h1>

<%
   //声明java代码块进行提示语的校验
   Object cab= request.getAttribute("flag");
   if(cab!=null){
%>
<div align="center">
    <span style="font-size: 16px;color:red;font-weight: bold;">用户名或者密码错误</span>
</div>
<% } %>

<%
    //声明java代码块进行密码修改提示语的校验
    Object obj= session.getAttribute("flagpwd");
    if(obj!=null){
%>
<div align="center">
    <span style="font-size: 16px;color:red;font-weight: bold;">密码修改成功</span>
</div>
<% }
      session.removeAttribute("flagpwd");
%>

<%
    //声明java代码块进行注册提示语的校验
    Object reg= session.getAttribute("reg");
    if(reg!=null){
%>
<div align="center">
    <span style="font-size: 16px;color:red;font-weight: bold;">用户注册成功</span>
</div>
<% }
//将reg提示语给删除掉
    session.removeAttribute("reg");
%>

<div id="showdiv">
    <form action="user" method="post">
        <input type="hidden" name="oper" value="login"/>
        <table>
            <tr>
                <td width="200px">
                    <input type="text" placeholder="用户名" name="uname" id="uname" value="" onblur="unameSpan();"/><br/><span id="unamespan">*6-16位数字</span>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="password" placeholder="密码" name="upwd" id="upwd" value="" onblur="checkPwd();" /><br/><span id="pwdspan">*6-16位由字母和数字组成</span>
                </td>
            </tr>
            <tr >
                <td>
                    <input type="text" name="code" id="code" value="" style="width:90px;" onblur="checkCode();" />&nbsp;&nbsp;&nbsp;&nbsp;<span id="codespan" style="background-image: url(img/yanzheng.jpg);" onclick="codeNum();"></span><br/><span id="spaned"></span>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="/cmd/notpawd.jsp" id="cd">忘记密码?</a>
                </td>
            </tr>
        </table>
        <div id="cdiv">
            <input type="submit" value="登录" name="" onclick="return checkAll();"/>
            <a href="/cmd/zhuce.jsp"><input type="button" name="" value="注册"/></a>
        </div>
    </form>
</div>
</body>
</html>
