<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header_v1.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- 본문 시작 write.jsp -->
<!-- 본문 시작 template.jsp -->  
	<div class="container text-center">
  <!-- 본문 시작 -->
  
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
					    <textarea id="summernote" rows="5" cols="60" name="description" class="form-control"></textarea>     
					 </td>
			    </tr>
			    <tr>
					<td colspan="2" align="center">
					    <input type="submit" value="글등록" class="btn btn-success">
					    <button type="button" onclick="location.href='/inquiry/home'" class="btn btn-warning">목록으로</button> 
					</td>
			    </tr>   
			    </tbody> 
		    </table>
		 </form>
    </div><!-- col end -->
  </div><!-- row end -->
<script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ],
        callbacks: {
        	onImageUpload: function(){
        		uploadSummernoteImageFile(files[0], this);
        	} //  
        }
      });
      
      function uploadSummernoteImageFile(file, editor){
    	  data = new FormData();
    	  data.append("file", flie);
    	  
    	  $.ajax({
    		 data: data,
    		 type: "POST",
    		 url: "/uploadSummernoteImageFile",
    		 dataType: "json",
    		 success: function(data){
    			 $(editor).summernote("insertImage", data.url);
    			 $("#thumbnailPath").append("<option value="+data.url+">"+data.originName+"</option>");
    		 }
    	  });
      }
</script>
<!-- 본문 끝 -->
<%@ include file="../template/footer_v1.jsp" %>