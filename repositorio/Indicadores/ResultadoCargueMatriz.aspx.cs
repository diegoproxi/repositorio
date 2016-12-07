using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
/// <summary>
/// Esta clase se encarga de visualizar el resultado de un cargue luego de ejecutarse
/// </summary>
public partial class Indicadores_ResultadoCargueMatriz : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void gvErrores_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
       
    }
    /// <summary>
    /// Metodo que se activa en el momento en que el usuario desea cambiar de página en el paginador del grid de resultados
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
   
    /// <summary>
    /// Metodo que se activa en el momento en que el usuario desea cambiar de página en el paginador del grid de errores
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    
    protected void RadGrid2_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == RadGrid.FilterCommandName)
        {
            Pair filterPair = (Pair)e.CommandArgument;
            if (filterPair.First.ToString() == "Contains")
            {
                e.Canceled = true;
                string newFilter = "";
                for (int j = 0; j < RadGrid2.Columns.Count; j++)
                {

                    string colName = RadGrid2.Columns[j].UniqueName;

                    if ((e.Item as GridFilteringItem)[colName] != null && (e.Item as GridFilteringItem)[colName].Controls.Count > 0 && ((e.Item as GridFilteringItem)[colName].Controls[0] as TextBox).Text != "")
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

                    RadGrid2.MasterTableView.FilterExpression = newFilter;

                    RadGrid2.Rebind();



                }

            }

        }
    }


    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == RadGrid.FilterCommandName)
        {
            Pair filterPair = (Pair)e.CommandArgument;
            if (filterPair.First.ToString() == "Contains")
            {
                e.Canceled = true;
                string newFilter = "";
                for (int j = 0; j < RadGrid1.Columns.Count; j++)
                {

                    string colName = RadGrid1.Columns[j].UniqueName;

                    if ((e.Item as GridFilteringItem)[colName] != null && (e.Item as GridFilteringItem)[colName].Controls.Count > 0 && ((e.Item as GridFilteringItem)[colName].Controls[0] as TextBox).Text != "")
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

                    RadGrid1.MasterTableView.FilterExpression = newFilter;

                    RadGrid1.Rebind();



                }

            }

        }
    }
    protected void RadGrid2_PageIndexChanged(object sender, GridPageChangedEventArgs e)
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "scrdep", "alert(''); $('#tt').tabs('select',1)", true);
       //ClientScript.RegisterClientScriptBlock(this.GetType(),"tabscr","alert(''); $('#tt').tabs('select',1)",true);
       
    }
}