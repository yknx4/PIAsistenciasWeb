<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:dashboardTemplate ptitle="${requestScope.nombreMaestro}">
     <jsp:attribute name="pcustomjs">
       <script language="JavaScript" src="${pageContext.request.contextPath}/resources/js/statsPersonalData.js" type="text/javascript" ></script> 
        
    </jsp:attribute>
    <jsp:body>

        <div class="row">
            <div class="col-lg-5">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        General
                    </div>
                    <c:if test="${not empty sessionScope.isAdmin}">
                        <c:if test="${empty requestScope.isSelf}">
                            <div class="col-md-12 text-center" style="margin: 10px">
                                <div class="dropdown">
                                    <button class="btn btn-outline btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
                                        Maestro
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu scrollable-menu" role="menu" aria-labelledby="dropdownMenu1">


                                        <logic:iterate id="rowProfesor" name="listUsers" indexId="maestrosIndex">

                                            <li role="presentation"><a role="menuitem" tabindex="<bean:write name="maestrosIndex"/>" href="${pageContext.request.contextPath}/PersonalStats.do?user=<bean:write name="rowProfesor" property="id"/>"><bean:write name="rowProfesor" property="name"/></a></li>

                                        </logic:iterate>

                                    </ul>
                                </div>
                            </div>
                        </c:if>
                    </c:if>
                    <!-- /.panel-heading -->
                    <div class="panel-body" >
                        <div class="list-group" >
                            <span href="#" class="list-group-item">
                                <i class="fa fa-check fa-fw"></i> Asistencias
                                <span class="pull-right text-muted small"><em>124</em>
                                </span>
                            </span>
                            <span href="#" class="list-group-item">
                                <i class="fa fa-times fa-fw"></i> Faltas
                                <span class="pull-right text-muted small"><em>6</em>
                                </span>
                            </span>
                            <span href="#" class="list-group-item">
                                <i class="fa fa-check-circle fa-fw"></i> Justificaciones
                                <span class="pull-right text-muted small"><em>5</em>
                                </span>
                            </span>
                            <span href="#" class="list-group-item">
                                <i class="fa fa-calendar fa-fw"></i> Sistemas Embebidos
                                <span class="pull-right text-muted small"><em>Clase mas ausente</em>
                                </span>
                            </span>
                            <span href="#" class="list-group-item">
                                <i class="fa fa-calendar-o fa-fw"></i> Mes mas ausente
                                <span class="pull-right text-muted small"><em>Febrero/2014</em>
                                </span>
                            </span>
                            <span href="#" class="list-group-item">
                                <i class="fa fa-group fa-fw"></i> Grupo mas ausente
                                <span class="pull-right text-muted small"><em>5j</em>
                                </span>
                            </span>
                            <span href="#" class="list-group-item">
                                <i class="fa fa-warning fa-fw"></i> Mayor Retardo
                                <span class="pull-right text-muted small"><em>23 minutos</em>
                                </span>
                            </span>


                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-4 -->
            <div class=" col-lg-7">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Semestral
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body text-center">
<!--                        <form id ="monthform" class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="dia" class="col-md-offset-2 col-md-3 control-label">Mes</label>
                                <div class="col-md-4">
                                    <select class="form-control" required="true" name="dias">
                                        <option value="0">Enero</option>
                                        <option value="1">Febrero</option>
                                        <option value="2">Marzo</option>
                                        <option value="3">Abril</option>
                                        <option value="4">Mayo</option>
                                        <option value="5">Junio</option>
                                        <option value="6">Julio</option>
                                        <option value="7">Agosto</option>
                                        <option value="8">Septiembre</option>
                                        <option value="9">Octubre</option>
                                        <option value="10">Noviembre</option>
                                        <option value="11">Diciembre</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                        -->
                        <div id="morris-donut-chart"></div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-8-->
        </div>

        <div class="row">
            <div class=" col-lg-11 ">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Asistencia
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div id="morris-bar-chart"></div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-4 -->
        </div>
    </jsp:body>

</t:dashboardTemplate>
