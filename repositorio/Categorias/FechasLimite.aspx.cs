using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using com.triario.repositorio.util;
/// <summary>
/// Esta clase se encarga de visualizar la pantalla de configuración de fechas limite de captura de los indicadores
/// </summary>
public partial class FechasLimite : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y vsiualiza la configuración ya realizada de fechas limite
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        CargarFechas();

        divError.Style["display"] = "none";
        divMsg.Style["display"] = "none";


    }
    /// <summary>
    /// Metodo que carga todos las fechas limite creadas en un grid
    /// </summary>
    private void CargarFechas()
    {
        FechasLimiteConfDAO fecDAO = new FechasLimiteConfDAO();
            if (Request["idcat"] != null && Request["idcat"] != "")
            {
                
                gvFechasL.DataSource = fecDAO.GetFechasLimiteXCat(int.Parse(Request["idcat"]));
                gvFechasL.DataBind();
                return;
            }
       
       if (Request["idind"] != null && Request["idind"] != "")
        {

            gvFechasL.DataSource = fecDAO.GetFechasLimiteXInd(int.Parse(Request["idind"]), int.Parse(Request["idcat"]));
            gvFechasL.DataBind();
            return;
        }
        

           
            gvFechasL.DataSource = fecDAO.GetFechasLimite();
            gvFechasL.DataBind();
        
    }
    /// <summary>
    /// Metodo que se activa en el momento en que el usuario presiona algun botón en el grid
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void gvFechasL_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            int id = int.Parse(e.CommandArgument.ToString());
            if (e.CommandName == "Eliminar")
            {
                FechasLimiteDAO fecDAO = new FechasLimiteDAO();
                fecDAO.DeleteFecha(id);
                divMsg.Style["display"] = "";
                msgExito.InnerText = Utils.GetMensaje("ELIMINAR_FECHA_LIMITE_CATEGORIA");
                CargarFechas();
            }
        }
        catch (Exception exc)
        {
            Utils.RegistrarError(exc);
            divError.Style["display"] = "";
            msgError.InnerText = Utils.GetMensaje("ERROR");
        }
    }
    /// <summary>
    /// Metodo que se activa en el momento en que el grid de fechas limite se esta armando, se usa para asociarle algunas propiedades a la celdas 
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void gvFechasL_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton link = (LinkButton)e.Row.FindControl("eliminar");
            link.Attributes.Add("OnClick", "javascript: if(confirm('Está seguro que desea eliminar esta fecha?')== false) return false");


        }
    }
}