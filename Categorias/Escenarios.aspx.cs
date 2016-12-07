using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using com.triario.repositorio.util;
/// <summary>
/// Esta clase se encarga de visualizar la pantalla de configuración de escenarios de los indicadores
/// </summary>
public partial class Categorias_Escenarios : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y vsiualiza la configuración ya realizada de escenarios
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if ((Request["idind"] == null || Request["idind"] == "") && (Request["idcat"] == null || Request["idcat"] == ""))
            {
                ConfiguracioEscenariosHabDAO cconEscDAO = new ConfiguracioEscenariosHabDAO();
                Utils.LlenarComboListaCheck(chklEscenarios, cconEscDAO.GetEscenarios(), "ID", "DSNOMBRE");


            }
            else{
                if (Request["idind"] == "" || Request["idind"] == null)
                {

                    ConfiguracioEscenariosHabDAO cconEscDAO = new ConfiguracioEscenariosHabDAO();
                    Utils.LlenarComboListaCheck(chklEscenarios, cconEscDAO.GetEscenariosCategoria(int.Parse(Request["idcat"])), "ID", "DSNOMBRE");

                }
                else
                {
                    ConfiguracioEscenariosHabDAO cconEscDAO = new ConfiguracioEscenariosHabDAO();
                    Utils.LlenarComboListaCheck(chklEscenarios, cconEscDAO.GetEscenariosIndicador(int.Parse(Request["idind"]), int.Parse(Request["idcat"])), "ID", "DSNOMBRE");
                }
            }

            DSRepositorioIndicadores.ConfiguracionEscenariosHabVODataTable dt = (DSRepositorioIndicadores.ConfiguracionEscenariosHabVODataTable)chklEscenarios.DataSource;

            for (int i = 0; i < chklEscenarios.Items.Count; i++)
            {

                chklEscenarios.Items[i].Selected = !dt[i].HABILITADO;

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
        //if (Request["idcat"] == "")
        //{
        //    Response.Write("<script>parent.document.getElementById('divError').style.display='';</script>");
        //    Response.Write("<script>parent.document.getElementById('msgError').InnerText='" + Utils.GetMensaje("SELECCIONAR_CATEGORIA") + "';</script>");

        //    Response.Write("<script>parent.cerrarEscenarios();</script>");
        //  //  msgError.InnerText = Utils.GetMensaje("SELECCIONAR_CATEGORIA");
        //    return;
        //}

        try
        {
            if ((Request["idind"] == null || Request["idind"] == "") && (Request["idcat"] == null || Request["idcat"] == ""))
            {
                ConfiguracionEscenariosDAO conf = new ConfiguracionEscenariosDAO();
                conf.DeleteEsc();
                for (int i = 0; i < chklEscenarios.Items.Count; i++)
                {

                    conf.InsertConEsc(int.Parse(chklEscenarios.Items[i].Value), null,null, null, !chklEscenarios.Items[i].Selected);


                }
                // Response.Write("<script>parent.document.getElementById('msgExito').InnerHtml='" + Utils.GetMensaje("ASIGNAR_ESCENARIOS_CATEGORIA") + "';</script>");
                Response.Write("<script>parent.document.getElementById('divMsg').style.display='';</script>");

                Response.Write("<script>parent.cerrarEscenarios('" + Utils.GetMensaje("ASIGNAR_ESCENARIOS_CATEGORIA") + "');</script>");
                // divMsg.Style["display"] = "";
                // msgExito.InnerText = Utils.GetMensaje("ASIGNAR_ESCENARIOS_CATEGORIA");
            }
            else
            {
                if (Request["idind"] == "" || Request["idind"] == null)
                {
                    ConfiguracionEscenariosDAO conf = new ConfiguracionEscenariosDAO();
                    conf.DeleteEscCat(int.Parse(Request["idcat"]));
                    for (int i = 0; i < chklEscenarios.Items.Count; i++)
                    {

                        conf.InsertConEscCat(int.Parse(chklEscenarios.Items[i].Value), null, int.Parse(Request["idcat"]), null, !chklEscenarios.Items[i].Selected);


                    }
                    // Response.Write("<script>parent.document.getElementById('msgExito').InnerHtml='" + Utils.GetMensaje("ASIGNAR_ESCENARIOS_CATEGORIA") + "';</script>");
                    Response.Write("<script>parent.document.getElementById('divMsg').style.display='';</script>");

                    Response.Write("<script>parent.cerrarEscenarios('" + Utils.GetMensaje("ASIGNAR_ESCENARIOS_CATEGORIA") + "');</script>");
                    // divMsg.Style["display"] = "";
                    // msgExito.InnerText = Utils.GetMensaje("ASIGNAR_ESCENARIOS_CATEGORIA");
                }
                else
                {
                    ConfiguracionEscenariosDAO conf = new ConfiguracionEscenariosDAO();
                    conf.DeleteEscInd(int.Parse(Request["idind"]));
                    for (int i = 0; i < chklEscenarios.Items.Count; i++)
                    {


                        conf.InsertConEscInd(int.Parse(chklEscenarios.Items[i].Value), int.Parse(Request["idind"]), !chklEscenarios.Items[i].Selected);


                    }
                    // Response.Write("<script>parent.document.getElementById('msgExito').InnerHtml='" + Utils.GetMensaje("ASIGNAR_ESCENARIOS_CATEGORIA") + "';</script>");
                    Response.Write("<script>parent.document.getElementById('divMsg').style.display='';</script>");

                    Response.Write("<script>parent.cerrarEscenarios('" + Utils.GetMensaje("ASIGNAR_ESCENARIOS_INDICADOR") + "');</script>");
                    // divMsg.Style["display"] = "";
                    // msgExito.InnerText = Utils.GetMensaje("ASIGNAR_ESCENARIOS_CATEGORIA");

                }
            }
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
    /// Metodo que se activa en el momento en que el checkboxlist de escenarios se esta armando, se usa para asociarle el botón de calculadora al check 
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void chklEscenarios_DataBound(object sender, EventArgs e)
    {
        CheckBoxList cbl = (CheckBoxList)sender;
        DSRepositorioIndicadores.ConfiguracionEscenariosHabVODataTable dat = (DSRepositorioIndicadores.ConfiguracionEscenariosHabVODataTable)cbl.DataSource;
        for(int i=0;i<dat.Count;i++){
            if(dat[i].DSTIPO!="O")
                cbl.Items[i].Text = cbl.Items[i].Text + "</lable><label><a href='javascript:fnAbrirCalculadora(" + dat[i].ID + ")' title='Calcular'>Calcular</a>";
        }
       
    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el check de "Todos", el sistema habilitara todos los check
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void chkTodos_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i < chklEscenarios.Items.Count; i++)
        {
            chklEscenarios.Items[i].Selected = chkTodos.Checked;
        }
    }
    protected void chklEscenarios_DataBinding(object sender, EventArgs e)
    {

    }
}