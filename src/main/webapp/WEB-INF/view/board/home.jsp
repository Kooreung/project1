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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"></c:import>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-8">
            <h3>게시물 목록</h3>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th style="width: 3rem">#</th>
                    <th>제목</th>
                    <th style="width: 10rem">작성자</th>
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
        </div>
    </div>
</div>

<div class="container mt-3">
    <div class="row justify-content-center">
        <div class="col-6">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:if test="${pageInfo.currentPageNumber > 1}">
                        <c:url value="/" var="firstPageLink">
                            <c:param name="page" value="1"/>
                        </c:url>
                        <li class="page-item">
                            <a class="page-link" href="${firstPageLink}" aria-label="First">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:if test="${pageInfo.prevPageNumber > 0}">
                        <c:url value="/" var="prevPageLink">
                            <c:param name="page" value="${pageInfo.prevPageNumber}"/>
                        </c:url>
                        <li class="page-item">
                            <a class="page-link" href="${prevPageLink}" aria-label="Previous">
                                &lt;
                            </a>
                        </li>
                    </c:if>

                    <c:forEach begin="${pageInfo.beginPageNumber}" end="${pageInfo.endPageNumber}" var="pageNumber">
                        <c:url var="pageLink" value="/">
                            <c:param name="page" value="${pageNumber}"></c:param>
                        </c:url>
                        <li class="page-item ${pageInfo.currentPageNumber eq pageNumber ? 'active' : ''}">
                            <a class="page-link" href="${pageLink}">${pageNumber}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${pageInfo.nextPageNumber < pageInfo.lastPageNumber}">
                        <c:url value="/" var="nextPageLink">
                            <c:param name="page" value="${pageInfo.nextPageNumber}"/>
                        </c:url>
                        <li class="page-item">
                            <a class="page-link" href="${nextPageLink}" aria-label="Next">
                                &gt;
                            </a>
                        </li>
                    </c:if>

                    <c:if test="${pageInfo.currentPageNumber < pageInfo.lastPageNumber}">
                        <c:url value="/" var="lastPageLink">
                            <c:param name="page" value="${pageInfo.lastPageNumber}"/>
                        </c:url>
                        <li class="page-item">
                            <a class="page-link" href="${lastPageLink}" aria-label="Last">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
