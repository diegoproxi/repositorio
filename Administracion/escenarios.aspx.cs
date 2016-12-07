using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using System.Data;
/// <summary>
///  Esta clase se encarga de visualizar la pantalla de esecnarios configurados, la cual permite que se administren los escanrios
/// </summary>

public partial class Administracion_escenarios : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y llena el grid con los escenarios creados
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        llenargrid();
        divError.Style["display"] = "none";
        divMsg.Style["display"] = "none";
    }
    /// <summary>
    /// Metodod que se encarga de cargar el grid con todos los escenarios configurados
    /// </summary>
    public void llenargrid()
    {
        EscenariosDAO es = new EscenariosDAO();
        System.Data.DataTable dtes = es.GetEscenarios();
        GridView1.DataSource = dtes;
        GridView1.DataBind();
            
    }
    /// <summary>
    /// Metodo que se activa en el momento en que el usuario presiona algun botón en el grid
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
         EscenariosDAO ESC = new EscenariosDAO();
       
        if (e.CommandName.Equals("eliminar"))
        {
            int id = int.Parse(e.CommandArgument.ToString());
            ESC.DeleteEsenario(true,id);
            llenargrid();   
           Response.Write("<script>alert('Escenario Eliminado correctamente')</script>");
      
        }
        if (e.CommandName == "arriba")
        {

            GridViewRow gvr = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
            int RowIndex = gvr.RowIndex;
            if (RowIndex == 0)
                return;
            
            DataTable dt = (DataTable)GridView1.DataSource;
                DataRow dr = dt.Rows[RowIndex];
                DataRow dr2 = dt.Rows[RowIndex-1];

                int ordeno = int.Parse(dr["ID"].ToString());
                int ordend = int.Parse(dr2["ID"].ToString());
                EscenariosDAO escDAO = new EscenariosDAO();
                escDAO.UpdateOrden(ordend, ordeno);
                llenargrid();   

        }

        if (e.CommandName == "abajo")
        {
            DataTable dt = (DataTable)GridView1.DataSource;
            GridViewRow gvr = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
            int RowIndex = gvr.RowIndex;
            if (RowIndex == dt.Rows.Count - 1)
                return;

          
            DataRow dr = dt.Rows[RowIndex];
            DataRow dr2 = dt.Rows[RowIndex + 1];

            int ordeno = int.Parse(dr["ID"].ToString());
            int ordend = int.Parse(dr2["ID"].ToString());
            EscenariosDAO escDAO = new EscenariosDAO();
            escDAO.UpdateOrden(ordend, ordeno);
            llenargrid();

        }


    }
    /// <summary>
    /// Metodo que se activa en el momento en que el grid de escenarios se esta armando, se usa para asociarle algunas propiedades a la celdas 
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton link = (LinkButton)e.Row.Cells[3].FindControl("ibtnDelete");
            link.Attributes.Add("OnClick", "javascript: if(confirm('Está seguro que desea eliminar el escenario?')== false) return false");
           
            if(e.Row.Cells[1].Text=="C"){
                e.Row.Cells[1].Text="Calculado";
                 
            }
             if(e.Row.Cells[1].Text=="P"){
                e.Row.Cells[1].Text="Presupuestado";
                 
            }
            if(e.Row.Cells[1].Text=="E"){
                e.Row.Cells[1].Text="Estimado";
                 
            }
             if(e.Row.Cells[1].Text=="O"){
                e.Row.Cells[1].Text="Comentarios";
                 
            }
              if(e.Row.Cells[1].Text=="R"){
                e.Row.Cells[1].Text="Real";
                 
            }
              if (e.Row.Cells[1].Text == "M")
              {
                  e.Row.Cells[1].Text = "Meta";

              }

        }
    }
}