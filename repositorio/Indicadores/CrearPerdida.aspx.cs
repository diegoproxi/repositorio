using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using com.triario.repositorio.util;
using System.Collections;
using System.Web.Services;
using System.Data;
/// <summary>
/// Esta clase se encarga de visualizar la pantalla de creación de indicadores
/// </summary>
public partial class Indicadores_CrearPerdida : System.Web.UI.Page
{
    string dependencias;
    /// <summary>
    /// Metodo que carga los componentes de la página y carga las lsitas necesarias para la creación de un indicador. Si se esta modificamdo el idnicador , carga los valores que tiene este
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        
       
        if (!IsPostBack)
        {
            //CategoriasDAO catDAO = new CategoriasDAO();
            //Utils.LlenarComboLista(ddlCategoria, catDAO.GetCategorias(), "ID", "DSNOMBRE");

        
          

            DSRepositorioIndicadores.UsuariosVORow usuVO = Utils.GetUsuario(Session,Response);

           // RegionesDAO regDAO = new RegionesDAO();
     
            //Utils.LlenarComboLista(ddlRegion, regDAO.GetRegionesXUsu(usuVO.ID), "ID", "DSNOMBRE");


            OpcionesListaBuscadorDAO opDAO = new OpcionesListaBuscadorDAO();
            Utils.LlenarComboLista(ddlOperacion,opDAO.GetOpcionesxlista(1058) ,"ID","DSNOMBRE");



            DiccionarioIndicadoresDAO dicDAO = new DiccionarioIndicadoresDAO();

            Utils.LlenarComboLista(ddlNombre, dicDAO.GetDiccionario(), "ID", "DSNOMBRE");


            PerdidasDAO indDAO = new PerdidasDAO();
          


            Session["atributos"] = null;
            Session["atributos"] = new Hashtable();
            

             Session["configuraciones"] = null;
            Session["configuraciones"] = new Hashtable();


            if (Request["id"]!=null&&Request["id"]!="")
            {
               
                 DSRepositorioIndicadores.PerdidasVODataTable indvo= indDAO.GetPerdida(int.Parse(Request["id"]));
                

                ddlNombre.SelectedValue =  indvo[0].IDDICCIONARIO+"";

                ddlOperacion.SelectedValue = indvo[0].IDOPE + "";

                ValoresXCampoXPerdDAO valdao = new ValoresXCampoXPerdDAO();
                DSRepositorioIndicadores.ValoresXCampoXPerdVODataTable dtv= valdao.GetValoresXCampo(int.Parse(Request["id"]), 9);
                DSRepositorioIndicadores.ValoresXCampoXPerdVODataTable dtv2 = valdao.GetValoresXCampo(int.Parse(Request["id"]), 1049);

                OpcionesMultiplesDAO opDAO2 = new OpcionesMultiplesDAO();


                Utils.LlenarComboLista(ckPlantas, opDAO2.GetOpcionesMultiples2(9, 1, int.Parse(ddlOperacion.SelectedValue), 1058), "ID", "DSNOMBRE");
                Utils.LlenarComboLista(cklineas, opDAO2.GetOpcionesMultiples2(1064, 1, int.Parse(ddlOperacion.SelectedValue), 1058), "ID", "DSNOMBRE");

                for (int i = 0; i < dtv.Rows.Count; i++)
                {
                    for (int j = 0; j < ckPlantas.Items.Count; j++)
                    {
                        if (ckPlantas.Items[j].Value == dtv[i].IDVALOR + "")
                        {
                            ckPlantas.Items[j].Selected = true;
                        }
                    }
                }



                for (int i = 0; i < dtv2.Rows.Count; i++)
                {
                    for (int j = 0; j < cklineas.Items.Count; j++)
                    {
                        if (cklineas.Items[j].Value == dtv2[i].IDVALOR + "")
                        {
                            cklineas.Items[j].Selected = true;
                        }
                    }
                }

                //txtAux.Text = indvo[0].IsDSAUXNull() ? "" : indvo[0].DSAUX;


               

               
            //    txt = indvo[0].IsIDCATEGORIANull() ? "-1" : indvo[0].IDCATEGORIA + ""; 

          
              GuardarAtributos(indvo[0]);
                 //GuardarConfiguraciones(indvo[0]);
              
                 hdInd.Value = Request["id"];
                 hdCat.Value = "1";
                 //txtNombreAux.Text = ddlNombre.SelectedItem.Text + " " + txtAux.Text;
                 //if (hdCat.Value == "8" || hdCat.Value=="-1")
                 //{
                    
                 //}




            }


        }
       

       
        divError.Style["display"] = "none";
        divMsg.Style["display"] = "none";
    }
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        OpcionesMultiplesDAO opDAO = new OpcionesMultiplesDAO();
        Utils.LlenarComboLista(ckPlantas, opDAO.GetOpcionesMultiples2(9, 1, int.Parse(ddlOperacion.SelectedValue), 1058), "ID", "DSNOMBRE");
        Utils.LlenarComboLista(cklineas, opDAO.GetOpcionesMultiples2(1064, 1, int.Parse(ddlOperacion.SelectedValue), 1058), "ID", "DSNOMBRE");
    }


    /// <summary>
    /// Metodo que carga la lsita de las categorias con su respectivo arbol de profundizacion
    /// </summary>
    //public void GetCategorias()
    //{


       
    //    string valaux = ddlCategoria.SelectedValue;
    //    ddlCategoria.Items.Clear();

    //    ddlCategoria.Items.Add(new ListItem("","-1"));

    //    CategoriasDAO catDAO = new CategoriasDAO();
    //    DSRepositorioIndicadoresTableAdapters.CamposDAO camDAO = new DSRepositorioIndicadoresTableAdapters.CamposDAO();
        

    //    DSRepositorioIndicadores.CategoriasVODataTable catdt= catDAO.GetCategorias();
    //    for (int i = 0; i < catdt.Count; i++)
    //    {
    //        ListItem li=new ListItem(catdt[i].DSNOMBRE, catdt[i].ID+"");

    //        li.Attributes["disabled"] = "disabled";
    //        ddlCategoria.Items.Add(li);
           
    //        DSRepositorioIndicadores.CamposVODataTable dtc = camDAO.GetCamposXCatPadre2(catdt[i].ID);
    //        for (int j = 0; j < dtc.Count; j++)
    //        {


    //            GetCategoriasHijas(catdt[i].ID, dtc[j], 1);

    //        }

    //    }
    //    ddlCategoria.SelectedValue = valaux;

    //}
    /// <summary>
    /// Función que recupera la categoria seleccionada por el usuario
    /// </summary>
    /// <returns>Categoria seleccionada</returns>
    //public int GetCategoriaSeleccionada()
    //{
    //    if (ddlCategoria.SelectedItem.Value == "-1")
    //    {
    //        if (hdCat.Value != "")
    //        {
    //            return int.Parse(hdCat.Value);
    //        }
    //        return -1;
    //    }
    //    string cat=ddlCategoria.SelectedValue;
    //    string[] vec = cat.Split(new char[] { '-' });
    //    if (vec.Length > 0)
    //    {
    //        return int.Parse(vec[0]);
    //    }
    //    else
    //    {
    //        return  int.Parse(cat);
    //    }
    //}
    /// <summary>
    /// Función que recupera el nivel de profundizacion seleccionado
    /// </summary>
    /// <returns>Nivel de profundizacion seleccionado</returns>
    //public int GetCampoSeleccionado()
    //{
    //    string cat = ddlCategoria.SelectedValue;
    //    string[] vec = cat.Split(new char[] { '-' });
    //    if (vec.Length > 0)
    //    {
    //        return int.Parse(vec[1]);
    //    }
    //    else
    //    {
    //        return int.Parse(cat);
    //    }
    //}
    /// <summary>
    /// Funcion que retorna una cadena identada con el caracter __
    /// </summary>
    /// <param name="cant">Cantidad de identación que le debe aplicar a la cadena</param>
    /// <returns></returns>
    private string GetEspacios(int cant)
    {
        string cad="";
        for(int i=0;i<cant;i++){
            cad += "__";
        }
        return cad;
    }
    /// <summary>
    /// Metodo recursivo que recorre las categorias hijas en el arbol de profundización 
    /// </summary>
    /// <param name="cat">Categoria a la que pertenece el arbol</param>
    /// <param name="nodo">Nodo desde el cual va a comenzar el recorrido</param>
    /// <param name="espacios">Espacios de identación que tendran los items del arbol</param>
    //public void GetCategoriasHijas(int cat, DSRepositorioIndicadores.CamposVORow nodo, int espacios)
    //{
    //    ListItem li = new ListItem(GetEspacios(espacios) + nodo.DSNOMBRE, cat + "-" + nodo.IDCAMXCAT);
    //    if(nodo.IDLISTA==-1)
    //        li.Attributes["disabled"] = "disabled";
    //    ddlCategoria.Items.Add(li);

        


    //    CamposDAO cam = new CamposDAO();
    //    DSRepositorioIndicadores.CamposVODataTable nodes = cam.GeCamposXCatHij2(nodo.IDCAMXCAT, cat);




    //    for (int i = 0; i < nodes.Count; i++)
    //    {

    //        GetCategoriasHijas(cat, nodes[i],espacios+1);
    //    }

      





    //}
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón continuar, el sistema lo llevara a lña siguiente pestaña
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
  
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón continuar, el sistema lo llevara a lña siguiente pestaña
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
   
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón continuar, el sistema lo llevara a lña siguiente pestaña
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
   
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón continuar, el sistema lo llevara a lña siguiente pestaña
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
 
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón continuar, el sistema lo llevara a lña siguiente pestaña
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
   

    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón continuar, el sistema lo llevara a lña siguiente pestaña
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>

    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón continuar, el sistema lo llevara a lña siguiente pestaña
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
  
    /// <summary>
    /// Metodo que guarda los atributos del idnicador que se esta creando o modificando
    /// </summary>
    /// <param name="ind">Identificador del indicador</param>
    private void GuardarAtributos(DSRepositorioIndicadores.PerdidasVORow ind)
    {
        Hashtable hsatr = (Hashtable)Session["atributos"];

        DSRepositorioIndicadoresTableAdapters.AtributosDAO atrDAO = new DSRepositorioIndicadoresTableAdapters.AtributosDAO();
        DSRepositorioIndicadores.AtributosVODataTable dtatr = atrDAO.GetAtributosConfigurados(1);
        for (int i = 0; i < dtatr.Count; i++)
        {
            if (dtatr[i].DSCOLUMNA == "DSFUENTE" || dtatr[i].DSCOLUMNA == "DSANALISIS" || dtatr[i].DSCOLUMNA == "DSDEFINICION" || dtatr[i].DSCOLUMNA == "DSREFRENCIAMEDIR")
                continue;
            string tipo = dtatr[i].DSTIPO;
            int idatr = dtatr[i].ID;

            if (!hsatr.ContainsKey("atributo" + idatr))
            {
                hsatr.Add("atributo" + idatr, null);
            }


            if (tipo.Trim() == "B")
            {
                hsatr["atributo" + idatr] = (bool)ind[dtatr[i].DSCOLUMNA] ? "1" : "0";
            }else{
                if (tipo.Trim() == "LM")
                {
                    ValoresXAtributoDAO valDAO = new ValoresXAtributoDAO();
                    DSRepositorioIndicadores.ValoresXAtributoVODataTable dtval= valDAO.GetValoresXAtriInd(idatr, ind.ID);
                    string aux = "";
                    for (int j = 0; j < dtval.Count; j++)
                    {
                        aux += dtval[j].IDVALOR + ",";
                    }

                    hsatr["atributo" + idatr] = aux;

                }
                else
                {

                    hsatr["atributo" + idatr] =  ind.IsNull(dtatr[i].DSCOLUMNA) ? "" : ind[dtatr[i].DSCOLUMNA].ToString();
                }
        }



        }
        Session["atributos"] = hsatr;
        Session["atributosant"] = hsatr.Clone();
    }
    /// <summary>
    /// Metodo que guarda los atributos seleccionado por el usuario de manera temporal, sin ir a almacenarlos directamente en la base de datos
    /// </summary>
    private void GuardarAtributos(){
        Hashtable hsatr = (Hashtable)Session["atributos"];

         DSRepositorioIndicadoresTableAdapters.AtributosDAO atrDAO = new DSRepositorioIndicadoresTableAdapters.AtributosDAO();
        DSRepositorioIndicadores.AtributosVODataTable dtatr= atrDAO.GetAtributosConfigurados(1);
         for (int i = 0; i < dtatr.Count; i++)
          {
                    string tipo = dtatr[i].DSTIPO;
                    int idatr = dtatr[i].ID;

                    if (!hsatr.ContainsKey("atributo" + idatr))
                    {
                        hsatr.Add("atributo" + idatr, null);
                    }


                    if (tipo.Trim() == "B")
                    {
                        hsatr["atributo"+idatr] = Request["atributo" + idatr]=="on"?"1":"0";
                    }
                    else
                    {

                        hsatr["atributo"+idatr] = Request["atributo" + idatr];
                    }



         }
         Session["atributos"] = hsatr;
    }
    /// <summary>
    /// Metodo que guarda los campos de profundización seleccionado por el usuario de manera temporal, sin ir a almacenarlos directamente en la base de datos
    /// </summary>
