<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: lifubao
  Date: 2020/2/18
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
</head>
<body>
    <h1>这是我们应用的主页</h1>
    <h3><%=request.getAttribute("username")%></h3>
    <h3><%=session.getAttribute("password")%></h3>
<%
    List<String> list = (List<String>) request.getAttribute("list");
%>

<h1>EL表达式</h1>
<h3>${username}</h3>
<h3>${password}</h3>
<h4>${list[0]}</h4>
<h4>${list[1]}</h4>
<h4>${list[2]}</h4>
    <br>
<h3>${stu.sname}</h3>
<h3>${stu.sage}</h3>
<h3>${stu.school.schoolName}</h3>
    <br>
<h1>获取map对象</h1>
<h3>${map.A}</h3>
<h3>${map["A"]}</h3>
    <br>
    <h3>${20+30}</h3>
    <h3>${20*30}</h3>
    <h3>${a+b}</h3>
    <br>
<%--    empty对于空串和null都是true--%>
<h1>${empty para}</h1>
<h1>${ para == null}</h1>
<h1>${ para == ""}</h1>

获取请求参数 通过路径传递过来 通过表单提交的数据 都属于param 而只有通过setAttribute才是属性
    <br>
    <h3>${param.name}</h3>

<%--<jsp:forward page="/WEB-INF/success.jsp">--%>
<%--    <jsp:param name="aa" value="AAAAAA"/>--%>
<%--</jsp:forward>--%>
<h1>${initParam.conPara}</h1>
    <br>
<h1>${cookie.keySet()}</h1>
<h1>${cookie.values()}</h1>
<h1>${cookie.get("lanqiao").value}</h1>
</body>
</html>
