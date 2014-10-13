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
public class AttendanceAction extends Action {
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
           boolean admin = request.getSession().getAttribute("isAdmin") != null;  

           List<ClasesWeb> clases;
           ClasesWebDBData mDbData;
           if(admin) mDbData = new ClasesWebDBData();
           else mDbData = new ClasesWebDBData(maestro);
           mDbData.setAllDias(true);
           mDbData.setAllHorarios(true);
           mDbData.setLimit(true);
           clases = mDbData.getData();
           request.setAttribute("listClases", clases);
           
           
           

           
           
        
        
        return mapping.findForward("success");
    }
    
    
    
}