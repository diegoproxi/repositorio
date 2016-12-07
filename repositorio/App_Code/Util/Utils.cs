using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Globalization;
using System.Web.SessionState;
using System.IO;
using System.Data.SqlClient;
using DSRepositorioIndicadoresTableAdapters;


namespace com.triario.repositorio.util
{
    /// <summary>
    /// Esta clase tiene ciertas utilidades que contienen funcionalidades que se utilizan en el resto del aplicativo
    /// </summary>
    public class Utils
    {
        /// <summary>
        /// Función que retorna el path actual de la petición
        /// </summary>
        /// <param name="request">Objeto que representa la petición</param>
        /// <returns>Retorna el path actual</returns>
        public static string GetPath(HttpRequest request)
        {
            string[] vec = request.Url.AbsoluteUri.Split(new char[] { '/' });
            string aux = "";
            for (int i = 0; i < vec.Length - 1; i++)
            {

                aux += vec[i] + "/";
            }
            return aux;
        }

        /*  public static bool EsAdministrador(HttpSessionState session)
          {
          
              Usuario u = (Usuario)session["usuario"];
              return u.IsAdministrador;

          }*/

        /// <summary>
        /// Función que retorna la descripción de un item de una lista
        /// </summary>
        /// <param name="id">Identificador del item de la lista</param>
        /// <returns>Descripción del item de la lista</returns>
        public static string GetDescripcion(int id)
        {
            OpcionesListaDAO valores = new OpcionesListaDAO();
            string descripcion = (string)valores.GetDescripcion(id);
            return descripcion;
        }
        /// <summary>
        /// Metodo que pobla dropdownlist con fechas
        /// </summary>
        /// <param name="ddldia">dropdownlist de los dias</param>
        /// <param name="ddlmes">dropdownlist de los meses</param>
        /// <param name="ddlanio">dropdownlist de los años</param>
        public static void LlenarFecha(DropDownList ddldia, DropDownList ddlmes, DropDownList ddlanio)
        {
            ddlanio.Items.Add(" ");
            ddlmes.Items.Add(" ");
            ddldia.Items.Add(" ");
            String Ano = System.DateTime.Now.ToString("yyy");

            for (int i = 1900; i <= Convert.ToInt32(Ano); i++)
            {
                ddlanio.Items.Add(Convert.ToString(i));
            }
            ddlanio.Items.Add("9999");
            //ddlanio.Text = (System.DateTime.Now.ToString("yyy"));


            String Mes;

            for (int i = 1; i <= 12; i++)
            {
                Mes = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(i);
                ddlmes.Items.Add(i.ToString());

            }


            for (int i = 1; i <= 31; i++)
            {
                ddldia.Items.Add(Convert.ToString(i));
            }

        }
        /// <summary>
        /// Metodo que llenar un ListBox con una lsita determinada
        /// </summary>
        /// <param name="ddl">ListBox a poblar</param>
        /// <param name="idlista">Id de la lista</param>
        public static void LlenarComboListaCheck(ListBox ddl, int idlista)
        {
            OpcionesListaDAO tipo = new OpcionesListaDAO();
            ddl.DataSource = tipo.GetValoresLista(idlista);
            DataTable dt = (DataTable)ddl.DataSource;
            DataRow dr = dt.NewRow();

            ddl.DataValueField = "id";
            ddl.DataTextField = "dsdescripcion";
            ddl.DataBind();
        }
        /// <summary>
        /// Metodo que carga un checkboxlist con un DataTable determinado
        /// </summary>
        /// <param name="ddl">CheckBoxList a cargar</param>
        /// <param name="dt">Fuente de datos con la que se llena el CheckBoxList</param>
        /// <param name="id">Identificador del campo display value</param>
        /// <param name="dsdescripcion">Identificador del campo text field</param>
        public static void LlenarComboListaCheck(CheckBoxList ddl, DataTable dt, string id, string dsdescripcion)
        {

            ddl.DataSource = dt;

            ddl.DataValueField = id;
            ddl.DataTextField = dsdescripcion;
            ddl.DataBind();
        }
        /// <summary>
        /// Metodo que carga un dropdownlist con un DataTable determinado
        /// </summary>
        /// <param name="ddl">dropdownlist a cargar</param>
        /// <param name="dt">Fuente de datos con la que se llena el dropdownlist</param>
        /// <param name="id">Identificador del campo display value</param>
        /// <param name="dsdescripcion">Identificador del campo text field</param>
        public static void LlenarComboLista(DropDownList ddl, DataTable dt, string id, string dsdescripcion)
        {




            ddl.DataSource = dt;

            DataRow dr = dt.NewRow();
            dr[id] = "-1";
            dr[dsdescripcion] = "";

            dt.Rows.InsertAt(dr, 0);
            ddl.DataValueField = id;
            ddl.DataTextField = dsdescripcion;



            ddl.DataBind();
        }
        public static void LlenarComboLista(CheckBoxList ddl, DataTable dt, string id, string dsdescripcion)
        {




            ddl.DataSource = dt;

            DataRow dr = dt.NewRow();
            dr[id] = "-1";
            dr[dsdescripcion] = "";

            dt.Rows.InsertAt(dr, 0);
            ddl.DataValueField = id;
            ddl.DataTextField = dsdescripcion;



            ddl.DataBind();
        }

