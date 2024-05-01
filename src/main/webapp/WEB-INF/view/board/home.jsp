<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2024-05-01
  Time: 오전 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <thead>
    <th>#</th>
    <th>제목</th>
    <tr>작성자
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${boardList}" var="board">
        <tr>
            <td>${board.id}</td>
            <td>${board.title}</td>
            <td>${board.write}</td>
        </tr>
    </c:forEach>
    </tbody>

</table>
<h3>게시물 목록</h3>

</body>
</html>
