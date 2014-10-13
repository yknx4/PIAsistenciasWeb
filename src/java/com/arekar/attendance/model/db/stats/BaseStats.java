/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arekar.attendance.model.db.stats;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.database.DataContract;
import model.database.DataContract.AsistenciaEntry;
import model.database.DataContract.ClasesWebEntry;
import model.database.DatabaseInstance;

/**
 *
 * @author Yknx
 */
public class BaseStats {

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
            + "	"+ ClasesWebEntry.TABLE_NAME +"\n"
            + "where \n"
            + "	" + ClasesWebEntry.COLUMN_ASISTIO + "=1\n"
            + "	and\n"
            + "	" + ClasesWebEntry.COLUMN_DIA + " = ?";
    private final String COUNT_AUSENT = "select \n"
            + "	count(*)\n"
            + "from \n"
            + "	" + ClasesWebEntry.TABLE_NAME + "\n"
            + "where \n"
            + "	" + ClasesWebEntry.COLUMN_ASISTIO + "=0\n"
            + "	and\n"
            + "	" + ClasesWebEntry.COLUMN_DIA + " = ?\n"
            + "	and\n"
            + "	 (ADDTIME(" + ClasesWebEntry.COLUMN_HORA + ",TIME('00:20:00'))) < curtime()";
    private final int dia;

    public BaseStats(int dia) throws SQLException {
        this.db = DatabaseInstance.getInstance();
        this.dia = dia;
        init();
    }

    int faltas;
    int asistencias;

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

    }

}