//private void GuardarConfiguraciones(){
//    Session["configuraciones"] = null;
//    Session["configuraciones"] = new Hashtable();
//        Hashtable hsatr = (Hashtable)Session["configuraciones"];

//        if (ddlCategoria.SelectedItem.Value == "-1")
//        {
//            txtNombreAux2.Value = "";
//            txtNombreAux.Text = ddlNombre.SelectedItem.Text;
//            return;
//        }

//        int idcam = GetCampoSeleccionado();

//        DSRepositorioIndicadoresTableAdapters.CamposDAO camDAO = new DSRepositorioIndicadoresTableAdapters.CamposDAO();

//        int cat = GetCategoriaSeleccionada();
//        string nom = "";
//        OpcionesListaDAO opDAO = new OpcionesListaDAO();
//        for (; ; )
//        {
//            DSRepositorioIndicadores.CamposVODataTable dtc = camDAO.GetCampoXCat(idcam);

//            if (dtc[0].IDLISTA != -1)
//            {
//                if (!hsatr.ContainsKey("configuracion" + dtc[0].ID))
//                {
//                    hsatr.Add("configuracion" + dtc[0].ID, null);
//                }

//                hsatr["configuracion" + dtc[0].ID] = Request["configuracion" + dtc[0].ID];
                
