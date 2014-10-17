/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arekar.attendance.struts.actions;

import com.arekar.attendance.struts.json.serializers.HorarioSerializer;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import controller.SQLData.ClasesController;
import controller.SQLData.GrupoController;
import controller.SQLData.MateriaController;
import controller.SQLData.Parser.HorariosParse;
import controller.SQLData.SalonController;
import controller.SQLData.UserController;
import helper.Utility;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Clase;
import model.Horario;
import model.database.DataContract;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Yknx
 */
public class GetDataAction extends Action {

    class JsonOutput<T> {

        public JsonOutput(T output, String message, boolean error) {
            this.output = output;
            this.message = message;
            this.error = error;
        }

        public JsonOutput() {
        }
        private T output;
        private String message;
        private boolean error;

        public T getOutput() {
            return output;
        }

        public void setOutput(T output) {
            this.output = output;
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }

        public boolean isError() {
            return error;
        }

        public void setError(boolean error) {
            this.error = error;
        }
    }

    private final static String SUCCESS = "success";
    private final static String FAILURE = "failure";

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        boolean admin = request.getSession().getAttribute("isAdmin") != null;
        String type = (String) request.getParameter("type");

        Horario test2 = null;

        if (admin && type != null && "POST".equals(request.getMethod())) {
            JsonOutput resultado = new JsonOutput();
            type = type.toLowerCase();
            request.setAttribute("isValid", true);
            switch (type) {
                case "horarios": {
                    HorariosParse horarios = HorariosParse.getInstance();
                    try {
                        resultado.setOutput(horarios.getHorarios());
                        resultado.setError(false);
                        resultado.setMessage("Complete: " + horarios.count() + " horarios gotten.");
                        test2 = horarios.get(1);

                    } catch (Exception e) {
                        resultado.setError(true);
                        resultado.setMessage("Error: " + e.toString());
                    }
                    break;
                }
                case "maestro": {
                    //where id not in (SELECT id_maestro FROM jfperez.clases where (dia =0 and id_Horarios = 1))
                    try {
                        String dia = (String) request.getParameter("dia");
                        dia = Utility.justNumbers(dia);
                        String horario = (String) request.getParameter("horario");
                        horario = Utility.justNumbers(horario);

                        String extra = "where id not in (SELECT id_maestro FROM jfperez.clases where (dia =" + dia + " and id_Horarios = " + horario + "))";
                        List user = UserController.getUsers(DataContract.UsuarioEntry.PROFESORES_TABLE_NAME, extra);
                        resultado.setOutput(user);
                        resultado.setError(false);
                        resultado.setMessage("Complete: " + user.size() + " profesores gotten.");

                    } catch (Exception e) {
                        resultado.setError(true);
                        resultado.setMessage("Error: " + e.toString());
                    }

                    break;
                }
                case "grupos": {
                    //where id not in (SELECT id_maestro FROM jfperez.clases where (dia =0 and id_Horarios = 1))
                    try {
                        String dia = (String) request.getParameter("dia");
                        dia = Utility.justNumbers(dia);
                        String horario = (String) request.getParameter("horario");
                        horario = Utility.justNumbers(horario);

                        String extra = "where id not in (SELECT id_Grupos FROM jfperez.clases where (dia =" + dia + " and id_Horarios = " + horario + "))";
                        List grupos = new GrupoController(GrupoController.TYPE_HELPER, extra).getGrupos();
                        resultado.setOutput(grupos);
                        resultado.setError(false);
                        resultado.setMessage("Complete: " + grupos.size() + " groups gotten.");

                    } catch (Exception e) {
                        resultado.setError(true);
                        resultado.setMessage("Error: " + e.toString());
                    }

                    break;
                }
                //where id not in (SELECT id_Materias FROM jfperez.clases where id_Grupos = 4)
                case "materias": {
                    //where id not in (SELECT id_maestro FROM jfperez.clases where (dia =0 and id_Horarios = 1))
                    try {
                        String grupo = (String) request.getParameter("grupo");
                        grupo = Utility.justNumbers(grupo);
                        String extra = "where id not in (SELECT id_Materias FROM jfperez.clases where id_Grupos = " + grupo + ")";
                        List materias = new MateriaController(extra).getMaterias();
                        resultado.setOutput(materias);
                        resultado.setError(false);
                        resultado.setMessage("Complete: " + materias.size() + " materias gotten.");

                    } catch (Exception e) {
                        resultado.setError(true);
                        resultado.setMessage("Error: " + e.toString());
                    }

                    break;
                }
                case "salones": {
                    //where id not in (SELECT id_maestro FROM jfperez.clases where (dia =0 and id_Horarios = 1))
                    try {
                        String dia = (String) request.getParameter("dia");
                        dia = Utility.justNumbers(dia);
                        String horario = (String) request.getParameter("horario");
                        horario = Utility.justNumbers(horario);
                        String extra = "where id not in (SELECT id_Salones FROM jfperez.clases where (dia =" + dia + " and id_Horarios = " + horario + "))";
                        List salones = new SalonController(extra).getSalones();
                        resultado.setOutput(salones);
                        resultado.setError(false);
                        resultado.setMessage("Complete: " + salones.size() + " salones gotten.");

                    } catch (Exception e) {
                        resultado.setError(true);
                        resultado.setMessage("Error: " + e.toString());
                    }

                    break;
                }
                case "validate": {
                    //where id not in (SELECT id_maestro FROM jfperez.clases where (dia =0 and id_Horarios = 1))
                    try {
                        String maestro = getNumericParameter("maestro", request);
                        String dia = getNumericParameter("dia", request);
                        String salon = getNumericParameter("salon", request);
                        String horario = getNumericParameter("horario", request);
                        String grupo = getNumericParameter("grupo", request);
                        String materia = getNumericParameter("materia", request);
                        Clase toEval = new Clase(maestro, dia, salon, horario, grupo, materia);
                        boolean isValid = ClasesController.isValid(toEval);
                        if (isValid) {
                            resultado.setOutput(null);
                            resultado.setError(false);
                            resultado.setMessage("Esta clase es correcta y puede ser agregada.");
                        }
                        else{
                            resultado.setOutput(null);
                            resultado.setError(true);
                            resultado.setMessage("Error en los datos de la clase, por favor llene de nuevo el formulario.");
                        }

                    } catch (Exception e) {
                        resultado.setError(true);
                        resultado.setMessage("Error: " + e.toString());
                    }

                    break;
                }case "insert": {
                    //where id not in (SELECT id_maestro FROM jfperez.clases where (dia =0 and id_Horarios = 1))
                    try {
                        String maestro = getNumericParameter("maestro", request);
                        String dia = getNumericParameter("dia", request);
                        String salon = getNumericParameter("salon", request);
                        String horario = getNumericParameter("horario", request);
                        String grupo = getNumericParameter("grupo", request);
                        String materia = getNumericParameter("materia", request);
                        Clase toEval = new Clase(maestro, dia, salon, horario, grupo, materia);
                        boolean isValid = ClasesController.insert(toEval);
                        if (isValid) {
                            resultado.setOutput(null);
                            resultado.setError(false);
                            resultado.setMessage("Esta clase fue agregada con éxito.");
                        }
                        else{
                            resultado.setOutput(null);
                            resultado.setError(true);
                            resultado.setMessage("Error en los datos de la clase, por favor llene de nuevo el formulario.");
                        }

                    } catch (Exception e) {
                        resultado.setError(true);
                        resultado.setMessage("Error al agregar: " + e.toString());
                    }

                    break;
                }
                
            }
            GsonBuilder builder = new GsonBuilder();
            builder.serializeNulls();
            builder.setPrettyPrinting();
            builder.registerTypeAdapter(Horario.class, new HorarioSerializer());
            Gson jsonifier = builder.create();
            String test = jsonifier.toJson(test2);
            System.out.println(test);

            request.setAttribute("output", jsonifier.toJson(resultado));
        }

        return mapping.findForward(SUCCESS);

    }

    private String getNumericParameter(String name, HttpServletRequest request) {
        String res = (String) request.getParameter(name);
        if (res == null) {
            return null;
        } else {
            res = Utility.justNumbers(res);
            return res;
        }

    }

}
