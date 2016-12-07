using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using com.triario.repositorio.util;
/// <summary>
/// Esta clase se encarga de visualizar la pantalla de configuración de permisos sobre los atributos de los indicadores
/// </summary>
public partial class Permisos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón guardar, el sistema guarda la configuración que el usuario haya hecho
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        //if (Request["idcat"] == "")
        //{
        //    Response.Write("<script>parent.document.getElementById('divError').style.display='';</script>");
        //    Response.Write("<script>parent.document.getElementById('msgError').InnerText='" + Utils.GetMensaje("SELECCIONAR_CATEGORIA") + "';</script>");

        //    Response.Write("<script>parent.cerrarEscenarios();</script>");
        //    //  msgError.InnerText = Utils.GetMensaje("SELECCIONAR_CATEGORIA");
        //    return;
        //}

        try
        {
            if ((Request["idind"] == null || Request["idind"] == "") && (Request["idcat"] == null || Request["idcat"] == ""))
            {
                PermisosAtributosDAO perDAO = new PermisosAtributosDAO();
                perDAO.DeletePermisos();
                DSRepositorioIndicadoresTableAdapters.PermisosHabDAO perHDAO = new DSRepositorioIndicadoresTableAdapters.PermisosHabDAO();
                DSRepositorioIndicadores.PermisosHabVODataTable perVO = perHDAO.GetPermisos();

                for (int i = 0; i < perVO.Count; i++)
                {

                    perDAO.InsertPermisosAtr(null, null, Request["permiso" + perVO[i].ID], perVO[i].ID);

                }
                // Response.Write("<script>parent.document.getElementById('msgExito').InnerHtml='" + Utils.GetMensaje("ASIGNAR_ESCENARIOS_CATEGORIA") + "';</script>");
                Response.Write("<script>parent.document.getElementById('divMsg').style.display='';</script>");

                Response.Write("<script>parent.cerrarEscenarios('" + Utils.GetMensaje("PERMISOS_CATEGORIA") + "');</script>");

            }
            else
            {
                if (Request["idind"] == "" || Request["idind"] == null)
                {
                    PermisosAtributosDAO perDAO = new PermisosAtributosDAO();
                    perDAO.DeletePermXCat(int.Parse(Request["idcat"]));
                    DSRepositorioIndicadoresTableAdapters.PermisosHabDAO perHDAO = new DSRepositorioIndicadoresTableAdapters.PermisosHabDAO();
                    DSRepositorioIndicadores.PermisosHabVODataTable perVO = perHDAO.GetPermisosXCat(int.Parse(Request["idcat"]));

                    for (int i = 0; i < perVO.Count; i++)
                    {

                        perDAO.InsertPermisosAtr(null, int.Parse(Request["idcat"]), Request["permiso" + perVO[i].ID], perVO[i].ID);

                    }
                    // Response.Write("<script>parent.document.getElementById('msgExito').InnerHtml='" + Utils.GetMensaje("ASIGNAR_ESCENARIOS_CATEGORIA") + "';</script>");
                    Response.Write("<script>parent.document.getElementById('divMsg').style.display='';</script>");

                    Response.Write("<script>parent.cerrarEscenarios('" + Utils.GetMensaje("PERMISOS_CATEGORIA") + "');</script>");
                }
                else
                {

                    PermisosAtributosDAO perDAO = new PermisosAtributosDAO();
                    perDAO.DetelePermXIndicador(int.Parse(Request["idind"]));
                    DSRepositorioIndicadoresTableAdapters.PermisosHabDAO perHDAO = new DSRepositorioIndicadoresTableAdapters.PermisosHabDAO();
                    DSRepositorioIndicadores.PermisosHabVODataTable perVO = perHDAO.GetPermisosXInd(int.Parse(Request["idind"]), int.Parse(Request["idcat"]));

                    for (int i = 0; i < perVO.Count; i++)
                    {

                        perDAO.InsertPermisosAtr(int.Parse(Request["idind"]), null, Request["permiso" + perVO[i].ID], perVO[i].ID);

                    }
                    // Response.Write("<script>parent.document.getElementById('msgExito').InnerHtml='" + Utils.GetMensaje("ASIGNAR_ESCENARIOS_CATEGORIA") + "';</script>");
                    Response.Write("<script>parent.document.getElementById('divMsg').style.display='';</script>");

                    Response.Write("<script>parent.cerrarEscenarios('" + Utils.GetMensaje("PERMISOS_CATEGORIA") + "');</script>");
                }
            }
            // divMsg.Style["display"] = "";
            // msgExito.InnerText = Utils.GetMensaje("ASIGNAR_ESCENARIOS_CATEGORIA");
        }
        catch (Exception exc)
        {
            Utils.RegistrarError(exc);
            Response.Write("<script>parent.document.getElementById('divError').style.display='';</script>");
            Response.Write("<script>parent.document.getElementById('msgError').InnerText='" + Utils.GetMensaje("ERROR") + "';</script>");
            Response.Write("<script>parent.cerrarEscenarios();</script>");
            // divError.Style["display"] = "";
            // msgError.InnerText = Utils.GetMensaje("ERROR");
        }
    }
}