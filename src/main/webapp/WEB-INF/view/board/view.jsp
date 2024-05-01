<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2024-05-01
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"></c:import>
<h3>${board.id} 번 게시물</h3>
<div>
    제목
    <input type="text" value="${board.title}">
</div>
<div>
    본문
    <textarea cols="30" rows="10">${board.content}</textarea>
</div>
<div>
    작성자
    <input type="text" value="${board.writer}">
</div>
<div>
    작성일시
    <input type="datetime-local" value="${board.inserted}" readonly>
</div>
<div>
    <a href="/modify?id=${board.id}">수정</a>
</div>

</body>
</html>
