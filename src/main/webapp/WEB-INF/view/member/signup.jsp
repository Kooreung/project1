<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2024-05-02
  Time: 오전 9:41
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
            <h3 class="mb-4">회원가입</h3>
            <form action="/member/signup" method="post" onsubmit="return checkValues()">
                <div class="mb-3">
                    <label for="inputEmail" class="form-label">이메일</label>
                    <div class="input-group">
                        <input name="email" id="inputEmail" required type="email" class="form-control">
                        <button onclick="emailCheck();" type="button" id="buttonEmailCheck"
                                class="btn btn-outline-secondary">중복 확인
                        </button>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="inputPassword" class="form-label">패스워드</label>
                    <input oninput="passwordCheck()" name="password" id="inputPassword" type="password"
                           class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="inputPasswordCheck" class="form-label">패스워드 확인</label>
                    <input oninput="passwordCheck()" id="inputPasswordCheck" type="password" class="form-control"
                           required>
                    <div class="form-text" id="passwordMessage"></div>
                </div>
                <div class="mb-3">
                    <label for="inputNickName" class="form-label">닉네임</label>
                    <input name="nickName" id="inputNickName" type="text" class="form-control" required>
                </div>
                <div>
                    <button class="btn btn-primary">가입</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    async function emailCheck() {
        const emailValue = document.querySelector("#inputEmail").value;
        const url = "/member/email?email=" + emailValue;

        // ajax 요청
        const response = await fetch(encodeURI(url));
        // 응답처리 (비동기 처리로 인해 fetch 와 console 이 별개로 진행)
        // 따라서 기다리기 위해 fetch 에 await 을 구성해준다.
        // 동기적 처리로 만들어준다. await 을 쓰기 위해 function 에 async 필수
        // console.log(response);
        alert(await response.text());
    }

    function checkValues() {
        const password = document.getElementById("inputPassword").value;
        const passwordCheck = document.getElementById("inputPasswordCheck").value;

        if (password != "" && password == passwordCheck) {
            return true;
        } else {
            alert("패스워드가 일치하지 않습니다.");
            return false;
        }
    }

    function passwordCheck() {
        const password = document.querySelector("#inputPassword").value;
        const passwordCheck = document.querySelector("#inputPasswordCheck").value;

        if (password != passwordCheck) {
            // 메시지 보여주기
            document.querySelector("#passwordMessage").textContent = "패스워드가 일치하지 않습니다.";
        } else {
            document.querySelector("#passwordMessage").textContent = "";
        }
    }
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
