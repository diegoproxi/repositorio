using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using System.Data;
/// <summary>
///  Esta clase se encarga de visualizar la pantalla de edición de items de una lista de valores, la cual permite crear y modificar cnuevos items a una lista
/// </summary>
public partial class Administracion_Items : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y vsiualiza los items ya creados para la lista
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarPadre();
        }

        OpcionesListaDAO op = new OpcionesListaDAO();
        System.Data.DataTable dtitems = null;
        if (Request["lista"] != null)
        {
            if (Request["lista"] == "NMLISTA1")
            {
                dtitems = op.GetValoresLista(27);
            }
            else if (Request["lista"] == "NMLISTA2")
            {
                dtitems = op.GetValoresLista(28);
            }

            else if (Request["lista"] == "NMLISTA3")
            {
                dtitems = op.GetValoresLista(29);
            }
            else if (Request["lista"] == "NMLISTA4")
            {
                dtitems = op.GetValoresLista(30);
            }
            GridView1.DataSource = dtitems;
            GridView1.DataBind();
        }
        else 
        {

            dtitems = op.GetValoresLista(Convert.ToInt32(Session["idlista"]));
            GridView1.DataSource = dtitems;
            GridView1.DataBind();
        }
        Session["dt"] = GridView1.DataSource;
    }
    private void CargarPadre()
    {
        if (Request["lista"] != null)
        {
            AtributosDAO cam = new AtributosDAO();
            System.Data.DataTable dc = cam.SelectAtributo(Convert.ToInt32(Request["idlista"]));

            OpcionesListaDAO atr = new OpcionesListaDAO();
            System.Data.DataTable dt = atr.GetValoresLista(Convert.ToInt32(dc.Rows[0]["IDLISTA"]));
            System.Data.DataRow dr = dt.NewRow();
            dr["ID"] = "-1";
            dr["DSNOMBRE"] = "";
            dr["IDLISTA"] = dc.Rows[0]["IDLISTA"].ToString();
            dt.Rows.InsertAt(dr, 0);
            DropDownList1.DataSource = dt;
            DropDownList1.DataValueField = "id";
            DropDownList1.DataTextField = "DSNOMBRE";
            DropDownList1.DataBind();
        }
        else if (Request["id"] != null)
        {
            OpcionesListaDAO atr = new OpcionesListaDAO();
            Session["idlista"] = Request["id"];
            lista_valoresDAO lisDAO = new lista_valoresDAO();
            int? padre = lisDAO.GetPadre(Convert.ToInt32(Request["id"]));
            System.Data.DataTable dt = atr.GetValoresLista(padre == null ? -1 : padre.Value);
            System.Data.DataRow dr = dt.NewRow();
            dr["ID"] = "-1";
            dr["DSNOMBRE"] = "";
            dr["IDLISTA"] = Request["id"];
            dt.Rows.InsertAt(dr, 0);
            DropDownList1.DataSource = dt;
            DropDownList1.DataValueField = "id";
            DropDownList1.DataTextField = "DSNOMBRE";
            DropDownList1.DataBind();
        }
        else
        {
            CamposDAO CAM = new CamposDAO();
            System.Data.DataTable dtcampo = CAM.GetCampo(Convert.ToInt32(Request["idlista"]));
            Session["idlista"] = dtcampo.Rows[0]["IDLISTA"];
            OpcionesListaDAO atr = new OpcionesListaDAO();
            if (dtcampo.Rows[0]["IDDEPENDIENTE"] != DBNull.Value)
            {
                dtcampo = CAM.GetCampo(Convert.ToInt32(dtcampo.Rows[0]["IDDEPENDIENTE"]));
                System.Data.DataTable dt = atr.GetValoresLista(Convert.ToInt32(dtcampo.Rows[0]["IDLISTA"]));
                System.Data.DataRow dr = dt.NewRow();
                dr["ID"] = "-1";
                dr["DSNOMBRE"] = "";
                dr["IDLISTA"] = dtcampo.Rows[0]["IDLISTA"].ToString();
                dt.Rows.InsertAt(dr, 0);
                DropDownList1.DataSource = dt;
                DropDownList1.DataValueField = "id";
                DropDownList1.DataTextField = "DSNOMBRE";
                DropDownList1.DataBind();
            }
        }
    }
    /// <summary>
    /// Metodo que carga los items de una lista
    /// </summary>

    private void Cargar()
    {

        OpcionesListaDAO op = new OpcionesListaDAO();
        System.Data.DataTable dtitems = null;
        if (Request["lista"] != null)
        {
            if (Request["lista"] == "NMLISTA1")
            {
                dtitems = op.GetValoresLista(27);
            }
            else if (Request["lista"] == "NMLISTA2")
            {
                dtitems = op.GetValoresLista(28);
            }

            else if (Request["lista"] == "NMLISTA3")
            {
                dtitems = op.GetValoresLista(29);
            }
            else if (Request["lista"] == "NMLISTA4")
            {
                dtitems = op.GetValoresLista(30);
            }
            GridView1.DataSource = dtitems;
            GridView1.DataBind();
        }
        else
        {

            dtitems = op.GetValoresLista(Convert.ToInt32(Session["idlista"]));
            GridView1.DataSource = dtitems;
            GridView1.DataBind();
        }
        Session["dt"] = GridView1.DataSource;
    }

    
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón guardar, el sistema guarda o modifica la información dle item
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        OpcionesListaDAO OP = new OpcionesListaDAO();
        int? PADRE=null;
        if(DropDownList1.Items.Count!=0)
        {
            if (DropDownList1.SelectedValue != "-1")
            {

                PADRE = Convert.ToInt32(DropDownList1.SelectedValue);

            }
                    }
        if (Request["lista"] != null)
        {
            if (Request["lista"] == "NMLISTA1")
            {
                OP.PRC_TRI_REP_INSERT_VALORES_LISTA(27, null, PADRE, txtvalor.Text,null, null, false,  txxtdesc.Text);
                Response.Write("<script>alert('Item insertado correctamente')</script>");
            }
            else if (Request["lista"] == "NMLISTA2")
            {
                OP.PRC_TRI_REP_INSERT_VALORES_LISTA(28, null, PADRE, txtvalor.Text, null, null, false,txxtdesc.Text);
                Response.Write("<script>alert('Item insertado correctamente')</script>");
            }

            else if (Request["lista"] == "NMLISTA3")
            {
                OP.PRC_TRI_REP_INSERT_VALORES_LISTA(29, null, PADRE, txtvalor.Text,null, null, false,  txxtdesc.Text);
                Response.Write("<script>alert('Item insertado correctamente')</script>");
            }
            else if (Request["lista"] == "NMLISTA4")
            {
                OP.PRC_TRI_REP_INSERT_VALORES_LISTA(30, null, PADRE, txtvalor.Text,null, null, false, txxtdesc.Text);
                Response.Write("<script>alert('Item insertado correctamente')</script>");
                
            }
        }
        else {
            if (hdId.Value == "")
            {

                OP.PRC_TRI_REP_INSERT_VALORES_LISTA(Convert.ToInt32(Session["idlista"]), null, PADRE, txtvalor.Text, null, null, false, txxtdesc.Text);
                Response.Write("<script>alert('Item insertado correctamente')</script>");
            }
            else
            {
                OP.UpdateQuery(txtvalor.Text,txxtdesc.Text,int.Parse(hdId.Value));
                Response.Write("<script>alert('Item modificado correctamente');</script>");
                txtvalor.Text = "";
                txxtdesc.Text = "";
                hdId.Value = "";
                DropDownList1.SelectedValue = "-1";
            }
            
        }
        Cargar();
        CargarPadre();

    }
    /// <summary>
    /// Metodo que se activa en el momento en que el usuario presiona algun botón en el grid
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id = int.Parse(e.CommandArgument.ToString());
        if (e.CommandName.Equals("eliminar"))
        {
            OpcionesListaDAO ol = new OpcionesListaDAO();
            ol.DeleteItem(true, id);
            Response.Write("<script>alert('Item Eliminado correctamente')</script>");
            Cargar();

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
            LinkButton link = (LinkButton)e.Row.Cells[2].FindControl("ibtnDelete");
            link.Attributes.Add("OnClick", "javascript: if(confirm('Está seguro que desea eliminar el item?')== false) return false");
        }
    }
    /// <summary>
    /// Metodo que se activa en el momento en que el usuario desea cambiar de página en el paginador del grid 
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = (DataTable)Session["dt"];

        GridView1.DataBind();
    }
}