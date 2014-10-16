<%-- 
    Document   : navigation
    Created on : Oct 7, 2014, 10:27:49 PM
    Author     : Yknx
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@tag description="Navigation Bar" pageEncoding="UTF-8"%>
<%@attribute name="title"  required="true" %>
<%-- The list of normal or fragment attributes can be specified here: --%>


<%-- any content can be specified here e.g.: --%>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">Control de Asistencias - ${title}</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">

        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-alerts">
                <li>
                    <a href="#">
                        <div>
                            <i class="fa fa-comment fa-fw"></i> New Comment
                            <span class="pull-right text-muted small">4 minutes ago</span>
                        </div>
                    </a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="#">
                        <div>
                            <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                            <span class="pull-right text-muted small">12 minutes ago</span>
                        </div>
                    </a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="#">
                        <div>
                            <i class="fa fa-envelope fa-fw"></i> Message Sent
                            <span class="pull-right text-muted small">4 minutes ago</span>
                        </div>
                    </a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="#">
                        <div>
                            <i class="fa fa-tasks fa-fw"></i> New Task
                            <span class="pull-right text-muted small">4 minutes ago</span>
                        </div>
                    </a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="#">
                        <div>
                            <i class="fa fa-upload fa-fw"></i> Server Rebooted
                            <span class="pull-right text-muted small">4 minutes ago</span>
                        </div>
                    </a>
                </li>
                <li class="divider"></li>
                <li>
                    <a class="text-center" href="#">
                        <strong>See All Alerts</strong>
                        <i class="fa fa-angle-right"></i>
                    </a>
                </li>
            </ul>
            <!-- /.dropdown-alerts -->
        </li>
        <!-- /.dropdown -->
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <c:choose>
                    <c:when test="${not empty sessionScope.UserNombre}" >
                        <li><a href="${pageContext.request.contextPath}/Attendance.do"><i class="fa fa-user fa-fw"></i>
                                ${sessionScope.UserNombre}
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <c:redirect url="${pageContext.request.contextPath}/Logout.do"></c:redirect>
                    </c:otherwise>
                </c:choose>

                <!--                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                                            </li>-->
                <li class="divider"></li>

                <li><a href="${pageContext.request.contextPath}/Logout.do"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li class="divider"></li>
                <li class="divider"></li>
                <li class="divider"></li>
                <li class="divider"></li>
                <li class="divider"></li>
                <li>
                    <a href="${pageContext.request.contextPath}"><i class="fa fa-dashboard fa-fw"></i> Inicio</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/Attendance.do<c:if test="${not empty sessionScope.isAdmin}">?user=self</c:if>"><i class="fa fa-table fa-fw"></i> Asistencias</a>
                </li>
                <c:if test="${not empty sessionScope.isProfessor}">
                    <li>
                        <a href="${pageContext.request.contextPath}/Calendar.do<c:if test="${not empty sessionScope.isAdmin}">?user=self</c:if>"><i class="fa fa-calendar fa-fw"></i> Horario</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/PersonalStats.do"><i class="fa fa-bar-chart-o fa-fw"></i> Estadísticas</a>
                    </li>
                </c:if>
                <c:if test="${not empty sessionScope.isAdmin}">
                    <li class="divider"></li>
                    <li class="divider"></li>
                    <li class="divider"></li>
                    <li class="divider"></li>
                    <li class="divider"></li>
                    <li>
                    <a href="${pageContext.request.contextPath}/Attendance.do"><i class="fa fa-table fa-fw"></i> Asistencias</a>
                </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/Calendar.do"><i class="fa fa-calendar fa-fw"></i> Horarios</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/Stats.do"><i class="fa fa-bar-chart-o fa-fw"></i> Estadísticas<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="flot.html">General</a>
                            </li>
                            <li>
                                <a href="morris.html">Por Usuario</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> Control de Usuarios<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="flot.html">Añadir</a>
                            </li>
                            <li>
                                <a href="morris.html">Modificar</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> Control de Clases<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="flot.html">Añadir</a>
                            </li>
                            <li>
                                <a href="morris.html">Modificar</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                </c:if>
                <!--                            <li>
                                                <a href="tables.html"><i class="fa fa-wrench fa-fw"></i> Control de Grupos</a>
                                            </li>-->


            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>