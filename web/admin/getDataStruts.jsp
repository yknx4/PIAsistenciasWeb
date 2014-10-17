<%-- 
    Document   : getDataStruts
    Created on : Oct 16, 2014, 6:35:44 AM
    Author     : Yknx
--%>

<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:validateAdmin></t:validateAdmin>

<c:choose>
    <c:when test="${not empty requestScope.isValid}" >

        ${requestScope.output}

    </c:when>
    <c:otherwise>
        <c:redirect url="${pageContext.request.contextPath}"></c:redirect>
    </c:otherwise>
</c:choose>