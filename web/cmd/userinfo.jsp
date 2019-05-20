<%@ page import="com.denglv.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style type="text/css">
        body{
            background-color: lightgoldenrodyellow;
        }
    </style>
    <script type="text/javascript">
        function deletRowCell(inp){
            //获取删除的行对象
            var tab=document.getElementById("tab");
            //获取要删除的行对象
            var tr=inp.parentNode.parentNode;
            //删除行
            tab.deleteRow(tr.rowIndex);
        }
    </script>
</head>
<body>
<div>
    <table id="tab" border="1px">
        <tr height="30px">
            <th width="100px">用户ID</th>
            <th width="100px">姓名</th>
            <th width="100px">用户名</th>
            <th width="100px">用户密码</th>
            <th width="100px">用户性别</th>
            <th width="100px">用户年龄</th>
            <th width="100px">出生日期</th>
            <th align="center" width="100px">
                <input type="button" value="修改" />
            </th>
        </tr>
        <tr height="30px">
            <th><%=((User)session.getAttribute("user")).getUid()%></th>
            <th><%=((User)session.getAttribute("user")).getName()%></th>
            <th><%=((User)session.getAttribute("user")).getUname()%></th>
            <th><%=((User)session.getAttribute("user")).getUpwd()%></th>
            <%
                String sex=((User)session.getAttribute("user")).getUsex();
                if("1".equals(sex)){
            %>
            <th>男</th>
            <% }else{ %>
            <th>女</th>
            <% } %>
            <th><%=((User)session.getAttribute("user")).getUage()%></th>
            <th><%=((User)session.getAttribute("user")).getUbirth()%></th>
            <th align="center">
                <input type="button" value="删除" onclick="deletRowCell(this);"/>
            </th>
        </tr>
    </table>
</div>
</body>
</html>
