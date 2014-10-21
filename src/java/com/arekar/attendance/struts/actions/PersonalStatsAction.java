/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arekar.attendance.struts.actions;

import controller.SQLData.UserController;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HorarioMaestro;
import model.SQLData.HorarioMaestroDBData;
import model.User;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Yknx
 */
public class PersonalStatsAction extends Action {

    private String user;

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        boolean admin = request.getSession().getAttribute("isAdmin") != null;
        user = request.getParameter("user");
        int maestro;
        try {
            maestro = (int) request.getSession().getAttribute("UserId");
        } catch (NullPointerException ex) {
            System.out.println("Invalid Session");
            return mapping.findForward("login");
        }

        if (admin) {
            if (user != null && !user.isEmpty()) {
                System.out.println(user);
                
                if (!user.equals("self")) {
                    maestro = Integer.parseInt(user);
                    
                }else{
                    request.setAttribute("isSelf", true);
                }
                List<User> mUsers = UserController.getUsers();
            List<User> profUsers = new ArrayList<>(); 
            for(User u:mUsers){
                if (u.hasPermission(User.PROFESSOR)) profUsers.add(u);
            }
            request.setAttribute("listUsers", profUsers);
            }
            User mUser = UserController.getUser(maestro);
            request.setAttribute("nombreMaestro", mUser.getName());
            
                    
            
            
        }

        

        return mapping.findForward("success");
    }
}
