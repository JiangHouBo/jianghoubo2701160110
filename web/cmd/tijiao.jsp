<%--
  Created by IntelliJ IDEA.
  User: 江厚波
  Date: 2019/5/11
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改密码信息</title>
    <style type="text/css">
        ul li{
            list-style: none;
        }
        body{
            background-image:url(../img/tianyuan.jpg);
            background-repeat: no-repeat;
            background-size:cover;
            text-align:center;
            margin-top:70px;
            margin-right:60px;
        }
        input[type=password]{
            width:300px;
            height: 25px;
        }
        #upwd1{
            position:relative;
            top:30px;
            right:36px;
        }
        #lab{
            margin-right:36px;
            position:relative;
            top:30px;
            right:40px;
        }
        #centerdiv{
            margin-top:50px;
        }
        #newupwd{
            position: relative;
            left:80px;
        }
        #span{
            margin-left:40px;
            font-size: 23px;
            font-weight:bold;
            font-family: "微软雅黑";
        }#spaned{
             position: relative;
             left:120px;
         }
        #spaned:hover{
            color:orangered;
        }
        #newid{
            position:relative;
            left:30px;
        }
        input[type=submit]{
            position:relative;
            top:56px;
            right:84px;
            width:110px;
            height:35px;
            color:antiquewhite;
            font-weight: bold;
            font-family:"微软雅黑";
            font-size:16px;
            background-color:orangered;
        }
        input[type=button]{
            position:relative;
            top:22px;
            left:60px;
            width:110px;
            height:35px;
            color:antiquewhite;
            font-weight: bold;
            font-family:"微软雅黑";
            font-size:16px;
            background-color:orangered;
        }
    </style>
    <script type="text/javascript" src="jquery-3.4.0.js"></script>
    <script type="text/javascript">
        $(function(){
            //校验密码修改
            $("#tj").submit(function(){
                //校验新密码
                if($("#newupwd").val()=="" ){
                    alert("新密码不能为空！");
                    return false;
                }else if($("#upwd1").val()==""){
                    //校验确认密码
                    alert("确认密码不能为空！");
                    return false;
                }else if($("#newupwd").val()!=$("#upwd1").val()){
                    //校验新密码和确认密码是否相等
                    alert("两次密码不等！");
                    return false;
                }else{
                    return true;
                }
            });
        });
    </script>
    <script type="text/javascript">
        function checkPwd(){
            var pwd=document.getElementById("newupwd").value;
            var span=document.getElementById("spaned");
            var reg=/^[a-z]\w{5,15}$/;
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
    </script>
</head>
<body>
<div>
    <span id="span">修改密码信息界面</span>
    <div id="centerdiv">
        <form action="/login.jsp" method="post" id="tj" target="_top">
            <input type="hidden" name="oper" value="pwd"/>
            <ul>
                <li><label id="newid">新密码</label><input type="password" name="newupwd" id="newupwd" onblur="checkPwd();"/><span style="font-family: '微软雅黑';font-weight: bold;" id="spaned">由6-16位数字和字母组成</span></li>
                <li><lable id="lab">确认密码</lable><input type="password" name="upwd1" id="upwd1"/></li>
                <li><input type="submit" name="" value="确认提交"/></li>
                <li><a href="notpawd.jsp"><input type="button" value="返回"/></a></li>
            </ul>
        </form>
    </div>
</div>
</body>
</html>

