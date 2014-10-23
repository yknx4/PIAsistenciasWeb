/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arekar.attendance.model.db.stats;

import helper.Utility;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.database.DatabaseInstance;

/**
 *
 * @author Yknx
 */
public class PersonalStats {

    private final int anio;
    private final int mes;
    private final String CNAS = "cnas";
    private int maestro;

    Connection db;

    private final int dia;

    public PersonalStats(int dia, int anio, int mes, int maestro) throws SQLException {
        this.db = DatabaseInstance.getInstance();
        this.dia = dia;
        this.anio = anio;
        this.mes = mes + 1;
        this.maestro = maestro;
        init();
    }

    public PersonalStats(int dia, int mes, int maestro) throws SQLException {
        this(dia, Calendar.getInstance().get(Calendar.YEAR), mes, maestro);
    }

    public PersonalStats(int dia, int maestro) throws SQLException {
        this(dia, Calendar.getInstance().get(Calendar.MONTH), maestro);
    }

    public PersonalStats(int maestro) throws SQLException {
        this(Calendar.getInstance().get(Calendar.DAY_OF_MONTH), maestro);
    }

    public PersonalStats(Date date, int maestro) throws SQLException {
        this.db = DatabaseInstance.getInstance();
        Calendar g = Calendar.getInstance();
        g.setTime(date);
        anio = g.get(Calendar.YEAR);
        mes = g.get(Calendar.MONTH) + 1;
        dia = g.get(Calendar.DAY_OF_MONTH);
        this.maestro = maestro;
        init();
    }

    String basicQuery(String cols, boolean asistio, String extra) {
        String base = "SELECT count(asistio) as cnas, " + cols + " FROM jfperez.listaasistencias where asistio = " + (asistio ? 1 : 0) + " AND year(fecha)= " + anio + "  AND id_maestro = " + maestro + " " + extra + "  order by cnas DESC; ";
        return base;
    }

    String getGlobalCountQuery(String nmonth) {
        return "SELECT (SELECT count(*) FROM jfperez.listaasistencias where  asistio =1 AND year(fecha)= " + anio + " AND month(fecha) = " + nmonth + " AND id_maestro = " + maestro + " ) as Asistencias, (SELECT count(*) FROM jfperez.listaasistencias where  asistio =1 AND year(fecha)= " + anio + " AND month(fecha)  = " + nmonth + " AND min >= ((20*60)+1) AND id_maestro = " + maestro + " ) as Retardos,(SELECT count(*) FROM jfperez.listaasistencias where    asistio = 0 AND year(fecha)= " + anio + " AND month(fecha) = " + nmonth + "  AND id_maestro = " + maestro + ") as Faltas,(SELECT count(*) FROM jfperez.listaasistencias where asistio =0 AND justifico = 1 AND year(fecha)= " + anio + " AND month(fecha) = " + nmonth + " AND id_maestro = " + maestro + ") as Justif";
    }

