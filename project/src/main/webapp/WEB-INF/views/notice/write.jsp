<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header_v1.jsp" %>
<!-- 본문 시작 notice/write.jsp -->
<div class="container text-center">
  <div class="row">
    <div class="col-sm-12">
    	<p><h3>글쓰기</h3></p> 
    </div><!-- col end -->
  </div><!-- row end -->

  <div class="row">
    <div class="col-sm-12">
		 <form name="productfrm" id="productfrm" method="post" action="insert" enctype="multipart/form-data">
		 	<table class="table table-hover">
			    <tbody style="text-align: left;">
			    <tr>
					<td>제목</td>
					<td> <input type="text" name="product_name" class="form-control"> </td>
			    </tr>
			    <tr>
					<td>내용</td>
					<td> 
					    <textarea rows="5" cols="60" name="description" class="form-control"></textarea>     
					 </td>
			    </tr>
			    <tr>
					<td>첨부파일</td>
					<td> <input type="file" name="img" class="form-control"> </td>
			    </tr>
			    <tr>
					<td colspan="2" align="center">
					    <input type="submit" value="글등록" class="btn btn-success">
					    <button type="button" onclick="location.href='/notice/home'" class="btn btn-warning">목록으로</button> 
					</td>
			    </tr>   
			    </tbody> 
		    </table>
		 </form>
    </div><!-- col end -->
  </div><!-- row end -->
</div><!-- container end -->

<!-- 본문 끝 -->
<%@ include file="../template/footer_v1.jsp" %>