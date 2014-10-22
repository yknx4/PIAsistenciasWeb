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
        <!--<script language="JavaScript" src="${pageContext.request.contextPath}/resources/js/calendarStrutsScripts.js" type="text/javascript" ></script>--> 
        <script language="JavaScript" type="text/javascript" >
            var objDatos = JSON.parse('${requestScope.datosTabla}');
            console.log(objDatos);
            
        </script> 
        <script language="JavaScript" src="${pageContext.request.contextPath}/resources/js/stats-data.js" type="text/javascript" ></script> 

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

            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Asistencias
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="list-group">
                            <logic:iterate id="row" name="maestrosMas">
                                <span class="list-group-item">
                                    <i class="fa fa-user fa-fw"></i> Maestro
                                    <span class="pull-right text-muted small"><em><bean:write name="row" property="name"/></em>
                                    </span>
                                </span>                              
                            </logic:iterate>
                            <logic:iterate id="row" name="gruposMas">
                                <span class="list-group-item">
                                <i class="fa fa-users fa-fw"></i> Grupo
                                    <span class="pull-right text-muted small"><em><bean:write name="row"/></em>
                                    </span>
                                </span>                              
                            </logic:iterate>
                            <logic:iterate id="row" name="diasMas">
                                <span class="list-group-item">
                                <i class="fa fa-sun-o fa-fw"></i> Día
                                    <span class="pull-right text-muted small"><em><bean:write name="row"/></em>
                                    </span>
                                </span>                              
                            </logic:iterate>
                            <logic:iterate id="row" name="fechasMas">
                                <span class="list-group-item">
                                <i class="fa fa-calendar-o fa-fw"></i> Fecha
                                    <span class="pull-right text-muted small"><em><bean:write name="row"/></em>
                                    </span>
                                </span>                              
                            </logic:iterate>
                            <logic:iterate id="row" name="horariosMas">
                                <span class="list-group-item">
                                <i class="fa fa-calendar fa-fw"></i> Horario
                                    <span class="pull-right text-muted small"><em><bean:write name="row"/></em>
                                    </span>
                                </span>                              
                            </logic:iterate>
                            
                            
                        </div>
                        <!-- /.list-group -->
                        <!-- <span class="btn btn-default btn-block">View All Alerts</span> -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-6 -->
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Faltas
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                       <div class="list-group">
                            <logic:iterate id="row" name="maestrosMenos">
                                <span class="list-group-item">
                                    <i class="fa fa-user fa-fw"></i> Maestro
                                    <span class="pull-right text-muted small"><em><bean:write name="row" property="name"/></em>
                                    </span>
                                </span>                              
                            </logic:iterate>
                            <logic:iterate id="row" name="gruposMenos">
                                <span class="list-group-item">
                                <i class="fa fa-users fa-fw"></i> Grupo
                                    <span class="pull-right text-muted small"><em><bean:write name="row"/></em>
                                    </span>
                                </span>                              
                            </logic:iterate>
                            <logic:iterate id="row" name="diasMenos">
                                <span class="list-group-item">
                                <i class="fa fa-sun-o fa-fw"></i> Día
                                    <span class="pull-right text-muted small"><em><bean:write name="row"/></em>
                                    </span>
                                </span>                              
                            </logic:iterate>
                            <logic:iterate id="row" name="fechasMenos">
                                <span class="list-group-item">
                                <i class="fa fa-calendar-o fa-fw"></i> Fecha
                                    <span class="pull-right text-muted small"><em><bean:write name="row"/></em>
                                    </span>
                                </span>                              
                            </logic:iterate>
                            <logic:iterate id="row" name="horariosMenos">
                                <span class="list-group-item">
                                <i class="fa fa-calendar fa-fw"></i> Horario
                                    <span class="pull-right text-muted small"><em><bean:write name="row"/></em>
                                    </span>
                                </span>                              
                            </logic:iterate>
                            
                            
                        </div>
                        <!-- /.list-group -->
                        <!-- <span class="btn btn-default btn-block">View All Alerts</span> -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-6 -->
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Administrativos
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="list-group">
                            <logic:iterate id="row" name="maestrosMas">
                                <span class="list-group-item">
                                    <i class="fa fa-user fa-fw"></i> Mas Asistencias
                                    <span class="pull-right text-muted small"><em><bean:write name="row" property="name"/></em>
                                    </span>
                                </span>                              
                            </logic:iterate>
                            <logic:iterate id="row" name="maestrosMenos">
                                <span class="list-group-item">
                                    <i class="fa fa-user fa-fw"></i> Mas Faltas
                                    <span class="pull-right text-muted small"><em><bean:write name="row" property="name"/></em>
                                    </span>
                                </span>                              
                            </logic:iterate>
                            
                            
                        </div>
                        <!-- /.list-group -->
                        <!-- <span class="btn btn-default btn-block">View All Alerts</span> -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-6 -->

        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        General
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div id="morris-area-chart"></div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-6 -->
        </div>
        <!-- /.row -->
    </jsp:body>

</t:dashboardTemplate>
