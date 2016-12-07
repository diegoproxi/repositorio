using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using Telerik.Web.UI;
/// <summary>
///  Esta clase se encarga de visualizar la pantalla de catalogo de indicadores, la cual permite que se administre el catalogo del sistema
/// </summary>

public partial class Administracion_Diccionarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    

    protected void dgdiccionario_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
    }
    protected void dgdiccionario_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
    }
    protected void dgdiccionario_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
       
    }
    protected void dgdiccionario_PreRender(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// Metodo que se activa en el momento en que el usuario presiona algun botón en el grid
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
      
        if (e.CommandName.Equals("eliminar"))
        {
            int id = int.Parse(e.CommandArgument.ToString());

            DiccionarioIndicadoresDAO es = new DiccionarioIndicadoresDAO();
            es.DeleteDiccionario(true, id);
            RadGrid1.Rebind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "<script>alert('Diccionario Eliminado correctamente')</script>", false);

            Response.Write("");

        }
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
}