using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;

/// <summary>
///  Esta clase se encarga de visualizar la pantalla de campos, la cual permite que se administren los campos del sistema
/// </summary>
public partial class Administracion_Campos : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y llena el grid con los campos configurados en  el sistema
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        llenargrid();
    }
    /// <summary>
    /// Metodod que se encarga de cargar el grid con todos los campos configurados
    /// </summary>
    public void llenargrid()
    {
        CamposDAO ca = new CamposDAO();
        System.Data.DataTable dtcampos = ca.GetCampos();
        GridView1.DataSource = dtcampos;
        GridView1.DataBind();
    }
    /// <summary>
    /// Metodo que se activa en el momento en que el grid de campos se esta armando, se usa para asociarle algunas propiedades a la celdas 
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton link = (LinkButton)e.Row.Cells[1].FindControl("ibtnDelete");
            link.Attributes.Add("OnClick", "javascript: if(confirm('Está seguro que desea eliminar el campo?')== false) return false");
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

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
            CamposDAO cam = new CamposDAO();
            cam.DeleteCampo(true, id);
            llenargrid();
            Response.Write("<script>alert('Campo Eliminado correctamente')</script>");

        }
    }
}