//                nom = " "+opDAO.GetNombre(int.Parse(Request["configuracion" + dtc[0].ID]))+nom;

//            }
//            if (dtc[0].IsIDPADRENull())
//            {

//                break;
//            }
//            else
//            {
//                idcam = dtc[0].IDPADRE;



//            }

//        }
//        nom = nom.Substring(1);
//        txtNombreAux2.Value = nom;
//        txtNombreAux.Text = ddlNombre.SelectedItem.Text + " " + nom;
//         Session["configuraciones"] = hsatr;
//    }
/// <summary>
/// Metodo que guarda los campos de profundización del idnicador que se esta creando o modificando
/// </summary>
/// <param name="ind">Identificador del indicador</param>
//private void GuardarConfiguraciones(DSRepositorioIndicadores.IndicadoresVORow ind)
//{
//    Session["configuraciones"] = null;
//    Session["configuraciones"] = new Hashtable();
//    Hashtable hsatr = (Hashtable)Session["configuraciones"];

//    if (!ind.IsIDCATEGORIANull())
//    {

//        DSRepositorioIndicadoresTableAdapters.ValoresXCampoDAO valDAO = new DSRepositorioIndicadoresTableAdapters.ValoresXCampoDAO();


//        string nom = "";
//        OpcionesListaDAO opDAO = new OpcionesListaDAO();
//        DSRepositorioIndicadores.ValoresXCampoVODataTable dtc = valDAO.GetValoresIndicador(ind.ID);
//        CamposDAO cam = new CamposDAO();
//        int campoaux = 0;
//        for (int i = 0; i < dtc.Count; i++)
//        {



//            if (!hsatr.ContainsKey("configuracion" + dtc[i].IDCAMPO))
//            {
//                hsatr.Add("configuracion" + dtc[i].IDCAMPO, null);
//            }

//            hsatr["configuracion" + dtc[i].IDCAMPO] = dtc[i].IDVALOR;

//            nom = " " + opDAO.GetNombre(dtc[i].IDVALOR) + nom;
//            campoaux = dtc[i].IDCAMPO;


