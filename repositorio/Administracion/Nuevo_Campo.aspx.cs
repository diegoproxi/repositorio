using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
/// <summary>
///  Esta clase se encarga de visualizar la pantalla de edición de campos, la cual permite crear y modificar los campoos del sistema
/// </summary>
public partial class Administracion_Nuevo_Campo : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y vsiualiza la configuración previa que se tenga para la alerta
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { 
            CamposDAO cam = new CamposDAO();
             System.Data.DataTable dt = cam.GetCampos();
            System.Data.DataRow dr = dt.NewRow();
            dr["ID"] = "-1";
            dr["DSNOMBRE"] = "";
             dr["IDLISTA"]="-1";
            dt.Rows.InsertAt(dr, 0);
            DropDownList1.DataSource = dt;
            DropDownList1.DataValueField = "ID";
            DropDownList1.DataTextField = "DSNOMBRE";
            DropDownList1.DataBind();
        }
    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón guardar, el sistema guarda toda la modificacióin que se hizo sobre el campo
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        CamposDAO campos = new CamposDAO();
        int? padre= null;
         int? padre2 =null;
        if(DropDownList1.SelectedValue!="-1")
        {
            padre2=Convert.ToInt32( DropDownList1.SelectedValue);
            System.Data.DataTable DTCAM = campos.GetCampo(Convert.ToInt32(DropDownList1.SelectedValue));

            padre=Convert.ToInt32( DTCAM.Rows[0]["IDLISTA"]);
        }
        lista_valoresDAO cam = new lista_valoresDAO();
        int? idlsita = null;
        cam.PRC_TRI_REP_INSERT_LISTA_VALORES(padre, TextBox1.Text, TextBox2.Text, false, ref idlsita);
       
       var id=idlsita;
       
           
        campos.InsertCampo(Convert.ToInt32(id), TextBox1.Text, TextBox2.Text, null,padre2, null, false, null, null);
        Response.Write("<script>alert('Campo insertado correctamente')</script>");
    }
}