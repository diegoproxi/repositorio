using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using DSRepositorioIndicadoresTableAdapters;
using com.triario.repositorio.util;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
/// <summary>
/// Esta clase se encarga de visualizar la pantalla de captura de datos del indicador
/// </summary>
public partial class Indicadores_Actualizar : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y registra el acceso al indicador
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            IndicadoresDAO indDAO = new IndicadoresDAO();
            indDAO.InsertAcceso(int.Parse(Request["id"]), Utils.GetUsuario(Session, Response).ID);
        }
        divError.Style["display"] = "none";
        divMsg.Style["display"] = "none";

        Server.ScriptTimeout = 1200;
        
      
    }
    /// <summary>
    /// Metodo web que registra un valor para un peridod especifo dle indicador
    /// </summary>
    /// <param name="idesc">Escenario del indicador</param>
    /// <param name="nio">Año del periodo</param>
    /// <param name="mes">Mes del periodo</param>
    /// <param name="valor">Valor a guardar</param>
    /// <param name="tipo">Tipo de escenario</param>
    /// <param name="idind">Identificador del indicador</param>
    [WebMethod]
    public static void GuardarValor(int idesc, int nio, int mes, string valor, string tipo, int idind)
    {
        if (tipo == "O")
        {
            ValoresXEscenarioDAO valDAO = new ValoresXEscenarioDAO();

            valDAO.InsertValorXEsc(idind, idesc, nio, mes, valor, null);

        }
        else
        {
            ValoresXEscenarioDAO valDAO = new ValoresXEscenarioDAO();

            valDAO.InsertValorXEsc(idind, idesc, nio, mes, null, (valor == null || valor == "") ? null : (decimal?)decimal.Parse(valor));
        }
    }
    [WebMethod]
    public static void GuardarPanel(string activo,string idusu, string idind)
    {
         string sqlSelectCommand = ""; 
        sqlSelectCommand = "delete from tri_rep_indicadoresxusuario where IDUSUARIO="+idusu+" and IDINDICADOR="+idind;

        SqlConnection sqlcon=new SqlConnection(ConfigurationManager.ConnectionStrings["core_repositorioConnectionString"].ConnectionString);
        sqlcon.Open();
        SqlCommand sqlcom=new SqlCommand(sqlSelectCommand,sqlcon);
        sqlcom.ExecuteNonQuery();




       
        if (activo == "1")
        {
            sqlSelectCommand = "insert into tri_rep_indicadoresxusuario(IDUSUARIO,IDINDICADOR) values("+idusu+","+idind+")";
            sqlcom=new SqlCommand(sqlSelectCommand,sqlcon);
        sqlcom.ExecuteNonQuery();

        }
        sqlcon.Close();

        
    }

  /// <summary>
  /// Metodo web que registar el valor de la meta del indicador para un año en especifico
  /// </summary>
  /// <param name="nio">El año de la meta</param>
  /// <param name="valor">El valor de la meta</param>
  /// <param name="idind">Identificador del indicador</param>
    [WebMethod]
    public static void GuardarValorMeta(int nio, string valor,  int idind)
    {

        MetasXIndicadorDAO valDAO = new MetasXIndicadorDAO();

        valDAO.InsertMetasXIndicador(idind, (valor == null || valor == "") ? null : (decimal?)decimal.Parse(valor), nio);
       
    }
    /// <summary>
    /// Metodo web que guarda el valor de la meta pero registrando un log de cambio
    /// </summary>
    /// <param name="nio">El año de la meta</param>
    /// <param name="valor">El valor de la meta</param>
    /// <param name="idind">Identificador de la meta</param>
    /// <param name="causal">La causal por la que se modifica el valor</param>
    /// <param name="idusu">El usuario que hizo la modificacion</param>
    [WebMethod]
    public static void GuardarValorMetaLog(int nio,  string valor, int idind, string causal, int idusu)
    {

           MetasXIndicadorDAO valDAO = new MetasXIndicadorDAO();

           valDAO.InsertMetaXIndicadorLog(idind, (valor == null || valor == "") ? null : (decimal?)decimal.Parse(valor), nio, idusu, causal);
       
    }

    /// <summary>
    /// Metodo web que registra un valor para un peridod especifo del indicador registrando un log de cambio
    /// </summary>
    /// <param name="idesc">Escenario del indicador</param>
    /// <param name="nio">Año del periodo</param>
    /// <param name="mes">Mes del periodo</param>
    /// <param name="valor">Valor a guardar</param>
    /// <param name="tipo">Tipo de escenario</param>
    /// <param name="idind">Identificador del indicador</param>
    /// <param name="causal">Causal de modificacion</param>
    /// <param name="idusu">Usuario que realiza el cambio</param>
    [WebMethod]
    public static void GuardarValorLog(int idesc, int nio, int mes, string valor, string tipo, int idind,string causal,int idusu)
    {
        if (tipo == "O")
        {
            ValoresXEscenarioDAO valDAO = new ValoresXEscenarioDAO();

            valDAO.InsertValoresXEscLog(idind, idesc, nio, mes, valor, null, idusu,causal);

        }
        else
        {
            ValoresXEscenarioDAO valDAO = new ValoresXEscenarioDAO();

            valDAO.InsertValoresXEscLog(idind, idesc, nio, mes, null, (valor == null || valor == "") ? null :(decimal?) decimal.Parse(valor), idusu, causal);
        }
    }




    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón +, el sistema añadira un año ,as al historial del indicador
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void btnAgregarAnio_Click(object sender, EventArgs e)
    {
        IndicadoresDAO inDAO = new IndicadoresDAO();
        inDAO.UpdateHasta(int.Parse(Request["id"]), int.Parse(Request["hfHasta"]) + 1);
    }

    protected void btnDisAnio_Click(object sender, EventArgs e)
    {
        IndicadoresDAO inDAO = new IndicadoresDAO();
        inDAO.UpdateDesde(int.Parse(Request["id"]), int.Parse(Request["hfDesde"]) - 1);
    }

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
       
    }
    /// <summary>
    /// Metodo que se activa en el momento en que el usuario desea cambiar de página en el paginador del grid 
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;

        
        GridView1.DataBind();
    }
    public static string Evaluate(string expression)
    {
        if (expression == null || expression == "")
            return null;


        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["core_repositorioConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand sqlcom = new SqlCommand();

        sqlcom.CommandType = CommandType.Text;
        sqlcom.Connection = con;

        try
        {
            con.Open();
            sqlcom.CommandText = "select " + expression + "";
            object o = sqlcom.ExecuteScalar();

            return o.ToString();
        }
        catch (Exception ex)
        {
            return null;
        }
        finally
        {
            con.Close();
            sqlcom.Dispose();
            con.Dispose();
        }

    }
    public DataTable GetData(string str)
    {
        SqlCommand cmd = new SqlCommand(str);
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
}