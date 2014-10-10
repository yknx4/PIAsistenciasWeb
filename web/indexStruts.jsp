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
                                        <div class="huge">26</div>
                                        <div>Asistencias hoy!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
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
                                        <div class="huge">2</div>
                                        <div>Faltas hoy!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
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
                                <span class="text-left text-info">Clases Anteriores</span> &nbsp;&nbsp; <span class="text-right text-muted">07:00</span>

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
                                            <tr class="info">
                                                <td>06:58:33am</td>
                                                <td>5J</td>
                                                <td>Carlos Ulibarri Ireta</td>
                                                <td>Mantenimiento de Software</td>
                                                <td>Laboratorio 1</td>
                                                <td><p class="text-center">✔</p></td>
                                            </tr>
                                            <tr class="info">
                                                <td>07:03:33am</td>
                                                <td>5H</td>
                                                <td>Luis Miguel Ávalos Contreras</td>
                                                <td>Bases de Datos</td>
                                                <td>Laboratorio 4</td>
                                                <td><p class="text-center">✔</p></td>
                                            </tr>
                                            <tr class="warning">
                                                <td>07:16:35am</td>
                                                <td>3J</td>
                                                <td>Hector Torres Torres</td>
                                                <td>Lenguajes Algorítmicos</td>
                                                <td>Medios Didacticos</td>
                                                <td><p class="text-center">✔ ◷</p></td>
                                            </tr>
                                            <tr class="danger">
                                                <td></td>
                                                <td>7B</td>
                                                <td>Salvador Macías Elizarrarás</td>
                                                <td>Seminario de Investigación</td>
                                                <td>Aula 1</td>
                                                <td><p class="text-center">✘</p></td>
                                            </tr>
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
                                <span class="text-left text-info">Clases Actuales</span> &nbsp;&nbsp; <span class="text-right text-muted">07:50</span>
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
                                            <tr class="info">
                                                <td>06:58:33am</td>
                                                <td>5J</td>
                                                <td>Carlos Ulibarri Ireta</td>
                                                <td>Mantenimiento de Software</td>
                                                <td>Laboratorio 1</td>
                                                <td><p class="text-center">✔</p></td>
                                            </tr>
                                            <tr class="info">
                                                <td>07:49:25am</td>
                                                <td>5B</td>
                                                <td>Hugo Lugo</td>
                                                <td>Métodos Numéricos</td>
                                                <td>Laboratorio 2</td>
                                                <td><p class="text-center">✔</p></td>
                                            </tr>
                                            <tr class="warning">
                                                <td></td>
                                                <td>3B</td>
                                                <td>Hector Torres Torres</td>
                                                <td>Lenguajes Algorítmicos</td>
                                                <td>Laboratorio HCI</td>
                                                <td><p class="text-center">◷</p></td>
                                            </tr>
                                            <tr class="warning">
                                                <td>08:01:16</td>
                                                <td>7B</td>
                                                <td>Salvador Macías Elizarrarás</td>
                                                <td>Seminario de Investigación</td>
                                                <td>Aula 1</td>
                                                <td><p class="text-center">✔ ◷</p></td>
                                            </tr>
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
