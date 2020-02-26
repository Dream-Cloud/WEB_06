<%--
  Created by IntelliJ IDEA.
  User: lifubao
  Date: 2020/2/18
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--引入jstl的核心标准库 prefix为前缀 uri核心标签库的uri--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--格式化标签库--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--引入函数标签库--%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>

<head>
    <title>success</title>
</head>
<body>

<c:set var="name" value="张三"></c:set>
<c:set var="sex" value="1"></c:set>
<h1><c:out value="${username}"></c:out></h1>
<h1><c:out value="${name}"></c:out></h1>

<c:if test="${username == 'admin' }">
    <h1>这是系统管理员</h1>
</c:if>

<c:choose>
    <c:when test="${sex == 1}">
        <h1>男</h1>
    </c:when>
    <c:when test="${sex == 0}">
        <h1>女</h1>
    </c:when>
    <c:otherwise>
        <h1>未知</h1>
    </c:otherwise>
</c:choose>

<c:forEach var="list" begin="0" end="2" step="1" items="${list}">
    ${list}
</c:forEach>
<br>
格式化标签
<br>
${date}
<br>
<fmt:formatDate value="${date}" pattern="yyy-MM-dd HH:mm:ss"></fmt:formatDate>
<br>
<c:set var="curr" value="123456.212"></c:set>
<fmt:formatNumber value="${curr}" type="currency" pattern="$.00"></fmt:formatNumber>
<hr>
函数标签库
<c:set var="str" value="hello world.java   "></c:set>
<c:out value="${fn:length(str)}"></c:out>
<c:out value="${fn:trim(str)}"></c:out>
<c:out value="${fn:endsWith(str.trim(),'.java')}"></c:out>


</body>
</html>
