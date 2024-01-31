<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>name</h2>
<c:forEach var="list" items="${list}">
${list.event_num}
</c:forEach>