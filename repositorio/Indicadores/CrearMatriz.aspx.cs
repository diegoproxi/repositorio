using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using com.triario.repositorio.util;

public partial class Indicadores_CrearMatriz : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            OpcionesListaBuscadorDAO opDAO = new OpcionesListaBuscadorDAO();
            Utils.LlenarComboLista(ddlPlanta, opDAO.GetOpcionesxlista(9), "ID", "DSNOMBRE");
            ddlPlanta.Items[0].Text = "Seleccione una planta";


         
            Utils.LlenarComboLista(ddlOperacion, opDAO.GetOpcionesxlista(1058), "ID", "DSNOMBRE");
            ddlPlanta.Items[0].Text = "Seleccione una operación";


            Utils.LlenarComboLista(ddlLinea, opDAO.GetOpcionesxlista(1064), "ID", "DSNOMBRE");
            ddlPlanta.Items[0].Text = "Seleccione una línea";

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        PerdidasDAO perDAO = new PerdidasDAO();
        perDAO.InsertMatriz(int.Parse(ddlPlanta.SelectedValue), int.Parse(ddlLinea.SelectedValue), int.Parse(ddlOperacion.SelectedValue), int.Parse(ddlPerdida.SelectedValue));

       Response.Write("<script>alert('Perdida ingresada correctamente');</script>");
    }
    protected void ddlOperacion_SelectedIndexChanged(object sender, EventArgs e)
    {
        DiccionarioIndicadoresDAO perDAO = new DiccionarioIndicadoresDAO();
        Utils.LlenarComboLista(ddlPerdida, perDAO.GetPerdidas(int.Parse(ddlOperacion.SelectedValue)), "ID", "DSNOMBRE");
    }
}