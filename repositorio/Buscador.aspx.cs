using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using com.triario.repositorio.util;
/// <summary>
/// Esta clase se encarga de visualizar la pantalla de buscador de indicadores
/// </summary>
public partial class Buscador : System.Web.UI.Page
{
    protected string dicionario = "";
    protected string nombre = "";
    protected string codigo = "";
    protected string region = "";
    protected string usuario = "";
    protected string parametros = "";
    protected int? avanzado = -1;
    /// <summary>
    /// Metodo que carga los componentes de la página y carga los filtros de busqueda
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //if (Request["User"] != null || Request["User"] != "")
            //{
            //    //UsuariosDAO usuDao = new UsuariosDAO();
            //    //DSRepositorioIndicadores.UsuariosVODataTable usuvo= usuDao.GetUsuarioXNombre(Request["User"]);
            //    //if (usuvo.Rows.Count > 0)
            //    //{
            //    //    Session["user"] = usuvo[0];
                   
            //    //}
               
            //}



            DiccionarioIndicadoresDAO dicDAO = new DiccionarioIndicadoresDAO();

            Utils.LlenarComboLista(lstdiccionario, dicDAO.GetDiccionario(), "ID", "DSNOMBRE");

            RegionesDAO regDAO = new RegionesDAO();

            Utils.LlenarComboLista(lstregion, regDAO.GetRegionesXUsu(Utils.GetUsuario(Session, Response).ID), "ID", "DSNOMBRE");

            UsuariosDAO usuDAO = new UsuariosDAO();

            Utils.LlenarComboLista(ddlResponsable, usuDAO.GetUsuariosResponsables(Utils.GetUsuario(Session, Response).IDREGION), "ID", "DSNOMBRES");


            OpcionesListaBuscadorDAO opDAO = new OpcionesListaBuscadorDAO();
            Utils.LlenarComboLista(ddlUnidMed, opDAO.GetOpcionesxlista(20), "ID", "DSNOMBRE");

        }

        chavanzado.Attributes.Add("onclick", "return Ocultar()");

       

       
    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón Buscar, el sistema realizara la bsuqueda aplicando los filtros
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        Buscar();
    }
    /// <summary>
    /// Metodo que arma el query de busqueda segun los filtros seleccionados , luego ejecuta la consulta y carga el resultado en el grid
    /// </summary>
    private void Buscar()
    {
        BuscadorDAO bDAO = new BuscadorDAO();
        dicionario = lstdiccionario.SelectedValue;
        region = lstregion.SelectedValue;
        nombre = txtnombre.Text.Trim().ToUpper();
        codigo = txtcodigo.Text.Trim().ToUpper();
       string  codigoaux = txtcodigoaux.Text.Trim().ToUpper();
        usuario = Utils.GetUsuario(Session,Response).ID + "";
        parametros = "";

        if (!chavanzado.Checked)
        {
            avanzado = -1;
        }
        else
        {
            avanzado = 1;
            int contador = 1;

            while (Request["lista" + contador] != null)
            {
                if (Request["lista" + contador] != "-1")
                {
                    parametros += "i." + Request["listahidden" + contador] + " like '%" + Request["lista" + contador] + "%' and ";
                }
                contador++;
            }

            if (parametros.Length > 0)
                parametros = parametros.Substring(0, parametros.Length - 5);
            else
                avanzado = -1;
        }
        gvbuscador.DataSource = bDAO.GetIndicadores(dicionario, nombre, codigo, region, usuario, avanzado, parametros, codigoaux, chkMios.Checked ? 1 : -1, int.Parse(ddlResponsable.SelectedValue), int.Parse(ddlUnidMed.SelectedValue));
        gvbuscador.DataBind();
        Session["dt"] = gvbuscador.DataSource;
    }
    /// <summary>
    /// Metodo que se activa en el momento en que el usuario desea cambiar de página en el paginador del grid de resultados
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void gvbuscador_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvbuscador.PageIndex = e.NewPageIndex;
        gvbuscador.DataSource =(DSRepositorioIndicadores.BuscadorVODataTable) Session["dt"];

        gvbuscador.DataBind();
    }
    /// <summary>
    /// Metodo que se activa en el momento en que el grid de resultados se esta armando, se usa para asociarle algunas propiedades a la celdas 
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void gvbuscador_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DSRepositorioIndicadores.BuscadorVODataTable dt= (DSRepositorioIndicadores.BuscadorVODataTable)gvbuscador.DataSource;
            if (Utils.GetUsuario(Session, Response).DSTIPO != "A" && Utils.GetUsuario(Session, Response).DSTIPO != "S")
            {
                e.Row.Cells[9].Visible = false; 

            }


            if (Utils.GetUsuario(Session, Response).DSTIPO == "A" || Utils.GetUsuario(Session, Response).DSTIPO == "S" || (!dt[e.Row.RowIndex].IsIDRESPONSABLENull()  &&  dt[e.Row.RowIndex].IDRESPONSABLE == Utils.GetUsuario(Session, Response).ID))
            {

            }
            else
            {
                e.Row.Cells[7].Visible = false; 
              //  gvbuscador.Columns[7].Visible = false;
            }
        }
    }
    /// <summary>
    /// Metodo que se activa en el momento en que el usuario presiona algun botón en el grid
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void gvbuscador_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id = int.Parse(e.CommandArgument.ToString());
        if (e.CommandName == "eliminar")
        {
            DSRepositorioIndicadoresTableAdapters.IndicadoresDAO indDAO = new IndicadoresDAO();
            indDAO.EliminarIndicador(id);
            Buscar();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msgeli", "<script>alert('Indicador eliminado correctamente')</script>", false);
        }

    }
}