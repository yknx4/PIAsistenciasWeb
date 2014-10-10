<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:mainTemplate title="Inicio de Sesión">
    <jsp:body>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Please Sign In</h3>
                        </div>
                        <div class="panel-body">
                            
                            <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <html:errors />
                            </div>

                            <form role="form" name="LoginForm" method="post" action="${pageContext.request.contextPath}/Login.do">
                                <fieldset>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="UserName" name="userName" autofocus="true"/>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Password" name="password" type="password" value=""/>
                                    </div>

                                    <html:submit value="Login" styleClass="btn btn-lg btn-success btn-block"/>
                                </fieldset>
                                <form>


                                    </div>
                                    </div>
                                    </div>
                                    </div>
                                    </div>
                                </jsp:body>

                            </t:mainTemplate>
