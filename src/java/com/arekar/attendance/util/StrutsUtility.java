/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.arekar.attendance.util;

import java.util.Date;
import java.util.GregorianCalendar;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Yknx
 */
public class StrutsUtility {
    public static Date getPageDate(HttpServletRequest request){
        String year,month,day;
        GregorianCalendar cale= (GregorianCalendar) GregorianCalendar.getInstance();
        int dYear=-1, dMonth=-1, dDay=-1;
        Date toCall = cale.getTime();
        year = request.getParameter("year");
        month = request.getParameter("month");
        day = request.getParameter("day");
        if (year != null && !year.isEmpty()) {

            dYear = Integer.parseInt(year);
            System.out.println("Año: "+dYear+" -> "+year);
        }
        if (month != null && !month.isEmpty()) {

            dMonth = Integer.parseInt(month);

        }
        if (day != null && !day.isEmpty()) {

            dDay = Integer.parseInt(day);

        }
        if(dYear>1970) cale.set(GregorianCalendar.YEAR, dYear);
        if(dMonth>=0) cale.set(GregorianCalendar.MONTH, dMonth);
        if(dDay>0) cale.set(GregorianCalendar.DATE, dDay);
        
        toCall = cale.getTime();
        return toCall;
    }
}
