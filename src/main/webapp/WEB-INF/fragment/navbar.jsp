<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2024-05-01
  Time: 오후 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-expand-lg bg-body-tertiary mb-3">
    <div class="container">
        <a class="navbar-brand" href="/">중앙정보처리학원</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a href="/" class="nav-link">
                        게시글목록
                    </a>
                </li>
                <sec:authorize access="not isAuthenticated()">
                    <li class="nav-item">
                        <a href="/member/signup" class="nav-link">
                            회원가입
                        </a>
                    </li>
                </sec:authorize>
                <sec:authorize access="not isAuthenticated()">
                    <li class="nav-item">
                        <a href="/member/login" class="nav-link">
                            로그인
                        </a>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a href="/member/list" class="nav-link">
                            회원목록
                        </a>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a href="/add" class="nav-link">
                            글쓰기
                        </a>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a href="/logout" class="nav-link">
                            로그아웃
                        </a>
                    </li>
                </sec:authorize>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>