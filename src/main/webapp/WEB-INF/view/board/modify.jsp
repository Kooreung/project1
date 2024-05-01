<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2024-05-01
  Time: 오후 2:16
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
<h3>${board.id}번 게시물 수정</h3>
<form action="/modify" method="post">
    <div>
        제목
        <input type="text" value="${board.title}" name="title" required>
    </div>
    <div>
        본문
        <textarea cols="30" rows="10" name="content" required>${board.content}</textarea>
    </div>
    <div>
        작성자
        <input type="text" value="${board.writer}" name="writer" required>
    </div>
    <div>
        <button>수정</button>
    </div>
    <input type="hidden" name="id" value="${"board.id"}">
</form>
</body>
</html>
