using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
/// <summary>
///  Esta clase se encarga de visualizar la pantalla de edición de alertas, la cual permite crear y modificar las alertas del sistema
/// </summary>
public partial class Administracion_Nueva_notificacion : System.Web.UI.Page
{

    /// <summary>
    /// Metodo que carga los componentes de la página y vsiualiza la configuración previa que se tenga para la alerta
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        llenarhora(DropDownList1);
        if (!IsPostBack)
        {
            if (Request["id"] != null)
            {
                Alertas_configuracionDAO aler = new Alertas_configuracionDAO();
                System.Data.DataTable dt = aler.GetAlerta(Convert.ToInt32(Request["id"]));
                DropDownList1.SelectedValue = dt.Rows[0]["NMTIEMPO"].ToString();
                TextBox1.Text = dt.Rows[0]["DSMENSAJE"].ToString();
            }
        }
    }
    /// <summary>
    /// Metodo que carga un dropdownlist con las horas 
    /// </summary>
    /// <param name="ddl">El dropdownlist que se va a cargar</param>
    public void llenarhora(DropDownList ddl)
    {
        for (int i = 1; i < 32; i++)
        {
            ddl.Items.Add(Convert.ToString(i));
            
        }
    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón guardar, el sistema guarda toda la modificacióin que se hizo sobre la alerta
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        Alertas_configuracionDAO AL = new Alertas_configuracionDAO();
        if (Request["id"] != null)
        {
            AL.UpdateAlerta(Convert.ToInt32(DropDownList1.SelectedValue), TextBox1.Text, false, Convert.ToInt32(Request["id"]));
            Response.Write("<script>alert('Notificaión modificada correctamente');window.parent.document.forms[0].submit();</script>");
        }
        else
        {   
            AL.InsertAlerta(Convert.ToInt32(DropDownList1.SelectedValue), TextBox1.Text, false);
            Response.Write("<script>alert('Notificaión insertada correctamente');window.parent.document.forms[0].submit();</script>");
        }
    }
}