<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:dashboardTemplate ptitle="${requestScope.nombreMaestro}">

    <jsp:body>
        <c:if test="${not empty sessionScope.isAdmin}">
            <c:if test="${empty requestScope.isSelf}">
                <div class="row">
                    <div class="col-lg-2">
                        <div class="well" id="titleContainer" >
                            <div class="text-center">
                                <div class="dropdown">
                                    <button class="btn btn-lg btn-outline btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
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
                        </div>
                    </div>
                </div>
            </c:if>
        </c:if>
        <div class="row">
            <div class="col-lg-offset-1 col-lg-3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        General
                    </div>
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
                                <i class="fa fa-calendar fa-fw"></i> Clase mas ausente
                                <span class="pull-right text-muted small"><em>Sistemas Embebidos</em>
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
            <div class="col-lg-offset-1 col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="form-group">
                                            <label for="dia" class="col-md-3 control-label">Mes</label>
                                            <div class="col-md-9">
                                                <select class="form-control" required="true" name="dias">
                                                    <option value="-1"></option>
                                                    <option value="0">Lunes</option>
                                                    <option value="1">Martes</option>
                                                    <option value="2">Miercoles</option>
                                                    <option value="3">Jueves</option>
                                                    <option value="4">Viernes</option>
                                                </select>
                                            </div>
                                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-8-->
        </div>

        <div class="row">
            <div class="col-lg-offset-1 col-lg-10 ">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Asistencia
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">

                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-4 -->
        </div>
    </jsp:body>

</t:dashboardTemplate>
