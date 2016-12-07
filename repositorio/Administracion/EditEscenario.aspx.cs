using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
/// <summary>
///  Esta clase se encarga de visualizar la pantalla de edición de escenarios, la cual permite crear y modificar cualquier escenario
/// </summary>
public partial class EditEscenario : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y vsiualiza la configuración previa que se tenga para el escenario
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["id"] != null)
            {
                EscenariosDAO es = new EscenariosDAO();
                System.Data.DataTable dt = es.SelEscenario(Convert.ToInt32(Request["id"]));
                TextBox1.Text = dt.Rows[0]["DSNOMBRE"].ToString();
                DropDownList1.SelectedValue = dt.Rows[0]["DSTIPO"].ToString();
            }
    
        }
    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón guardar, el sistema guarda toda la modificacióin que se hizo sobre el escenario
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        EscenariosDAO es = new EscenariosDAO();
        if (Request["id"] != null)
        {
           
            es.UpdateEscenario(TextBox1.Text, DropDownList1.SelectedValue, false, Convert.ToInt32(Request["id"]));
            Response.Write("<script>window.parent.document.forms[0].submit();</script>");
        }
        else {

            es.Insert(TextBox1.Text, DropDownList1.SelectedValue, false);
            Response.Write("<script>window.parent.document.forms[0].submit();</script>");
                
        }
     }
}