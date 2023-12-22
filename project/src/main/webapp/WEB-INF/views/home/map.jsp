<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header_v1.jsp" %>
<!-- 본문 시작 map.jsp -->

<div id="map" style="width:100%;height:350px;"></div>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2f64c81a28b39304014a52bdbdc6b39d"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.498899, 127.031673), // 지도의 중심좌표
    level: 2 // 지도의 확대 레벨
};

//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);  

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.498899, 127.031673); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
</script>
<!-- 본문 끝 -->
<%@ include file="../template/footer_v1.jsp" %>