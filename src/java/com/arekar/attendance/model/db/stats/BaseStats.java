/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arekar.attendance.model.db.stats;

import helper.Utility;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ClasesWeb;
import model.User;
import model.database.DataContract;
import model.database.DataContract.AsistenciaEntry;
import model.database.DataContract.ClasesWebEntry;
import model.database.DatabaseInstance;

/**
 *
 * @author Yknx
 */
public class BaseStats {

    private final int anio;
    private final int mes;
    private String CNAS = "cnas";

    public int getFaltas() {
        return faltas;
    }

    public int getAsistencias() {
        return asistencias;
    }

    Connection db;
    private final String COUNT_ATTEND = "select \n"
            + "	count(*)\n"
            + "from \n"
            + "	" + ClasesWebEntry.TABLE_NAME + "2\n"
            + "where \n"
            + "	" + ClasesWebEntry.COLUMN_ASISTIO + "=1\n"
            + "	and\n"
            + "	" + ClasesWebEntry.COLUMN_DIA + " = ?";
    private final String COUNT_AUSENT = "select \n"
            + "	count(*)\n"
            + "from \n"
            + "	" + ClasesWebEntry.TABLE_NAME + "2\n"
            + "where \n"
            + "	" + ClasesWebEntry.COLUMN_ASISTIO + "=0\n"
            + "	and\n"
            + "	" + ClasesWebEntry.COLUMN_DIA + " = ?\n"
            + "	and\n"
            + "	 (ADDTIME(" + ClasesWebEntry.COLUMN_HORA + ",TIME('00:20:00'))) < curtime()";
    private final int dia;

    public BaseStats(int dia, int anio, int mes) throws SQLException {
        this.db = DatabaseInstance.getInstance();
        this.dia = dia ;
        this.anio = anio;
        this.mes = mes+1;
        init();
    }

    public BaseStats(int dia, int mes) throws SQLException {
        this(dia, Calendar.getInstance().get(Calendar.YEAR), mes);
    }

    public BaseStats(int dia) throws SQLException {
        this(dia, Calendar.getInstance().get(Calendar.MONTH));
    }

    public BaseStats() throws SQLException {
        this(Calendar.getInstance().get(Calendar.DAY_OF_MONTH));
    }

    public BaseStats(Date date) throws SQLException {
        this.db = DatabaseInstance.getInstance();
        Calendar g = Calendar.getInstance();
        g.setTime(date);
        anio = g.get(Calendar.YEAR);
        mes = g.get(Calendar.MONTH)+1;
        dia = g.get(Calendar.DAY_OF_MONTH) ;
        init();
    }

    String basicQuery(String cols, boolean asistio, String group) {
        String base = "SELECT count(asistio) as cnas, " + cols + " FROM jfperez.listaasistencias where asistio = " + (asistio ? 1 : 0) + " AND year(fecha)= " + anio + " AND month(fecha) = " + mes + " group by " + group + " order by cnas DESC; ";
        return base;
    }

    String getGlobalCountQuery(String ndia) {
        return "SELECT (SELECT count(*) FROM jfperez.listaasistencias where dayofmonth(fecha) = " + ndia + " AND   asistio =1 AND year(fecha)= " + anio + " AND month(fecha) = " + mes + " ) as Asistencias, (SELECT count(*) FROM jfperez.listaasistencias where dayofmonth(fecha) = " + ndia + " AND   asistio =1 AND year(fecha)= " + anio + " AND month(fecha)  = " + mes + " AND min >= ((20*60)+1)) as Retardos,(SELECT count(*) FROM jfperez.listaasistencias where dayofmonth(fecha) = " + ndia + " AND   asistio = 0 AND year(fecha)= " + anio + " AND month(fecha) = " + mes + ") as Faltas,(SELECT count(*) FROM jfperez.listaasistencias where dayofmonth(fecha) = " + ndia + " AND   asistio =0 AND justifico = 1 AND year(fecha)= " + anio + " AND month(fecha) = " + mes + " ) as Justif";
    }

