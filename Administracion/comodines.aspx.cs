using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
/// <summary>
///  Esta clase se encarga de visualizar la pantalla de comodines, la cual permite que se administren los comodines del sistema
/// </summary>
public partial class Administracion_comodines : System.Web.UI.Page
{
    /// <summary>
    /// Metodo que carga los componentes de la página y vsiualiza la configuración previa que se tenga en cuanto a comodines
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            llenarlistas(DropDownList1);
            llenarlistas(DropDownList2);
            llenarlistas(DropDownList3);
            llenarlistas(DropDownList4);

            AtributosDAO at = new AtributosDAO();
            System.Data.DataTable dtcomo = at.SelectComodines();
            for (int i = 0; i < dtcomo.Rows.Count; i++)
            {
                if (Convert.ToBoolean(dtcomo.Rows[i]["SNACTIVO"]) == true)
                {

                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "DSTEXTO1")
                    {
                        CheckBox1.Checked = true;
                        TextBox1.Enabled = true;
                        TextBox1.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "DSTEXTO2")
                    {
                        CheckBox2.Checked = true;
                        TextBox2.Enabled = true;
                        TextBox2.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "DSTEXTO3")
                    {
                        CheckBox3.Checked = true;
                        TextBox3.Enabled = true;
                        TextBox3.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "DSTEXTO4")
                    {
                        CheckBox4.Checked = true;
                        TextBox4.Enabled = true;
                        TextBox4.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "DSAREA1")
                    {
                        CheckBox5.Checked = true;
                        TextBox5.Enabled = true;
                        TextBox5.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "DSAREA2")
                    {
                        CheckBox6.Checked = true;
                        TextBox6.Enabled = true;
                        TextBox6.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "DSAREA3")
                    {
                        CheckBox7.Checked = true;
                        TextBox7.Enabled = true;
                        TextBox7.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "DSAREA4")
                    {
                        CheckBox8.Checked = true;
                        TextBox8.Enabled = true;
                        TextBox8.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "FECHA1")
                    {
                        CheckBox9.Checked = true;
                        TextBox9.Enabled = true;
                        TextBox9.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "FECHA2")
                    {
                        CheckBox10.Checked = true;
                        TextBox10.Enabled = true;
                        TextBox10.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "FECHA3")
                    {
                        CheckBox11.Checked = true;
                        TextBox11.Enabled = true;
                        TextBox11.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "FECHA4")
                    {
                        CheckBox12.Checked = true;
                        TextBox12.Enabled = true;
                        TextBox12.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "NMNUMERO1")
                    {
                        CheckBox13.Checked = true;
                        TextBox13.Enabled = true;
                        TextBox13.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "NMNUMERO2")
                    {
                        CheckBox14.Checked = true;
                        TextBox14.Enabled = true;
                        TextBox14.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "NMNUMERO3")
                    {
                        CheckBox15.Checked = true;
                        TextBox15.Enabled = true;
                        TextBox15.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "NMNUMERO4")
                    {
                        CheckBox16.Checked = true;
                        TextBox16.Enabled = true;
                        TextBox16.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "NMLISTA1")
                    {
                        CheckBox17.Checked = true;
                        TextBox17.Enabled = true;
                        TextBox17.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                        DropDownList1.SelectedValue = dtcomo.Rows[i]["IDDEPENDIENTE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "NMLISTA2")
                    {
                        CheckBox18.Checked = true;
                        TextBox18.Enabled = true;
                        TextBox18.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                        DropDownList2.SelectedValue = dtcomo.Rows[i]["IDDEPENDIENTE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "NMLISTA3")
                    {
                        CheckBox19.Checked = true;
                        TextBox19.Enabled = true;
                        TextBox19.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                        DropDownList3.SelectedValue = dtcomo.Rows[i]["IDDEPENDIENTE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "NMLISTA4")
                    {
                        CheckBox20.Checked = true;
                        TextBox20.Enabled = true;
                        TextBox20.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                        DropDownList4.SelectedValue = dtcomo.Rows[i]["IDDEPENDIENTE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "SNBOOL1")
                    {
                        CheckBox21.Checked = true;
                        TextBox21.Enabled = true;
                        TextBox21.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "SNBOOL2")
                    {
                        CheckBox22.Checked = true;
                        TextBox22.Enabled = true;
                        TextBox22.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "SNBOOL3")
                    {
                        CheckBox23.Checked = true;
                        TextBox23.Enabled = true;
                        TextBox23.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }
                    if (dtcomo.Rows[i]["DSCOLUMNA"].ToString() == "SNBOOL4")
                    {
                        CheckBox24.Checked = true;
                        TextBox24.Enabled = true;
                        TextBox24.Text = dtcomo.Rows[i]["DSNOMBRE"].ToString();
                    }



                }
            }
        }
       
    }
  
    /// <summary>
    /// Metodo que se encarga de cargar un dropdownlist con lso atributos configurados en el sistema
    /// </summary>
    /// <param name="ddl">Parametro con el dropdownlist que se desea cargar</param>
    public void llenarlistas(DropDownList ddl) {
        AtributosDAO atr = new AtributosDAO();
        System.Data.DataTable dt = atr.GetDataBy();
        System.Data.DataRow dr = dt.NewRow();
        dr["ID"] = "-1";
        dr["DSNOMBRE"] = "";
        dt.Rows.InsertAt(dr, 0);
        ddl.DataSource = dt;
        ddl.DataValueField = "id";
        ddl.DataTextField = "DSNOMBRE";
        ddl.DataBind();
        
    }
    /// <summary>
    /// Metodo que se ejecuta al momento en que el usuario presiona el botón guardar, el sistema guarda toda la configuración hecha por el usuario
    /// </summary>
    /// <param name="sender">Objeto que desencadena el evento</param>
    /// <param name="e">Objeto que representa el evento</param>
    protected void Button5_Click(object sender, EventArgs e)
   
    {
        AtributosDAO at = new AtributosDAO();
        if (CheckBox1.Checked == true)
        {
            at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(TextBox1.Text, null, null, true, "DSTEXTO1");
        }
        else {
            at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "DSTEXTO1");
        }
           if (CheckBox2.Checked == true)
        {          
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO( TextBox2.Text, null,null, true, "DSTEXTO2");
        }
         else
           {
               at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "DSTEXTO2");
           }
           if (CheckBox3.Checked == true)
        {          
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO( TextBox3.Text,null, null, true, "DSTEXTO3");
        }
           else
           {
               at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "DSTEXTO3");
           }
           if (CheckBox4.Checked == true)
        {          
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(  TextBox4.Text, null,null, true, "DSTEXTO4");
        }
           else
           {
               at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "DSTEXTO4");
           }
           if (CheckBox5.Checked == true)
           {
               at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO( TextBox5.Text,null, null, true, "DSAREA1");
           }
           else
           {
               at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "DSAREA1");
           }
           if (CheckBox6.Checked == true)
           {
               at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(  TextBox6.Text,null, null, true, "DSAREA2");
           }
           else
           {
               at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "DSAREA2");
           }

