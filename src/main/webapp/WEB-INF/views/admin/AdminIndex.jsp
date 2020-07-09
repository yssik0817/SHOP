<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>simple shopping mall</title>
<link href = "/resources/css/main.css" rel="stylesheet" type="text/css">


</head>
<body>
	<c:import url="Top.jsp"/>
	<table class="tableclass1">
		<c:choose>
			<c:when test="${idKey!=null }" >
				<tr>
					<td style="background-color: #F1F8E0;">${idKey}님 방문 감사합니다.</td>
				</tr>
			</c:when>
			<c:when test="${idKey==null }" >
				<tr>
					<td style="background-color: #F1F8E0;">로그인 하신 후 이용해주세요</td>
				</tr>		
			</c:when>	
		</c:choose>
	</table>
	<c:import url="Bottom.jsp"/>
</body>
</html>