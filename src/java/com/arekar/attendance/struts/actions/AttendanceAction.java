/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arekar.attendance.struts.actions;

import com.arekar.attendance.model.db.stats.BaseStats;
import com.arekar.attendance.util.StrutsUtility;
import controller.SQLData.Parser.HorariosParse;
import helper.Utility;
import static helper.Utility.isDebug;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.GregorianCalendar;
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

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }
    private int dia;
    private HorariosParse horas;
    private int[] horarios;
    String year;
    String month;
    String day;
    private String user;

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        dia = Utility.getDate();
        user = request.getParameter("user");
        int maestro;
        try {
            maestro = (int) request.getSession().getAttribute("UserId");
        } catch (NullPointerException ex) {
            System.out.println("Invalid Session");
            return mapping.findForward("login");
        }

        try {
            horas = HorariosParse.getInstance();
            horarios = horas.getClosest();
            if (isDebug) {
                horarios = Utility.fixedHorarios;
                if (Utility.getDate() > 4) {
                    dia = Utility.fixedDay;
                }
            }
        } catch (SQLException | ParseException ex) {
            Logger.getLogger(AsistenciasForm.class.getName()).log(Level.SEVERE, null, ex);
        }
        String h1 = horas.getHora(horarios[0], true);
        String h2 = horas.getHora(horarios[0] - 1, true);
        request.setAttribute("h1", h1);
        request.setAttribute("h2", h2);
        request.setAttribute("dia", dia);
         boolean admin = request.getSession().getAttribute("isAdmin") != null;
        List<ClasesWeb> clases;
        ClasesWebDBData mDbData;
        if (admin) {
            if(user!=null && !user.isEmpty()){
                System.out.println(user);
                if(user.equals("self")) mDbData = new ClasesWebDBData(maestro);
                else mDbData = new ClasesWebDBData(Integer.parseInt(user));
            }else
            mDbData = new ClasesWebDBData();
            
        } 
        else {
            mDbData = new ClasesWebDBData(maestro);
        }
        Date toCall = StrutsUtility.getPageDate(request);
        mDbData.setDateSpecific(true);
        mDbData.setDateQuery(toCall);
        mDbData.setAllDias(true);
        mDbData.setThisWeek(false);
        mDbData.setAllHorarios(true);
        mDbData.setLimit(true);
        clases = mDbData.getData();
        request.setAttribute("listClases", clases);
        request.setAttribute("fechaBonita", Utility.PrettyDateFormatter.format(toCall));
        request.setAttribute("fechaSQL", Utility.MySQLDateFormatter.format(toCall));

        return mapping.findForward("success");
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

}
