<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
        <div class="header-top">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/image/KakaoTalk_20221012_170414651.png" alt=""></a>
            </div>
            <div class="side">
                <ul>
                    <c:if test="${admin != null}">
                    <li><a href="${pageContext.request.contextPath}/adminpage/1?searchUser=&userInfo=">관리자페이지</a></li>
                    </c:if>
                    <li><a href=""><img src="${pageContext.request.contextPath}/image/search.png" alt="" id="search-logo"></a></li>
                    <c:if test="${user != null}">
                    	<li><a href="${pageContext.request.contextPath}/cart/${user.userid}"><img src="${pageContext.request.contextPath}/image/bag_buy_cart.png" alt="" id="cart-logo"></a></li>
                    </c:if>
                    <c:if test="${user eq null}">
                    <li><a href="${pageContext.request.contextPath}/loginpage">로그인 |</a></li>
                    </c:if>
                    <c:if test="${user != null}">
                    <li><a href="${pageContext.request.contextPath}/logout">로그아웃 |</a></li>
                    </c:if>
                    <li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
                </ul>
            </div>
        </div>
        <nav class="category">
            <ul>
                <li>Category</li>
                <li><a href="${pageContext.request.contextPath}/category/furniture">가구</a></li>
                <li><a href="${pageContext.request.contextPath}/category/fabric">패브릭</a></li>
                <li><a href="${pageContext.request.contextPath}/category/storage">수납용품</a></li>
                <li><a href="${pageContext.request.contextPath}/category/supplies">생활용품</a></li>
                <li><a href="${pageContext.request.contextPath}/notice">공지사항</a></li>
                <li><a href="${pageContext.request.contextPath}/qna">Q&A</a></li>
                <li><a href="">이벤트</a></li>
            </ul>
        </nav>
        <div id="main-image"></div>
    </header>