//        }
//         //nom = nom.Substring(1);
//         txtNombreAux2.Value = nom;
//         txtNombreAux.Text = ddlNombre.SelectedItem.Text + " " + nom+" "+txtAux.Text;
//        Session["configuraciones"] = hsatr;
//        Session["configuracionesant"] = hsatr.Clone();
//        object aux = cam.GetCampoXCategoria(ind.IDCATEGORIA, campoaux);
//        ddlCategoria.SelectedValue = (ind.IDCATEGORIA + "-" + (aux == null ? "0" : aux.ToString())).Trim();
//        Session["catant"] = ddlCategoria.SelectedItem.Text;
//        //ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "prueba", "<script>alert('" + ddlCategoria.Items.Count + "');</script>", false);
//    }
//    else
//    {
//        txtNombreAux2.Value = "";
//        txtNombreAux.Text = ddlNombre.SelectedItem.Text + " " + txtAux.Text;
//    }
//}
    /// <summary>
    /// Función que retorna el valor de un atributo que ha seleccionado el usuario de manera temporal
    /// </summary>
    /// <param name="idatr">Identificador del atributo</param>
    /// <returns>Valor del atributo</returns>
    public string GetValorAtributo(int idatr)
    {
        Hashtable hsatr = (Hashtable)Session["atributos"];
        object o=null;
        if (hsatr.ContainsKey("atributo" + idatr))
        {
            o = hsatr["atributo" + idatr];
            return o == null ? "" : o.ToString();
        }
        else
        {
            return "";
        }

    }
    /// <summary>
    /// Función que retorna el valor de un atributo que ha sido almacenado antes de realizar la modificación
    /// </summary>
    /// <param name="idatr">Identificador del atributo</param>
    /// <returns>Valor del atributo</returns>
    public string GetValorAtributoant(int idatr)
    {
        Hashtable hsatr = (Hashtable)Session["atributosant"];
        object o = null;
        if (hsatr.ContainsKey("atributo" + idatr))
        {
            o = hsatr["atributo" + idatr];
            return o == null ? "" : o.ToString();
        }
        else
        {
            return "";
        }

    }
    /// <summary>
    /// Función que retorna el valor de un campo de profundización que ha seleccionado el usuario de manera temporal
    /// </summary>
    /// <param name="idatr">Identificador del campo</param>
    /// <returns>Valor del campo</returns>
    //  public string GetValorConfiguracion(int idatr)
    //{
    //    Hashtable hsatr = (Hashtable)Session["configuraciones"];
    //    object o=null;
    //    if (hsatr.ContainsKey("configuracion" + idatr))
    //    {
    //        o = hsatr["configuracion" + idatr];
    //        return o == null ? "" : o.ToString();
    //    }
    //    else
    //    {
    //        return "";
    //    }

    //}
      /// <summary>
      /// Función que retorna el valor de un campos d eprofundización que ha sido almacenado antes de realizar la modificación
      /// </summary>
      /// <param name="idatr">Identificador del campo</param>
      /// <returns>Valor del campo</returns>
      //public string GetValorConfiguracionant(int idatr)
      //{
      //    Hashtable hsatr = (Hashtable)Session["configuracionesant"];
      //    object o = null;
      //    if (hsatr.ContainsKey("configuracion" + idatr))
      //    {
      //        o = hsatr["configuracion" + idatr];
      //        return o == null ? "" : o.ToString();
      //    }
      //    else
      //    {
      //        return "";
      //    }

      //}
    /// <summary>
    /// Metodo que cosntruye un nodo del arbol de profundización de una categoria
    /// </summary>
    /// <param name="cat">Categoria dle arbol</param>
    /// <param name="nodo">Nodo desde el cual se desea cargar</param>
    /// <param name="i">Indica si es el ultimo nodo</param>
    //public void ConstruirNodo(int cat, DSRepositorioIndicadores.CamposVORow nodo,bool i)
    //{

    //    cad += "<input type='hidden' name='lista" + nodo.ID + "' id='lista" + nodo.ID + "' value='"+nodo.IDLISTA+"'/>";

    //    if (!nodo.IsIDDEPENDIENTENull())
    //    {
    //        cad += "<input type='hidden' name='dependiente" + nodo.ID + "-" + nodo.IDDEPENDIENTE + "'  id='dependiente" + nodo.ID + "-" + nodo.IDDEPENDIENTE + "' value='1'/>";
    //    }
    //    if (!nodo.IsIDDEPENDIENTE2Null())
    //    {
    //        cad += "<input type='hidden' name='dependiente" + nodo.ID + "-" + nodo.IDDEPENDIENTE2 + "'  id='dependiente" + nodo.ID + "-" + nodo.IDDEPENDIENTE2 + "' value='1'/>";
    //    }
    //    if (!nodo.IsIDDEPENDIENTE3Null())
    //    {
    //        cad += "<input type='hidden' name='dependiente" + nodo.ID + "-" + nodo.IDDEPENDIENTE3 + "'  id='dependiente" + nodo.ID + "-" + nodo.IDDEPENDIENTE3 + "' value='1'/>";
    //    }

    //        cad += "<div><label for='configuracion" + nodo.ID + "'>" + nodo.DSNOMBRE + " </label><select name='configuracion" + nodo.ID + "' id='configuracion" + nodo.ID + "' onchange='cambioValorConf(this.value," + nodo.ID + ")'><option value='-1'></option>";

    //        if (nodo.IsIDDEPENDIENTENull()||i)
    //        {

    //            DSRepositorioIndicadoresTableAdapters.OpcionesListaDAO opDAO = new DSRepositorioIndicadoresTableAdapters.OpcionesListaDAO();
    //            DSRepositorioIndicadores.OpcionesListaVODataTable opVO = opDAO.GetValoresListaRegion(nodo.IDLISTA, int.Parse(ddlRegion.SelectedValue));
    //            for (int j = 0; j < opVO.Count; j++)
    //            {
    //                cad += " <option value='" + opVO[j].ID + "' " + ((GetValorConfiguracion(nodo.ID) == opVO[j].ID + "") ? "selected" : "") + ">" + opVO[j].DSNOMBRE + "</option>";
    //            }

    //        }else{
    //            if (GetValorConfiguracion(nodo.IDDEPENDIENTE) != "" && GetValorConfiguracion(nodo.IDDEPENDIENTE) != null)
    //            {
    //                OpcionesListaDAO opDAO = new OpcionesListaDAO();
    //                DSRepositorioIndicadores.OpcionesListaVODataTable opVO = opDAO.GetValoresListaPadreRegion(int.Parse(GetValorConfiguracion(nodo.IDDEPENDIENTE)), nodo.IDLISTA, int.Parse(ddlRegion.SelectedValue));

    //                for (int j = 0; j < opVO.Count; j++)
    //                {
    //                    cad += " <option value='" + opVO[j].ID + "' " + ((GetValorConfiguracion(nodo.ID) == opVO[j].ID + "") ? "selected" : "") + ">" + opVO[j].DSNOMBRE + "</option>";
    //                }
    //            }
                
              

    //            //if (!nodo.IsIDDEPENDIENTE2Null()&&  GetValorConfiguracion(nodo.IDDEPENDIENTE2) != "" && GetValorConfiguracion(nodo.IDDEPENDIENTE2) != null)
    //            //{
    //            //    dependencias = dependencias + " if(idcampo==" + nodo.IDDEPENDIENTE2 + "){if(document.getElementById('configuracion" + nodo.IDDEPENDIENTE2 + "')!=undefined) {cargarSelect(document.forms[0].configuracion" + nodo.ID + ",valor," + nodo.IDLISTA + "," + ddlRegion.SelectedValue + "); return;}}";
    //            //}
    //            //if (!nodo.IsIDDEPENDIENTE3Null() && GetValorConfiguracion(nodo.IDDEPENDIENTE3) != "" && GetValorConfiguracion(nodo.IDDEPENDIENTE3) != null)
    //            //{
    //            //    dependencias = dependencias + " if(idcampo==" + nodo.IDDEPENDIENTE3 + "){if(document.getElementById('configuracion" + nodo.IDDEPENDIENTE3 + "')!=undefined) {cargarSelect(document.forms[0].configuracion" + nodo.ID + ",valor," + nodo.IDLISTA + "," + ddlRegion.SelectedValue + "); return;}}";
    //            //}

    //        }
    //        if (!nodo.IsIDDEPENDIENTE2Null() || !nodo.IsIDDEPENDIENTE3Null())
    //        {

    //            dependencias = dependencias + "if(idcampo==" + nodo.ID + "){";

    //            if (!nodo.IsIDDEPENDIENTENull())
    //            {

    //                dependencias = dependencias + "   if(document.getElementById('dependiente" + nodo.IDDEPENDIENTE + "-" + nodo.ID + "')!=undefined) {cargarSelect(document.forms[0].configuracion" + nodo.IDDEPENDIENTE + ",valor,document.forms[0].lista" + nodo.IDDEPENDIENTE + ".value," + ddlRegion.SelectedValue + ");  ";

    //                dependencias = dependencias + " }";
    //            }

    //            if (!nodo.IsIDDEPENDIENTE2Null())
    //            {

    //                dependencias = dependencias + "   if(document.getElementById('dependiente" + nodo.IDDEPENDIENTE2 + "-" + nodo.ID + "')!=undefined) {cargarSelect(document.forms[0].configuracion" + nodo.IDDEPENDIENTE2 + ",valor,document.forms[0].lista" + nodo.IDDEPENDIENTE2 + ".value," + ddlRegion.SelectedValue + ");  ";

    //                dependencias = dependencias + " }";
    //            }
    //            if (!nodo.IsIDDEPENDIENTE3Null())
    //            {

    //                dependencias = dependencias + "   if(document.getElementById('dependiente" + nodo.IDDEPENDIENTE3 + "-" + nodo.ID + "')!=undefined) {cargarSelect(document.forms[0].configuracion" + nodo.IDDEPENDIENTE3 + ",valor,document.forms[0].lista" + nodo.IDDEPENDIENTE3 + ".value," + ddlRegion.SelectedValue + ");  ";

    //                dependencias = dependencias + " }";
    //            }



    //            dependencias = dependencias + "return; }";
    //        }
    //        else
    //        {
    //            if (!nodo.IsIDDEPENDIENTENull())
    //            {
    //                dependencias = dependencias + "  if(idcampo==" + nodo.IDDEPENDIENTE + "){";



    //                dependencias = dependencias + "   if(document.getElementById('configuracion" + nodo.IDDEPENDIENTE + "')!=undefined) {cargarSelect(document.forms[0].configuracion" + nodo.ID + ",valor," + nodo.IDLISTA + "," + ddlRegion.SelectedValue + ");  ";
    //                dependencias = dependencias + " aux" + nodo.ID + "=true;";
    //                dependencias = dependencias + " }}";
    //            }
    //        }
    //        //if (!nodo.IsIDDEPENDIENTE2Null())
    //        //{
    //        //    dependencias = dependencias + " if(idcampo==" + nodo.IDDEPENDIENTE2 + "){";

    //        //    dependencias = dependencias + "   if(document.getElementById('configuracion" + nodo.IDDEPENDIENTE2 + "')!=undefined) {cargarSelect(document.forms[0].configuracion" + nodo.ID + ",valor," + nodo.IDLISTA + "," + ddlRegion.SelectedValue + ");  ";
    //        //    dependencias = dependencias + " aux"+nodo.ID+"=true;";
    //        //    dependencias = dependencias + " }}";
    //        //}

    //        //if (!nodo.IsIDDEPENDIENTE3Null())
    //        //{
    //        //    dependencias = dependencias + " if(idcampo==" + nodo.IDDEPENDIENTE3 + "){";

    //        //    dependencias = dependencias + "   if(document.getElementById('configuracion" + nodo.IDDEPENDIENTE3 + "')!=undefined) {cargarSelect(document.forms[0].configuracion" + nodo.ID + ",valor," + nodo.IDLISTA + "," + ddlRegion.SelectedValue + ");  ";
    //        //    dependencias = dependencias + " aux"+nodo.ID+"=true;";
    //        //    dependencias = dependencias + "} }";
    //        //}

    //        //dependencias = dependencias + "if(aux" + nodo.ID + ")return;";

    //        cad += "</select>";
    //            cad+="</div>";
                
               
      


    //    //if (!nodo.IsIDPADRENull())
    //    //{

    //    //    DSRepositorioIndicadoresTableAdapters.CamposDAO camDA = new CamposDAO();

    //    //    ConstruirNodo(cat, camDA.GetCampoXCat(nodo.IDPADRE)[0]);

    //    //}



    //    //CamposDAO cam = new CamposDAO();
    //    //DSRepositorioIndicadores.CamposVODataTable nodes = cam.GeCamposXCatHij2(nodo.IDCAMXCAT, cat);

      


    //    //for (int i = 0; i < nodes.Count; i++)
    //    //{

    //    //    ConstruirNodo(cat, nodes[i]);
    //    //}

    //    //if (nodo.IDLISTA == -1)
    //    //{

    //    //    cad += " </fieldset>";

    //    //}

       



    //}
    private string cad = "";
    /// <summary>
    /// Función que arma y construye el arbol de profundización de la categoria seleccionada
    /// </summary>
    /// <returns>Retorna una cadena con el arbol construido</returns>
