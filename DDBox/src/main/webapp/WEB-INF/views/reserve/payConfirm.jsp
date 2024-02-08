<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제확인</title>
</head>
<body>
	<table class="striped-table align-center">
			<tr>
				<th width="30%">영화제목</th>
				<td class="align-center">${movie.movie_title}</td>
				
			</tr>
				<tr>
					<th>상영관</th>
					<td class="align-center">${screen.scr_name}</td>
				</tr>
				<tr>
					<th>상영시간</th>
					<td class="align-center">${show.shw_time}</td>
				</tr>
		</table>
</body>
</html>