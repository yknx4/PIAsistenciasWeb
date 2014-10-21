<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:validateAdmin></t:validateAdmin>
<t:dashboardTemplate ptitle="Estadística - ${requestScope.fechaBonita}">
    <jsp:attribute name="pcustomjs">
        <script language="JavaScript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js" type="text/javascript" ></script> 
        <script language="JavaScript" src="${pageContext.request.contextPath}/resources/js/calendarStrutsScripts.js" type="text/javascript" ></script> 
        
    </jsp:attribute>
    <jsp:attribute name="pcustomcss">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/datepicker3.css"/>
    </jsp:attribute>
    <jsp:body>
        
        <div class="row">
            <div class="col-lg-1">
                <div class="well" id="titleContainer" >

                    <div class="input-group date" >
                        <input type="text" class="form-control" id="dateText" readonly>
                        <input type="date" class="form-control" readonly style="width: 1px; margin:  0px; padding: 0px; float: right">
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                    </div>


                </div>
            </div>



        </div>
        <div class="row">

            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading" >
                        Asistencias 


                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-6 -->
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Faltas
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-6 -->
        </div>
    </jsp:body>

</t:dashboardTemplate>
