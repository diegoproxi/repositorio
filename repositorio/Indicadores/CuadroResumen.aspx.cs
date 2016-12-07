using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using com.triario.repositorio.util;
using System.Data;
/// <summary>
/// Esta clase se encarga de visualizar la pantalla del cuadro resumen
/// </summary>
public partial class Indicadores_CuadroResumen : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y carga el perido que se va a cargar segun la configuración
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Session["userid"] = Utils.GetUsuario(Session, Response).ID + "";
            int aux=int.Parse(Utils.GetParametro("DIAS_MES_ANTERIOR"));

            aux = DateTime.Now.Day > aux ? DateTime.Now.Month - 1 : DateTime.Now.Month - 2;
            int anio = DateTime.Now.Year;

            if (aux <= 0)
            {
                aux += 12;
                anio--;
            }

           


            Session["anio"] =anio;
            Session["mes"] =aux;
        }

    }
    protected void RadChart1_ItemDataBound(object sender, Telerik.Charting.ChartItemDataBoundEventArgs e)
    {

    }
    /// <summary>
    /// Metodo que se ejecuta cuando el grid esta haciendo render
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void RadGrid1_PreRender(object sender, EventArgs e)
    {
        string[] meses = { "", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };

        RadGrid1.Columns[4].HeaderText+=" "+meses[int.Parse(Session["mes"].ToString())];
        RadGrid1.Columns[5].HeaderText += " " + meses[int.Parse(Session["mes"].ToString())];
    }
    /// <summary>
    /// Metodo que se activa en el momento en que el usuario presiona algun botón en el grid
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void RadGrid1_ItemCommand(object source, GridCommandEventArgs e)
    {
        if (e.CommandName == RadGrid.FilterCommandName)
        {
            Pair filterPair = (Pair)e.CommandArgument;
            if (filterPair.First.ToString() == "Contains")
            {
                e.Canceled = true;
                string newFilter = "";
                for(int j=0;j<RadGrid1.Columns.Count;j++){
                
                string colName = RadGrid1.Columns[j].UniqueName;

                if ((e.Item as GridFilteringItem)[colName] != null && (e.Item as GridFilteringItem)[colName].Controls.Count > 0 && ((e.Item as GridFilteringItem)[colName].Controls[0] as TextBox).Text!="")
                {

                    TextBox tbPattern = (e.Item as GridFilteringItem)[colName].Controls[0] as TextBox;
                    string[] values = tbPattern.Text.Split(' ');
              
                    
                   

                    for (int i = 0; i < values.Length; i++)
                    {
                        if (newFilter == "")
                        {
                            newFilter += " (it[\"" + colName + "\"].ToString().ToUpper().Contains(\"" + values[i] + "\".ToUpper()))";
                        }
                        else
                        {
                            newFilter += " AND  (it[\"" + colName + "\"].ToString().ToUpper().Contains(\"" + values[i] + "\".ToUpper()))";
                        }


                    }
                }
                
                    //  (it["dsnombre"].ToString().ToUpper().Contains("accid cej".ToUpper())) AND (it["DSREGION"].ToString().ToUpper().Contains("col".ToUpper()))
                  
                        RadGrid1.MasterTableView.FilterExpression =  newFilter ;
                 
                    RadGrid1.Rebind();



                }
               
            }

        }
    }

    protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
    {

    }
    /// <summary>
    /// Metodo que se activa en el momento en que el grid se esta cargando
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void RadGrid1_Load(object sender, EventArgs e)
    {
        string[] meses = { "", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };

        RadGrid1.Columns[4].HeaderText = "Valor Real Acumulado " + meses[int.Parse(Session["mes"].ToString())];
        RadGrid1.Columns[5].HeaderText = "Valor Presupuestado " + meses[int.Parse(Session["mes"].ToString())];
    }
}