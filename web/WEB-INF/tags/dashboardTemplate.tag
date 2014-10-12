<%@tag description="Dashboard Page Template" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@attribute name="pcustomcss" fragment="true" %>
<%@attribute name="pcustomjs" fragment="true" %>
<%@attribute name="ptitle"  required="true" %>

<t:mainTemplate title="${ptitle}">
    <jsp:attribute name="customcss">
        <!-- Timeline CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/timeline.css"/>
        <!-- Morris Charts CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/morris.css"/>
        <jsp:invoke fragment="pcustomcss"/>
    </jsp:attribute>
     <jsp:attribute name="customjs">

        <script language="JavaScript" src="${pageContext.request.contextPath}/resources/js/plugins/morris/raphael.min.js" type="text/javascript" ></script> 
        <script language="JavaScript" src="${pageContext.request.contextPath}/resources/js/plugins/morris/morris.min.js" type="text/javascript" ></script> 
        <script language="JavaScript" src="${pageContext.request.contextPath}/resources/js/plugins/morris/morris-data.js" type="text/javascript" ></script> 
        <jsp:invoke fragment="pcustomjs"/>
    </jsp:attribute>

    <jsp:body>
        <div id="wrapper">
            <t:navigation title="${ptitle}"/>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><ui:insert name="page_title"></ui:insert></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <jsp:doBody/>
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->
    </jsp:body>

  

       

</t:mainTemplate>
