<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:dashboardTemplate ptitle="Inicio">
    <jsp:body>
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-check-circle fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">${requestScope.asistencias}</div>
                                <div>Asistencias hoy!</div>
                            </div>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/Attendance.do">
                        <div class="panel-footer">
                            <span class="pull-left">Ver Detalles</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-times-circle fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">${requestScope.faltas}</div>
                                <div>Faltas hoy!</div>
                            </div>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/Attendance.do">
                        <div class="panel-footer">
                            <span class="pull-left">Ver Detalles</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>


        </div> 
        <!--/.row-->
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <span class="text-left text-info">Clases Anteriores</span> &nbsp;&nbsp; <span class="text-right text-muted">${requestScope.h2}</span>

                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Hora</th>
                                        <th>Grupo</th>
                                        <th>Nombre</th>
                                        <th>Clase</th>
                                        <th>Salón</th>
                                        <th>✔</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <logic:iterate id="rowAntes" name="listClasesAntes" indexId="claseIndexAhora">
                                        <tr class=" <logic:equal name="rowAntes" property="asistio" value="false">danger </logic:equal> <logic:equal name="rowAntes" property="asistio" value="true">info 
                                            <logic:equal name="rowAntes" property="late" value="true">warning </logic:equal></logic:equal>">
                                            <td><bean:write name="rowAntes" property="hora"/></td>
                                            <td><bean:write name="rowAntes" property="grupo"/></td>
                                            <td><bean:write name="rowAntes" property="maestro"/></td>
                                            <td><bean:write name="rowAntes" property="materia"/></td>
                                            <td><bean:write name="rowAntes" property="salon"/></td>
                                            <td><p class="text-center">

                                                    <logic:equal name="rowAntes" property="asistio" value="true">&#10004; 
                                                        <logic:equal name="rowAntes" property="late" value="true">&#9785; </logic:equal>
                                                    </logic:equal>
                                                        <logic:equal name="rowAntes" property="asistio" value="false">✘ </logic:equal>
                                                            
                                                        </p></td>
                                                </tr>
                                    </logic:iterate>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-6 -->

            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <span class="text-left text-info">Clases Actuales</span> &nbsp;&nbsp; <span class="text-right text-muted">${requestScope.h1}</span>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Hora</th>
                                        <th>Grupo</th>
                                        <th>Nombre</th>
                                        <th>Clase</th>
                                        <th>Salón</th>
                                        <th>&#10004;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <logic:iterate id="rowAhora" name="listClasesAhora" indexId="claseIndexAhora">
                                        <tr class="<logic:equal name="rowAhora" property="asistio" value="true">info </logic:equal>
                                            <logic:equal name="rowAhora" property="late" value="true">warning </logic:equal>">
                                            <td><bean:write name="rowAhora" property="hora"/></td>
                                            <td><bean:write name="rowAhora" property="grupo"/></td>
                                            <td><bean:write name="rowAhora" property="maestro"/></td>
                                            <td><bean:write name="rowAhora" property="materia"/></td>
                                            <td><bean:write name="rowAhora" property="salon"/></td>
                                            <td><p class="text-center">
                                                    <logic:equal name="rowAhora" property="asistio" value="true">&#10004; </logic:equal>
                                                    <logic:equal name="rowAhora" property="late" value="true">&#9785; </logic:equal>
                                                    </p></td>
                                            </tr>
                                    </logic:iterate>

                                </tbody>
                            </table>
                        </div>
                        <!-- /.table-responsive -->
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