//    public string ConstruirArbol()
//    {

//        if (ddlCategoria.SelectedItem.Value == "-1")
//            return "";

//        int idcam = GetCampoSeleccionado();

//        DSRepositorioIndicadoresTableAdapters.CamposDAO camDAO = new DSRepositorioIndicadoresTableAdapters.CamposDAO();

//        List<DSRepositorioIndicadores.CamposVORow> lista = new List<DSRepositorioIndicadores.CamposVORow>();


//         for (; ; )
//         {
//              DSRepositorioIndicadores.CamposVODataTable dtc =    camDAO.GetCampoXCat(idcam);

//              lista.Add(dtc[0]);

//             if (dtc[0].IsIDPADRENull())
//             {

//                 break;
//             }
//             else
//             {
//                 idcam = dtc[0].IDPADRE;
                 
                 

//             }

//         }


        


//        dependencias = "<script> function cambioValorConf(valor,idcampo){  ";

//        int cat=GetCategoriaSeleccionada();

//bool aux=false;
//        for (int i = lista.Count - 1; i >= 0; i--)
//        {
//            if (lista[i].IDLISTA == -1)
//        {

//            cad+= " <fieldset><legend>" + lista[i].DSNOMBRE + "</legend>";
//aux=true;

//        }
//        else
//        {

//            ConstruirNodo(cat, lista[i], i == lista.Count - 1);
//}

//        }

//if(aux){

//cad+="</fieldset>";
//}

//        //if (ddlCategoria.SelectedValue.Contains('-'))
//        //{
//        //    int idcam = GetCampoSeleccionado();

           
//        //    DSRepositorioIndicadores.CamposVODataTable dtc = camDAO.GetCamposXCat(GetCategoriaSeleccionada());
//        //    for (int j = 0; j < dtc.Count; j++)
//        //    {
//        //        if(dtc[j].IDCAMXCAT==idcam)

//        //        ConstruirNodo(cat, dtc[j]);

//        //    }

//        //}
//        //else
//        //{

//        //    DSRepositorioIndicadoresTableAdapters.CamposDAO camDAO = new DSRepositorioIndicadoresTableAdapters.CamposDAO();
//        //    DSRepositorioIndicadores.CamposVODataTable dtc = camDAO.GetCamposXCatPadre2(GetCategoriaSeleccionada());
//        //    for (int j = 0; j < dtc.Count; j++)
//        //    {


//        //        ConstruirNodo(cat, dtc[j]);

//        //    }
//        //}

//        dependencias += " } </script>";
//        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "scrdep", dependencias, false);
//        return cad+dependencias;

