<%@ page import="com.denglv.pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

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
        <%
             List<User> l= (ArrayList<User>)request.getAttribute("l");
             //遍历
             for(User u:l){
        %>
                <tr height="30px">
                      <th><%=u.getUid()%></th>
                      <th><%=u.getName()%></th>
                      <th><%=u.getUname()%></th>
                      <th><%=u.getUpwd()%></th>
                    <%
                        if("1".equals(u.getUsex())){
                    %>
                      <th>男</th>
                    <% }else{ %>
                      <th>女</th>
                    <% } %>
                      <th><%=u.getUage()%></th>
                      <th><%=u.getUbirth()%></th>
                      <th align="center">
                            <input type="button" value="删除" onclick="deletRowCell(this);"/>
                      </th>
                </tr>
        <% } %>
    </table>
</div>
</body>
</html>
