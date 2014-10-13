/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.arekar.attendance.struts.actions;

import controller.SQLData.Parser.HorariosParse;
import helper.Utility;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Horario;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import view.ui.AsistenciasForm;
import static view.ui.AsistenciasForm.isDebug;

/**
 *
 * @author Yknx
 */
public class AdminDashboardAction extends Action {
    private int dia;
    private HorariosParse horas;
    private int[] horarios;

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        dia = Utility.getDate();
           
        try { 
            horas = HorariosParse.getInstance();
            horarios = horas.getClosest();
            if(isDebug) {
                horarios = Utility.fixedHorarios;
                if(Utility.getDate()>4)
                dia = Utility.fixedDay;
            }
        } catch ( SQLException | ParseException ex) {
            Logger.getLogger(AsistenciasForm.class.getName()).log(Level.SEVERE, null, ex);
        }
            String h1 = horas.getHora(horarios[0],true);
            String h2 = horas.getHora(horarios[0]-1,true);
           request.setAttribute("h1", h1);
           request.setAttribute("h2", h2);
        
        
        return mapping.findForward("success");
    }
    
    public String generateJson(String[] parameters){
        String res="{\n \"hora\": \"?\",\n \"grupo\": \"?\",\n \"materia\": \"?\",\n \"salon\": \"?\",\n \"dia\": \"?\",\n \"horario\": \"?\",\n \"usuario\": \"?\",\n \"flags\": {\n \"asistio\": ?,\n \"justifico\": ?,\n \"late\": ?\n },\n \"horas\": {\n \"asistio\": \"?\",\n \"justifico\": \"?\"\n }\n}";
        for(String p : parameters){
            res = res.replaceFirst("/?", p);
        }
        
        return res;
    }
    
}
