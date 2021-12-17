<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Oh-Mate! 하우스 정보</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="container_mate">
		<h1 class="point_title">하우스 정보</h1>
		<div>
			<form action="#">
				<div id="tbl1">
					<table class="table">
						<tr>
							<th style="width:130px;">보증금</th>
							<td style="width:200px;"><fmt:formatNumber value="${h.houseCharge}" pattern="#,###"/>원</td>
							<th style="width:130px;">성별 타입</th>
							<td style="width:200px;">
								<c:choose>
									<c:when test="${h.houseGender eq 1 }">
										남성전용
									</c:when>
									<c:when test="${h.houseGender eq 2 }">
										여성전용
									</c:when>
									<c:when test="${h.houseGender eq 3 }">
										남녀공용
									</c:when>
								</c:choose>
							</td>
							<th style="width:130px;">주거 형태</th>
							<td style="width:330px;">${h.houseForm }</td>
						</tr>
						<tr>
							<th>방 개수</th>
							<td>${h.houseRoom }개</td>
							<th>임대 만료일</th>
							<td>${h.houseownerDeadline }</td>
							<th>주소</th>
							<td>${h.addressName } ${h.addressRoad } ${h.addressDetail }</td>
						</tr>
						<tr>
							<th>하우스오너</th>
							<td>${h.memberId }</td>
							<th>매매 상태</th>
							<td>
								<c:choose>
									<c:when test="${h.houseSelling eq 1 }">
										판매중
									</c:when>
									<c:when test="${h.houseSelling eq 2 }">
										판매완료
									</c:when>
								</c:choose>
							</td>
							<th>정산 계좌</th>
							<td>${h.accountInfo }</td>
						</tr>
					</table>
				</div>
				<div id="tbl2">
					<table class="table">
						<tr>
							<th style="width:131px;">하우스 이름</th>
							<td>${h.houseTitle }</td>
						</tr>
						<tr>
							<th>방 정보</th>
							<td></td>
						</tr>
						<tr>
							<th>제공 시설</th>
							<td>
								<input type="hidden" value="${h.houseConvenience }" id="houseOption">
								<table class="chkTbl table">
									<tbody></tbody>
								</table>
							</td>
						</tr>
						<tr>
							<th>하우스 이미지</th>
							<td></td>
						</tr>
						<tr>
							<th>하우스 소개</th>
							<td>${h.houseContent }</td>
						</tr>
						<tr>
							<th>이용 규칙</th>
							<td>${h.houseRule }</td>
						</tr>
						<tr>
							<th>승인 상태</th>
							<td>
								<input type="hidden" value="${h.houseAllow }" id="houseAllow">
								<select class="form-select" name="houseAllow">
									<option value="1">승인 대기</option>
									<option value="2">승인</option>
									<option value="3">미승인</option>
								</select>
							</td>
						</tr>
					</table>
				</div>
				<div class="btnBox">
					<button type="button" class="btn btn_out">목록</button>
                    <input type="submit" class="btn" value="수정">
				</div>
			</form>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	var houseOption = ['TV', '냉장고', '밥솥', '책상', '토스트기', '쇼파', '가스레인지', '전자레인지', '세탁기', '정수기', '청소기',
						'커피포트', '에어컨', '건조 시설', '침대', '서랍', '옷장', '의자', '인터넷 시설', '엘리베이터', '보안'];
	$(function(){
		for(var i=0;i<houseOption.length/7;i++){
			var tr = $("<tr>");
			for(var j=0;j<houseOption.length/3;j++){
				var td = $("<td>");
				var input = $("<input class='form-check-input' type='checkbox' disabled>");
				var label = $("<label class='form-check-label'>");
				td.append(input);
				td.append(label);
				tr.append(td);
				$(".chkTbl>tbody").append(tr);
			}
		}
		for(var i=0;i<houseOption.length;i++){
			$(".chkTbl label").eq(i).html(houseOption[i]);
			if($("#houseOption").val().charAt(i) == 1){
				$(".chkTbl [type=checkbox]").eq(i).prop("checked",true);
			}
		}
		$("#tbl2 .form-select>option").eq($("#houseAllow").val()-1).prop("selected",true);
		if($("#tbl2 .form-select").val() != 1){
			$("#tbl2 .form-select").prop("disabled",true);
		}
	});
	$(".btnBox>button").click(function(){
		history.go(-1);
	});
</script>
<link rel="stylesheet" href="/resources/css/admin/adminHouseView.css">
</html>