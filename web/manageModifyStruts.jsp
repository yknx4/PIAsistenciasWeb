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

        <script language="JavaScript" src="${pageContext.request.contextPath}/resources/js/manageModifyStrutsScripts.js" type="text/javascript" ></script> 
    </jsp:attribute>
    <jsp:body>
        <t:validateAdmin></t:validateAdmin>
            <div class="row">
                <div id="adduserbox " class="mainbox col-lg-4 col-lg-offset-1 col-md-12 col-sm-8 ">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">Editar Usuario</div>
                        </div>  
                        <div class="panel-body">
                            <form id="signupform" class="form-horizontal" role="form">

                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>

                                <div class="form-group">
                                    <label for="firstname" class="col-md-3 control-label">Maestro</label>
                                    <div class="col-md-9">
                                        <select class="form-control" required="true" name="maestros">
                                            <option value="-1"></option> 
                                        <logic:iterate id="rowProfesor" name="listUsers" indexId="maestrosIndex">

                                            <option value="<bean:write name="rowProfesor" property="id"/>"><bean:write name="rowProfesor" property="name"/></option> 

                                        </logic:iterate>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="email" class="col-md-3 control-label">Email</label>
                                <div class="col-md-9">
                                    <div id="containerEmail" class="pruebaClass">
                                        <input id="inpte" type="text" class="form-control" disabled="true" name="email" placeholder="Email Address"/>
                                        <span><i></i></span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="name" class="col-md-3 control-label">Nombre</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="name" placeholder="Nombre"/>
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
                                    <button id="btn-signup" type="button" class="btn btn-info" name="btnupdateuser" disabled="true"><i class="fa fa-user"></i> &nbsp Actualizar Usuario</button>

                                </div>
                            </div>





                        </form>
                    </div>
                </div>




            </div> 
<!--            <div id="addclassbox " class="mainbox col-lg-4 col-lg-offset-1 col-md-12 col-sm-8 ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title"></div>
                    </div>  
                    <div class="panel-body">


                    </div>
                </div>




            </div> -->
        </div>
    </jsp:body>

</t:dashboardTemplate>