        /// <summary>
        /// Metodo que carga un dropdownlist con una lista determinada
        /// </summary>
        /// <param name="ddl">Dropdownlist que se va cargar</param>
        /// <param name="idlista">Identificador de la lista a cargar</param>

        public static void LlenarComboLista(DropDownList ddl, int idlista)
        {
            OpcionesListaDAO tipo = new OpcionesListaDAO();
            ddl.DataSource = tipo.GetValoresLista(idlista);
            DataTable dt = (DataTable)ddl.DataSource;
            DataRow dr = dt.NewRow();
            dr["id"] = "-1";
            dr["dsdescripcion"] = "";
            dr["idlista"] = idlista;
            dt.Rows.InsertAt(dr, 0);
            ddl.DataValueField = "id";
            ddl.DataTextField = "dsdescripcion";
            ddl.DataBind();
        }
        /// <summary>
        /// Metodo que carga un CheckBoxList con una lista determinada
        /// </summary>
        /// <param name="ddl">CheckBoxList que se va cargar</param>
        /// <param name="idlista">Identificador de la lista a cargar</param>
        public static void LlenarComboLista(CheckBoxList ddl, int idlista)
        {
            OpcionesListaDAO tipo = new OpcionesListaDAO();
            ddl.DataSource = tipo.GetValoresLista(idlista);
            DataTable dt = (DataTable)ddl.DataSource;
            DataRow dr = dt.NewRow();
            dr["id"] = "-1";
            dr["dsdescripcion"] = "";
            dr["idlista"] = idlista;
            dt.Rows.InsertAt(dr, 0);
            ddl.DataValueField = "id";
            ddl.DataTextField = "dsdescripcion";
            ddl.DataBind();
        }
        /// <summary>
        ///  Metodo que carga un RadioButtonList con una lista determinada
        /// </summary>
        /// <param name="rbl">CheckBoxList que se va cargar</param>
        /// <param name="idlista">Identificador de la lista a cargar</param>
        public static void LlenarTipos(RadioButtonList rbl, int idlista)
        {

            OpcionesListaDAO tipo = new OpcionesListaDAO();

            rbl.DataSource = tipo.GetValoresLista(idlista);
            DataTable dt = (DataTable)rbl.DataSource;
            DataRow dr = dt.NewRow();
            rbl.DataValueField = "id";
            rbl.DataTextField = "dsdescripcion";
            rbl.DataBind();

        }
        /// <summary>
        /// Metodo que carga un RadioButtonList con una lista determinada a partir de un registro padre especifico
        /// </summary>
        /// <param name="ddl">DropDownList que se va cargar</param>
        /// <param name="IdLista">Identificador de la lista a cargar</param>
        /// <param name="padre">Registro padre a partir del cual se va a cargar la lista</param>
        public static void LLenarListaComboPadre(DropDownList ddl, int IdLista, int padre)
        {
            OpcionesListaDAO tipo = new OpcionesListaDAO();
            ddl.DataSource = tipo.GetValoresListaPadre(IdLista, padre);
            DataTable dt = (DataTable)ddl.DataSource;
            DataRow dr = dt.NewRow();
            dr["id"] = "-1";
            dr["dsdescripcion"] = " ";
            dr["idlista"] = IdLista;
            dt.Rows.InsertAt(dr, 0);
            ddl.DataValueField = "id";
            ddl.DataTextField = "dsdescripcion";
            ddl.DataBind();
        }
        /// <summary>
        /// Metodo que muestra una alerta al usuario
        /// </summary>
        /// <param name="html">Control contenedor donde se va cargar el mensaje</param>
        /// <param name="msg">Mensaje de la alerta que se quiere mostrar</param>
        public static void Msg(HtmlGenericControl html, string msg)
        {
            html.Attributes.Add("onload", "javascript: alert('" + msg + "')");
        }
        /// <summary>
        /// Metodo que muestra una alerta al usuario y redirecciona a una ruta especifica
        /// </summary>
        /// <param name="html">Control contenedor donde se va cargar el mensaje</param>
        /// <param name="msg">Mensaje de la alerta que se quiere mostrar</param>
        /// <param name="ruta">Ruta a donde sera redireccionado el usuario</param>
        public static void MsgRedireccionar(HtmlGenericControl html, string msg, string ruta)
        {
            html.Attributes.Add("onload", "javascript: alert('" + msg + "');location.href='" + ruta + "';");
        }
        /// <summary>
        /// Funcion que convierte un object en int
        /// </summary>
        /// <param name="val">Objeto que se quiere convertir</param>
        /// <returns>Entero convertido</returns>
        public static int ToInt32(object val)
        {

            return Convert.ToInt32(val == DBNull.Value || val == null || val.ToString().Trim().Length == 0 ? 0 : val);
        }
        /// <summary>
        /// Funcion que convierte un object en int nullable
        /// </summary>
        /// <param name="val">Objeto que se quiere convertir</param>
        /// <returns>Entero nullable convertido</returns>
        public static int? ToInt32Null(object val)
        {

            return val == DBNull.Value || val == null || val.ToString().Trim().Length == 0 || val.ToString() == "-1" || val.ToString().Trim() == "" ? null : (int?)Convert.ToInt32(val);
        }
        /// <summary>
        /// Funcion que convierte un object en un DateTime
        /// </summary>
        /// <param name="val">Object a convertir</param>
        /// <returns>DateTime convertido</returns>
        public static DateTime? StringToDateTime(object val)
        {

            if (val == null)
            {
                return null;
            }
            if (val == DBNull.Value)
            {
                return null;
            }




            return (DateTime?)(val == DBNull.Value || val == null ? null : val);
        }