    ResultSet getDataDiaFromDB(int ndia) {
        try {
            String query = getGlobalCountQuery(ndia + "");
            return db.createStatement().executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    String getDataForDia(int ndia) throws SQLException {
        /*{
         day: '2014-10-1',
         attends: 250,
         late: 24,
         ausent: 6,
         justifications: 4
         }*/
        ResultSet data = getDataDiaFromDB(ndia);
        String result = "{";
        result += "\"day\": \"" + anio + "-" + mes + "-" + (ndia+1) + "\",";
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
        // Create a calendar object and set year and month
        Calendar mycal = new GregorianCalendar(anio, mes, 2);

// Get the number of days in that month
        int daysInMonth = mycal.getActualMaximum(Calendar.DAY_OF_MONTH);
        for (int i = 0; i < daysInMonth; i++) {
            try {
                data.add(getDataForDia(i  + 1));
            } catch (SQLException ex) {
                Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        json+=Utility.arrayToCSV(data.toArray(new String[data.size()]));
        json+="]}";
        return json;
    }

    String basicQuery;

    public List<User> getProfesoresMas() {
        return profesoresMas;
    }

    public void setProfesoresMas(List<User> profesoresMas) {
        this.profesoresMas = profesoresMas;
    }

    public List<User> getProfesoresMenos() {
        return profesoresMenos;
    }

    public void setProfesoresMenos(List<User> profesoresMenos) {
        this.profesoresMenos = profesoresMenos;
    }

    public List<String> getGrupoMas() {
        return grupoMas;
    }

    public void setGrupoMas(List<String> grupoMas) {
        this.grupoMas = grupoMas;
    }

    public List<String> getGrupoMenos() {
        return grupoMenos;
    }

    public void setGrupoMenos(List<String> grupoMenos) {
        this.grupoMenos = grupoMenos;
    }

    public List<Integer> getDiaMas() {
        return diaMas;
    }

    public void setDiaMas(List<Integer> diaMas) {
        this.diaMas = diaMas;
    }

    public List<Integer> getDiaMenos() {
        return diaMenos;
    }

    public void setDiaMenos(List<Integer> diaMenos) {
        this.diaMenos = diaMenos;
    }

    public List<String> getFechaMas() {
        return fechaMas;
    }

    public void setFechaMas(List<String> fechaMas) {
        this.fechaMas = fechaMas;
    }

    public List<String> getFechaMenos() {
        return fechaMenos;
    }

    public void setFechaMenos(List<String> fechaMenos) {
        this.fechaMenos = fechaMenos;
    }

    public List<String> getHorariomas() {
        return horariomas;
    }

    public void setHorariomas(List<String> horariomas) {
        this.horariomas = horariomas;
    }

    public List<String> getHorariomenos() {
        return horariomenos;
    }

    public void setHorariomenos(List<String> horariomenos) {
        this.horariomenos = horariomenos;
    }

    public List<ClasesWeb> getClasesmas() {
        return clasesmas;
    }

    public void setClasesmas(List<ClasesWeb> clasesmas) {
        this.clasesmas = clasesmas;
    }

    public List<ClasesWeb> getClasesmenos() {
        return clasesmenos;
    }

    public void setClasesmenos(List<ClasesWeb> clasesmenos) {
        this.clasesmenos = clasesmenos;
    }

    public List<User> getProfesoresInpuntual() {
        return profesoresInpuntual;
    }

    public void setProfesoresInpuntual(List<User> profesoresInpuntual) {
        this.profesoresInpuntual = profesoresInpuntual;
    }

    public interface GetFromResultInterface {

        public abstract <T> T getData(ResultSet raw);
    }

    ResultSet getData(String cols, boolean asistio, String goup) {
        try {
            String basicQuery = basicQuery(cols, asistio, goup);
            System.out.println("Chance y jala: " + basicQuery);
            return db.createStatement().executeQuery(basicQuery);
        } catch (SQLException ex) {
            Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    static final String USER_COLS = "id_maestro, maestro";
    static final String USER_GROUP = "id_maestro";
    static final String GRUPO_COLS = "id_grupo, grupo";
    static final String GRUPO_GROUP = "id_grupo";
    static final String DIA_COLS = "dia";
    static final String DIA_GROUP = "dia";
    static final String FECHA_COLS = "DATE(fecha) as fechaf";
    static final String FECHA_GROUP = "fechaf";
    static final String HORARIO_COLS = "id_horario,hora_clase";
    static final String HORARIO_GROUP = "id_horario";
    static final String CLASE_COLS = "clase,maestro,grupo";
    static final String CLASE_GROUP = "clase";

    <T> List<T> getFullData(String cols, boolean asistio, String goup, GetFromResultInterface method) {
        ArrayList<T> data = new ArrayList<>();
        try {

            ResultSet raw = getData(cols, asistio, goup);
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

    class GetProfesor implements GetFromResultInterface {

        @Override
        public User getData(ResultSet raw) {
            try {
                User mUser = new User();
                mUser.setId(raw.getInt(USER_GROUP));
                mUser.setName(raw.getString("maestro"));
                return mUser;
            } catch (SQLException ex) {
                Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null;
        }

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

    class GetDia implements GetFromResultInterface {

        @Override
        public Integer getData(ResultSet raw) {
            try {
                return raw.getInt("dia");
            } catch (SQLException ex) {
                Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null;
        }

    }

    class GetHorario implements GetFromResultInterface {

        @Override
        public String getData(ResultSet raw) {
            try {
                String[] res = new String[2];
                res[0] = String.valueOf(raw.getInt("id_horario"));
                res[1] = raw.getString("hora_clase");
                return res[0] + " - " + res[1];
            } catch (SQLException ex) {
                Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null;
        }

    }

    class GetFecha implements GetFromResultInterface {

        @Override
        public String getData(ResultSet raw) {
            try {
                Date m = Utility.MySQLDateFormatter.parse(raw.getString("fechaf"));
                return Utility.PrettyDateFormatter.format(m);
            } catch (SQLException ex) {
                Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ParseException ex) {
                Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null;
        }

    }

    class GetClase implements GetFromResultInterface {

        @Override
        public ClasesWeb getData(ResultSet raw) {
            try {
                ClasesWeb m = new ClasesWeb();
                m.setId(raw.getInt("clase"));
                m.setMaestro(raw.getString("maestro"));
                m.setGrupo(raw.getString("grupo"));
                return m;
            } catch (SQLException ex) {
                Logger.getLogger(BaseStats.class.getName()).log(Level.SEVERE, null, ex);
            }
            return null;
        }

    }

    int faltas;
    int asistencias;
    private List<User> profesoresMas;
    private List<User> profesoresMenos;
    private List<String> grupoMas;
    private List<String> grupoMenos;
    private List<Integer> diaMas;
    private List<Integer> diaMenos;
    private List<String> fechaMas;
    private List<String> fechaMenos;
    private List<String> horariomas;
    private List<String> horariomenos;
    private List<ClasesWeb> clasesmas;
    private List<ClasesWeb> clasesmenos;
    private List<User> profesoresInpuntual;
    String datosJson;

    public String getDatosJson() {
        return datosJson;
    }

    public void setDatosJson(String datosJson) {
        this.datosJson = datosJson;
    }

    private void init() throws SQLException {
        try (PreparedStatement asis = db.prepareStatement(COUNT_ATTEND)) {

            asis.setInt(1, dia);
            System.out.println(asis);
            ResultSet as = asis.executeQuery();
            as.first();
            asistencias = as.getInt(1);
        }
        try (PreparedStatement fal = db.prepareStatement(COUNT_AUSENT)) {

            fal.setInt(1, dia);
            System.out.println(fal);
            ResultSet as = fal.executeQuery();
            as.first();
            faltas = as.getInt(1);
        }
        profesoresMas = getFullData(USER_COLS, true, USER_GROUP, new GetProfesor());
        profesoresMenos = getFullData(USER_COLS, false, USER_GROUP, new GetProfesor());
        grupoMas = getFullData(GRUPO_COLS, true, GRUPO_GROUP, new GetGrupo());
        grupoMenos = getFullData(GRUPO_COLS, false, GRUPO_GROUP, new GetGrupo());
        diaMas = getFullData(DIA_COLS, true, DIA_GROUP, new GetDia());
        diaMenos = getFullData(DIA_COLS, false, DIA_GROUP, new GetDia());
        fechaMas = getFullData(FECHA_COLS, true, FECHA_GROUP, new GetFecha());
        fechaMenos = getFullData(FECHA_COLS, false, FECHA_GROUP, new GetFecha());
        horariomas = getFullData(HORARIO_COLS, true, HORARIO_GROUP, new GetHorario());
        horariomenos = getFullData(HORARIO_COLS, false, HORARIO_GROUP, new GetHorario());
        clasesmas = getFullData(CLASE_COLS, true, CLASE_GROUP, new GetClase());
        System.out.println("Test: "+getGeneralData() );
        datosJson = getGeneralData();

    }

}
