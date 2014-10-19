<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:dashboardTemplate ptitle="Control">
    <jsp:attribute name="pcustomcss">
        
    </jsp:attribute>
    <jsp:attribute name="pcustomjs">
        
        <script language="JavaScript" src="${pageContext.request.contextPath}/resources/js/manageNewStrutsScripts.js" type="text/javascript" ></script> 
    </jsp:attribute>
    <jsp:body>
        <t:validateAdmin></t:validateAdmin>
            <div class="row">
                <div id="adduserbox " class="mainbox col-lg-4 col-lg-offset-1 col-md-12 col-sm-8 ">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">Añadir Usuario</div>
                        </div>  
                        <div class="panel-body">
                            <form id="signupform" class="form-horizontal" role="form">

                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>



                                <div class="form-group">
                                    <label for="email" class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                        <div id="containerEmail" class="pruebaClass">
                                            <input id="inpte" type="text" class="form-control" name="email" placeholder="Email Address"/>
                                            <span><i></i></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="firstname" class="col-md-3 control-label">Nombre(s)</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="firstname" placeholder="First Name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="lastname" class="col-md-3 control-label">Apellidos</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="lastname" placeholder="Last Name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label">Password</label>
                                    <div class="col-md-9">
                                        <input type="password" class="form-control" name="passwd" placeholder="Password"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="lastname" class="col-md-3 control-label">Permisos</label>
                                    <div class="col-md-9">

                                        <div class="checkbox ">
                                            <label  class="tooltipCheckbox" data-toggle="tooltip" title="Por horas, Tiempo Completo.">
                                                <input  type="checkbox" name="isMaestro"/> Maestro
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label class="tooltipCheckbox"  data-toggle="tooltip" title="Administrativo, Directivo, Profesor Tiempo completo.">
                                                <input type="checkbox" name="isPersonal" /> Personal
                                            </label>
                                        </div>
                                        <div class="checkbox ">
                                            <label class="text-danger tooltipCheckbox"  data-toggle="tooltip" title="Control total del Sistema.">
                                                <input type="checkbox" name="isAdmin" /> Administrador
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-3 col-md-9">
                                        <button id="btn-signup" type="button" class="btn btn-info" name="btnadduser" disabled="true"><i class="fa fa-user"></i> &nbsp Registrar Usuario</button>

                                    </div>
                                </div>





                            </form>
                        </div>
                    </div>




                </div> 
                <div id="addclassbox " class="mainbox col-lg-4 col-lg-offset-1 col-md-12 col-sm-8 ">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">Añadir Clase</div>
                        </div>  
                        <div class="panel-body" id="clasePanel">

                            <form id="classform" class="form-horizontal" role="form">

                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>
                                <div class="row">
                                    <div class="col-lg-7 col-md-7 col-sm-5">

                                        <div class="form-group">
                                            <label for="dia" class="col-md-3 control-label">Dia</label>
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
                                        <div class="form-group">
                                            <label for="maestro" class="col-md-3 control-label">Maestro</label>
                                            <div class="col-md-9">
                                                <select class="form-control" disabled="true" required="true" name="maestros">
                                                    <option value="-1"></option> 

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="materia" class="col-md-3 control-label" >Materia</label>
                                            <div class="col-md-9">
                                                <select class="form-control" disabled="true" required="true" name="materias">
                                                    <option value="-1"></option> 
                                                </select>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-lg-5 col-md-5 col-sm-5">

                                        <div class="form-group">
                                            <label for="hora" class="col-md-3 control-label">Hora</label>
                                            <div class="col-md-9">
                                                <select class="form-control" disabled="true" required="true" name="horarios">
                                                    <option value="-1"></option>


                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="Grupo" class="col-md-3 control-label">Grupo</label>
                                            <div class="col-md-9">
                                                <select class="form-control" disabled="true" required="true" name="grupos">
                                                    <option value="-1"></option> 

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="Salón" class="col-md-3 control-label">Salon</label>
                                            <div class="col-md-9">
                                                <select class="form-control" disabled="true" required="true" name="salones">
                                                    <option value="-1"></option> 


                                                </select>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                        <div class="form-group">
                                            <!-- Button -->                                        
                                            <div class="col-md-offset-4 col-md-8">
                                                <button id="btn-signup" type="button" class="btn btn-info" disabled="true" name="btnsignup"><i class="fa fa-graduation-cap"></i> &nbsp Registrar Clase</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>




                            </form>
                        </div>
                    </div>




                </div> 
            </div>
    </jsp:body>

</t:dashboardTemplate>
