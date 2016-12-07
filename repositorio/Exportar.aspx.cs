using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using com.triario.repositorio.util;
using System.Collections;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Text;
using System.Linq.Expressions;
using System.Web.Services;


/// <summary>
/// Esta clase se encarga de visualizar la pantalla de exportación de indicadores
/// </summary>

public partial class Exportar : System.Web.UI.Page
{
    /// <summary>
    /// Este metodo carga las plantillas guardadas con aterioridad y el resto de componentes que tiene la pantalla
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PlantillasDAO planDAO = new PlantillasDAO();
            Utils.LlenarComboLista(ddlPlantillas, planDAO.GetPlantillas(), "ID", "DSNOMBRE");
        }
        Session["plantilla"] = null;
    }
    /// <summary>
    /// Este metodo controla el evento click dle boton guardar plantilla que s evisualiza en la pantalla
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        

        PlantillasDAO planDAO=new PlantillasDAO();
        if (planDAO.ExistePlantilla(Request["__EVENTARGUMENT"]).Value > 0)
        {

            Response.Write("<script>alert('Ya existe una plantilla con el mismo nombre');</script>");
            return;
        }


        planDAO.InsertPlantilla(Request["__EVENTARGUMENT"], Request.Params.ToString());
        Utils.LlenarComboLista(ddlPlantillas, planDAO.GetPlantillas(), "ID", "DSNOMBRE");
        ddlPlantillas.SelectedValue = planDAO.GetMax().ToString();
        Cargar();
    }
    /// <summary>
    /// Este metodo controla el evento que se dispara al momento en que el usuario desea cargar una plantilla ya guardada
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddlPlantillas_SelectedIndexChanged(object sender, EventArgs e)
    {
        Cargar();
    }
    /// <summary>
    /// Este metodo carga los filtros seleccionados en la plantilla que el usuario desea cargar
    /// </summary>
    private void Cargar()
    {
        Session["plantilla"] = null;
        Session["plantilla"] = new Hashtable();
        PlantillasDAO plan = new PlantillasDAO();
        Hashtable hs = new Hashtable();
        DSRepositorioIndicadores.PlantillasVODataTable planvo = plan.GetPlantilla(int.Parse(ddlPlantillas.SelectedValue));
        if (planvo.Count > 0)
        {
            string[] vec = planvo[0].DSPARAMETROS.Split(new char[] { '&' });
            for (int i = 0; i < vec.Length; i++)
            {
                string[] aux = vec[i].Split(new char[] { '=' });
                if (aux.Length < 2)
                    continue;
                hs.Add(aux[0], aux[1]);
            }
        }
        Session["plantilla"] = hs;

    }
    /// <summary>
    /// Este metodo recupera el valor de un atributo de los filtros ya seleccionados en una plantilla guardada
    /// </summary>
    /// <param name="idatr">Parametro que indica el nombre del atributo a recuperar</param>
    /// <returns>El valor del atributo especificado</returns>
    public string GetValor(string idatr)
    {
        Hashtable hsatr = (Hashtable)Session["plantilla"];
        if (hsatr == null)
            return "";
        object o = null;
        if (hsatr.ContainsKey( idatr))
        {
            o = hsatr[ idatr];
            return o == null ? "" : o.ToString();
        }
        else
        {
            return "";
        }

    }
    /// <summary>
    /// Este metodo recupera el valor de un atributo tipo check de los filtros ya seleccionados en una plantilla guardada
    /// </summary>
    /// <param name="idatr">Parametro que indica el nombre del atributo tipo check a recuperar</param>
    /// <returns>El valor del atributo tipo check especificado</returns>
     public string GetValorChk(string idatr)
    {
        Hashtable hsatr = (Hashtable)Session["plantilla"];
        if (hsatr == null)
            return "";
        object o = null;
        if (hsatr.ContainsKey( idatr))
        {
            o = hsatr[ idatr];
            return o == null ? "" : "checked";
        }
        else
        {
            return "";
        }

    }
     private void GuardarOrden(Hashtable hs, string param,string sql)
     {
        
         int orden = Request["o"+param]==null?0: int.Parse(Request["o"+param]);
         ArrayList arr = null;
         if (hs.ContainsKey(orden + ""))
         {
             arr = (ArrayList)hs[orden + ""];
         }
         else
         {
             arr = new ArrayList();
         }
         arr.Add(sql);
         hs[orden + ""] = arr;
     }
    /// <summary>
    /// Metodo que genera un GridView a partir de los atributos seleccionados por el usuario. Inspecciona los atributos seleccionados para realizar la exportación y genera un query a partir de estos
    /// </summary>
    /// <returns>Retorna un GridView que contiene el resultado de la consulta geenerada</returns>
     private GridView GenerarQuery()
     {
         string sql = "select i.ID ";
         Hashtable hsa = new Hashtable();
         if (Request["chkatrfcodigo"] == "on")
         {
             //sql += " ,DSCODIGO CODIGO";
             GuardarOrden(hsa, "chkatrfcodigo", " ,DSCODIGO CODIGO");
            
         }
         if (Request["chkatrfcodigoaux"] == "on")
         {
             //sql += " ,DSCODIGOAUX CODIGOAUX";
             GuardarOrden(hsa, "chkatrfcodigoaux", " ,DSCODIGOAUX CODIGOAUX");
         }
         if (Request["chkatrfnombre"] == "on")
         {
             //sql += " ,dbo.[GetNombreCompletoIndicador](i.id) NOMBRE";
             GuardarOrden(hsa, "chkatrfnombre", " ,dbo.[GetNombreCompletoIndicador](i.id) NOMBRE");
         }
         if (Request["chkatrfregion"] == "on")
         {
             //sql += " ,(select r.DSNOMBRE from tri_rep_regiones r where r.ID=i.IDREGION) REGION";
             GuardarOrden(hsa, "chkatrfregion", ",(select r.DSNOMBRE from tri_rep_regiones r where r.ID=i.IDREGION) REGION");
         }
         if (Request["chkatrcat"] == "on")
         {
             //sql += " ,(select r.DSNOMBRE from tri_rep_regiones r where r.ID=i.IDREGION) REGION";
             GuardarOrden(hsa, "chkatrcat", ",(select r.DSNOMBRE from tri_rep_categorias r where r.ID=i.IDCATEGORIA) CATEGORIA");
         }



         if (Request["chkatrfresp"] == "on")
         {
           //  sql += " ,(select u.DSNOMBRES from tri_rep_usuarios u where u.ID=i.IDRESPONSABLE) RESPONSABLE";
             GuardarOrden(hsa, "chkatrfresp", " ,(select u.DSNOMBRES from tri_rep_usuarios u where u.ID=i.IDRESPONSABLE) RESPONSABLE");
         }
         string where = "";

         if (Request["responsable"] != null && Request["responsable"] != "" && Request["responsable"] != "-1")
         {
             where += " and  IDRESPONSABLE=" + Request["responsable"];
         }
         if (Request["categoria"] != null && Request["categoria"] != "" && Request["categoria"] != "-1")
         {
             where += " and  IDCATEGORIA=" + Request["categoria"];
         }

         if (Request["diccionario"] != null && Request["diccionario"] != "" && Request["diccionario"] != "-1")
         {
             where += " and  IDDICCIONARIO=" + Request["diccionario"];
         }

         if (Request["region"] != null && Request["region"] != "" && Request["region"] != "-1")
         {
             where += " and  IDREGION=" + Request["region"];
         }
         else
         {

             where += " and (idregion in (SELECT ID FROM dbo.tri_rep_regiones where  (ID=(select IDREGION from tri_rep_usuarios where id=" + com.triario.repositorio.util.Utils.GetUsuario(Session, Response).ID + ") or IDPADRE=(select IDREGION from tri_rep_usuarios where id=" + com.triario.repositorio.util.Utils.GetUsuario(Session, Response).ID + ")) and SNELIMINADO=0) or idresponsable = " + com.triario.repositorio.util.Utils.GetUsuario(Session, Response).ID + ")";
         }

         DSRepositorioIndicadoresTableAdapters.AtributosDAO lbDAO = new DSRepositorioIndicadoresTableAdapters.AtributosDAO();
         DSRepositorioIndicadores.AtributosVODataTable lvDT = lbDAO.GetAtributos();
         for (int i = 0; i < lvDT.Count; i++)
         {
             DSRepositorioIndicadores.AtributosVORow lvR = lvDT[i];
             string sql2 = "";
             if (Request["chkatr" + lvR.ID] == "on")
             {
                 if (lvR.DSTIPO.Trim() == "L" || lvR.DSTIPO.Trim() == "LM")
                 {
                     if (lvR.DSTIPO.Trim() == "L")
                     {
                         sql2 += " ,(select top(1) isnull(DSHOMOLOGACION,op.DSNOMBRE) from tri_rep_opciones_lista op where op.ID=i." + lvR.DSCOLUMNA + ") [" + lvR.DSNOMBRE + "]";
                     }
                     else
                     {
                         sql2 += " ,STUFF((select ', '+isnull(DSHOMOLOGACION,op.DSNOMBRE) from tri_rep_opciones_lista op where op.ID in (select IDVALOR from tri_rep_valoresxatributo where IDIND=i.ID and IDATR=" + lvR.ID + " )  FOR XML PATH('') ),1,1,'') [" + lvR.DSNOMBRE + "]";

                     }


                 }
                 else
                 {
                     sql2 += " ," + lvR.DSCOLUMNA + " [" + lvR.DSNOMBRE + "]";
                 }

                 GuardarOrden(hsa, "chkatr" + lvR.ID, sql2);
             }
             if (Request["lista" + lvR.ID] != null && Request["lista" + lvR.ID] != "" && Request["lista" + lvR.ID] != "-1")
             {
                 where += " and " + lvR.DSCOLUMNA + "=" + Request["lista" + lvR.ID];
             }
            
         }

         for (int i = 0; i <= lvDT.Count + 5; i++)
         {
             if (hsa.ContainsKey(i + ""))
             {
                 ArrayList arr=(ArrayList)hsa[i+""];
                 for(int j=0;j<arr.Count;j++){
                     sql+=arr[j].ToString();
                 }
             }
         }
         Hashtable hs2 = new Hashtable();
         DSRepositorioIndicadoresTableAdapters.CamposDAO lbcDAO = new DSRepositorioIndicadoresTableAdapters.CamposDAO();
         DSRepositorioIndicadores.CamposVODataTable lvcDT = lbcDAO.GetCampos();
         for (int i = 0; i < lvcDT.Count; i++)
         {
             DSRepositorioIndicadores.CamposVORow lvcR = lvcDT[i];
             string sql2 = "";
             if (Request["chkcam" + lvcR.ID] == "on")
             {

                 sql2 += " ,(select top(1) isnull(DSHOMOLOGACION,op.DSNOMBRE) from tri_rep_opciones_lista op,tri_rep_valoresxcampo vc where  op.ID=vc.IDVALOR and vc.IDINDICADOR=i.ID and vc.IDCAMPO=" + lvcR.ID + ") [" + lvcR.DSNOMBRE + "]";

                 GuardarOrden(hs2, "chkcam" + lvcR.ID, sql2);

             }
             if (Request["listacam" + lvcR.ID] != null && Request["listacam" + lvcR.ID] != "" && Request["listacam" + lvcR.ID] != "-1")
             {
                 where += " and " + Request["listacam" + lvcR.ID] + " in (select ve.IDVALOR from tri_rep_valoresxcampo ve where ve.IDINDICADOR=i.ID and ve.IDCAMPO=" + lvcR.ID + ")";
             }
         }
         for (int i = 0; i <= lvcDT.Count; i++)
         {
             if (hs2.ContainsKey(i + ""))
             {
                 ArrayList arr = (ArrayList)hs2[i + ""];
                 for (int j = 0; j < arr.Count; j++)
                 {
                     sql += arr[j].ToString();
                 }
             }
         }


         Hashtable hs3 = new Hashtable();
         string[] meses = { "", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };
         DSRepositorioIndicadoresTableAdapters.EscenariosDAO lbeDAO = new DSRepositorioIndicadoresTableAdapters.EscenariosDAO();
         DSRepositorioIndicadores.EscenariosVODataTable lvDTe = lbeDAO.GetEscenarios();
         for (int i = 0; i < lvDTe.Count; i++)
         {
             DSRepositorioIndicadores.EscenariosVORow lvRe = lvDTe[i];
             if (Request["chkesc" + lvRe.ID] == "on")
             {
                 string sql3 = "";
                 int plazo = int.Parse(com.triario.repositorio.util.Utils.GetParametro("LARGO_PLAZO"));
                 for (int j = DateTime.Now.Year - plazo; j <= DateTime.Now.Year + plazo; j++)
                 {
                     if (Request["chkper" + j] == "on")
                     {
                         for (int k = 1; k <= 12; k++)
                         {
                             sql3 += ",dbo.FN_GETVALORPERIODO(" + lvRe.ID + "," + j + "," + k + ",i.ID,isnull(i.IDCATEGORIA,-1)) [" + lvRe.DSNOMBRE + " " + meses[k] + " " + j + "]";
                         }
                     }
                 }
                 GuardarOrden(hs3, "chkesc" + lvRe.ID, sql3);

             }

         }

         if (Request["chkescm" ] == "on")
         {
             string sql3 = "";
             int plazo = int.Parse(com.triario.repositorio.util.Utils.GetParametro("LARGO_PLAZO"));
             for (int j = DateTime.Now.Year - plazo; j <= DateTime.Now.Year + plazo; j++)
             {
                 if (Request["chkper" + j] == "on")
                 {
                    
                         sql3 += ",dbo.FN_FORMATO_NUMERO((select top(1) NMVALOR from tri_rep_metasxindicador where [IDINDICADOR]=i.ID and NMANIO="+j+" order by ID desc))   [Meta " + j + "]";
                         
                    
                 }
             }
             GuardarOrden(hs3, "chkescm", sql3);

         }
         for (int i = 0; i <= lvDTe.Count+1; i++)
         {
             if (hs3.ContainsKey(i + ""))
             {
                 ArrayList arr = (ArrayList)hs3[i + ""];
                 for (int j = 0; j < arr.Count; j++)
                 {
                     sql += arr[j].ToString();
                 }
             }
         }




         sql += " from tri_rep_indicadores i where SNELIMINADO=0 and (i.IDPERD is null or IDCATEGORIA=1) ";

         sql += where;



         sql += " order by dbo.[GetNombreCompletoIndicador](i.id) ";

         GridView grid = new GridView();
         DataTable dt = GetData(new SqlCommand(sql));
         //Response.Write(sql);
         for (int i = 0; i < dt.Rows.Count; i++)
         {
             for (int j = 0; j < dt.Columns.Count; j++)
             {
                 if (dt.Rows[i][j] != null)
                 {
                     if (dt.Rows[i][j].ToString().Contains("@calc@"))
                     {
                         string aux = dt.Rows[i][j].ToString().Replace("@calc@", "");
                         try
                         {
                             dt.Rows[i][j] = Evaluate(aux);
                         }
                         catch (Exception exc) { }
                     }
                 }
             }
         }

         grid.DataSource = dt;
         grid.DataBind();

         return grid;
     }
    /// <summary>
    /// Este metodo realiza el calculo aritemtico para poder generar el valor de los escenarios calculados
    /// </summary>
    /// <param name="expression">Parametro que indica la expresion aritmetica a calcular</param>
    /// <returns>Retorna el resultado d ela operación aritemtica en formato númerico</returns>
     public static string Evaluate(string expression)
     {
         if(expression==null||expression=="")
             return "";

       
         String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["core_repositorioConnectionString"].ConnectionString;
         SqlConnection con = new SqlConnection(strConnString);
        SqlCommand sqlcom=new SqlCommand();

       sqlcom.CommandType=CommandType.Text;
         sqlcom.Connection=con;

         try
         {
             con.Open();
             sqlcom.CommandText = "select dbo.FN_FORMATO_NUMERO(" + expression+")";
             object o=sqlcom.ExecuteScalar();

             return o.ToString();
         }
         catch (Exception ex)
         {
             throw ex;
         }
         finally
         {
             con.Close();
             sqlcom.Dispose();
             con.Dispose();
         }

     }
    /// <summary>
    /// Función que recibe un comando de sql y retorna el resultado
    /// </summary>
    /// <param name="cmd">El comando sql que se desea ejecutar</param>
    /// <returns>El resultado que genero la ejecución de la cosnulta</returns>
     private DataTable GetData(SqlCommand cmd)
     {
         DataTable dt = new DataTable();
         String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["core_repositorioConnectionString"].ConnectionString;
         SqlConnection con = new SqlConnection(strConnString);
         cmd.CommandTimeout = 360;
         SqlDataAdapter sda = new SqlDataAdapter();
         cmd.CommandType = CommandType.Text;
         cmd.Connection = con;
         try
         {
             con.Open();
             sda.SelectCommand = cmd;
             sda.Fill(dt);
             return dt;
         }
         catch (Exception ex)
         {
             throw ex;
         }
         finally
         {
             con.Close();
             sda.Dispose();
             con.Dispose();
         }
     }
     public override void VerifyRenderingInServerForm(Control control)
     {
         /* Verifies that the control is rendered */
     }
    /// <summary>
    /// Metodo que controla el evento click sobre el botón de generar Excel con la exportación
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
     protected void btnGenerar_Click(object sender, EventArgs e)
     {
         Response.Clear();
         Response.Buffer = true;

         Response.AddHeader("content-disposition",
          "attachment;filename=sabanarepositorio.xls");
         Response.Charset = "";
         Response.ContentType = "application/vnd.ms-excel";
         StringWriter sw = new StringWriter();
         HtmlTextWriter hw = new HtmlTextWriter(sw);

         GridView GridView1 = GenerarQuery();

         if (GridView1 != null)
         {



             GridView1.AllowPaging = false;
             //GridView1.DataBind();

             //Change the Header Row back to white color
             GridView1.HeaderRow.Style.Add("background-color", "#FFFFFF");

             //Apply style to Individual Cells
             //GridView1.HeaderRow.Cells[0].Style.Add("background-color", "green");
             //GridView1.HeaderRow.Cells[1].Style.Add("background-color", "green");
             //GridView1.HeaderRow.Cells[2].Style.Add("background-color", "green");
             //GridView1.HeaderRow.Cells[3].Style.Add("background-color", "green");

             for (int i = 0; i < GridView1.Rows.Count; i++)
             {
                 GridViewRow row = GridView1.Rows[i];

                 //Change Color back to white
                 row.BackColor = System.Drawing.Color.White;

                 //Apply text style to each Row
                 row.Attributes.Add("class", "textmode");

                 //Apply style to Individual Cells of Alternating Row
                 if (i % 2 != 0)
                 {
                     for (int k = 0; k < row.Cells.Count; k++)
                         row.Cells[k].Style.Add("background-color", "#C2D69B");

                 }
             }
             GridView1.RenderControl(hw);

             //style to format numbers to string
             string style = @"<style> .textmode { mso-number-format:\@; } </style>";
             Response.Write(style);
             Response.Output.Write(sw.ToString());
             Response.Flush();
             Response.End();
         }
     }
     /// <summary>
     /// Metodo que controla el evento click sobre el botón de generar PDF con la exportación
     /// </summary>
     /// <param name="sender">Objeto que desencadena el evento</param>
     /// <param name="e">Objeto que representa el evento</param>
     protected void ftnGenerarPDF_Click(object sender, EventArgs e)
     {
         Response.ContentType = "application/pdf";
         Response.AddHeader("content-disposition", "attachment;filename=sabanarepositorio.pdf");
         Response.Cache.SetCacheability(HttpCacheability.NoCache);
         StringWriter sw = new StringWriter();
         HtmlTextWriter hw = new HtmlTextWriter(sw);
         GridView GridView1 = GenerarQuery();
         GridView1.AllowPaging = false;
         //GridView1.DataBind();
         GridView1.RenderControl(hw);
         StringReader sr = new StringReader(sw.ToString());
         Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
         HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
         PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
         pdfDoc.Open();
         htmlparser.Parse(sr);
         pdfDoc.Close();
         Response.Write(pdfDoc);
         Response.End();  
     }
     /// <summary>
     /// Metodo que controla el evento click sobre el botón de generar Word con la exportación
     /// </summary>
     /// <param name="sender">Objeto que desencadena el evento</param>
     /// <param name="e">Objeto que representa el evento</param>
     protected void btnGenerarWord_Click(object sender, EventArgs e)
     {
         Response.Clear();
         Response.Buffer = true;
         Response.AddHeader("content-disposition", "attachment;filename=sabanarepositorio.doc");
         Response.Charset = "";
         Response.ContentType = "application/vnd.ms-word ";
         StringWriter sw = new StringWriter();
         HtmlTextWriter hw = new HtmlTextWriter(sw);
         GridView GridView1 = GenerarQuery();
         GridView1.AllowPaging = false;
       //  GridView1.DataBind();
         GridView1.RenderControl(hw);
         Response.Output.Write(sw.ToString());
         Response.Flush();
         Response.End();
     }
     /// <summary>
     /// Metodo que controla el evento click sobre el botón de generar CSV con la exportación
     /// </summary>
     /// <param name="sender">Objeto que desencadena el evento</param>
     /// <param name="e">Objeto que representa el evento</param>
     protected void btnGenerarCSV_Click(object sender, EventArgs e)
     {
         Response.Clear();
         Response.Buffer = true;
         Response.AddHeader("content-disposition", "attachment;filename=sabanarepositorio.csv");
         Response.Charset = "";
         Response.ContentType = "application/text";
         GridView GridView1 = GenerarQuery();
         DataTable dt =(DataTable) GridView1.DataSource;
         GridView1.AllowPaging = false;
       //  GridView1.DataBind();

         StringBuilder sb = new StringBuilder();
         for (int k = 0; k <dt.Columns.Count ; k++)
         {
             //add separator
             sb.Append(dt.Columns[k].ColumnName + ',');
         }
         //append new line
         sb.Append("\r\n");
         for (int i = 0; i < dt.Rows.Count; i++)
         {
             for (int k = 0; k < dt.Columns.Count; k++)
             {
                 //add separator
                 sb.Append( dt.Rows[i][k].ToString() + ',');
             }
             //append new line
             sb.Append("\r\n");
         }
         Response.Output.Write(sb.ToString());
         Response.Flush();
         Response.End();
     }
     [WebMethod]
     public static bool ExistePlantilla(string nom)
     {

          PlantillasDAO planDAO=new PlantillasDAO();
          if (planDAO.ExistePlantilla(nom).Value > 0)
          {
              return true;
          }
          return false;
     }
     protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
     {
         PlantillasDAO plan = new PlantillasDAO();
         plan.Delete(int.Parse(ddlPlantillas.SelectedValue));

         PlantillasDAO planDAO = new PlantillasDAO();
         Utils.LlenarComboLista(ddlPlantillas, planDAO.GetPlantillas(), "ID", "DSNOMBRE");
     }
}