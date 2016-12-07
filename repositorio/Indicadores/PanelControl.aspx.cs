using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
/// <summary>
/// Esta clase se encarga de visualizar la pantalla de panel de control
/// </summary>
public partial class Indicadores_PanelControl : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y carga los idnicadores a visualizar
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["User"] != null || Request["User"] != "")
            {
                UsuariosDAO usuDao = new UsuariosDAO();
                DSRepositorioIndicadores.UsuariosVODataTable usuvo = usuDao.GetUsuarioXNombre(Request["User"]);
                if (usuvo.Rows.Count > 0)
                {
                    Session["user"] = usuvo[0];

                }

            }
        }

    }
}