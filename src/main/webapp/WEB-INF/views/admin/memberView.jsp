<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate! 회원정보</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
		<div class="container_mate">
	        <h1>회원 정보</h1>
	        <div>
	            <form action="">
	                <table class="table">
	                    <tr class="table-active_mate center_list">
	                        <th>프로필 이미지</th>
	                        <td class="displayflex" colspan="3">
	                            <div class="img-viewr">
	                                <img id="img-view" class="profile_view" src="/img/img/profile.png">
	                            </div>
	                            <label class="btn btn_sm btn_out" for="profile">프로필 선택</label>
	                            <input type="file" name="profileFilepath" id="profile" onchange="loadImg(this);" accept=".jpg,.jpeg,.png,.gif" style="display: none;">
	                        </td>
	                    </tr>
	                    <tr class="table-active_mate">
	                        <th>등급</th>
	                        <td colspan="3"><input type="text" name="memberLevel" class="input_03" value="" readonly></td>
	                    </tr>
	                    <tr class="table-active_mate">
	                        <th>아이디</th>
	                        <td colspan="3"><input type="text" name="memberId" class="input_03" value="" readonly></td>
	                    </tr>
	                    <tr class="table-active_mate">
	                        <th>비밀번호</th>
	                        <td colspan="3"><input type="password" name="memberPw" class="input_03" value=""></td>
	                    </tr>
	                    <tr class="table-active_mate">
	                        <th>이메일</th>
	                        <td colspan="3"><input type="text" name="email" class="input_03" value=""></td>
	                    </tr>
	                    <tr class="table-active_mate">
	                        <th>이름</th>
	                        <td colspan="3"><input type="text" name="memberName" class="input_03" value=""></td>
	                    </tr>
	                    <tr class="table-active_mate">
	                        <th>성별</th>
	                        <td colspan="3">
	                            <div class="select">
	                                <input type="radio" id="select" name="select" value="m"><label for="select" style="width:130px;">남자</label>
	                                <input type="radio" id="select2" name="select" value="w"><label for="select2" style="width:130px;">여자</label>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr class="table-active_mate">
	                        <th>나이</th>
	                        <td colspan="3">
	                            <div class="select">
	                                <input type="radio" id="select3" name="selectAge" value="two"><label for="select3" style="width:130px;">20대</label>
	                                <input type="radio" id="select4" name="selectAge" value="three"><label for="select4" style="width:130px;">30대</label>
	                                <input type="radio" id="select5" name="selectAge" value="four"><label for="select5" style="width:130px;">40대 이상</label>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr class="table-active_mate">
	                        <th>가입일</th>
	                        <td colspan="3"><input type="text" name="enrollDate" class="input_03" value="" readonly></td>
	                    </tr>
	                    <tr class="table-active_mate">
	                        <th>헬퍼</th>
	                        <td>
	                            <div class="form-check form-switch">
	                                <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
	                                <label class="form-check-label" for="flexSwitchCheckDefault"></label>
	                            </div>
	                        </td>
	                        <th>프로필 등록 여부</th>
	                        <td><a href="/">등록</a></td>
	                    </tr>
	                </table>
	            </form>
	        </div>
		</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
</body>
<link rel="stylesheet" href="/resources/css/admin/memberView.css">
</html>