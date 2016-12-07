using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using com.triario.repositorio.util;
using Telerik.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
/// <summary>
/// Esta clase se encarga de visualizar la calculadora de escenarios
/// </summary>
public partial class Categorias_Calculadora : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y carga los componentes necesarios para poder realizar las operaciones aritemticas
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        divError.Style["display"] = "none";
        divMsg.Style["display"] = "none";
        if (!IsPostBack)
        {

            if ((Request["idind"] == null || Request["idind"] == "") && (Request["idcat"] == null || Request["idcat"] == ""))
            {
                ConfiguracionEscenariosDAO confDAO = new ConfiguracionEscenariosDAO();
                object obj = confDAO.GetFormulaEsc(int.Parse(Request["id"]));
                hdOperacion2.Value = obj == null || obj == DBNull.Value ? "" : obj.ToString();
            }
            else
            {
                if (Request["idcat"] != null && Request["idcat"] != "")
                {
                    ConfiguracionEscenariosDAO confDAO = new ConfiguracionEscenariosDAO();
                    object obj = confDAO.GetFormulaEscXCat(int.Parse(Request["id"]), int.Parse(Request["idcat"]));
                    hdOperacion2.Value = obj == null || obj == DBNull.Value ? "" : obj.ToString();
                }
                if (Request["idind"] != null && Request["idind"] != "")
                {
                    ConfiguracionEscenariosDAO confDAO = new ConfiguracionEscenariosDAO();
                    object obj = confDAO.GetFormulaEscXInd(int.Parse(Request["id"]), int.Parse(Request["idind"]), int.Parse(Request["idcat"]));
                    hdOperacion2.Value = obj == null || obj == DBNull.Value ? "" : obj.ToString();
                }
            }
        }

    }

    protected void RadComboBoxProduct_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        if (e.Text == "")
        {
            return;
        }
        string sqlSelectCommand = "select i.id, dbo.GetNombreCompletoIndicador(i.ID) dsnombre, i.dscodigo,(select DSNOMBRE from tri_rep_opciones_lista where ID=i.IDUNIMED ) UNIDADMEDIDA,(select DSNOMBRE from tri_rep_regiones where ID=i.IDREGION) DSREGION from dbo.tri_rep_indicadores i where  1=1 and dbo.GetNombreCompletoIndicador(i.ID) is not null ";
        string[] vec = e.Text.Split(new char[] { ' ' });

        for (int i = 0; i < vec.Length; i++)
        {
            sqlSelectCommand += " and ( upper(dbo.GetNombreCompletoIndicador(i.ID)) like upper('%" + vec[0] + "%') or  DSCODIGO like ('%" + vec[0] + "%') or  upper((select DSNOMBRE from tri_rep_regiones where ID=i.IDREGION)) like upper('%" + vec[0] + "%') or upper((select DSNOMBRE from tri_rep_opciones_lista where ID=i.IDUNIMED) ) like upper('%" + vec[0] + "%') )";

        }
        sqlSelectCommand += " order by dsnombre";

        SqlDataAdapter adapter = new SqlDataAdapter(sqlSelectCommand,
          ConfigurationManager.ConnectionStrings["core_repositorioConnectionString"].ConnectionString);
        for (int i = 0; i < vec.Length; i++)
        {
            adapter.SelectCommand.Parameters.AddWithValue("@text" + i, vec[i]);
        }
        DataTable dataTable = new DataTable();
        adapter.Fill(dataTable);

        foreach (DataRow dataRow in dataTable.Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();

            item.Text = dataRow.IsNull("dsnombre") ? "" : dataRow["dsnombre"].ToString();
            item.Value = dataRow.IsNull("dscodigo") ? "" : dataRow["dscodigo"].ToString();


            item.Attributes.Add("REGION", dataRow.IsNull("DSREGION") ? "" : dataRow["DSREGION"].ToString());
            item.Attributes.Add("UNIDAD", dataRow.IsNull("UNIDADMEDIDA") ? "" : dataRow["UNIDADMEDIDA"].ToString());



            radCodigo.Items.Add(item);

            item.DataBind();
        }
    }

    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón Gurdar, el sistema almacena la formula que el usuario definio
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Button12_Click(object sender, EventArgs e)
    {
        try
        {
            ConfiguracionEscenariosDAO confDAO = new ConfiguracionEscenariosDAO();

            if ((Request["idind"] == null || Request["idind"] == "") && (Request["idcat"] == null || Request["idcat"] == ""))
            {
                confDAO.UpdateEsc(hdOperacion.Value, int.Parse(Request["id"]), hdOperacion3.Value);
                Response.Write("<script>alert('" + Utils.GetMensaje("ASIGNAR_FORMULA_ESCENARIO_CATEGORIA") + "')</script>");
                Response.Write("<script>parent.cerrarVentana();</script>");

            }
            else
            {

                if (Request["idind"] == null || Request["idind"] == "")
                {
                    confDAO.UpdateEscCat(hdOperacion.Value, int.Parse(Request["idcat"]), int.Parse(Request["id"]), hdOperacion3.Value);
                    Response.Write("<script>alert('" + Utils.GetMensaje("ASIGNAR_FORMULA_ESCENARIO_CATEGORIA") + "')</script>");
                    Response.Write("<script>parent.cerrarVentana();</script>");

                }
                else
                {
                    confDAO.UpdateEscInd(hdOperacion.Value, int.Parse(Request["idind"]), int.Parse(Request["id"]), hdOperacion3.Value);
                    Response.Write("<script>alert('" + Utils.GetMensaje("ASIGNAR_FORMULA_ESCENARIO_INDICADOR") + "')</script>");
                    Response.Write("<script>parent.cerrarVentana();</script>");

                }
            }

        }
        catch (Exception exc)
        {
            Utils.RegistrarError(exc);
            divError.Style["display"] = "";
            msgError.InnerText = Utils.GetMensaje("ERROR");
        }


    }
}