using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DSRepositorioIndicadoresTableAdapters;
using Telerik.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Administracion_ConfigurarIndicadores : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HiddenField1.Value != "1")
        {
            indicadores.Style["display"] = "none";
            llenarcombo(DropDownList1);
        }
        else {
            indicadores.Style["display"] = "";
        }
        
    }
    public void llenarcombo(DropDownList ddl)
    {
        RegionesDAO reg = new RegionesDAO();
        System.Data.DataTable dt = reg.SelectRegiones();
        System.Data.DataRow dr = dt.NewRow();
        dr["ID"] = "-1";
        dr["DSNOMBRE"] = "";
        dt.Rows.InsertAt(dr, 0);
        ddl.DataSource = dt;
        ddl.DataValueField = "id";
        ddl.DataTextField = "DSNOMBRE";
        ddl.DataBind();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
    public void limpiar()
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox7.Text = "";
        TextBox8.Text = "";
        TextBox9.Text = "";
        TextBox10.Text = "";
        TextBox11.Text = "";
        TextBox12.Text = "";
        TextBox13.Text = "";
        TextBox14.Text = "";
        TextBox15.Text = "";
        TextBox16.Text = "";
        TextBox17.Text = "";
        TextBox18.Text = "";
        TextBox19.Text = "";
        TextBox20.Text = "";
    }
    protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        limpiar();
        if (DropDownList1.SelectedValue != "-1")
        {
            IndicadoresDAO indicadores = new IndicadoresDAO();
            indicadoresxregionDAO IND = new indicadoresxregionDAO();
            DSRepositorioIndicadores.indicadoresxregionVODataTable dtindicadores = IND.SelectIndicadoresxRegion(Convert.ToInt32(DropDownList1.SelectedValue));
            if (dtindicadores.Rows.Count > 0)
            {
                for (int i = 0; i < dtindicadores.Rows.Count; i++)
                {
                    System.Data.DataTable dtindicador = indicadores.GetIndicador(Convert.ToInt32(dtindicadores.Rows[i]["ID_INDICADOR"]));
                    string text = "TextBox" + (dtindicadores[i].NMORDEN).ToString();
                    RadComboBox textbox = (RadComboBox)FindControl(text);
                    textbox.Text = dtindicador.Rows[0]["DSCODIGO"].ToString();
                }
               
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      

       indicadoresxregionDAO indxregion = new indicadoresxregionDAO();
       IndicadoresDAO indicador = new IndicadoresDAO();
        indxregion.DeleteIndicadoresXregion(Convert.ToInt32(DropDownList1.SelectedValue));
        for (int i = 1; i < 21; i++)
        {
            string text = "TextBox" + (i).ToString();
            RadComboBox textbox = (RadComboBox)FindControl(text);
            object dtindicador = indicador.GetIndicadorXCod(textbox.Text);
            if (dtindicador != null && textbox.Text!="")
            {
                indxregion.InsertIndicadoresxregion(Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(dtindicador),i);
            }
        }
        Response.Write("<script>alert('Cambios guardados correctamente') </script>");
        limpiar();
        DropDownList1.SelectedValue = "-1";
        indicadores.Style["display"] = "none";
    }
    protected void RadComboBoxProduct_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    {
        RadComboBox radCodigo = (RadComboBox)sender;

        if (e.Text == "")
        {
            return;
        }
        string sqlSelectCommand = "select i.id, dbo.GetNombreCompletoIndicador(i.ID) dsnombre, i.dscodigo,(select DSNOMBRE from tri_rep_opciones_lista where ID=i.IDUNIMED ) UNIDADMEDIDA,(select DSNOMBRE from tri_rep_regiones where ID=i.IDREGION) DSREGION from dbo.tri_rep_indicadores i where  1=1 and dbo.GetNombreCompletoIndicador(i.ID) is not null ";
        string[] vec = e.Text.Split(new char[] { ' ' });

        for (int i = 0; i < vec.Length; i++)
        {
            sqlSelectCommand += " and ( upper(dbo.GetNombreCompletoIndicador(i.ID)) like upper('%" + vec[0] + "%') or  DSCODIGO like ('%" + vec[0] + "%') or  upper((select DSNOMBRE from tri_rep_regiones where ID=i.IDREGION)) like upper('%" + vec[0] + "%') or upper((select DSNOMBRE from tri_rep_opciones_lista where ID=i.IDUNIMED) ) like upper('%" + vec[0] + "%') )";

        }
        sqlSelectCommand += " order by dsnombre";

        SqlDataAdapter adapter = new SqlDataAdapter(sqlSelectCommand,
          ConfigurationManager.ConnectionStrings["core_repositorioConnectionString"].ConnectionString);
        for (int i = 0; i < vec.Length; i++)
        {
            adapter.SelectCommand.Parameters.AddWithValue("@text" + i, vec[i]);
        }
        DataTable dataTable = new DataTable();
        adapter.Fill(dataTable);

        foreach (DataRow dataRow in dataTable.Rows)
        {
            RadComboBoxItem item = new RadComboBoxItem();

            item.Text = dataRow.IsNull("dscodigo") ? "" : dataRow["dscodigo"].ToString();
            item.Value = dataRow.IsNull("dscodigo") ? "" : dataRow["dscodigo"].ToString();


            item.Attributes.Add("REGION", dataRow.IsNull("DSREGION") ? "" : dataRow["DSREGION"].ToString());
            item.Attributes.Add("UNIDAD", dataRow.IsNull("UNIDADMEDIDA") ? "" : dataRow["UNIDADMEDIDA"].ToString());
            item.Attributes.Add("NOMBRE", dataRow.IsNull("dsnombre") ? "" : dataRow["dsnombre"].ToString());


            radCodigo.Items.Add(item);

            item.DataBind();
        }
    }
}