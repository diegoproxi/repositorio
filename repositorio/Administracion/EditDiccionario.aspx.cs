using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
/// <summary>
///  Esta clase se encarga de visualizar la pantalla de edición de diccionario, la cual permite crear y modificar el catalogo de indicadores
/// </summary>

public partial class Administracion_EditDiccionario : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y vsiualiza la configuración previa que se tenga para el catalogo
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["id"] != null)
            {
                DiccionarioIndicadoresDAO dicc = new DiccionarioIndicadoresDAO();
                System.Data.DataTable dtd = dicc.SelDiccionario(Convert.ToInt32(Request["id"]));
                TextBox1.Text = dtd.Rows[0]["DSNOMBRE"].ToString();
                if (dtd.Rows[0]["DSDESCRIPCION"] != null)
                {
                    TextBox2.Text = dtd.Rows[0]["DSDESCRIPCION"].ToString();
                }
                
            }

        }
    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón guardar, el sistema guarda toda la modificacióin que se hizo sobre el catalogo
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        DiccionarioIndicadoresDAO dicc = new DiccionarioIndicadoresDAO();
        if (Request["id"] != null)
        {
            dicc.UpdateDiccionario(TextBox1.Text, TextBox2.Text, false, Convert.ToInt32(Request["id"]));
            Response.Write("<script>alert('Diccionario modificado correctamente')</script>");


        }
        else {
            dicc.InsertDicc(TextBox1.Text, TextBox2.Text, false);
            Response.Write("<script>alert('Diccionario ingresado correctamente')</script>");
        
        }
    }
}