//    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón de crear indicador, el sistema creara el indicador con los datos ingresados por el usuario
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Button2_Click(object sender, EventArgs e)
    {


        GuardarAtributos();

     
      
       
        
           

        


        CrearIndicador();
    }
    /// <summary>
    /// Esta clase reperesenta una lista de items
    /// </summary>
    public class ListData
    {
        public string text { get; set; }
        public int value { get; set; }
    }
    /// <summary>
    /// Metodo web que retorna los items de una lista a partir de un item padre y una región
    /// </summary>
    /// <param name="lista">Lista de donde se cargarn los items</param>
    /// <param name="padre">Padre de los items a cargar</param>
    /// <param name="region">Región a la que pertenecen los items</param>
    /// <returns>Lista de items</returns>
    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static IEnumerable<ListData> GetListData(string lista,string padre,string region)
    {
        OpcionesListaDAO opDAO = new OpcionesListaDAO();
        DSRepositorioIndicadores.OpcionesListaVODataTable opvo= opDAO.GetValoresListaPadreRegion(int.Parse(padre), int.Parse(lista),int.Parse(region));
        List<ListData> list = new List<ListData>();
        for (int i = 0; i < opvo.Count; i++)
        {
            list.Add(new ListData(){
                text=opvo[i].DSNOMBRE,
                value=opvo[i].ID
            });

        }

       
       
        return list;
    }
   

    //[System.Web.Services.WebMethod]
    //[System.Web.Script.Services.ScriptMethod]
    //public static IEnumerable<ListData> GetListData(string lista,  string region)
    //{
    //    OpcionesListaDAO opDAO = new OpcionesListaDAO();
    //    DSRepositorioIndicadores.OpcionesListaVODataTable opvo = opDAO.GetValoresListaRegion(int.Parse(lista), int.Parse(region));
    //    List<ListData> list = new List<ListData>();
    //    for (int i = 0; i < opvo.Count; i++)
    //    {
    //        list.Add(new ListData()
    //        {
    //            text = opvo[i].DSNOMBRE,
    //            value = opvo[i].ID
    //        });

    //    }



    //    return list;
    //}
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón Guardar Configuraciones, el sistema almacenara temporalemnte los campos seleccionados
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
 
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón Guardar Configuraciones, el sistema almacenara temporalemnte los campos seleccionados
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    
    /// <summary>
    /// Metodo que crea el indicador a partir d elos datos ingresados por el usuario
    /// </summary>
    private void CrearIndicador()
    {
        int iddic = int.Parse(ddlNombre.SelectedValue);


        if (Request["id"] != null && Request["id"] != "")
        {
            try
            {
                PerdidasDAO indDAO = new PerdidasDAO();
                int? atr8 = Utils.ToInt32Null(GetValorAtributo(8));
                int? atr7 = Utils.ToInt32Null(GetValorAtributo(7));
            
                int? atr10 = Utils.ToInt32Null(GetValorAtributo(10));
                int? atr11 = Utils.ToInt32Null(GetValorAtributo(11));
                int? atr2 = Utils.ToInt32Null(GetValorAtributo(2));
             
                int? atr9 = Utils.ToInt32Null(GetValorAtributo(9));
                int? atr4 = Utils.ToInt32Null(GetValorAtributo(4));
                int? atr5 = Utils.ToInt32Null(GetValorAtributo(5));
              
                int? atr6 = Utils.ToInt32Null(GetValorAtributo(6));
             
                int? atr15 = Utils.ToInt32Null(GetValorAtributo(15));
                int? atr32 = Utils.ToInt32Null(GetValorAtributo(32));

                int? atr35 = Utils.ToInt32Null(GetValorAtributo(35));
                int? atr33 = Utils.ToInt32Null(GetValorAtributo(33));
                int? atr34 = Utils.ToInt32Null(GetValorAtributo(34));

                indDAO.UpdatePerdida( iddic, Utils.ToInt32Null(GetValorAtributo(8)), Utils.ToInt32Null(GetValorAtributo(7)), GetValorAtributo(14),
                    Utils.ToInt32Null(GetValorAtributo(10)), Utils.ToInt32Null(GetValorAtributo(11)), Utils.ToInt32Null(GetValorAtributo(2)),
                    GetValorAtributo(3), Utils.ToInt32Null(GetValorAtributo(9)), Utils.ToInt32Null(GetValorAtributo(4)), 
                    Utils.ToInt32Null(GetValorAtributo(5)),null, Utils.ToInt32Null(GetValorAtributo(6)), 
                    GetValorAtributo(13), null, false, Utils.ToInt32Null(GetValorAtributo(15)), null, null, null, null, null, null, null, null,
                    null, null, null, null, null, null, null, null,
                    Utils.ToInt32Null(GetValorAtributo(32)), Utils.ToInt32Null(GetValorAtributo(33)), Utils.ToInt32Null(GetValorAtributo(34)), 
                    Utils.ToInt32Null(GetValorAtributo(35)), null, null, null, null, int.Parse(ddlOperacion.SelectedValue), null,int.Parse(Request["id"]));
              
               //indDAO.UpdatePerdida(   idcat, 1, 2, iddic, "" , codigo,"",
               //     Utils.ToInt32Null(GetValorAtributo(8)), null, GetValorAtributo(14), Utils.ToInt32Null(GetValorAtributo(10)),
               //      Utils.ToInt32Null(GetValorAtributo(11)), Utils.ToInt32Null(GetValorAtributo(2)), GetValorAtributo(3), Utils.ToInt32Null(GetValorAtributo(9)), Utils.ToInt32Null(GetValorAtributo(4)), Utils.ToInt32Null(GetValorAtributo(5)), null,
               //       Utils.ToInt32Null(GetValorAtributo(6)), GetValorAtributo(13),null,
               //       Utils.ToInt32Null(GetValorAtributo(15)), GetValorAtributo(16), GetValorAtributo(17), GetValorAtributo(18), GetValorAtributo(19),
               //       GetValorAtributo(20), GetValorAtributo(21), GetValorAtributo(22), GetValorAtributo(23), Utils.StringToDateTime(GetValorAtributo(24)),
               //       Utils.StringToDateTime(GetValorAtributo(25)), Utils.StringToDateTime(GetValorAtributo(26)), Utils.StringToDateTime(GetValorAtributo(27)),
               //        Utils.ToInt32Null(GetValorAtributo(28)), Utils.ToInt32Null(GetValorAtributo(29)), Utils.ToInt32Null(GetValorAtributo(30)), Utils.ToInt32Null(GetValorAtributo(31)),
               //        Utils.ToInt32Null(GetValorAtributo(32)), Utils.ToInt32Null(GetValorAtributo(33)), Utils.ToInt32Null(GetValorAtributo(34)), Utils.ToInt32Null(GetValorAtributo(35)),
               //        Utils.ToboolNull(GetValorAtributo(36)), Utils.ToboolNull(GetValorAtributo(37)), Utils.ToboolNull(GetValorAtributo(38)), Utils.ToboolNull(GetValorAtributo(39)),
               //       "", -1, conse, GetValorAtributo(41), GetValorAtributo(42), GetValorAtributo(43), "");
               // hdInd.Value = idind.ToString();



                //ValoresXCampoXPerdDAO valatDAO = new ValoresXCampoXPerdDAO();
                //valatDAO.DeleteCamposXPerd(9,int.Parse(Request["id"]));

                //for (int j = 0; j < ckPlantas.Items.Count; j++)
                //{
                //    if (ckPlantas.Items[j].Selected)
                //    {
                //        valatDAO.Insert(9, int.Parse(Request["id"]), int.Parse(ckPlantas.Items[j].Value), false);
                //    }
                //}

                //valatDAO.DeleteCamposXPerd(1049, int.Parse(Request["id"]));

                //for (int j = 0; j < cklineas.Items.Count; j++)
                //{
                //    if (cklineas.Items[j].Selected)
                //    {
                //        valatDAO.Insert(1049, int.Parse(Request["id"]), int.Parse(cklineas.Items[j].Value), false);
                //    }
                //}

                //Hashtable hsatr = (Hashtable)Session["configuraciones"];
                //ValoresXCampoDAO valDAO = new ValoresXCampoDAO();

                //foreach (DictionaryEntry de in hsatr)
                //{
                //    int key = int.Parse(de.Key.ToString().Replace("configuracion", ""));
                //    valDAO.InsertValoresXCampo(key, idind, Utils.ToInt32Null(GetValorConfiguracion(key)));
                //}

                //LogDAO logDao = new LogDAO();
                //logDao.InsertLog(Utils.GetUsuario(Session, Response).ID, idind, "CREARIND", "El usuario creo el indicador", null, null,null,null,null);

                //indDAO.CrearMatriz(int.Parse(Request["id"]));
           

                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "setindcat", "<script>alert('Perdida modificada correctamente');document.location.href='Perdidas.aspx';</script>", false);
               


            }

            catch (Exception exc)
            {
                Utils.RegistrarError(exc);
                divError.Style["display"] = "";
                msgError.InnerText = Utils.GetMensaje("ERROR");
            }
        }
        else
        {


            try
            {
                PerdidasDAO indDAO = new PerdidasDAO();
                int? atr8 = Utils.ToInt32Null(GetValorAtributo(8));
                //int? atr7 = Utils.ToInt32Null(GetValorAtributo(7));

                int? atr10 = Utils.ToInt32Null(GetValorAtributo(10));
                int? atr11 = Utils.ToInt32Null(GetValorAtributo(11));
                int? atr2 = Utils.ToInt32Null(GetValorAtributo(2));

                int? atr9 = Utils.ToInt32Null(GetValorAtributo(9));
                int? atr4 = Utils.ToInt32Null(GetValorAtributo(4));
                int? atr5 = Utils.ToInt32Null(GetValorAtributo(5));

                int? atr6 = Utils.ToInt32Null(GetValorAtributo(6));

                int? atr15 = Utils.ToInt32Null(GetValorAtributo(15));
                int? atr32 = Utils.ToInt32Null(GetValorAtributo(32));

                int? atr35 = Utils.ToInt32Null(GetValorAtributo(35));
                int? atr33 = Utils.ToInt32Null(GetValorAtributo(33));
                int? atr34 = Utils.ToInt32Null(GetValorAtributo(34));

                //indDAO.UpdatePerdida(iddic, Utils.ToInt32Null(GetValorAtributo(8)), Utils.ToInt32Null(GetValorAtributo(7)), GetValorAtributo(14),
                //Utils.ToInt32Null(GetValorAtributo(10)), Utils.ToInt32Null(GetValorAtributo(11)), Utils.ToInt32Null(GetValorAtributo(2)),
                //GetValorAtributo(3), Utils.ToInt32Null(GetValorAtributo(9)), Utils.ToInt32Null(GetValorAtributo(4)),
                //Utils.ToInt32Null(GetValorAtributo(5)), Utils.ToInt32Null(GetValorAtributo(7)), Utils.ToInt32Null(GetValorAtributo(6)),
                //GetValorAtributo(13), null, false, Utils.ToInt32Null(GetValorAtributo(15)), null, null, null, null, null, null, null, null,
                //null, null, null, null, null, null, null, null,
                //Utils.ToInt32Null(GetValorAtributo(32)), Utils.ToInt32Null(GetValorAtributo(33)), Utils.ToInt32Null(GetValorAtributo(34)),
                //Utils.ToInt32Null(GetValorAtributo(35)), null, null, null, null, int.Parse(ddlOperacion.SelectedValue), null, int.Parse(Request["id"]));

              int idperd=int.Parse(  indDAO.InsertPerdida(iddic, Utils.ToInt32Null(GetValorAtributo(8)), null,
                  GetValorAtributo(14), Utils.ToInt32Null(GetValorAtributo(10)), Utils.ToInt32Null(GetValorAtributo(11)), Utils.ToInt32Null(GetValorAtributo(2)),
                  GetValorAtributo(3), Utils.ToInt32Null(GetValorAtributo(9)), Utils.ToInt32Null(GetValorAtributo(4)),
                  Utils.ToInt32Null(GetValorAtributo(5)), null, Utils.ToInt32Null(GetValorAtributo(6)), 
                  GetValorAtributo(13), null, false, Utils.ToInt32Null(GetValorAtributo(15)), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
                    Utils.ToInt32Null(GetValorAtributo(32)), Utils.ToInt32Null(GetValorAtributo(33)), Utils.ToInt32Null(GetValorAtributo(34)),
                    Utils.ToInt32Null(GetValorAtributo(35)), null, null, null, null, int.Parse(ddlOperacion.SelectedValue), null).ToString());

                //indDAO.UpdatePerdida(   idcat, 1, 2, iddic, "" , codigo,"",
                //     Utils.ToInt32Null(GetValorAtributo(8)), null, GetValorAtributo(14), Utils.ToInt32Null(GetValorAtributo(10)),
                //      Utils.ToInt32Null(GetValorAtributo(11)), Utils.ToInt32Null(GetValorAtributo(2)), GetValorAtributo(3), Utils.ToInt32Null(GetValorAtributo(9)), Utils.ToInt32Null(GetValorAtributo(4)), Utils.ToInt32Null(GetValorAtributo(5)), null,
                //       Utils.ToInt32Null(GetValorAtributo(6)), GetValorAtributo(13),null,
                //       Utils.ToInt32Null(GetValorAtributo(15)), GetValorAtributo(16), GetValorAtributo(17), GetValorAtributo(18), GetValorAtributo(19),
                //       GetValorAtributo(20), GetValorAtributo(21), GetValorAtributo(22), GetValorAtributo(23), Utils.StringToDateTime(GetValorAtributo(24)),
                //       Utils.StringToDateTime(GetValorAtributo(25)), Utils.StringToDateTime(GetValorAtributo(26)), Utils.StringToDateTime(GetValorAtributo(27)),
                //        Utils.ToInt32Null(GetValorAtributo(28)), Utils.ToInt32Null(GetValorAtributo(29)), Utils.ToInt32Null(GetValorAtributo(30)), Utils.ToInt32Null(GetValorAtributo(31)),
                //        Utils.ToInt32Null(GetValorAtributo(32)), Utils.ToInt32Null(GetValorAtributo(33)), Utils.ToInt32Null(GetValorAtributo(34)), Utils.ToInt32Null(GetValorAtributo(35)),
                //        Utils.ToboolNull(GetValorAtributo(36)), Utils.ToboolNull(GetValorAtributo(37)), Utils.ToboolNull(GetValorAtributo(38)), Utils.ToboolNull(GetValorAtributo(39)),
                //       "", -1, conse, GetValorAtributo(41), GetValorAtributo(42), GetValorAtributo(43), "");
                // hdInd.Value = idind.ToString();



                //ValoresXCampoXPerdDAO valatDAO = new ValoresXCampoXPerdDAO();
                

                //for (int j = 0; j < ckPlantas.Items.Count; j++)
                //{
                //    if (ckPlantas.Items[j].Selected)
                //    {
                //        valatDAO.Insert(9,idperd, int.Parse(ckPlantas.Items[j].Value), false);
                //    }
                //}


                //for (int j = 0; j < cklineas.Items.Count; j++)
                //{
                //    if (cklineas.Items[j].Selected)
                //    {
                //        valatDAO.Insert(1049, idperd, int.Parse(cklineas.Items[j].Value), false);
                //    }
                //}

                //indDAO.CrearMatriz(idperd);
             

               // ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "setindcat", "<script>document.forms[0].hdInd.value=" + idind + ";document.forms[0].hdCat.value=" + GetCategoriaSeleccionada() + ";</script>", false);
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "setindcat", "<script>alert('Perdida ingresada correctamente');document.location.href='Perdidas.aspx';</script>", false);
               

            }

            catch (Exception exc)
            {
                Utils.RegistrarError(exc);
                divError.Style["display"] = "";
                msgError.InnerText = Utils.GetMensaje("ERROR");
            }
        }




    }
    protected void ddlRegion_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón Configuraciones
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    //protected void Button5_Click(object sender, EventArgs e)
    //{
    //    mvPaso.ActiveViewIndex = 4;
    //    GruposUsuariosDAO gruDAO = new GruposUsuariosDAO();
    //    Utils.LlenarComboLista(ddlGrupos, gruDAO.GetGrupos(), "ID", "DSNOMBRE");

    //    EscenariosDAO escDAO = new EscenariosDAO();
    //    Utils.LlenarComboLista(ddlEscenario, escDAO.GetEscenarios(), "ID", "DSNOMBRE");
    //    CargarGrupos();
        
        
    //}
    /// <summary>
    /// Metodo que carga los grupos creados para el indicador
    /// </summary>
    //private void CargarGrupos()
    //{
    //    GruposXIndicadorConfDAO grindDAO = new GruposXIndicadorConfDAO();
    //    gvPermisos.DataSource = grindDAO.GetGruposXIndicador(int.Parse(hdInd.Value));
    //    gvPermisos.DataBind();
    //}
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón Terminar
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
   
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón Guardar Grupoo, el sistema almacenara el grupo que esta creando
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    //protected void Button8_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        GruposXIndicadorDAO grupDAO = new GruposXIndicadorDAO();
    //        grupDAO.InsertGrupoXIndicador(int.Parse(ddlGrupos.SelectedValue), int.Parse(hdInd.Value), ddlEscenario.SelectedValue == "-1" ? null : (int?)int.Parse(ddlEscenario.SelectedValue), ddlTipo.SelectedValue, ddlPlazo.SelectedValue);
    //        divMsg.Style["display"] = "";
    //        msgExito.InnerText = Utils.GetMensaje("ASIGNAR_GRUPOS_INDICADOR");
    //        ddlGrupos.SelectedValue = "-1";
    //        ddlEscenario.SelectedValue = "-1";
    //        ddlTipo.SelectedValue = "-1";
    //        ddlPlazo.SelectedValue = "-1";
    //        CargarGrupos();

    //    }
    //    catch (Exception exc)
    //    {
    //        Utils.RegistrarError(exc);
    //        divError.Style["display"] = "";
    //        msgError.InnerText = Utils.GetMensaje("ERROR");
    //    }
    //}
    /// <summary>
    /// Metodo que se activa en el momento en que el grid de grupos se esta armando, se usa para asociarle algunas propiedades a la celdas 
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    //protected void gvPermisos_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        LinkButton link = (LinkButton)e.Row.FindControl("eliminar");
    //        link.Attributes.Add("OnClick", "javascript: if(confirm('Está seguro que desea eliminar este grupo?')== false) return false");


    //    }
    //}
    /// <summary>
    /// Metodo que se activa en el momento en que el usuario presiona algun botón en el grid
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    //protected void gvPermisos_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    try
    //    {
    //        int id = int.Parse(e.CommandArgument.ToString());
    //        if (e.CommandName == "Eliminar")
    //        {
    //            GruposXIndicadorDAO fecDAO = new GruposXIndicadorDAO();
    //            fecDAO.DeleteGrupoXIndicador(id);
    //            divMsg.Style["display"] = "";
    //            msgExito.InnerText = Utils.GetMensaje("ELIMINAR_GRUPO_USUARIOS_INDICADOR");
    //            CargarGrupos();
    //        }
    //    }
    //    catch (Exception exc)
    //    {
    //        Utils.RegistrarError(exc);
    //        divError.Style["display"] = "";
    //        msgError.InnerText = Utils.GetMensaje("ERROR");
    //    }
    //}
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón Finalizar, el sistema llevara al usuario a la pantalla de captura del indicador
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("Actualizar.aspx?id="+hdInd.Value);
    }

    /// <summary>
    /// Metodo que se ejecuta en el momento que el usuario selecciona un negocio
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    //protected void ddlNegocio_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DSRepositorioIndicadores.UsuariosVORow usu= Utils.GetUsuario(Session,Response);
    //    RegionesDAO regDAO = new RegionesDAO();
    //    Utils.LlenarComboLista(ddlRegion,regDAO.GetRegionesXUsuXNeg(int.Parse(ddlNegocio.SelectedValue),usu.ID),"ID","DSNOMBRE");
    //    GetCategorias();

    //}
    /// <summary>
    /// Metodo que se ejecuta en el momento que el usuario selecciona un catalogo
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    //protected void ddlNombre_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (GetCategoriaSeleccionada() != 8)
    //    {
    //        txtNombreAux.Text = ddlNombre.SelectedItem.Text + " " + txtNombreAux2.Value;
    //    }
    //    else
    //    {

    //    }
    //}
    /// <summary>
    /// Metodo que se ejecuta cuando el usuario cambia el nombre del indicador
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    //protected void txtNomDic_TextChanged(object sender, EventArgs e)
    //{
    //    if (GetCategoriaSeleccionada() != 8)
    //    {
    //        txtNombreAux.Text = txtNomDic.Text + " " + txtNombreAux2.Value;
    //    }
    //    else
    //    {

    //    }
    //}
    protected void btnSiguiente_Click(object sender, EventArgs e)
    {
        GuardarAtributos();

        CrearIndicador();
    }
}