        /// <summary>
        /// Funcion que convierte un string en un DateTime
        /// </summary>
        /// <param name="val">string a convertir</param>
        /// <returns>DateTime convertido</returns>
        public static DateTime? StringToDateTime(string val)
        {

            if (val == null)
            {
                return null;
            }
            if (val == "")
            {
                return null;
            }
            string[] vec = val.Split(new char[] { '/' });
            return new DateTime(int.Parse(vec[2]), int.Parse(vec[1]), int.Parse(vec[0]));


        }
        /// <summary>
        /// Metodo que recupera el usuario actual
        /// </summary>
        /// <param name="ses">Session actual del usuario</param>
        /// <param name="res">Objeto de respuesta actual</param>
        /// <returns>Retorna toda la información del usuario actual</returns>
        public static DSRepositorioIndicadores.UsuariosVORow GetUsuario(HttpSessionState ses, HttpResponse res)
        {
            if (ses["user"] == null)
            {
               if(HttpContext.Current.User!=null&&HttpContext.Current.User.Identity!=null&&HttpContext.Current.User.Identity.Name!=null){
                       UsuariosDAO usuDao = new UsuariosDAO();
                    DSRepositorioIndicadores.UsuariosVODataTable usuvo= usuDao.GetUsuarioXNombre(HttpContext.Current.User.Identity.Name);
                    if (usuvo.Rows.Count > 0)
                    {
                        ses["user"] = usuvo[0];
                        return  usuvo[0];
                   
                    }
               }

               res.Redirect("https://www.conectandonosconlaestrategia.com/user=?" + HttpContext.Current.User.Identity.Name);
                return null;
            }

            return (DSRepositorioIndicadores.UsuariosVORow)ses["user"];
        }

