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
            right:57px;
            top:20px;
            width:140px;
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
        function  testCheckNum() {
            var ntext=document.getElementById("utext").value;
            var yhspan=document.getElementById("yjspan");
            if(ntext==""||ntext==null){
                yhspan.innerHTML="手机号不能为空";
                yhspan.style.color="red";
                return false;
            }else{
                yhspan.innerHTML="";
                return true;
            }
        }
        function testAll(){
            testCheckNum();
            return testCheckNum();
        }
    </script>
</head>
<body onload="testCode();">
<div id="showd">
    <form action="tijiao.jsp" method="post">
    <ul id="cul">
        <li><lable>手机号:</lable><input type="text" name="utext" id="utext" onblur="testCheckNum();"/></li><span id="yjspan"></span>
        <li id="uli"><lable>验证码:</lable><input type="text" name="upss" id="upss" /></li><span id="spancode" style="background-image: url(../img/coderad.jpg);" onclick="testCode();"></span>
        <li><input type="submit" name="" id="sub" value="确定" onclick="return testAll();"/></li>
    </ul>
    </form>
</div>
</body>
</html>
