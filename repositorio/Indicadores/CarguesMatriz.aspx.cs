using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.triario.repositorio.util;
using DSRepositorioIndicadoresTableAdapters;
/// <summary>
/// Esta clase se encarga de visualizar la pantalla de cargues de actualización
/// </summary>
public partial class Indicadores_CarguesMatriz : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    /// <summary>
    /// Metodo que se ejecuta al momento cargar el grid, el sistema indica el usuario que esta logueado
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void SqlDataSourceCargues_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters[0].Value = Utils.GetUsuario(Session,Response).ID+"";
    }
    /// <summary>
    /// Metodo que se activa en el momento en que el grid de cargues se esta armando, se usa para asociarle algunas propiedades a la celdas 
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void gvCargues_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton link = (LinkButton)e.Row.Cells[3].FindControl("ibtnDelete");
            link.Attributes.Add("OnClick", "javascript: if(!confirm('Está seguro que desea eliminar esta actualización?')||!confirm('Tenga en cuenta que se retrocedan los cambios que haya realizado.Está seguro que desea eliminar esta actualización?')) return false");
        }
    }
    /// <summary>
    /// Metodo que se activa en el momento en que el usuario presiona algun botón en el grid
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void gvCargues_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id = int.Parse(e.CommandArgument.ToString());
        if (e.CommandName.Equals("eliminar"))
        {

            ActualizacionDAO es = new ActualizacionDAO();
           
            es.DeleteActualizacion(id);
            Response.Write("<script>alert('Actualización eliminada exitosamente')</script>");
            gvCargues.DataBind();

        }
    }
}