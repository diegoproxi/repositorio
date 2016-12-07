using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using com.triario.repositorio.util;
using System.Data.OleDb;
using System.Data;
using System.Globalization;
/// <summary>
/// Esta clase se encarga de visualizar la pantalla de captura masiva de indicadores
/// </summary>
public partial class Indicadores_CargaMasivaMatriz : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y carga las lsitas necesarias para la carga
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            EscenariosDAO escDAO = new EscenariosDAO();
            DataTable dt = escDAO.GetEscenariosActualizables();
            Session["tipos"] = dt;
             Utils.LlenarComboLista(ddlEscenario, dt,"ID","DSNOMBRE");

             for (int i = ddlEscenario.Items.Count - 1; i >= 1; i--)
             {
                 if (ddlEscenario.Items[i].Value != "1026" && ddlEscenario.Items[i].Value != "1027" && ddlEscenario.Items[i].Value != "5" && ddlEscenario.Items[i].Value != "7" && ddlEscenario.Items[i].Value != "4")
                 ddlEscenario.Items.RemoveAt(i);
                 
             }



             for (int i = 2008; i <= DateTime.Now.Year + int.Parse(Utils.GetParametro("LARGO_PLAZO")); i++)
             {
               
                     ddlDesde.Items.Add(i+"");
                     ddlHasta.Items.Add(i + "");
                

             }
             for (int i = DateTime.Now.Year - 5; i <= DateTime.Now.Year + 5; i++)
             {
                 ddlAnio.Items.Add(i + "");
             }

             ddlAnio.Items[5].Selected = true;
             LlenarComboListaMes(ddlPeriodo);


        }
        Page.Form.Attributes.Add("enctype", "multipart/form-data");
        divError.Style["display"] = "none";
        divMsg.Style["display"] = "none";

        chkRestr.Visible = (Utils.GetUsuario(Session,Response).DSTIPO == "S");
    }
    public void LlenarComboListaMes(DropDownList ddl)
    {
        string[] meses = { "enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre" };
        for (int i = 0; i < meses.Length; i++)
        {
            ddl.Items.Add(new ListItem(meses[i], (i + 1) + ""));
        }
        ddl.Items[DateTime.Now.Month-1].Selected = true;

    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón cargar, el sistema cargara el archivo temporalmente y listara las hojas que contiene
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void btnCargar_Click(object sender, EventArgs e)
    {
        if (ddlEscenario.SelectedValue=="-1")
        {
            divError.Style["display"] = "";
            msgError.InnerHtml = "Debe seleccionar un escenario";
            return ;
        }

        Random rnd = new Random();
       
        string archivo =  rnd.Next(10000)+fuArchivo.FileName;
        hfArchivo.Value = archivo;
        if (SubirArchivo(fuArchivo, ddlHoja, archivo))
        {
            divCar.Style["display"] = "none";
            divFinal.Style["display"] = "";
        }
        
    }

 /// <summary>
 /// Funciónque sube un archivo al servidor y almacena el archivo en una ruta especifica
 /// </summary>
 /// <param name="FileUpload1">Control tipo upload que contiene el archivo</param>
 /// <param name="DropDownList1">Dropdown donde s ecargarn las hojas que contiene el archivo</param>
 /// <param name="archivo">Nombre con el que se gaurdara el archivo</param>
 /// <returns></returns>
    private bool SubirArchivo(FileUpload FileUpload1, DropDownList DropDownList1,string archivo)
    {
        if (!FileUpload1.HasFile)
        {
            divError.Style["display"] = "";
           msgError.InnerHtml= "Debe seleccionar un archivo ";
            return false;
        }
        string ext = FileUpload1.FileName.ToLower();
        if (!ext.Contains(".xls"))
        {
            divError.Style["display"] = "";
            msgError.InnerHtml = "Debe seleccionar un archivo de excel";

           
            return false;
        }
        FileUpload1.SaveAs(Request.PhysicalApplicationPath + "\\cargues\\" + archivo);
        string[] sheets = GetExcelSheetNames(Request.PhysicalApplicationPath + "\\cargues\\" +archivo);
        if (sheets == null)
        {
            divError.Style["display"] = "";
            msgError.InnerHtml = "Verifique que el archivo sea un doumento de excel 97/2003";

            return false;
        }

        for (int i = 0; i < sheets.Length; i++)
        {
            if (sheets[i].Contains('_'))
                continue;
            DropDownList1.Items.Add(sheets[i].Replace("$",""));
        }

        return true;
    }
    /// <summary>
    /// Función que retorna las hojas que contiene un archivo en excel
    /// </summary>
    /// <param name="excelFile">Nombre del archivo en excel</param>
    /// <returns>Lista de hojas que contiene le archivo</returns>
    private string[] GetExcelSheetNames(string excelFile)
    {
        OleDbConnection objConn = null;
        System.Data.DataTable dt = null;

        try
        {
            // Connection String. Change the excel file to the file you

            // will search.

            string connString = "Provider=Microsoft.Jet.OLEDB.4.0;" +
                "Data Source=" + excelFile + ";Extended Properties=Excel 8.0;";
            // Create connection object by using the preceding connection string.

            objConn = new OleDbConnection(connString);
            // Open connection with the database.

            objConn.Open();
            // Get the data table containg the schema guid.

            dt = objConn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables_Info, null);

            if (dt == null)
            {
                return null;
            }

            string[] excelSheets = new string[dt.Rows.Count];
            int i = 0;

            // Add the sheet name to the string array.

            foreach (DataRow row in dt.Rows)
            {

                //if ((i % 2) != 0)
                //    continue;
                excelSheets[i] = row["TABLE_NAME"].ToString();
                i++;
                
            }

            // Loop through all of the sheets if you want too...


            return excelSheets;
        }
        catch (Exception ex)
        {
            return null;
        }
        finally
        {
            // Clean up.

            if (objConn != null)
            {
                objConn.Close();
                objConn.Dispose();
            }
            if (dt != null)
            {
                dt.Dispose();
            }
        }
    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón Finalizar, el sistema terminara de hacer la carga del archivo y caragar el contenido en un DataTable
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void btnFinalizar_Click(object sender, EventArgs e)
    {
        GetData(gvCarga, ddlHoja, Request.PhysicalApplicationPath + "\\cargues\\" + hfArchivo.Value);

        divFinal.Style["display"] = "none";

        divFinal2.Style["display"] = "";

       

    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón Terminar, el sistema terminara de hacer la actualización de los indicadores
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void btnTerminar_Click(object sender, EventArgs e)
    {
        ActualizacionDAO actDAO = new ActualizacionDAO();
        int act = int.Parse(actDAO.InsertActualizacion(Utils.GetUsuario(Session,Response).ID, txtObs.Text, hfArchivo.Value,chkRestr.Checked,int.Parse( ddlEscenario.SelectedValue)).ToString());
      DataTable dt = (DataTable)Session["dt"];
      IndicadoresDAO indDAO = new IndicadoresDAO();
      ErroresActDAO err = new ErroresActDAO();
      DataTable dtaux = (DataTable)Session["tipos"];
      string tipo = dtaux.Rows[ddlEscenario.SelectedIndex]["DSTIPO"].ToString();
      ActualizacionXIndicadorDAO actxindDAO = new ActualizacionXIndicadorDAO();
        int idusu=Utils.GetUsuario(Session,Response).ID;
        string tipousu=Utils.GetUsuario(Session,Response).DSTIPO;
        PerdidasDAO perDAO = new PerdidasDAO();
      for (int i = 0; i < dt.Rows.Count; i++)
      {
         
              int? aux = null;
              aux = perDAO.GetIdIndicador(dt.Rows[i][0].ToString(), dt.Rows[i][1].ToString(), dt.Rows[i][3].ToString(), dt.Rows[i][2].ToString());
              if (aux == null)
              {
                  err.InsertError(act, "La perdida " + dt.Rows[i][0].ToString() + " no existe");
                  continue;
              }
             


          int idind=int.Parse(aux.ToString());
          int anio = int.Parse(ddlAnio.SelectedValue);

          int mes = int.Parse(ddlPeriodo.SelectedValue); ;
              try
              {
                
                
                     
                     /*
                      if (dt.Rows[i].IsNull(j)||dt.Rows[i][j]==null||dt.Rows[i][j].ToString().Trim()=="")
                      {
                          mes++;
                         continue;
                      }
                      * */
                    
                      if(ddlEscenario.SelectedValue=="4"){
                          string valor = null;
                          if (dt.Rows[i].IsNull(4) || dt.Rows[i][4] == null || dt.Rows[i][4].ToString().Trim().ToUpper() == "N/A")
                          {
                              valor = "";
                          }
                          else
                          {
                              valor = dt.Rows[i][4].ToString();
                          }
                          actxindDAO.InsertValorActObs(idind, int.Parse(ddlEscenario.SelectedValue), anio, mes, valor, act, idusu, "Cargue Masivo", !chkRestr.Checked, dt.Rows[i][0].ToString(), tipousu);
                      }else{
                          decimal? valor = null;
                          if (dt.Rows[i].IsNull(4) || dt.Rows[i][4] == null || dt.Rows[i][4].ToString().Trim().ToUpper() == "N/A")
                          {
                              valor = null;
                          }
                          else
                          {
                              valor = decimal.Parse(dt.Rows[i][4].ToString());
                          }
                          actxindDAO.InsertValorActNum(idind, int.Parse(ddlEscenario.SelectedValue), anio, mes, valor, act, idusu, "Cargue Masivo", !chkRestr.Checked, dt.Rows[i][0].ToString(), tipousu);
                      }

                   


              }
              catch (Exception exc)
              {
                  err.InsertError(act, "Se produjo un error al actualizar el indicador " + dt.Rows[i][0].ToString() + ", en el período "+anio+"-"+mes+" . Error :"+exc.Message);
              }
          


      }

      ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "setindcat", "<script>alert('Se realizo el cargue exitosamente');window.location.href='../Indicadores/ResultadoCargueMatriz.aspx?id="+act+"';</script>", false);


    }
    /// <summary>
    /// Metodo que carga el contenido de un archivo en un GridView
    /// </summary>
    /// <param name="grid">Grid que se poblara</param>
    /// <param name="DropDownList1">Dropdownlist que tiene cargado las hojas del archivo</param>
    /// <param name="archivo">El archivo de excel que contiene los datos</param>
    public void GetData(GridView grid, DropDownList DropDownList1, string archivo)
    {
        OleDbConnection objConn = null;
        System.Data.DataTable dt = new DataTable();


        // Connection String. Change the excel file to the file you

        // will search.

        string connString = "Provider=Microsoft.Jet.OLEDB.4.0;" +
                      "Data Source=" + archivo + ";Extended Properties=Excel 8.0;";
        // Create connection object by using the preceding connection string.

        objConn = new OleDbConnection(connString);
        // Open connection with the database.

        objConn.Open();
        // Get the data table containg the schema guid.


        OleDbCommand olecom = objConn.CreateCommand();
        olecom.CommandText = "select * from [" + DropDownList1.Text+"$" + "]";
        OleDbDataAdapter olead = new OleDbDataAdapter();

        olead.SelectCommand = olecom;

        olead.Fill(dt);
        grid.DataSource = dt;
        Session["dt" ] = dt;
        grid.DataBind();




        if (objConn != null)
        {
            objConn.Close();
            objConn.Dispose();
        }
        if (dt != null)
        {
            dt.Dispose();
        }



    }


    /// <summary>
    /// Metodo que se activa en el momento en que el usuario desea cambiar de página en el paginador del grid 
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void gvCarga_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvCarga.PageIndex = e.NewPageIndex;
        gvCarga.DataSource =(DataTable) Session["dt"];

        gvCarga.DataBind();

    }
    protected void gvCarga_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow gvr = e.Row;
        NumberFormatInfo nfi = new NumberFormatInfo();
        nfi.NumberDecimalSeparator = ",";
        nfi.NumberGroupSeparator = ".";
        for (int i = 0; i < gvr.Cells.Count; i++)
        {
            string aux = gvr.Cells[i].Text;
            double d = 0;
            if (double.TryParse(aux, out d))
            {

              

                gvr.Cells[i].Text = d.ToString("0,0.0",nfi);
            }
                
            
        }
    }
}