<%-- 
    Document   : validateAdmin
    Created on : Oct 16, 2014, 3:07:38 AM
    Author     : Yknx
--%>

<%@tag description="Validates if it's admin, otherwise forward to login" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:if test="${empty sessionScope.isAdmin}">
    <c:redirect url="${pageContext.request.contextPath}/Login.do"></c:redirect>
</c:if>