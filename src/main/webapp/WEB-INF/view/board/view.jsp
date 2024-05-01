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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"></c:import>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-6">
            <h3>${board.id} 번 게시물</h3>
            <div class="mb-3, col-4">
                <label for="inputTitle" class="form-label">
                    제목
                </label>
                <input id="inputTitle" class="form-control" type="text" value="${board.title}" readonly>
            </div>
            <div class="mb-3">
                <label for="inputContent" class="form-label">
                    본문
                </label>
                <textarea id="inputContent" class="form-control" cols="30" rows="10"
                          readonly>${board.content}</textarea>
            </div>
            <div class="mb-3">
                <label for="inputWriter" class="form-label">
                    작성자
                </label>
                <input id="inputWriter" class="form-control" type="text" value="${board.writer}" readonly>
            </div>
            <div class="mb-3">
                <label for="inputInserted" class="form-label">
                    작성일시
                </label>
                <input id="inputInserted" class="form-control" type="datetime-local" value="${board.inserted}" readonly>
            </div>
            <div class="mb-3">
                <button form="formDelete" class="btn btn-danger">삭제</button>
                <button class="btn btn-secondary">수정</button>
                <form form="formDelete" action="/delete" method="post">
                    <input type="hidden" name="id" value="${board.id}">
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
