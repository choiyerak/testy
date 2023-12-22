<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header_v1.jsp" %>
<!-- 본문 시작 commHome.jsp -->
<p><h2>수업자료</h2></p>

  <div class="text-center"><button class="btn btn-success">출결하기</button></div>


<!-- 검색 시작 -->
<form action="commList.jsp" onsubmit="return searchCheck()">
   <div class="row">
       <div class="col-md-8"></div> <!-- 빈 공간을 확보하여 출결하기 버튼과 검색창을 오른쪽으로 이동 -->
       <div class="col-md-4" style="text-align: right; height: 50px;">
            <select name="col">
                <option value="subject_content">제목+내용</option>
                <option value="subject">제목</option>
                <option value="content">내용</option>
                <option value="wname">작성자</option>
            </select>
            <input type="text" name="word" id="word">
            <input type="submit" value="검색" class="btn btn-primary">
        </div>
    </div>
</form>
<!-- 검색 끝 -->
        <div class="text-center">	 
        <table class="table">
         <thead>
             <th>no</th>
		  <th>제목</th>
		  <th>작성자</th>
		  <th>조회수</th>
		  <th>작성일</th>
      </thead>
      <tbody>
        <tr>
        	<td colspan="5">등록된 글이 없습니다.</td>    
        </tr>
       </tbody>
 	</table>
 	</div>
 <div class="text-center">	 	
 <p class="p2">
 <a href='write' class="btn btn-warning">글쓰기</a></p></div>
<!-- 본문 끝 -->
<%@ include file="../template/footer_v1.jsp" %>