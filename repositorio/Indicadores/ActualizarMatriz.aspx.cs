using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using com.triario.repositorio.util;
using System.Web.Services;
using DotNetNuke.Entities.Users;
using DotNetNuke.Security.Roles;

public partial class Indicadores_ActualizarMatriz : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            OpcionesListaBuscadorDAO opDAO = new OpcionesListaBuscadorDAO();

             DSRepositorioIndicadores.OpcionesListaBuscadorVODataTable dt=opDAO.GetOpcionesxlista(9);

             Utils.LlenarComboLista(ddlPlanta, dt, "ID", "DSNOMBRE");
            
             RolesUserDAO ru = new RolesUserDAO();


           DSRepositorioIndicadores.RolesUserVODataTable roles = ru.GetRoles(int.Parse(Session["userid"].ToString()));




           if (!IsAdmin())
           {
               for (int i = ddlPlanta.Items.Count - 1; i >= 1; i--)
               {
                   bool enc = false;
                   //if( !user.IsInRole(ddlPlanta.SelectedValue +";"))
                   //    ddlPlanta.Items[i].Text = "";
                   for (int j = 0; j < roles.Rows.Count; j++)
                   {

                       if (ddlPlanta.Items[i].Text.ToUpper().Equals(roles[j].RoleName.ToUpper()))
                       {
                           enc = true;
                       }
                   }
                   if (!enc)
                   {
                       ddlPlanta.Items.RemoveAt(i);
                   }
               }

           }



          
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
        ddl.Items[DateTime.Now.Month-1].Selected = true;

    }
    protected void ddlPlanta_SelectedIndexChanged(object sender, EventArgs e)
    {
        OpcionesMultiplesDAO opDAO = new OpcionesMultiplesDAO();
        
        Utils.LlenarComboLista(ddlOperacion, opDAO.GetOpcionesMultiples2(1058, 1, int.Parse(ddlPlanta.SelectedValue), 9),"ID","DSNOMBRE");


        RolesUserDAO ru = new RolesUserDAO();


        DSRepositorioIndicadores.RolesUserVODataTable roles = ru.GetRoles(int.Parse(Session["userid"].ToString()));



        if (!IsAdmin())
        {

            for (int i = ddlOperacion.Items.Count - 1; i >= 1; i--)
            {
                bool enc = false;
                //if( !user.IsInRole(ddlPlanta.SelectedValue +";"))
                //    ddlPlanta.Items[i].Text = "";
                for (int j = 0; j < roles.Rows.Count; j++)
                {

                    if (ddlOperacion.Items[i].Text.ToUpper().Contains(roles[j].RoleName.ToUpper()))
                    {
                        enc = true;
                    }
                }
                if (!enc)
                {
                    ddlOperacion.Items.RemoveAt(i);
                }
            }
        }
        






        Utils.LlenarComboLista(ddlLinea, opDAO.GetOpcionesMultiples2(-1, -1, -1,-1), "ID", "DSNOMBRE");

        CargarIndicadores();
    }
    public bool IsAdmin()
    {
        RolesUserDAO ru = new RolesUserDAO();
        DSRepositorioIndicadores.RolesUserVODataTable roles = ru.GetRoles(int.Parse(Session["userid"].ToString()));
        if (Session["userid"].ToString() == "1" || Session["userid"].ToString() == "248" || Session["userid"].ToString() == "546")
            return true;
        for (int j = 0; j < roles.Rows.Count; j++)
        {

            if (roles[j].RoleName.ToUpper().Contains("Administrador"))
            {
                return true;
            }
        }
        return false;

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
        decimal pre = 0;
        decimal re = 0;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            cad += "<tr id='tr" + dt[i].ID + "'>";

            cad += "<td>";
            if (IsAdmin())
            {
                cad += " <div class='fields'><a href='javascript:eliminarMatriz(" + dt[i].ID + ")'><img src='https://www.conectandonosconlaestrategia.com/images/delete.gif' /></a></div>";
            }

            cad+="<a href='https://www.conectandonosconlaestrategia.com/RepositorioIndicadores/Indicadores/Actualizar.aspx?id=" + dt[i].ID + "' target='_blank'>" + dt[i].DSNOMBRE + "</a></td>";
            cad += "<td>" +(dt[i].IsUNIDADMEDIDANull()?"":  dt[i].UNIDADMEDIDA) + "</td>";
            cad += "<td><input type='text' size='12' class='easyui-numberbox' data-options='precision:1' onchange='fnCambioValor(" + dt[i].ID+ ",7,this.value)' style='text-align: right;' value='" + (dt[i].IsREALUMNull() ? "" : dt[i].REALUM.ToString()) + "'/></td>";
            cad += "<td><input type='text' size='12' class='easyui-numberbox' data-options='precision:1' onchange='fnCambioValor(" + dt[i].ID + ",5,this.value)' style='text-align: right;' value='" + (dt[i].IsPREUMNull() ? "" : dt[i].PREUM.ToString()) + "'/></td>";
            cad += "<td><input type='text' size='12' class='easyui-numberbox' data-options='precision:1' onchange='fnCambioValor(" + dt[i].id2 + ",1026,this.value)' style='text-align: right;' value='" + (dt[i].IsREALPESNull() ? "" : dt[i].REALPES.ToString()) + "'/></td>";
            cad += "<td><input type='text' size='12' class='easyui-numberbox' data-options='precision:1' onchange='fnCambioValor(" + dt[i].id2 + ",1027,this.value)'  style='text-align: right;' value='" + (dt[i].IsPREPESNull() ? "" : dt[i].PREPES.ToString()) + "'/></td>";
            cad += "<td><textarea  rows='1'  cols='25'  onchange='fnCambioValor2(" + dt[i].ID + ",4,this.value)' style='font-size: 9px;height: 20px;line-height: 10px;width: 90%;'>" + (dt[i].IsCOMENNull() ? "" : dt[i].COMEN) + "</textarea></td>";
            cad += "</tr>";
            if (dt[i].DSNOMBRE != "COSTO PRODUCCIÓN")
            {
                pre += dt[i].IsPREPESNull() ? 0 : dt[i].PREPES;
                re += dt[i].IsREALPESNull() ? 0 : dt[i].REALPES;
            }
        }
        decimal pre2 = 0;
        decimal re2 = 0;
        //DSRepositorioIndicadores.MatrizPerdidaVODataTable dt2 = matriz.GetIndicadores(int.Parse(ddlAnio.SelectedValue), int.Parse(ddlPeriodo.SelectedValue), -1, -1, int.Parse(ddlPlanta.SelectedValue));
        //for (int i = 0; i < dt.Rows.Count; i++)
        //{
        //    if (dt2[i].DSNOMBRE != "COSTO OPERACIÓN")
        //    {
        //        pre2 += dt2[i].IsPREPESNull() ? 0 : dt2[i].PREPES;
        //        re2 += dt2[i].IsREALPESNull() ? 0 : dt2[i].REALPES;
        //    }

        //}

        lblTabla.Text = cad;

        lblTotPlanR.Text = "$ " + matriz.GetTotal2(1026, int.Parse(ddlAnio.SelectedValue), int.Parse(ddlPeriodo.SelectedValue), int.Parse(ddlPlanta.SelectedValue), int.Parse(ddlOperacion.SelectedValue));

        lblTotPlanP.Text = "$ " + matriz.GetTotal2(1027, int.Parse(ddlAnio.SelectedValue), int.Parse(ddlPeriodo.SelectedValue), int.Parse(ddlPlanta.SelectedValue), int.Parse(ddlOperacion.SelectedValue));

        //lblTotPlanR.Text = "$ " + pre2.ToString("N");
        //lblTotPlanP.Text = "$ " + re2.ToString("N");


        lblTotLineaP.Text = "$ " + pre.ToString("N");
        lblTotLineaR.Text = "$ " + re.ToString("N");

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
    [WebMethod]
    public static void EliminarInd(int ind)
    {
        PerdidasDAO indDAO = new PerdidasDAO();
        indDAO.EliminarMatriz(ind);
    }

}