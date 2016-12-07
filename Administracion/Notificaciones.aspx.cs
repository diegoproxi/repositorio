using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
/// <summary>
///  Esta clase se encarga de visualizar la pantalla de configuración de alertas, la cual permite crear y modificar las alertas del sistema
/// </summary>
public partial class Administracion_Alertas_confi : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y llena el grid con las alertas creadas
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
       
        llenargrid();
    }
    /// <summary>
    /// Metodod que se encarga de cargar el grid con todas las alertas configurados
    /// </summary>
    public void llenargrid()
    {
        Alertas_configuracionDAO al = new Alertas_configuracionDAO();
        System.Data.DataTable dtal = al.GetAlertas();
        GridView1.DataSource = dtal;
        GridView1.DataBind();           
    }
    /// <summary>
    /// Metodo que se activa en el momento en que el usuario presiona algun botón en el grid
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id = int.Parse(e.CommandArgument.ToString());
        if (e.CommandName.Equals("eliminar"))
        {
            Alertas_configuracionDAO al = new Alertas_configuracionDAO();
            al.DeleteAlerta(true, id);
            Response.Write("<script>alert('Campo Eliminado correctamente')</script>");
            llenargrid();

        }
    }
    /// <summary>
    /// Metodo que se activa en el momento en que el grid de escenarios se esta armando, se usa para asociarle algunas propiedades a la celdas 
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton link = (LinkButton)e.Row.Cells[3].FindControl("ibtnDelete");
            link.Attributes.Add("OnClick", "javascript: if(confirm('Está seguro que desea eliminar la notificación?')== false) return false");
        }
    }
}