    ResultSet getDataMonthFromDB(int nomth) {
        try {
            String query = getGlobalCountQuery(nomth + "");
            return db.createStatement().executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    String getDataForMonth(int nmonth) throws SQLException {
        /*{
         day: '2014-10-1',
         attends: 250,
         late: 24,
         ausent: 6,
         justifications: 4
         }*/
        ResultSet data = getDataMonthFromDB(nmonth);
        String result = "{";
        result += "\"day\": \"" + anio + "-" + nmonth + "\",";
        if (data.first()) {

            result += "\"attends\": " + data.getInt("Asistencias") + "" + ",";
            result += "\"late\": " + data.getInt("Retardos") + "" + ",";
            result += "\"ausent\": " + data.getInt("Faltas") + "" + ",";
            result += "\"justifications\": " + data.getInt("Justif") + "" + "";

        } else {
            result += "\"attends\": " + 0 + "" + ",";
            result += "\"late\": " + 0 + "" + ",";
            result += "\"ausent\": " + 0 + "" + ",";
            result += "\"justifications\": " + 0 + "" + "";
        }
        result += "}";
        return result;
    }

    String getGeneralData() {
        ArrayList<String> data = new ArrayList<>();
        String json = "{\"datos\": [";

        for (int i = 0; i < 12; i++) {
            try {
                data.add(getDataForMonth(i + 1));
            } catch (SQLException ex) {
                Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        json += Utility.arrayToCSV(data.toArray(new String[data.size()]));
        json += "]}";
        return json;
    }

    private String basicQuery;

    public String getBasicQuery() {
        return basicQuery;
    }

    public void setBasicQuery(String basicQuery) {
        this.basicQuery = basicQuery;
    }

    public int getMaestro() {
        return maestro;
    }

    public void setMaestro(int maestro) {
        this.maestro = maestro;
    }

    public int getAsistencias() {
        return asistencias;
    }

    public void setAsistencias(int asistencias) {
        this.asistencias = asistencias;
    }

    public int getFaltas() {
        return faltas;
    }

    public void setFaltas(int faltas) {
        this.faltas = faltas;
    }

    public int getJustificaciones() {
        return justificaciones;
    }

    public void setJustificaciones(int justificaciones) {
        this.justificaciones = justificaciones;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public String getMes_ausente() {
        return mes_ausente;
    }

    public void setMes_ausente(String mes_ausente) {
        this.mes_ausente = mes_ausente;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public int getRetardos() {
        return retardos;
    }

    public void setRetardos(int retardos) {
        this.retardos = retardos;
    }

    public int getMayor_retardo() {
        return mayor_retardo;
    }

    public void setMayor_retardo(int mayor_retardo) {
        this.mayor_retardo = mayor_retardo;
    }

    public interface GetFromResultInterface {

        public abstract <T> T getData(ResultSet raw);
    }

    ResultSet getData(String cols, boolean asistio, String extra) {
        try {
            String basicquerystring = basicQuery(cols, asistio, extra);
            System.out.println("Chance y jala: " + basicquerystring);
            return db.createStatement().executeQuery(basicquerystring);
        } catch (SQLException ex) {
            Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    static final String ATT_COLS = "id_maestro, maestro";
    static final String RET_COLS = ATT_COLS;
    static final String AUS_COLS = RET_COLS;
    static final String JUS_COLS = AUS_COLS;
    static final String JUS_EXTRA = "AND justifico = 1";
    static final String RET_EXTRA = "AND (min > (20*60))";
    static final String EMPTY_EXTRA = "";

    <T> List<T> getFullData(String cols, boolean asistio, String extra, GetFromResultInterface method) {
        ArrayList<T> data = new ArrayList<>();
        try {

            ResultSet raw = getData(cols, asistio, extra);
            int max = 0;
            if (raw == null) {
                System.err.println("SOMETHING WENT REALLY WRONG! " + cols);
                return data;
            }
            while (raw.next()) {
                T mUser;
                if (raw.isFirst()) {
                    max = raw.getInt(CNAS);
                    mUser = method.getData(raw);
                } else {
                    int tmp = raw.getInt(CNAS);
                    if (tmp == max) {
                        mUser = method.getData(raw);
                    } else {
                        break;
                    }
                }
                if (mUser != null) {

                    data.add(mUser);
                } else {
                    System.err.println("Something went wrong!");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }

    <T> T getFirstData(String cols, boolean asistio, String extra, GetFromResultInterface method) {
        T mUser = null;
        try {
            ResultSet raw = getData(cols, asistio, extra);
            int max = 0;
            if (raw == null) {
                System.err.println("SOMETHING WENT REALLY WRONG! " + cols);
                return null;
            }
            if (raw.first()) {
                mUser = method.getData(raw);
            } else {
                System.err.println("Something went wrong!");
            }

        } catch (SQLException ex) {
            Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mUser;
    }

    class GetGrupo implements GetFromResultInterface {

        @Override
        public String getData(ResultSet raw) {
            try {
                return raw.getString("grupo");
            } catch (SQLException ex) {
                Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null;
        }

    }

    class GetInt implements GetFromResultInterface {

        public GetInt(String campo) {
            this.campo = campo;
        }

        final String campo;

        @Override
        public Integer getData(ResultSet raw) {
            try {
                return raw.getInt(campo);
            } catch (SQLException ex) {
                Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null;
        }

    }

    class GetString implements GetFromResultInterface {

        public GetString(String campo) {
            this.campo = campo;
        }

        final String campo;

        @Override
        public String getData(ResultSet raw) {
            try {
                return raw.getString(campo);
            } catch (SQLException ex) {
                Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null;
        }

    }

    private int asistencias;
    private int faltas;
    private int justificaciones;
    private String materia;
    private String mes_ausente;
    private String grupo;
    private int retardos;
    private int mayor_retardo;
    String datosJson;

    private void init() throws SQLException {
        asistencias = getFirstData(ATT_COLS, true, EMPTY_EXTRA, new GetInt(CNAS));
        retardos = getFirstData(RET_COLS, true, RET_EXTRA, new GetInt(CNAS));
        faltas = getFirstData(AUS_COLS, false, EMPTY_EXTRA, new GetInt(CNAS));
        justificaciones = getFirstData(JUS_COLS, false, JUS_EXTRA, new GetInt(CNAS));

        System.out.println("Test: " + getGeneralData());
        datosJson = getGeneralData();

    }

    public String getDatosJson() {
        return datosJson;
    }

    public void setDatosJson(String datosJson) {
        this.datosJson = datosJson;
    }

}
