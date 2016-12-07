using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using com.triario.repositorio.util;
using System.Web.Services;

public partial class Indicadores_ActualizarMatriz : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            OpcionesListaBuscadorDAO opDAO = new OpcionesListaBuscadorDAO();
            Utils.LlenarComboLista(ddlPlanta, opDAO.GetOpcionesxlista(9), "ID", "DSNOMBRE");
            ddlPlanta.Items[0].Text = "Seleccione una planta";


            for (int i = DateTime.Now.Year - 5; i <= DateTime.Now.Year + 5; i++)
            {
                ddlAnio.Items.Add(i + "");
            }

            ddlAnio.Items[5].Selected = true;
            LlenarComboListaMes(ddlPeriodo);

        }
    }
    public  void LlenarComboListaMes(DropDownList ddl)
    {
        string[] meses = { "enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre" };
        for (int i = 0; i < meses.Length; i++)
        {
            ddl.Items.Add(new ListItem(meses[i], (i + 1) + ""));
        }
        ddl.Items[DateTime.Now.Month].Selected = true;

    }
    protected void ddlPlanta_SelectedIndexChanged(object sender, EventArgs e)
    {
        OpcionesMultiplesDAO opDAO = new OpcionesMultiplesDAO();
        
        Utils.LlenarComboLista(ddlOperacion, opDAO.GetOpcionesMultiples2(1058, 1, int.Parse(ddlPlanta.SelectedValue), 9),"ID","DSNOMBRE");
        Utils.LlenarComboLista(ddlLinea, opDAO.GetOpcionesMultiples2(-1, -1, -1,-1), "ID", "DSNOMBRE");

        CargarIndicadores();
    }
    protected void ddlOperacion_SelectedIndexChanged(object sender, EventArgs e)
    {
        OpcionesMultiplesDAO opDAO = new OpcionesMultiplesDAO();

        Utils.LlenarComboLista(ddlLinea, opDAO.GetOpcionesMultiples(1064, 1, int.Parse(ddlPlanta.SelectedValue),ddlOperacion.SelectedValue, 9,1058), "ID", "DSNOMBRE");

        CargarIndicadores();
      
    }
    protected void ddlAnio_SelectedIndexChanged(object sender, EventArgs e)
    {
        CargarIndicadores();
    }

    private void CargarIndicadores()
    {

        MatrizPerdidaDAO matriz = new MatrizPerdidaDAO();
        DSRepositorioIndicadores.MatrizPerdidaVODataTable dt= matriz.GetIndicadores(int.Parse(ddlAnio.SelectedValue), int.Parse(ddlPeriodo.SelectedValue), int.Parse(ddlLinea.SelectedValue), int.Parse(ddlOperacion.SelectedValue), int.Parse(ddlPlanta.SelectedValue));
        string cad = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            cad += "<tr>";

            cad += "<td><a href='https://www.conectandonosconlaestrategia.com/RepositorioIndicadores/Indicadores/Actualizar.aspx?id=" + dt[i].ID + "' target='_blank'>" + dt[i].DSNOMBRE + "</a></td>";
            cad += "<td>" +(dt[i].IsUNIDADMEDIDANull()?"":  dt[i].UNIDADMEDIDA) + "</td>";
            cad += "<td><input type='text' size='12' class='easyui-numberbox' data-options='precision:1' onchange='fnCambioValor(" + dt[i].ID+ ",7,this.value)' style='text-align: right;' value='" + (dt[i].IsREALUMNull() ? "" : dt[i].REALUM.ToString()) + "'/></td>";
            cad += "<td><input type='text' size='12' class='easyui-numberbox' data-options='precision:1' onchange='fnCambioValor(" + dt[i].ID + ",5,this.value)' style='text-align: right;' value='" + (dt[i].IsPREUMNull() ? "" : dt[i].PREUM.ToString()) + "'/></td>";
            cad += "<td><input type='text' size='12' class='easyui-numberbox' data-options='precision:1' onchange='fnCambioValor(" + dt[i].id2 + ",7,this.value)' style='text-align: right;' value='" + (dt[i].IsREALPESNull() ? "" : dt[i].REALPES.ToString()) + "'/></td>";
            cad += "<td><input type='text' size='12' class='easyui-numberbox' data-options='precision:1' onchange='fnCambioValor(" + dt[i].id2 + ",5,this.value)'  style='text-align: right;' value='" + (dt[i].IsPREPESNull() ? "" : dt[i].PREPES.ToString()) + "'/></td>";
            cad += "<td><textarea  rows='1'  cols='25'  onchange='fnCambioValor2(" + dt[i].ID + ",4,this.value)' style='font-size: 9px;height: 20px;line-height: 10px;width: 90%;'>" + (dt[i].IsCOMENNull() ? "" : dt[i].COMEN) + "</textarea></td>";
            cad += "</tr>";
        }

        lblTabla.Text = cad;

        lblTotPlanR.Text= "$ "+matriz.GetTotal(int.Parse(ddlAnio.SelectedValue), int.Parse(ddlPeriodo.SelectedValue), 1026,int.Parse(ddlPlanta.SelectedValue));

        lblTotPlanP.Text = "$ " + matriz.GetTotal(int.Parse(ddlAnio.SelectedValue), int.Parse(ddlPeriodo.SelectedValue), 1027, int.Parse(ddlPlanta.SelectedValue));



       // lblTotLinea.Text= "$ "+matriz.GetTotal(int.Parse(ddlAnio.SelectedValue), int.Parse(ddlPeriodo.SelectedValue), int.Parse(ddlLinea.SelectedValue));
      
    }
    protected void ddlLinea_SelectedIndexChanged(object sender, EventArgs e)
    {
        CargarIndicadores();
    }
    protected void ddlPeriodo_SelectedIndexChanged(object sender, EventArgs e)
    {
        CargarIndicadores();
    }
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
}