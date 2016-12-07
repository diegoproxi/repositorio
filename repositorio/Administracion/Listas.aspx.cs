using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using System.Data;
public partial class Administracion_Listas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        llenargrid();
    }

    private void llenargrid()
    {
        lista_valoresDAO lista = new lista_valoresDAO();
        System.Data.DataTable dt = lista.GetListas();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        llenargrid();

     
    }
}