using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Esta clase se encarga de visualizar la pantalla de la papelera del sistema
/// </summary>
public partial class Administracion_Papelera : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadGrid1_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {

    }
    protected void RadGrid1_ItemDeleted(object sender, Telerik.Web.UI.GridDeletedEventArgs e)
    {

    }
    /// <summary>
    /// Metodo que se activa en el momento en que el usuario presiona algun botón en el grid para restaurar algun elemento
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Restaurar")
        {
            string[] vec= e.CommandArgument.ToString().Split(new char[]{'@'});
            int id =  int.Parse(vec[0]);
            string tabla = vec[1];
            DSRepositorioIndicadoresTableAdapters.QueriesTableAdapter que = new DSRepositorioIndicadoresTableAdapters.QueriesTableAdapter();
            que.RestaurarDAO(id, tabla);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('El objeto se restauro exitosamente');", true);

            RadGrid1.DataBind();

        }
    }
}