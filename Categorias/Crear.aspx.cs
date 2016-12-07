using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using com.triario.repositorio.util;
using System.Web.Services;
/// <summary>
/// Esta clase se encarga de visualizar la pantalla de administración Categorías 
/// </summary>
public partial class Categorias_Crear : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y vsiualiza la configuración ya realizada sobre las categorias
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CamposDAO campDAO = new CamposDAO();
            Utils.LlenarComboListaCheck(chkblCampos, campDAO.GetCampos(), "ID", "DSNOMBRE");



        }
        divError.Style["display"] = "none";
        divMsg.Style["display"] = "none";
        //if (Request.Form["__EVENTTARGET"] == "btnAnadirAgrup")
        //{
        //    //fire event
        //    btnAnadirAgrup_Click(this, new EventArgs());
        //}

        // ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "tabs", "<script>cargarTabs();</script>", false);
        //ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "validar", "<script>validarEngine();</script>", false);
    }
    /// <summary>
    /// Metodo web que guarda el arbol de nivel de profundizacion ara una categoria
    /// </summary>
    /// <param name="cad">Cadena con el arbol a guardar</param>
    /// <param name="cat">Categoria a la cual pertenece el arbol</param>
    [WebMethod]
    public static void GuardarTree(string cad, string cat)
    {
        CamposXCategoriaDAO campDAO = new CamposXCategoriaDAO();
        campDAO.DeleteCamposXCat(int.Parse(cat));
        string[] vec1 = cad.Split(new char[] { ',' });
        for (int i = 0; i < vec1.Length; i++)
        {
            if (vec1[i].Trim() == "")
                continue;
            string[] vec2 = vec1[i].Split(new char[] { '@' });
            int orden = int.Parse(vec2[1].Trim());


            string[] vec3 = vec2[0].Split(new char[] { ':' });
            int id = int.Parse(vec3[0].Trim());
            int? padre = null;
            if (vec3.Length > 1)
            {
                padre = int.Parse(vec3[1].Trim());
            }

            campDAO.UpdateOrdenCamposXCat(orden, padre, id);

        }
    }
    /// <summary>
    /// Metodo web que elimina una categoria
    /// </summary>
    /// <param name="cat">Categoria a eliminar</param>
    [System.Web.Services.WebMethod]
    public static void EliminarCat(string cat)
    {
        CategoriasDAO catDAO = new CategoriasDAO();
        catDAO.DeleteCategoria(int.Parse(cat));
    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón crear categoria, el sistema creara la categoria
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void btnCrear_Click(object sender, EventArgs e)
    {
        try
        {
            CategoriasDAO catDAO = new CategoriasDAO();
            catDAO.InsertCategoria(txtNombrecategoria.Text);
            divMsg.Style["display"] = "";
            msgExito.InnerText = Utils.GetMensaje("CREAR_CATEGORIA");
            txtNombrecategoria.Text = "";
        }
        catch (Exception exc)
        {
            Utils.RegistrarError(exc);
            divError.Style["display"] = "";
            msgError.InnerText = Utils.GetMensaje("ERROR");
        }

    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón crear añadir, el sistema añadira el campo seleccionado al arbol de nivel de profundizacion de la categoria seleccionada
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void btnAnadir_Click(object sender, EventArgs e)
    {
        if (hdIdCat.Value == "")
        {
            divError.Style["display"] = "";
            msgError.InnerText = Utils.GetMensaje("SELECCIONAR_CATEGORIA");
            return;
        }
        try
        {
            CamposXCategoriaDAO camDAO = new CamposXCategoriaDAO();
            for (int i = 0; i < chkblCampos.Items.Count; i++)
            {
                if (chkblCampos.Items[i].Selected)
                {
                    camDAO.InsertCampoXCategoria(int.Parse(hdIdCat.Value), int.Parse(chkblCampos.Items[i].Value), null, null);
                }
                chkblCampos.Items[i].Selected = false;
            }


            divMsg.Style["display"] = "";
            msgExito.InnerText = Utils.GetMensaje("ASIGNAR_CAMPOS_CATEGORIA");

        }
        catch (Exception exc)
        {
            Utils.RegistrarError(exc);
            divError.Style["display"] = "";
            msgError.InnerText = Utils.GetMensaje("ERROR");
        }
    }
    /// <summary>
    /// Metodo que construye un nodo del arbol de nivel de profundizacion
    /// </summary>
    /// <param name="cat">Categoria a la que pertenece el arbol de nivel de profundizacion</param>
    /// <param name="nodo">Nodo del arbol a construir</param>
    public void ConstruirNodo(int cat, DSRepositorioIndicadores.CamposVORow nodo)
    {

        if (nodo.IDLISTA == -1)
        {

            cad += "  <li data-options=\"iconCls:'icon-tip',id:" + nodo.ID + "\" > ";

        }
        else
        {

            cad += "  <li data-options=\"id:" + nodo.ID + "\" > ";
        }



        cad += "<span>" + nodo.DSNOMBRE + " </span>";



        CamposDAO cam = new CamposDAO();
        DSRepositorioIndicadores.CamposVODataTable nodes = cam.GetCamposXCatHij(nodo.ID, cat);

        if (nodes.Count > 0)
        {
            cad += "<ul>";
        }


        for (int i = 0; i < nodes.Count; i++)
        {

            ConstruirNodo(cat, nodes[i]);
        }

        if (nodes.Count > 0)
        {
            cad += "</ul>";
        }

        cad += "  </li>";





    }
    private string cad = "";
    /// <summary>
    /// Metodo que construye  el arbol de nivel de profundizacion
    /// </summary>
    /// <param name="cat">Categoria a la que pertenece el arbol de nivel de profundizacion</param>
    public string ConstruirArbol(int cat)
    {

        cad = "  <ul id=\"tt-" + cat + "\" class=\"easyui-tree\" data-options=\"animate:true,dnd:true,onClick: function(node){" +
               "$(this).tree('toggle', node.target);" +
           "},onContextMenu: function(e,node){ " +
           "	e.preventDefault(); " +
           "	$(this).tree('select',node.target); " +
           "	$('#mm" + cat + "').menu('show',{ " +
           "		left: e.pageX, " +
       "			top: e.pageY " +
       "		}); " +
       "	}\"\"> ";





        DSRepositorioIndicadoresTableAdapters.CamposDAO camDAO = new DSRepositorioIndicadoresTableAdapters.CamposDAO();
        DSRepositorioIndicadores.CamposVODataTable dtc = camDAO.GetCamposXCatPadre(cat);
        for (int j = 0; j < dtc.Count; j++)
        {


            ConstruirNodo(cat, dtc[j]);

        }

        cad += "</ul> " +
    "<script>" +
       " $('#tt-" + cat + "').tree({" +
          "  onDrop: function (target, source, point) {" +
            "   EnviarTree(guardarTree(" + cat + ")," + cat + ");" +

           " }" +
       " });" +
    " </script>   ";
        cad += "<div id=\"mm" + cat + "\" class=\"easyui-menu\" style=\"width:120px;\"> " +

    "<div onclick=\"remove(" + cat + ")\" data-options=\"iconCls:'icon-remove'\">Eliminar</div>" +

    "</div>";
        return cad;

    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón crear añadir agrupador, el sistema añadira el agrupador seleccionado al arbol de nivel de profundizacion de la categoria seleccionada
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void btnAnadirAgrup_Click(object sender, EventArgs e)
    {
        if (hdIdCat.Value == "")
        {
            divError.Style["display"] = "";
            msgError.InnerText = Utils.GetMensaje("SELECCIONAR_CATEGORIA");
            return;
        }

        try
        {
            CamposXCategoriaDAO camDAO = new CamposXCategoriaDAO();

            camDAO.InsertCampoXCategoria(int.Parse(hdIdCat.Value), null, Request["__EVENTARGUMENT"], null);



            divMsg.Style["display"] = "";
            msgExito.InnerText = Utils.GetMensaje("ASIGNAR_CAMPOS_CATEGORIA");

        }
        catch (Exception exc)
        {
            Utils.RegistrarError(exc);
            divError.Style["display"] = "";
            msgError.InnerText = Utils.GetMensaje("ERROR");
        }
    }
    protected void dtnEscenarios_Click(object sender, EventArgs e)
    {
       

    }

    protected void btnGuardarCnfEsc_Click(object sender, EventArgs e)
    {
         

    }
}