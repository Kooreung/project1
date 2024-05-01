<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2024-05-01
  Time: 오전 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>새 게시물 작성</h3>
<br>
<form action="/add" method="post">
    <div>
        제목
        <input type="text" name="title" required>
    </div>
    <div>
        본문
        <textarea cols="30" rows="10" name="content" required></textarea>
    </div>
    <div>
        작성자
        <input type="text" name="writer" required>
    </div>
    <div>
        <button>저장</button>
    </div>
</form>

</body>
</html>
