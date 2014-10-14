/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.arekar.attendance.struts.actions;

import com.arekar.attendance.model.db.stats.BaseStats;
import controller.SQLData.Parser.HorariosParse;
import helper.Utility;
import static helper.Utility.isDebug;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ClasesWeb;
import model.Horario;
import model.SQLData.ClasesWebDBData;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import view.ui.AsistenciasForm;

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
           request.setAttribute("dia", dia);
           int maestro = (int) request.getSession().getAttribute("UserId");
           
           List<ClasesWeb> antes;
           List<ClasesWeb> ahora;
           
           ClasesWebDBData mDbData = new ClasesWebDBData();
           mDbData.setThisWeek(true);
           mDbData.setDia(dia);
           mDbData.setHorario(horarios[0]-1);
           antes = mDbData.getData();
           mDbData.setHorario(horarios[0]);
           ahora = mDbData.getData();
           request.setAttribute("listClasesAntes", antes);
           request.setAttribute("listClasesAhora", ahora);
           
           BaseStats mStats = new BaseStats(dia); 
           request.setAttribute("faltas", mStats.getFaltas());
           request.setAttribute("asistencias", mStats.getAsistencias());
           
           
        
        
        return mapping.findForward("success");
    }
    
    
    
}
