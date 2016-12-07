using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using com.triario.repositorio.util;
/// <summary>
///  Esta clase se encarga de visualizar la pantalla de edición de fechas limite de captura, la cual permite crear y modificar nuevas fechas
/// </summary>
public partial class Categorias_AgregarFechaLimite : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y vsiualiza la fecha limite creada
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            EscenariosDAO escDAO = new EscenariosDAO();
            Utils.LlenarComboLista(ddlEscenario, escDAO.GetEscenarios(), "ID", "DSNOMBRE");



            int limite = DateTime.Now.Year + int.Parse(Utils.GetParametro("LARGO_PLAZO"));
            ddlPeriodo.Items.Add("Todos");
               for (int i = 2008; i  <= limite + 5; i++)
            {
                ddlPeriodo.Items.Add(i +"");
                for (int j = 1; j <= 12; j++)
                {

                    ddlPeriodo.Items.Add(i + "-" + j);
                }

            }

            //for (int i = DateTime.Now.Month; i <= 12; i++)
            //{
            //    ddlPeriodo.Items.Add(DateTime.Now.Year + "-" + i);
            //}

            //for (int i = DateTime.Now.Year + 1; i <= limite + 5; i++)
            //{
            //    for (int j = 1; j <= 12; j++)
            //    {

            //        ddlPeriodo.Items.Add(i + "-" + j);
            //    }

            //}
          

        }

        divError.Style["display"] = "none";
        divMsg.Style["display"] = "none";
    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón guardar, el sistema guarda o modifica la fecha limite
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        try
        {
            FechasLimiteDAO fecDAO = new FechasLimiteDAO();
            string per = ddlPeriodo.SelectedValue;
            int? anio = null;
            int? mes = null;
            if (ddlPeriodo.SelectedIndex!=0)
            {
                string[] vec = per.Split(new char[] { '-' });
               

                 anio = int.Parse(vec[0]);
                if(vec.Length>1)
                 mes = int.Parse(vec[1]);
            }

            if (chkPersonalizado.Checked)
            {if (Request["idind"] != null && Request["idind"] != "")
                {
                    fecDAO.InsertFechaLimite(int.Parse(Request["idind"]), null, ddlEscenario.SelectedValue == "-1" ? null : (int?)int.Parse(ddlEscenario.SelectedValue), "", Utils.StringToDateTime(txtDesde.Text), Utils.StringToDateTime(txtHasta.Text), anio, mes, null, chkPersonalizado.Checked);
                }
            else if (Request["idcat"] != null && Request["idcat"] != "")
                {
                    fecDAO.InsertFechaLimite(null, int.Parse(Request["idcat"]), ddlEscenario.SelectedValue == "-1" ? null : (int?)int.Parse(ddlEscenario.SelectedValue), "", Utils.StringToDateTime(txtDesde.Text), Utils.StringToDateTime(txtHasta.Text), anio, mes, null, chkPersonalizado.Checked);
                }
                
                else
                {
                    fecDAO.InsertFechaLimite(null, null, ddlEscenario.SelectedValue == "-1" ? null : (int?)int.Parse(ddlEscenario.SelectedValue), "", Utils.StringToDateTime(txtDesde.Text), Utils.StringToDateTime(txtHasta.Text), anio, mes, null, chkPersonalizado.Checked);
                }
            }
            else
            {
                if (Request["idcat"] != null && Request["idcat"] != "")
                {
                    fecDAO.InsertFechaLimite(null, int.Parse(Request["idcat"]), ddlEscenario.SelectedValue == "-1" ? null : (int?)int.Parse(ddlEscenario.SelectedValue), "", null, null, anio, mes, int.Parse(txtDias.Text) * (rbAntes.Checked ? -1 : 1), chkPersonalizado.Checked);
                }
                else if (Request["idind"] != null && Request["idind"] != "")
                {
                    fecDAO.InsertFechaLimite(int.Parse(Request["idind"]), null, ddlEscenario.SelectedValue == "-1" ? null : (int?)int.Parse(ddlEscenario.SelectedValue), "", null, null, anio, mes, int.Parse(txtDias.Text) * (rbAntes.Checked ? -1 : 1), chkPersonalizado.Checked);
                }
                else
                {
                    fecDAO.InsertFechaLimite(null, null, ddlEscenario.SelectedValue == "-1" ? null : (int?)int.Parse(ddlEscenario.SelectedValue), "", null, null, anio, mes, int.Parse(txtDias.Text) * (rbAntes.Checked ? -1 : 1), chkPersonalizado.Checked);
                }
            }

            Response.Write("<script>alert('"+Utils.GetMensaje("ASIGNAR_FECHA_LIMITE_CATEGORIA")+"')</script>");

 

            Response.Write("<script>parent.document.forms[0].submit();</script>");


            //divMsg.Style["display"] = "";
            //msgExito.InnerText = Utils.GetMensaje("ASIGNAR_FECHA_LIMITE_CATEGORIA");

        }
        catch (Exception exc)
        {
            Utils.RegistrarError(exc);
            divError.Style["display"] = "";
            msgError.InnerText = Utils.GetMensaje("ERROR");
        }
    }
}