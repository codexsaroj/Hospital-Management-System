<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>


<c:if test="${not empty msg}">
	<p class="text-center fs-6" style="color: red;">${msg}</p>
	<c:remove var="msg" scope="session"></c:remove>
</c:if>