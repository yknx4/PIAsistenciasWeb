/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.arekar.attendance.model.db.views;

/**
 *
 * @author Yknx
 */
public class HorarioMaestroView {

    public HorarioMaestroView(int dia, int horario, String materia, String salon, boolean empty) {
        this.dia = dia;
        this.horario = horario;
        this.materia = materia;
        this.salon = salon;
        this.empty = empty;
    }

    public boolean isEmpty() {
        return empty;
    }

    public void setEmpty(boolean empty) {
        this.empty = empty;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public int getHorario() {
        return horario;
    }

    public void setHorario(int horario) {
        this.horario = horario;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public String getSalon() {
        return salon;
    }

    public void setSalon(String salon) {
        this.salon = salon;
    }
    int dia;
    int horario;
    String materia;
    String salon;
    boolean empty;
}
