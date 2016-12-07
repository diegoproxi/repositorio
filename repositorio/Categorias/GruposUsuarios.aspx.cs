using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Categorias_GruposUsuarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void chkTodos_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i < chkGrupos.Items.Count; i++)
        {
            chkGrupos.Items[i].Selected = chkTodos.Checked;
        }
    }
}