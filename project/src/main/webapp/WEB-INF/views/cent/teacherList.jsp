<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
    
<!DOCTYPE html>
<html>
<head>

    
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<!-- .jsp -->
<div id="teacherList">
    <h3>강사 목록</h3>
    <ul>
        <c:forEach var="teacher" items="${list}">   
           <li>${teacher.t_id} - ${teacher.t_name}</li>
        </c:forEach>
   </ul>
</div>

</body>
</html>