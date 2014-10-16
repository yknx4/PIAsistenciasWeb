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
import model.Usuario;
import static model.Usuario.ADMINISTRATIVE_PERSONNEL;
import static model.Usuario.EXTRA_FLAG;
import static model.Usuario.PROFESSOR;
import static model.Usuario.SYSTEM_ADMIN;
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
    private final static String ADMIN = "admin";
    private HttpSession session;

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        LoginForm loginForm = (LoginForm) form;
        String username = loginForm.getUserName();
        String password = loginForm.getPassword();
        String forward = SUCCESS;
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
            session.setAttribute("UserNombre", mUser.getName());
            session.setAttribute("UserEmail", mUser.getEmail());
            session.setAttribute("UserPicture", request.getContextPath() + "/" + Utility.IMG_PATH + mUser.getPicture());
            /*session.setAttribute("isAdmin", false);
            session.setAttribute("isProfessor", false);
            session.setAttribute("isPersonnel", false);*/
            
            
            
            Integer[] permissions = Usuario.getPermissions(mUser.getPermission());
            for (int p : permissions) {
                switch (p) {
                    case ADMINISTRATIVE_PERSONNEL:
                        session.setAttribute("isPersonnel", true);
                        break;
                    case PROFESSOR:
                        session.setAttribute("isProfessor", true);
                        break;
                    case SYSTEM_ADMIN:
                        session.setAttribute("isAdmin", true);
                        forward = ADMIN;
                        Utility.forceAusent();
                        break;
                    case EXTRA_FLAG:
                        break;
                    default:

                }
            }

            return mapping.findForward(forward);
        } else {
            if (session != null) {
                session.invalidate();
            }
            return mapping.findForward(FAILURE);
        }

    }
}
