/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.arekar.attendance.struts.actions;

import com.arekar.attendance.model.db.stats.BaseStats;
import com.arekar.attendance.util.StrutsUtility;
import helper.Utility;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Yknx
 */
public class StatsAction extends Action{

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Date toCall = StrutsUtility.getPageDate(request);
        SimpleDateFormat monthDateFormatter = new SimpleDateFormat("MM / yyyy");
        request.setAttribute("fechaBonita", monthDateFormatter.format(toCall));
        request.setAttribute("fechaSQL", Utility.MySQLDateFormatter.format(toCall));
        BaseStats stats = new BaseStats(toCall); 
        request.setAttribute("maestrosMas", stats.getProfesoresMas());
        request.setAttribute("maestrosMenos", stats.getProfesoresMenos());
        request.setAttribute("gruposMas", stats.getGrupoMas());
        request.setAttribute("gruposMenos", stats.getGrupoMenos());
        request.setAttribute("diasMas", stats.getDiaMas());
        request.setAttribute("diasMenos", stats.getDiaMenos());
        request.setAttribute("fechasMas", stats.getFechaMas());
        request.setAttribute("fechasMenos", stats.getFechaMenos());
        request.setAttribute("horariosMas", stats.getHorariomas());
        request.setAttribute("horariosMenos", stats.getHorariomenos());
        request.setAttribute("clasesMas", stats.getClasesmas());
        request.setAttribute("clasesMenos", stats.getClasesmenos());
        request.setAttribute("datosTabla", stats.getDatosJson());
        //request.setAttribute("maestrosImpuntuales", stats.getProfesoresInpuntual());
        
        
        return mapping.findForward("success");
    }
    
}
