using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;

public partial class Administracion_EditConfiguracion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ConfiguracionesDAO con = new ConfiguracionesDAO();
            System.Data.DataTable dt = con.SelectConfxid(Convert.ToInt32(Request["id"]));
            Label1.Text = dt.Rows[0]["DSDESCRIPCION"].ToString();
            TextBox1.Text = dt.Rows[0]["DSVALOR"].ToString();
               
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ConfiguracionesDAO co = new ConfiguracionesDAO();
        co.UpdateQuery(TextBox1.Text, Convert.ToInt32(Request["id"]));
        Response.Write("<script>alert('configuracion modificada correctamente');window.parent.document.forms[0].submit();</script>");

    }
}