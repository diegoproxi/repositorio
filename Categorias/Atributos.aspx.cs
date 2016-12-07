using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using com.triario.repositorio.util;
/// <summary>
/// Esta clase se encarga de visualizar la pantalla de connfiguración de atributos de los indicadores
/// </summary>
public partial class Categorias_Atributos : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y vsiualiza la configuración ya realizada
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ConfiguracionAtributosHabDAO cconEscDAO = new ConfiguracionAtributosHabDAO();
            Utils.LlenarComboListaCheck(chklAtributos, cconEscDAO.GetConAtrXCat(int.Parse(Request["idcat"])), "ID", "DSNOMBRE");

            DSRepositorioIndicadores.ConfiguracionAtributosHabVODataTable dt = (DSRepositorioIndicadores.ConfiguracionAtributosHabVODataTable)chklAtributos.DataSource;


            for (int i = 0; i < chklAtributos.Items.Count; i++)
            {


                chklAtributos.Items[i].Selected = dt[i].HABILITADO ;

            }
        }
    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón guardar, el sistema guarda la configuración que el usuario haya hecho
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void btnGuardarCnfEsc_Click(object sender, EventArgs e)
    {
        if (Request["idcat"] == "")
        {
            Response.Write("<script>parent.document.getElementById('divError').style.display='';</script>");
            Response.Write("<script>parent.document.getElementById('msgError').InnerText='" + Utils.GetMensaje("SELECCIONAR_CATEGORIA") + "';</script>");

            Response.Write("<script>parent.cerrarEscenarios();</script>");
            //  msgError.InnerText = Utils.GetMensaje("SELECCIONAR_CATEGORIA");
            return;
        }

        try
        {
            ConfiguracionAtributosDAO conf = new ConfiguracionAtributosDAO();
            conf.DeleteConCategoria(int.Parse(Request["idcat"]));
            for (int i = 0; i < chklAtributos.Items.Count; i++)
            {
                
                    conf.InsertConfAtr(int.Parse(Request["idcat"]),null,null,int.Parse(chklAtributos.Items[i].Value),chklAtributos.Items[i].Selected);
                
            }
            // Response.Write("<script>parent.document.getElementById('msgExito').InnerHtml='" + Utils.GetMensaje("ASIGNAR_ESCENARIOS_CATEGORIA") + "';</script>");
            Response.Write("<script>parent.document.getElementById('divMsg').style.display='';</script>");

            Response.Write("<script>parent.cerrarEscenarios('" + Utils.GetMensaje("ASIGNAR_ATRIBUTOS_CATEGORIA") + "');</script>");
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
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el check de "Todos", el sistema habilitara todos los check
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void chkTodos_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0;i< chklAtributos.Items.Count; i++)
        {
            chklAtributos.Items[i].Selected = chkTodos.Checked;
        }
    }
}