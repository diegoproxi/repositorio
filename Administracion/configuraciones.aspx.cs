using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;

public partial class configuraciones : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        llenargrid();
    }

    private void llenargrid()
    {
        ConfiguracionesDAO con = new ConfiguracionesDAO();
        System.Data.DataTable dt = con.selectconfi();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}