<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate! 프로필 등록</title>
<!-- jQuery라이브러리 -->
<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<!-- 부트스트랩용 jQuery -->
<script type="text/javascript" src="/resources/js/bootstrap.bundle.min.js"></script>
<!-- 기본 CSS -->
<link rel="stylesheet" href="/resources/css/default.css">
<!-- 폰트 CSS -->
<link rel="stylesheet" href="/resources/css/font.css">
<link rel="stylesheet" href="/resources/css/admin/profileFrm.css">
</head>
<body>
	<div class="container_win">
		<h1>프로필 등록</h1>
        <div>
            <form action="/adminInsertProfile.do" method="post">
            	<input type="hidden" name="pWriter" value="${memberId }">
            	<input type="hidden" name="memberNo" value="${memberNo }">
                <table class="table">
                	<tr class="table-active_mate">
                		<th>지역</th>
                		<td>
                			<select class="form-select" name="pLocal">
                				<option value="0">지역구 선택</option>
                			</select>
                		</td>
                	</tr>
                    <tr class="table-active_mate">
                        <th>성별 타입</th>
                        <td>
                            <div class="select">
                                <input type="radio" id="pGender" name="pGender" value="1"><label for="pGender">남성전용</label>
                                <input type="radio" id="pGender2" name="pGender" value="2"><label for="pGender2">여성전용</label>
                                <input type="radio" id="pGender3" name="pGender" value="3"><label for="pGender3">남녀공용</label>
                            </div>
                        </td>
                    </tr>
                    <tr class="table-active_mate">
                        <th>선호 나이</th>
                        <td>
                            <div class="select">
                                <input type="radio" id="pAge" name="pAge" value="1"><label for="pAge">20대</label>
                                <input type="radio" id="pAge2" name="pAge" value="2"><label for="pAge2">30대</label>
                                <input type="radio" id="pAge3" name="pAge" value="3"><label for="pAge3">40대 이상</label>
                            </div>
                        </td>
                    </tr>
                    <tr class="table-active_mate">
                        <th>흡연 여부</th>
                        <td>
                            <div class="select">
                                <input type="radio" id="pSmoke" name="pSmoke" value="1"><label for="pSmoke">비흡연</label>
                                <input type="radio" id="pSmoke2" name="pSmoke" value="2"><label for="pSmoke2">흡연</label>
                            </div>
                        </td>
                    </tr>
                    <tr class="table-active_mate">
                        <th>반려동물</th>
                        <td>
                            <div class="select">
                                <input type="radio" id="pPet" name="pPet" value="1"><label for="pPet">없음</label>
                                <input type="radio" id="pPet2" name="pPet" value="2"><label for="pPet2">있음</label>
                            </div>
                        </td>
                    </tr>
                    <tr class="table-active_mate">
                        <th>청소</th>
                        <td>
                            <div class="select">
                                <input type="radio" id="pCleaning" name="pCleaning" value="1"><label for="pCleaning">좋아함</label>
                                <input type="radio" id="pCleaning2" name="pCleaning" value="2"><label for="pCleaning2">싫어함</label>
                            </div>
                        </td>
                    </tr>
                    <tr class="table-active_mate">
                        <th>생활 패턴</th>
                        <td>
                            <div class="select">
                                <input type="radio" id="pPattern" name="pPattern" value="1"><label for="pPattern">밤</label>
                                <input type="radio" id="pPattern2" name="pPattern" value="2"><label for="pPattern2">낮</label>
                            </div>
                        </td>
                    </tr>
                </table>
                <div class="btnBox">
                    <button type="button" class="btn btn_out">닫기</button>
                    <input type="submit" class="btn" value="등록">
                </div>
            </form>
        </div>
	</div>
</body>
<script>
	var local = [
		'강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구',
		'마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구'
	];
	$(function(){
		for(var i=0;i<local.length;i++){
			var option = $("<option>");
			option.attr("value",i+1);
			option.html(local[i]);
			$("select").append(option);
		}
	});
	$("[type=button]").click(function(){
		self.close();
	});
</script>
</html>