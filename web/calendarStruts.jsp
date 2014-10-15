<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:dashboardTemplate ptitle="Horario">
    
    <jsp:body>
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
