<%@tag description="Main Webpage Template" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@attribute name="customcss" fragment="true" %>
<%@attribute name="customjs" fragment="true" %>
<%@attribute name="title"  required="true" %>
<html:html lang="true">
    <head>
        <link type="image/x-icon" href="http://www.ucol.mx/cms/img/favicon.ico" rel="icon" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="description" content="Sistema de control de asistencias para profesores de la Universidad de Colima"/>
        <meta name="author" content="Arekar Technologies"/>


        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>

        <!-- MetisMenu CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/metisMenu/metisMenu.min.css"/>

       

        <!-- Custom CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sb-admin-2.css"/>

        

        <!-- Custom Fonts -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/font-awesome-4.1.0/css/font-awesome.min.css"/>
        
       <jsp:invoke fragment="customcss"/>

            <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
            <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
            <!--[if lt IE 9]>
                <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
                <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
            <![endif]-->
            <title>Control de Asistencias - ${title}</title>
            <html:base/>
    </head>

    <body>
        
       

            <jsp:doBody/>

          
    <!-- /#wrapper -->


        <!-- jQuery Version 1.11.0 -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.0.js" type="text/javascript" ></script> 

        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript" ></script> 

        <!-- Metis Menu Plugin JavaScript -->
        <script  src="${pageContext.request.contextPath}/resources/js/plugins/metisMenu/metisMenu.min.js" type="text/javascript" ></script>  

        <!-- Custom Theme JavaScript -->
        <script  src="${pageContext.request.contextPath}/resources/js/sb-admin-2.js" type="text/javascript" ></script> 
        
        <!-- Template Client JS -->
        <jsp:invoke fragment="customjs"/>
    </body>
</html:html>