            if (CheckBox7.Checked == true)
           {
               at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO( TextBox7.Text,null, null, true, "DSAREA3");
           }
            else
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "DSAREA3");
            }

            if (CheckBox8.Checked == true)
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(  TextBox8.Text, null,null, true, "DSAREA4");
            }
            else
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "DSAREA4");
            }

            if (CheckBox9.Checked == true)
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO( TextBox9.Text,null, null, true, "FEFECHA1");
            }
            else
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "FEFECHA1");
            }
            if (CheckBox10.Checked == true)
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(  TextBox10.Text,null, null, true, "FEFECHA2");
            }
            else
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "FEFECHA2");
            }

            if (CheckBox11.Checked == true)
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(TextBox11.Text,null, null, true, "FEFECHA3");
            }
            else
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "FEFECHA3");
            }

            if (CheckBox12.Checked == true)
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO( TextBox12.Text, null,null, true, "FEFECHA4");
            }
            else
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "FEFECHA4");
            }

            if (CheckBox13.Checked == true)
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO( TextBox13.Text,null, null, true, "NMNUMERO1");
            }
            else
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "NMNUMERO1");
            }
            if (CheckBox14.Checked == true)
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO( TextBox14.Text,null, null, true, "NMNUMERO2");
            }
            else
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "NMNUMERO2");
            }

            if (CheckBox15.Checked == true)
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(TextBox15.Text,null, null, true, "NMNUMERO3");
            }
            else
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "NMNUMERO3");
            }

            if (CheckBox16.Checked == true)
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO( TextBox16.Text,null, null, true, "NMNUMERO4");
            }
            else
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "NMNUMERO4");
            }

            if (CheckBox17.Checked == true)
            {
                AtributosDAO listas = new AtributosDAO();
                System.Data.DataTable dlista = listas.SelectAtributo(Convert.ToInt32(DropDownList1.SelectedValue));
                int? idpadre = null;

                idpadre = Convert.ToInt32(dlista.Rows[0]["ID"]);

                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(TextBox17.Text, null, idpadre,true, "NMLISTA1");
            }
            else
            { 
            
                 at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "NMLISTA1");
            }
            
            if (CheckBox18.Checked == true)
            {
                AtributosDAO listas = new AtributosDAO();
                System.Data.DataTable dlista = listas.SelectAtributo(Convert.ToInt32(DropDownList2.SelectedValue));
                int? idpadre = null;
                
                    idpadre = Convert.ToInt32(dlista.Rows[0]["ID"]);

                    at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(TextBox18.Text, null, idpadre, true, "NMLISTA2");
            }
            else
            {

                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "NMLISTA2");
            }
            if (CheckBox19.Checked == true)
            {
                AtributosDAO listas = new AtributosDAO();
                System.Data.DataTable dlista = listas.SelectAtributo(Convert.ToInt32(DropDownList3.SelectedValue));
                int? idpadre = null;
              
                    idpadre = Convert.ToInt32(dlista.Rows[0]["ID"]);

                    at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(TextBox19.Text, null, idpadre, true, "NMLISTA3");
            }

            else
            {

                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "NMLISTA3");
            }
            if (CheckBox20.Checked == true)
            {
                AtributosDAO listas = new AtributosDAO();
                System.Data.DataTable dlista = listas.SelectAtributo(Convert.ToInt32(DropDownList4.SelectedValue));
                int? idpadre = null;
             
                    idpadre = Convert.ToInt32(dlista.Rows[0]["ID"]);

                    at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(TextBox20.Text, null, idpadre, true, "NMLISTA4");
            }
            else
            {

                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "NMLISTA4");
            }
            if (CheckBox21.Checked == true)
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO( TextBox21.Text,null, null, true, "SNBOOL1");
            }
            else
            {

                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "SNBOOL1");
            }
            if (CheckBox22.Checked == true)
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO( TextBox22.Text,null, null, true, "SNBOOL2");
            }
            else
            {

                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "SNBOOL2");
            }
            if (CheckBox23.Checked == true)
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(TextBox23.Text,null, null, true, "SNBOOL3");
            }
            else
            {

                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "SNBOOL3");
            }
            if (CheckBox24.Checked == true)
            {
                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(TextBox24.Text, null,null, true, "SNBOOL4");
            }
            else
            {

                at.PRC_TRI_REP_UPDATE_ORDEN_ATRIBUTO(null, null, null, false, "SNBOOL4");
            }
}
        
    
}