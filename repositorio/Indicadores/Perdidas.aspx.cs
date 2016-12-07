using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.triario.repositorio.util;
using DSRepositorioIndicadoresTableAdapters;
using System.Data;
/// <summary>
/// Esta clase se encarga de visualizar la pantalla de cargues de actualización
/// </summary>
public partial class Indicadores_Perdidas : System.Web.UI.Page
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
            LinkButton link = (LinkButton)e.Row.Cells[7].FindControl("ibtnDelete");
            link.Attributes.Add("OnClick", "javascript: if(!confirm('Está seguro que desea eliminar esta perdida?')) return false");
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

            PerdidasDAO es = new PerdidasDAO();
           
            es.EliminarPerdida(id);
            Response.Write("<script>alert('Perdida eliminada exitosamente')</script>");
            gvCargues.DataBind();

        }
    }
    protected void gvCargues_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvCargues.PageIndex = e.NewPageIndex;
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}