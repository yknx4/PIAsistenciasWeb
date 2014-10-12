<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Refresh" content="0" url="${pageContext.request.contextPath}/Login.do">
        <script type="text/javascript">
        <!--
        window.location = "${pageContext.request.contextPath}/Login.do";
        //-->   
        </script>
        <title>Login Failure -> Redirecting...</title>
    </head>
    <body>
        <p>If you were not automatically redirected, click <a href="${pageContext.request.contextPath}/Login.do">this</a>.
    </p>
    </body>
</html>


