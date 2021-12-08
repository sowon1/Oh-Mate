<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${list}" var="h">
	<a href="<c:url value='/house/houseView?houseNo=${h.houseNo}'/>">
		<li>
              <div class="house_list_photo">
                  <div class="like_house">
                      <img src="/resources/img/icon/heart_off.png">
                  </div>
                  <img src="/resources/upload/house/${h.photoList}">
              </div>
              <div class="house_list_text">
                  <div class="list_line_01">
                      <span class="list_house_title">${h.houseTitle}</span>
                  </div>
                  <div class="list_line_02">
                      <span class="list_tag">
                      	<c:choose>
                      		<c:when test="${h.houseGender == '1'}">
                      			남성전용
                      		</c:when>
                      		<c:when test="${h.houseGender == '2'}">
                      			여성전용
                      		</c:when>
                      		<c:otherwise>
                      			남여공용
                      		</c:otherwise>
                      	</c:choose>
                      </span>
                      <span class="house_form">${h.houseForm}</span>
                  </div>
              </div>
              <a href="<c:url value='/house/houseView?houseNo=${h.houseNo}'/>" class="house_more_btn">입주 가능 방 ${h.houseRoom}개</a>
       </li>         
	</a>
</c:forEach>