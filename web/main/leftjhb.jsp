<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style type="text/css">
        body{
            background-color:aliceblue;
            font-weight: bold;
        }
        #img{
            border-radius:48%;
        }
    </style>
    <script src="jquery-3.4.0.js" type="text/javascript"></script>
    <script type="text/javascript">
        var flag=true;
        $(function(){
            $(".roudiv,.img").click(function(){
                if(flag){
                    $(".u").slideUp(300);
                    flag=false;
                }else{
                    $(".u").slideDown(300);
                    flag=true;
                }
            });
        })
    </script>
</head>
<body>
<dd>
    <div class="roudiv">
        <span><img src="/img/tar.jpg" id="img"/></span>管理信息
    </div>
    <ul class="u">
        <li><a href="/cmd/userinfo.jsp" target="_tab">查询个人信息</a></li>
        <li><a href="/cmd/newpwd.jsp" target="_tab">修改密码</a></li>
        <li><a href="/user?oper=show" target="_tab">查询用户信息</a></li>
    </ul>
</dd>
</body>
</html>
