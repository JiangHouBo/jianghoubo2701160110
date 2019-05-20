<%@ page import="com.denglv.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style type="text/css">
        body{
            background-color: antiquewhite;
        }
        #showdiv{
            height:60px;
            line-height: 60px;
            letter-spacing: 5px;
            font-family:"arial, helvetica, sans-serif";
            font-weight:bold;
        }
        .rightdiv{
            font-weight: bold;
            float:right;
            position:relative;
            bottom:75px;
            right:60px
        }
        #uout{
            font-weight:200;
            position:relative;
            left:10px;
        }
        b:hover{
            color:cornflowerblue;
        }
    </style>
    <script type="text/javascript" src="jquery-3.4.0.js"></script>
    <script type="text/javascript">
     //退出功能
        $(function(){
            $("#uout").click(function(){
               var tc=confirm("你现在要退出吗");
                 if(tc){
                     window.top.location.href="/user?oper=uout";
                 }
            });
        });
    </script>
</head>
<body>
<div id="showdiv">
    <h2><i>用户登录界面</i></h2>
</div>
<div class="rightdiv">
    <span><b>欢迎 <%=((User)session.getAttribute("user")).getName()%> 登录</b></span>
    <a href="javascript:void(0)" id="uout">退出</a>
</div>
</body>
</html>
