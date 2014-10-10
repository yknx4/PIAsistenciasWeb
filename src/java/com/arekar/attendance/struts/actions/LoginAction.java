/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arekar.attendance.struts.actions;

import com.arekar.attendance.struts.LoginForm;
import controller.SQLData.UserController;
import helper.Utility;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import model.User;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Yknx
 */
public class LoginAction extends org.apache.struts.action.Action {

    private final static String SUCCESS = "success";
    private final static String FAILURE = "failure";
    private HttpSession session;

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        LoginForm loginForm = (LoginForm) form;
        String username = loginForm.getUserName();
        String password = loginForm.getPassword();
        /*String username = "ds";
         String password = "dsad";*/

        ResultSet data = UserController.getUser(username, password);
       // ResultSet data = null;
        session = request.getSession(true);
        if (data != null && data.first()) {
            User mUser = UserController.getUser(data);
            session.setAttribute("rawUserData", data);
             session.setAttribute("UserObject", mUser);
             session.setAttribute("UserId", mUser.getId());
             session.setAttribute("UserNombre", mUser.getNombre());
             session.setAttribute("UserEmail", mUser.getEmail());
             session.setAttribute("UserPicture", request.getContextPath() + "/" + Utility.IMG_PATH + mUser.getPicture());
             
            return mapping.findForward(SUCCESS);
        } else {
            if (session != null) {
                session.invalidate();
            }
            return mapping.findForward(FAILURE);
        }

    }
}