        /// <summary>
        /// Funcion que convierte un object en un DateTime
        /// </summary>
        /// <param name="val">Object a convertir</param>
        /// <returns>DateTime convertido</returns>
        public static DateTime? ToDateTime(object val)
        {

            if (val == null)
            {
                return null;
            }
            return (DateTime?)(val == DBNull.Value || val == null ? null : val);
        }
        /// <summary>
        /// Funcion que convierte un object en un bool
        /// </summary>
        /// <param name="val">Object a convertir</param>
        /// <returns>bool convertido</returns>
        public static bool Tobool(object val)
        {
            if (val == null)
            {
                return false;
            }
            if (val.ToString() == "1")
                return true;
            if (val.ToString() == "0")
                return false;
            return (bool)(val == DBNull.Value || val == null ? false : val);
        }
        /// <summary>
        /// Funcion que convierte un object en un bool nullable
        /// </summary>
        /// <param name="val">Object a convertir</param>
        /// <returns>bool nullable a convertido</returns>
        public static bool? ToboolNull(object val)
        {
            if (val == null || val == DBNull.Value)
            {


                return null;
            }
            if (val.ToString() == "1")
                return true;
            else
                return false;



        }
        /// <summary>
        /// Metodo que regsitra un resgitro en el log del sistema
        /// </summary>
        /// <param name="error">Error a registrar</param>
        public static void InsertLog(string error)
        {
            ErroresDAO talogs = new ErroresDAO();
            talogs.InsertarError(error, null);
        }
        /*  public static string GetNombreUsuario(HttpSessionState session)
          {
              Usuario us = (Usuario)session["usuario"];
              if (us != null)
              {
                  return us.UsuarioS;
              }
              return "";
          }*/
        /// <summary>
        /// Metodo que crea un archivo delimitado por un caracter
        /// </summary>
        /// <param name="fileName">Nombre del archivo a crear</param>
        /// <param name="dt">DataTable con el cual se desea crear el archivo</param>
        /// <param name="separatorChar">Caracter con el que se separaran los registros</param>
        /// <param name="hdr">Indica si el archivo tendra cabecera</param>
        /// <param name="textDelimiter">Indica si los registros estaran delimitados</param>
        public static void CreateTextDelimiterFile(string fileName, DataTable dt, string separatorChar, bool hdr, bool textDelimiter)
        {


            if (fileName == "")
            {

                throw new System.ArgumentException("Argumentos no válidos.");
            }

            StreamWriter sw;
            int col = 0;
            string value = "";


            sw = new System.IO.StreamWriter(fileName, false, System.Text.Encoding.Default);

            if (hdr)
            {

                foreach (DataColumn dc in dt.Columns)
                {
                    if (textDelimiter)
                    {



                        value += "\"" + dc.ColumnName + "\"" + separatorChar;

                    }
                    else
                    {


                        value += dc.ColumnName + separatorChar;

                    }
                }

                sw.WriteLine(value.Remove(value.Length - 1, 1));
                value = "";

            }
            foreach (DataRow dr in dt.Rows)
            {

                foreach (DataColumn dc in dt.Columns)
                {
                    if ((dc.DataType == System.Type.GetType("System.String")) && textDelimiter)
                    {

                        value += "\"" + dr[col].ToString() + "\"" + separatorChar;

                    }
                    else
                    {


                        value += dr[col].ToString() + separatorChar;

                    }


                    col++;

                }

                sw.WriteLine(value.Remove(value.Length - 1, 1));
                value = "";
                col = 0;

            }


            sw.Close();


        }
        /// <summary>
        /// Funcion que retorna un DataTable a prtir de una consulta sql
        /// </summary>
        /// <param name="sql">Consulta sql a ejecutar</param>
        /// <param name="con">Conexión a la base de datos</param>
        /// <returns>Retorna un DataTable con el conjunto de regsitros devueltos de la consulta</returns>
        public static DataTable CreateDataTable(string sql, SqlConnection con)
        {
            SqlCommand com = con.CreateCommand();
            com.CommandText = sql;
            SqlDataAdapter adap = new SqlDataAdapter(com);
            DataTable dtfiltro = new DataTable();
            adap.Fill(dtfiltro);
            return dtfiltro;

        }
        /// <summary>
        /// Metodo que ejecuta una sentencia sql
        /// </summary>
        /// <param name="sql">Sentencia sql</param>
        /// <param name="con">Conexión a la base de datos</param>
        public static void EjecutarQuery(string sql, SqlConnection con)
        {
            con.Open();
            SqlCommand com = con.CreateCommand();
            com.CommandText = sql;
            com.ExecuteNonQuery();
            con.Close();

        }
        /// <summary>
        /// Función que ejecuta una sentencia sql y retorna el resultado
        /// </summary>
        /// <param name="sql">Consulta sql a ejecutar</param>
        /// <param name="con">Conexión a la base de datos</param>
        /// <returns></returns>
        public static object EjecutarScalar(string sql, SqlConnection con)
        {
            con.Open();
            SqlCommand com = con.CreateCommand();
            com.CommandText = sql;
            object o = com.ExecuteScalar();
            con.Close();
            return o;



        }
        /// <summary>
        /// Metodo que asigna un valor a un DropDownList
        /// </summary>
        /// <param name="ddl">DropDownList que desea asignarle el valor</param>
        /// <param name="valor">Valor a asignar en el DropDownList</param>
        public static void AsignarValorLista(DropDownList ddl, string valor)
        {
            try
            {
                ddl.SelectedValue = valor;
            }
            catch (Exception exc)
            {

                Utils.InsertLog("Mensaje:" + exc.Message + ". <br> Pila:" + exc.StackTrace + " <br> ");
            }
        }
        /// <summary>
        /// Función que retorna un mensaje determinado
        /// </summary>
        /// <param name="msg">Mensaje a recuperar</param>
        /// <returns>Mensaje recuperado</returns>
        public static string GetMensaje(string msg)
        {
            OpcionesListaDAO opDAO = new OpcionesListaDAO();
            return opDAO.GetMensaje(msg).ToString();

        }
        /// <summary>
        /// Metodo que registra un error en el log del sistema
        /// </summary>
        /// <param name="exc">Excpeción generada por el error</param>
        public static void RegistrarError(Exception exc)
        {
            Utils.InsertLog("Mensaje:" + exc.Message + ". <br> Pila:" + exc.StackTrace + " <br> ");
        }
        /// <summary>
        /// Funcion que retorna el contendio de una página web
        /// </summary>
        /// <param name="url">Url de la página a consultar</param>
        /// <param name="username">Usuario para acceder a la página</param>
        /// <param name="password">Password para acceder a la página</param>
        /// <returns>Retorna el contenido de la pagina a consultar</returns>
        public static string GetWebConent(string url, string username, string password)
        {
            System.IO.Stream st = null;
            System.IO.StreamReader sr = null;

            try
            {
                // make a Web request
                System.Net.WebRequest req = System.Net.WebRequest.Create(url);

                // if the username/password are specified, use these credentials
                if (username != null && password != null)
                    req.Credentials = new System.Net.NetworkCredential(username, password);

                // get the response and read from the result stream
                System.Net.WebResponse resp = req.GetResponse();

                st = resp.GetResponseStream();
                sr = new System.IO.StreamReader(st);

                // read all the text in it
                return sr.ReadToEnd();
            }
            catch
            {
                return string.Empty;
            }
            finally
            {
                // always close readers and streams
                if (sr != null)
                    sr.Close();

                if (st != null)
                    st.Close();
            }
        }
        /// <summary>
        /// Funcion que recupera un parametro de la base de datos
        /// </summary>
        /// <param name="param">Nombre del parametro a recuperar</param>
        /// <returns>Valor del parametro recuperado</returns>
        public static string GetParametro(string param)
        {
            ConfiguracionesDAO confDAO = new ConfiguracionesDAO();
            return confDAO.GetParametro(param).ToString();

        }


    }
}