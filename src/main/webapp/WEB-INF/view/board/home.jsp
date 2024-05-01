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
    <style>
        td, th, tr {
            border: 1px solid black;
        }

        .active {
            background-color: skyblue;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"></c:import>
<h3>게시물 목록</h3>
<table>
    <thead>
    <tr>
        <th>#</th>
        <th>제목</th>
        <th>작성자</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${boardList}" var="board">
        <c:url value="/board" var="viewLink">
            <c:param name="id" value="${board.id}"></c:param>
        </c:url>
        <tr>
            <td>${board.id}</td>
            <td>
                <a href="${viewLink}">${board.title}</a>
            </td>
            <td>${board.writer}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
