using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using com.triario.repositorio.util;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Esta clase se encarga de visualizar la pantalla de auditoria del sistema
/// </summary>

public partial class Administracion_Auditoria : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y muestra los usuarios del sistema
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            UsuariosDAO usuDAO = new UsuariosDAO();
            Utils.LlenarComboLista(ddlUsuario, usuDAO.GetUsuarios(), "ID", "DSNOMBRES");
        }
    }
    /// <summary>
    /// Metodo que controla el evento click del botón buscar
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql = "SELECT  ID,(select DSNOMBRES from tri_rep_usuarios where ID= IDUSUARIO) DSUSUARIO, IDINDICADOR, DSACCION, FEFECHA, DSOBSERVACIONES, DSNUEVOVALOR, DSVALORANT,(select e.DSNOMBRE from tri_rep_escenarios e where ID= IDESCENARIO) DSESCENARIO, NMANIO, dbo.FN_GETMES(NMMES) NMMES,dbo.GetNombreCompletoIndicador(IDINDICADOR) DSINIDCADOR FROM            tri_rep_logs where 1=1";
        
      if(ddlUsuario.SelectedValue!="-1"){
         sql+=" and IDUSUARIO="+ddlUsuario.SelectedValue;
      }
        if(txtdesde.Text!=""){
         sql+=" and convert(date,FEFECHA)>= CONVERT(date,'"+txtdesde.Text+"',103)";
      }
         if(txthasta.Text!=""){
             sql += " and convert(date,FEFECHA)<= CONVERT(date,'" + txthasta.Text + "',103)";
      }
      
sql+=" order by FEFECHA desc ";


        gvbuscador.DataSource=GetData(new SqlCommand(sql));
        Session["dt"] = gvbuscador.DataSource;
        gvbuscador.DataBind();

    }
    /// <summary>
    /// Función que recibe un comando de sql y retorna el resultado
    /// </summary>
    /// <param name="cmd">El comando sql que se desea ejecutar</param>
    /// <returns>El resultado que genero la ejecución de la cosnulta</returns>
    private DataTable GetData(SqlCommand cmd)
    {
        DataTable dt = new DataTable();
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["core_repositorioConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        cmd.CommandTimeout = 360;
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            return dt;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            sda.Dispose();
            con.Dispose();
        }
    }
    /// <summary>
    /// Metodo que se activa en el momento en que el usuario desea cambiar d epágina en el paginador del grid de resultados
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void gvbuscador_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvbuscador.PageIndex = e.NewPageIndex;
        gvbuscador.DataSource = (DataTable)Session["dt"];

        gvbuscador.DataBind();

    }
}