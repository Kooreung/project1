<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2024-05-02
  Time: 오후 2:06
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
<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-6">
            <h3 class="mb-4">회원 정보 수정</h3>
            <form action="/member/modify" method="post" onsubmit="return confirm('저장하시겠습니까?')">
                <input type="hidden" name="id" value="${member.id}">
                <div class="mb-3">
                    <label for="inputEmail" class="form-label">
                        이메일
                    </label>
                    <input id="inputEmail" type="email" name="email" value="${member.email}"
                           class="form-control-plaintext">
                </div>
                <div class="mb-3">
                    <label for="inputPassword" class="form-labal">
                        패스워드
                    </label>
                    <input oninput="passwordCheck()" id="inputPassword" type="text" class="form-control" name="password"
                           value="">
                    <div class="form-text">
                        암호를 입력하지 않으면 기존 암호로 유지됩니다.
                    </div>
                </div>
                <div class="mb-3">
                    <label for="inputPasswordCheck" class="form-labal">
                        패스워드 확인
                    </label>
                    <input oninput="passwordCheck()" id="inputPasswordCheck" type="text" class="form-control"
                           value="${member.password}">
                    <div class="form-text" id="passwordMessage"></div>
                </div>
                <div class="mb-3">
                    <label for="inputNickName" class="form-labal">
                        닉네임
                    </label>
                    <input id="inputNickName" type="text" class="form-control" name="nickName"
                           value="${member.nickName}">
                </div>
                <div class="mb-3">
                    <button class="btn btn-secondary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function passwordCheck() {
        const password = document.querySelector("#inputPassword").value;
        const passwordCheck = document.querySelector("#inputPasswordCheck").value;

        if (password == passwordCheck) {
            document.querySelector("#passwordMessage").textContent = "";
        } else {
            document.querySelector("#passwordMessage").textContent = "패스워드가 일치하지 않습니다.";
        }
    }
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
