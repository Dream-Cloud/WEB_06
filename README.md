# 1、EL表达式

## 1.1 jsp的弊端：

1. 没有真正的实现前后端代码的分离。其中Java代码和html代码会混杂。页面结构不构清晰，不便于维护。

2. jsp脚本片段和html代码穿插 ，结构混乱 ，不便于复杂页面的开发，在实际开发中，所有的jsp页面的访问应该都是通过servlet来访问，而不能直接访问jsp。因此在开发中，一般将需要经过servlet来访问的页面都统统放置在WEB-INF目录。WEB-INF目录下的资源，是不允许通过地址栏直接访问的，仅可以通过程序代码访问，所以通常仅仅将登录也放置在web目录下，页面一律统统都需要放置在WEB-INF目录下，保证数据安全。

在数据的传递中  我们都是通过域对象来传递   **Request  Session** 

```jsp
<h3>${username}</h3>
<h3>${password}</h3>
<h4>${list[0]}</h4>
<h4>${list[1]}</h4>
<h4>${list[2]}</h4>
```

## 1.2、EL表达式概述

表达式语言(Expression Language)简称EL，它是JSP2.0中引入的一个新内容。通过EL可以简化在JSP开发中对对象的引用，从而规范页面代码，增加程序的可读性及可维护性。

EL主要是为了获取共享域中的数据。

### 1.2.1、EL主要作用

　　1、获取数据

　　　　EL表达式主要用于替换JSP页面中的脚本表达式，以从各种类型的web域 中检索java对象、获取数据。(某个web域 中的对象，访问javabean的属性、访问list集合、访问map集合、访问数组)

　　2、执行运算

　　　　利用EL表达式可以在JSP页面中执行一些基本的关系运算、逻辑运算和算术运算，以在JSP页面中完成一些简单的逻辑运算。${user==null}

　　3、获取web开发常用对象

　　　　EL 表达式定义了一些隐式对象，利用这些隐式对象，web开发人员可以很轻松获得对web常用对象的引用，从而获得这些对象中的数据。

　　4、调用Java方法

　　　　EL表达式允许用户开发自定义EL函数，以在JSP页面中通过EL表达式调用Java类的方法。

### 1.2.2、获取Javabean的属性

```jsp
<h3>${stu.sname}</h3>
<h3>${stu.sage}</h3>
<h3>${stu.school.schoolName}</h3>
```

```jsp
<h1>获取map对象</h1>
<h3>${map.A}</h3>
<h3>${map["A"]}</h3>
```

**注意：尽量不要使用数字作为map的主键**

获取的原理：使用的是pageContext.findAttribute();

当发现EL表达式时，则按照域对象从小到达pageContext、request、session、application 一次调用findAttribute（）去查找目标属性。如果找到了，就返回值；如果没有找到，返回的是空 ，也不会报错。

### 1.2.3、进行运算

算术运算

关系运算

逻辑运算

其他运算符

empty

```jsp
<%--empty 对于空串及null返回的都是true  --%>
    <h1>${empty para}</h1>
<%--    判断是否位null--%>
    <h1>${para == null}</h1>
<%--    只能判断是否为“”--%>
    <h1>${para == ""}</h1>
```



### 1.2.4、获取WEB对象

pageScope

requestScope

sessionScope

applicationScope

```jsp
<br>
    <h3>${requestScope.stu.sname}</h3>
    <h3>${requestScope.stu.sage}</h3>
    <h3>${requestScope.stu.school.schoolName}</h3>
<br>
    <h1>获取map对象</h1>
    <h3>${sessionScope.map.A}</h3>
    <h3>${sessionScope.map["A"]}</h3>
```



### 1.2.5、获取请求参数

```jsp
req.setCharacterEncoding("UTF-8");
req.getRequestDispatcher("/WEB-INF/home.jsp?name=张三").forward(req,resp);
```

```jsp
<%--获取请求的参数 通过路径传递过来  通过表单提交的数据 都属于param  而只有通过setAttribute设置的才是属性 --%>
<h3>${param.name}</h3>
```

```jsp
<jsp:forward page="/WEB-INF/success.jsp">
    <jsp:param name="aa" value="AAAAAAAA"/>
</jsp:forward>
```



### 1.2.6、初始化参数的获取

```jsp
<context-param>
    <param-name>conPara</param-name>
    <param-value>context-param</param-value>
</context-param>
```

```jsp
<h1>${initParam.conPara}</h1>
```

# 2、JSTL的使用

## 2.1、引入JSTL

引入jstl的jar 

![img](E:\YouDaoYun\m15234512314@163.com\43a3452230b344238f6d8bab5c301032\clipboard.png)

在jsp页面引入标签库

```jsp
<%--引入jstl的核心标签库  prefix前缀 uri核心标签库的uri地址 --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
```

## 2.2、JSTL 核心标签库

JSTL的核心标签库标签共13个，从功能上可以分为4类：表达式控制标签、流程控制标签、循环标签、URL操作标签。使用这些标签能够完成JSP页面的基本功能，减少编码工作。

（1）表达式控制标签：out标签、set标签、remove标签、catch标签。

```jsp
<c:set var="name" value="zhangsan "></c:set>
<h1><c:out value="${username}"></c:out></h1>
<h1><c:out value="${name}"></c:out> </h1>
```

（2）流程控制标签：if标签、choose标签、when标签、otherwise标签。

```jsp
<%--多条件判断 相当于if---else if--else--%>
<c:choose>
    <c:when test="${sex ==1}">
        <h1>男</h1>
    </c:when>
    <c:when test="${sex ==2}">
        <h1>女</h1>
    </c:when>
    <c:otherwise>
        <h1>性别未知</h1>
    </c:otherwise>
</c:choose>
```

```jsp
	<%--流程控制--%>
    <c:if test="${name == 'admin'}">
        <h1>这是系统管理员</h1>
    </c:if>
```

（3）循环标签：forEach标签、forTokens标签。

```jsp
<%--循环--%>
<c:forEach var="list" begin="0" end="2" items="${list}" step="2" >
    ${list}
</c:forEach>
```

（4）URL操作标签：import标签、url标签、redirect标签。

格式化标签库

```jsp
<%--格式化标签库0--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
```

## 2.3、Functions标签库

```jsp
<%--函数标签库--%>
<c:set var="str" value="hello world.java    "></c:set>
<c:out value="${fn:length(str)}"></c:out>
<c:out value="${fn:trim(str)}"></c:out>
<c:out value="${fn:endsWith(str.trim(),'.java' )}"></c:out>
```



