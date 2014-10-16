<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:dashboardTemplate ptitle="Horario">

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
<!--                                                    <script>
                                                        var ind = <bean:write name="maestrosIndex"/>;
                                                        if (ind % 20 === 0)
                                                            document.write('<ul class="list-unstyled col-md-4">');
                                                    </script>-->
                                                    <li role="presentation"><a role="menuitem" tabindex="<bean:write name="maestrosIndex"/>" href="${pageContext.request.contextPath}/Calendar.do?user=<bean:write name="rowProfesor" property="id"/>"><bean:write name="rowProfesor" property="name"/></a></li>
<!--                                                    <script>

                                                        if (ind % 20 === 0)
                                                            document.write('</ul>');
                                                    </script>-->
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
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Horario <c:if test="${not empty requestScope.nombreMaestro}">
                            - ${requestScope.nombreMaestro}
                        </c:if>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Hora</th>
                                        <th>Lunes</th>
                                        <th>Martes</th>
                                        <th>Miercoles</th>
                                        <th>Jueves</th>
                                        <th>Viernes</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <nested:iterate id="row" name="listHorarioMaestro" indexId="horarioIndex">
                                        <nested:notEmpty name="row">
                                            <tr>
                                                <th class="text-center"><script>
                                                    document.write(<bean:write name="horarioIndex"/> + 1);
                                                    </script>  </th>
                                                    <nested:iterate id="entry" name="row">
                                                    <td><bean:write name="entry" property="salon"/> <br/> <small><bean:write name="entry" property="materia"/> - <bean:write name="entry" property="grupo"/> </small><br/><small><bean:write name="entry" property="hora"/></small></td>

                                                </nested:iterate>
                                            </tr>
                                        </nested:notEmpty>
                                    </nested:iterate>
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
