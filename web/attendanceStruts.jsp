<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:dashboardTemplate ptitle="Asistencias">
    <jsp:body>
        <div class="row">

            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Asistencias
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Fecha</th>
                                        <th>Hora</th>
                                        <th>Grupo</th>
                                            <c:if test="${not empty sessionScope.isAdmin}">
                                            <th>Maestro</th>
                                            </c:if>
                                        <th>Materia</th>
                                        <th>&#10004;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <logic:iterate id="rowAntes" name="listClases" indexId="claseIndexAhora">
                                        <logic:equal name="rowAntes" property="asistio" value="true">
                                            <tr >
                                                <td><bean:write name="rowAntes" property="fechaAsistio"/></td>
                                                <td><bean:write name="rowAntes" property="hora"/></td>
                                                <td><bean:write name="rowAntes" property="grupo"/></td>
                                                <c:if test="${not empty sessionScope.isAdmin}">
                                                    <td><bean:write name="rowAntes" property="maestro"/></td>
                                                </c:if>
                                                <td><bean:write name="rowAntes" property="materia"/></td>
                                                <td>

                                                    <logic:equal name="rowAntes" property="asistio" value="true">&#10004; 
                                                        <logic:equal name="rowAntes" property="late" value="true">&#9785; </logic:equal>
                                                    </logic:equal>
                                                    <logic:equal name="rowAntes" property="asistio" value="false">✘ </logic:equal>

                                                    </td>
                                                </tr>
                                        </logic:equal>
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
                        Faltas
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Grupo</th>
                                    <c:if test="${not empty sessionScope.isAdmin}">
                                    <th>Maestro</th>
                                    </c:if>
                                <th>Materia</th>
                                <th>&#10004;</th>
                                </thead>
                                <tbody>
                                    <logic:iterate id="rowAntes" name="listClases" indexId="claseIndexAhora">
                                        <logic:equal name="rowAntes" property="asistio" value="false">
                                            <tr >
                                                <td><bean:write name="rowAntes" property="fechaAsistio"/></td>
                                                <td><bean:write name="rowAntes" property="hora"/></td>
                                                <td><bean:write name="rowAntes" property="grupo"/></td>
                                                <c:if test="${not empty sessionScope.isAdmin}">
                                                    <td><bean:write name="rowAntes" property="maestro"/></td>
                                                </c:if>
                                                <td><bean:write name="rowAntes" property="materia"/></td>
                                                <td>

                                                    <logic:equal name="rowAntes" property="asistio" value="true">&#10004; 
                                                        <logic:equal name="rowAntes" property="late" value="true">&#9785; </logic:equal>
                                                    </logic:equal>
                                                    <logic:equal name="rowAntes" property="asistio" value="false">✘ </logic:equal>

                                                    </td>
                                                </tr>
                                        </logic:equal>
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
    </jsp:body>

</t:dashboardTemplate>
