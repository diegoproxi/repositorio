using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Microsoft.ApplicationBlocks.Data;

public partial class MapaTransversal : System.Web.UI.Page
{
    public  int Real = 1026;
    public  int Presupuesto = 1027;
    public  int Matriz = 7035;
    public  int Costos = 7034;
    public int RealUM = 7;
    public int PresupuestoUM = 1;

    public  int Medellin = 6899;
    public  int Bogota = 6901;
    public  int Barranquilla = 6900;
    public  int Caloto = 6902;

    public int perdidas_costo = 7031;
    public int perdidas_volumen = 7032;
    public int perdidas_control = 7033;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            int anio = int.Parse(Request["anio"]);
            int mes = int.Parse(Request["mes"]);
            int ope = int.Parse(Request["ope"]);

            DataTable dt = new DataTable();
            dt.Columns.Add("INDICADOR");
            dt.Columns.Add("PESNC");
            dt.Columns.Add("UMNC");
            dt.Columns.Add("PESMED");
            dt.Columns.Add("UMMED");
            dt.Columns.Add("PESBOG");
            dt.Columns.Add("UMBOG");
            dt.Columns.Add("PESBAR");
            dt.Columns.Add("UMBAR");
            dt.Columns.Add("PESCAL");
            dt.Columns.Add("UMCAL");
            dt.Columns.Add("Pertenece");


            DataRow dr = dt.NewRow();
            dr["INDICADOR"] = "INDICE";

            double? vr1 = GetTotal2(Real, anio, mes, Costos, -1, -1, ope, -1, -1, -1);
            double? vr2 = GetTotal2(RealUM, anio, mes, Costos, -1, -1, ope, -1, -1, -1);

            double? vr3 = GetTotal2(Real, anio, mes, Costos, Medellin, -1, ope, -1, -1, -1);
            double? vr4 = GetTotal2(RealUM, anio, mes, Costos, Medellin, -1, ope, -1, -1, -1);


            double? vr5 = GetTotal2(Real, anio, mes, Costos, Bogota, -1, ope, -1, -1, -1);
            double? vr6 = GetTotal2(RealUM, anio, mes, Costos, Bogota, -1, ope, -1, -1, -1);
            double? vr7 = GetTotal2(Real, anio, mes, Costos, Barranquilla, -1, ope, -1, -1, -1);
            double? vr8 = GetTotal2(RealUM, anio, mes, Costos, Barranquilla, -1, ope, -1, -1, -1);

            double? vr9 = GetTotal2(Real, anio, mes, Costos, Caloto, -1, ope, -1, -1, -1);
            double? vr10 = GetTotal2(RealUM, anio, mes, Costos, Caloto, -1, ope, -1, -1, -1);

            double? vvr1 = GetTotal2(Real, anio, mes, Matriz, -1, -1, ope, -1, -1, -1);
            double? vvr2 = GetTotal2(RealUM, anio, mes, Matriz, -1, -1, ope, -1, -1, -1);

            double? vvr3 = GetTotal2(Real, anio, mes, Matriz, Medellin, -1, ope, -1, -1, -1);
            double? vvr4 = GetTotal2(RealUM, anio, mes, Matriz, Medellin, -1, ope, -1, -1, -1);


            double? vvr5 = GetTotal2(Real, anio, mes, Matriz, Bogota, -1, ope, -1, -1, -1);
            double? vvr6 = GetTotal2(RealUM, anio, mes, Matriz, Bogota, -1, ope, -1, -1, -1);
            double? vvr7 = GetTotal2(Real, anio, mes, Matriz, Barranquilla, -1, ope, -1, -1, -1);
            double? vvr8 = GetTotal2(RealUM, anio, mes, Matriz, Barranquilla, -1, ope, -1, -1, -1);

            double? vvr9 = GetTotal2(Real, anio, mes, Matriz, Caloto, -1, ope, -1, -1, -1);
            double? vvr10 = GetTotal2(RealUM, anio, mes, Matriz, Caloto, -1, ope, -1, -1, -1);

            dr["PESNC"] = vr1 == null || vr1.Value == 0 ? "0" : MostrarValor((vvr1.Value / vr1.Value) * 100) + "%";
            dr["UMNC"] = vr2 == null || vr2.Value == 0 ? "0" : MostrarValor((vvr2.Value / vr2.Value) * 100) + "%";

            dr["PESMED"] = vr3 == null || vr3.Value == 0 ? "0" : MostrarValor((vvr3.Value / vr3.Value) * 100) + "%";
            dr["UMMED"] = vr4 == null || vr4.Value == 0 ? "0" : MostrarValor((vvr4.Value / vr4.Value) * 100) + "%";


            dr["PESBOG"] = vr5 == null || vr5.Value == 0 ? "0" : MostrarValor((vvr5.Value / vr5.Value) * 100) + "%";
            dr["UMBOG"] = vr6 == null || vr6.Value == 0 ? "0" : MostrarValor((vvr6.Value / vr6.Value) * 100) + "%";
            dr["PESBAR"] = vr7 == null || vr7.Value == 0 ? "0" : MostrarValor((vvr7.Value / vr7.Value) * 100) + "%";
            dr["UMBAR"] = vr8 == null || vr8.Value == 0 ? "0" : MostrarValor((vvr8.Value / vr8.Value) * 100) + "%";

            dr["PESCAL"] = vr9 == null || vr9.Value == 0 ? "0" : MostrarValor((vvr9.Value / vr9.Value) * 100) + "%";
            dr["UMCAL"] = vr10 == null || vr10.Value == 0 ? "0" : MostrarValor((vvr10.Value / vr10.Value) * 100) + "%";




            dt.Rows.Add(dr);

            dr = dt.NewRow();
            dr["INDICADOR"] = "COSTO PRODUCCION";
            dr["Pertenece"] = "INDICE";
            dr["PESNC"] = GetTotal(Real, anio, mes, Costos, -1, -1, ope, -1, -1, -1);
            dr["UMNC"] = GetTotal(RealUM, anio, mes, Costos, -1, -1, ope, -1, -1, -1);

            dr["PESMED"] = GetTotal(Real, anio, mes, Costos, Medellin, -1, ope, -1, -1, -1);
            dr["UMMED"] = GetTotal(RealUM, anio, mes, Costos, Medellin, -1, ope, -1, -1, -1);


            dr["PESBOG"] = GetTotal(Real, anio, mes, Costos, Bogota, -1, ope, -1, -1, -1);
            dr["UMBOG"] = GetTotal(RealUM, anio, mes, Costos, Bogota, -1, ope, -1, -1, -1);
            dr["PESBAR"] = GetTotal(Real, anio, mes, Costos, Barranquilla, -1, ope, -1, -1, -1);
            dr["UMBAR"] = GetTotal(RealUM, anio, mes, Costos, Barranquilla, -1, ope, -1, -1, -1);

            dr["PESCAL"] = GetTotal(Real, anio, mes, Costos, Caloto, -1, ope, -1, -1, -1);
            dr["UMCAL"] = GetTotal(RealUM, anio, mes, Costos, Caloto, -1, ope, -1, -1, -1);

            dt.Rows.Add(dr);


            dr = dt.NewRow();
            dr["INDICADOR"] = "MATRIZ PERDIDAS";
            dr["Pertenece"] = "INDICE";
            dr["PESNC"] = GetTotal(Real, anio, mes, Matriz, -1, -1, ope, -1, -1, -1);
            dr["UMNC"] = GetTotal(RealUM, anio, mes, Matriz, -1, -1, ope, -1, -1, -1);

            dr["PESMED"] = GetTotal(Real, anio, mes, Matriz, Medellin, -1, ope, -1, -1, -1);
            dr["UMMED"] = GetTotal(RealUM, anio, mes, Matriz, Medellin, -1, ope, -1, -1, -1);


            dr["PESBOG"] = GetTotal(Real, anio, mes, Matriz, Bogota, -1, ope, -1, -1, -1);
            dr["UMBOG"] = GetTotal(RealUM, anio, mes, Matriz, Bogota, -1, ope, -1, -1, -1);
            dr["PESBAR"] = GetTotal(Real, anio, mes, Matriz, Barranquilla, -1, ope, -1, -1, -1);
            dr["UMBAR"] = GetTotal(RealUM, anio, mes, Matriz, Barranquilla, -1, ope, -1, -1, -1);

            dr["PESCAL"] = GetTotal(Real, anio, mes, Matriz, Caloto, -1, ope, -1, -1, -1);
            dr["UMCAL"] = GetTotal(RealUM, anio, mes, Matriz, Caloto, -1, ope, -1, -1, -1);

            dt.Rows.Add(dr);




            dr = dt.NewRow();
            dr["INDICADOR"] = "PÉRDIDAS DEL COSTO DE PRODUCCIÓN";
            dr["Pertenece"] = "MATRIZ PERDIDAS";
            dr["PESNC"] = GetTotal(Real, anio, mes, Matriz, -1, -1, ope, -1, perdidas_costo, -1);
            dr["UMNC"] = GetTotal(RealUM, anio, mes, Matriz, -1, -1, ope, -1, perdidas_costo, -1);

            dr["PESMED"] = GetTotal(Real, anio, mes, Matriz, Medellin, -1, ope, -1, perdidas_costo, -1);
            dr["UMMED"] = GetTotal(RealUM, anio, mes, Matriz, Medellin, -1, ope, -1, perdidas_costo, -1);


            dr["PESBOG"] = GetTotal(Real, anio, mes, Matriz, Bogota, -1, ope, -1, perdidas_costo, -1);
            dr["UMBOG"] = GetTotal(RealUM, anio, mes, Matriz, Bogota, -1, ope, -1, perdidas_costo, -1);
            dr["PESBAR"] = GetTotal(Real, anio, mes, Matriz, Barranquilla, -1, ope, -1, perdidas_costo, -1);
            dr["UMBAR"] = GetTotal(RealUM, anio, mes, Matriz, Barranquilla, -1, ope, -1, perdidas_costo, -1);

            dr["PESCAL"] = GetTotal(Real, anio, mes, Matriz, Caloto, -1, ope, -1, perdidas_costo, -1);
            dr["UMCAL"] = GetTotal(RealUM, anio, mes, Matriz, Caloto, -1, ope, -1, perdidas_costo, -1);

            dt.Rows.Add(dr);

            CoreMapas.DSMapasTableAdapters.DiccionarioDAO dicDAO = new CoreMapas.DSMapasTableAdapters.DiccionarioDAO();


            CoreMapas.DSMapas.DiccionarioVODataTable dtdic = dicDAO.GetPerdidas2(perdidas_costo);
            CoreMapas.DSMapasTableAdapters.tri_rep_opciones_listaTableAdapter tri = new CoreMapas.DSMapasTableAdapters.tri_rep_opciones_listaTableAdapter();



            int cant = 0;



            for (int m = 0; m < dtdic.Rows.Count; m++)
            {
                dr = dt.NewRow();
                dr["INDICADOR"] = dtdic[m].DSNOMBRE;
                dr["Pertenece"] = "PÉRDIDAS DEL COSTO DE PRODUCCIÓN";
                dr["PESNC"] = GetTotal(Real, anio, mes, Matriz, -1, -1, ope, -1, perdidas_costo, dtdic[m].IDDICCIONARIO);
                dr["UMNC"] = GetTotal(RealUM, anio, mes, Matriz, -1, -1, ope, -1, perdidas_costo, dtdic[m].IDDICCIONARIO);

                dr["PESMED"] = GetTotal(Real, anio, mes, Matriz, Medellin, -1, ope, -1, perdidas_costo, dtdic[m].IDDICCIONARIO);
                dr["UMMED"] = GetTotal(RealUM, anio, mes, Matriz, Medellin, -1, ope, -1, perdidas_costo, dtdic[m].IDDICCIONARIO);


                dr["PESBOG"] = GetTotal(Real, anio, mes, Matriz, Bogota, -1, ope, -1, perdidas_costo, dtdic[m].IDDICCIONARIO);
                dr["UMBOG"] = GetTotal(RealUM, anio, mes, Matriz, Bogota, -1, ope, -1, perdidas_costo, dtdic[m].IDDICCIONARIO);
                dr["PESBAR"] = GetTotal(Real, anio, mes, Matriz, Barranquilla, -1, ope, -1, perdidas_costo, dtdic[m].IDDICCIONARIO);
                dr["UMBAR"] = GetTotal(RealUM, anio, mes, Matriz, Barranquilla, -1, ope, -1, perdidas_costo, dtdic[m].IDDICCIONARIO);

                dr["PESCAL"] = GetTotal(Real, anio, mes, Matriz, Caloto, -1, ope, -1, perdidas_costo, dtdic[m].IDDICCIONARIO);
                dr["UMCAL"] = GetTotal(RealUM, anio, mes, Matriz, Caloto, -1, ope, -1, perdidas_costo, dtdic[m].IDDICCIONARIO);

                if (dr["PESNC"] != null && dr["PESNC"].ToString() != "")
                {
                    dt.Rows.Add(dr);
                    cant++;
                }





            }
            if (cant == 0)
            {
                dt.Rows.RemoveAt(dt.Rows.Count - 1);
            }

            //////////////////////////

            cant = 0;
            dr = dt.NewRow();
            dr["INDICADOR"] = "PÉRDIDAS DE VOLUMEN DE PRODUCCIÓN";
            dr["Pertenece"] = "MATRIZ PERDIDAS";
            dr["PESNC"] = GetTotal(Real, anio, mes, Matriz, -1, -1, ope, -1, perdidas_volumen, -1);
            dr["UMNC"] = GetTotal(RealUM, anio, mes, Matriz, -1, -1, ope, -1, perdidas_volumen, -1);

            dr["PESMED"] = GetTotal(Real, anio, mes, Matriz, Medellin, -1, ope, -1, perdidas_volumen, -1);
            dr["UMMED"] = GetTotal(RealUM, anio, mes, Matriz, Medellin, -1, ope, -1, perdidas_volumen, -1);


            dr["PESBOG"] = GetTotal(Real, anio, mes, Matriz, Bogota, -1, ope, -1, perdidas_volumen, -1);
            dr["UMBOG"] = GetTotal(RealUM, anio, mes, Matriz, Bogota, -1, ope, -1, perdidas_volumen, -1);
            dr["PESBAR"] = GetTotal(Real, anio, mes, Matriz, Barranquilla, -1, ope, -1, perdidas_volumen, -1);
            dr["UMBAR"] = GetTotal(RealUM, anio, mes, Matriz, Barranquilla, -1, ope, -1, perdidas_volumen, -1);

            dr["PESCAL"] = GetTotal(Real, anio, mes, Matriz, Caloto, -1, ope, -1, perdidas_volumen, -1);
            dr["UMCAL"] = GetTotal(RealUM, anio, mes, Matriz, Caloto, -1, ope, -1, perdidas_volumen, -1);

            dt.Rows.Add(dr);

         dicDAO = new CoreMapas.DSMapasTableAdapters.DiccionarioDAO();


             dtdic = dicDAO.GetPerdidas2(perdidas_volumen);


            tri = new CoreMapas.DSMapasTableAdapters.tri_rep_opciones_listaTableAdapter();







            for (int m = 0; m < dtdic.Rows.Count; m++)
            {
                dr = dt.NewRow();
                dr["INDICADOR"] = dtdic[m].DSNOMBRE;
                dr["Pertenece"] = "PÉRDIDAS DE VOLUMEN DE PRODUCCIÓN";
                dr["PESNC"] = GetTotal(Real, anio, mes, Matriz, -1, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
                dr["UMNC"] = GetTotal(RealUM, anio, mes, Matriz, -1, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);

                dr["PESMED"] = GetTotal(Real, anio, mes, Matriz, Medellin, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
                dr["UMMED"] = GetTotal(RealUM, anio, mes, Matriz, Medellin, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);


                dr["PESBOG"] = GetTotal(Real, anio, mes, Matriz, Bogota, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
                dr["UMBOG"] = GetTotal(RealUM, anio, mes, Matriz, Bogota, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
                dr["PESBAR"] = GetTotal(Real, anio, mes, Matriz, Barranquilla, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
                dr["UMBAR"] = GetTotal(RealUM, anio, mes, Matriz, Barranquilla, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);

                dr["PESCAL"] = GetTotal(Real, anio, mes, Matriz, Caloto, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
                dr["UMCAL"] = GetTotal(RealUM, anio, mes, Matriz, Caloto, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);

                if (dr["PESNC"] != null && dr["PESNC"].ToString() != "")
                {
                    dt.Rows.Add(dr);
                    cant++;
                }





            }

            if (cant == 0)
            {
                dt.Rows.RemoveAt(dt.Rows.Count - 1);
            }

            cant = 0;

            dr = dt.NewRow();
            dr["INDICADOR"] = "PÉRDIDAS DEL CONTROL DE LA PRODUCCIÓN";
            dr["Pertenece"] = "MATRIZ PERDIDAS";
            dr["PESNC"] = GetTotal(Real, anio, mes, Matriz, -1, -1, ope, -1, perdidas_control, -1);
            dr["UMNC"] = GetTotal(RealUM, anio, mes, Matriz, -1, -1, ope, -1, perdidas_control, -1);

            dr["PESMED"] = GetTotal(Real, anio, mes, Matriz, Medellin, -1, ope, -1, perdidas_control, -1);
            dr["UMMED"] = GetTotal(RealUM, anio, mes, Matriz, Medellin, -1, ope, -1, perdidas_control, -1);


            dr["PESBOG"] = GetTotal(Real, anio, mes, Matriz, Bogota, -1, ope, -1, perdidas_control, -1);
            dr["UMBOG"] = GetTotal(RealUM, anio, mes, Matriz, Bogota, -1, ope, -1, perdidas_control, -1);
            dr["PESBAR"] = GetTotal(Real, anio, mes, Matriz, Barranquilla, -1, ope, -1, perdidas_control, -1);
            dr["UMBAR"] = GetTotal(RealUM, anio, mes, Matriz, Barranquilla, -1, ope, -1, perdidas_control, -1);

            dr["PESCAL"] = GetTotal(Real, anio, mes, Matriz, Caloto, -1, ope, -1, perdidas_control, -1);
            dr["UMCAL"] = GetTotal(RealUM, anio, mes, Matriz, Caloto, -1, ope, -1, perdidas_control, -1);

            dt.Rows.Add(dr);

            dicDAO = new CoreMapas.DSMapasTableAdapters.DiccionarioDAO();


            dtdic = dicDAO.GetPerdidas2(perdidas_control);


            tri = new CoreMapas.DSMapasTableAdapters.tri_rep_opciones_listaTableAdapter();


            




            for (int m = 0; m < dtdic.Rows.Count; m++)
            {
                dr = dt.NewRow();
                dr["INDICADOR"] = dtdic[m].DSNOMBRE;
                dr["Pertenece"] = "PÉRDIDAS DEL CONTROL DE LA PRODUCCIÓN";
                dr["PESNC"] = GetTotal(Real, anio, mes, Matriz, -1, -1, ope, -1, perdidas_control, dtdic[m].IDDICCIONARIO);
                dr["UMNC"] = GetTotal(RealUM, anio, mes, Matriz, -1, -1, ope, -1, perdidas_control, dtdic[m].IDDICCIONARIO);

                dr["PESMED"] = GetTotal(Real, anio, mes, Matriz, Medellin, -1, ope, -1, perdidas_control, dtdic[m].IDDICCIONARIO);
                dr["UMMED"] = GetTotal(RealUM, anio, mes, Matriz, Medellin, -1, ope, -1, perdidas_control, dtdic[m].IDDICCIONARIO);


                dr["PESBOG"] = GetTotal(Real, anio, mes, Matriz, Bogota, -1, ope, -1, perdidas_control, dtdic[m].IDDICCIONARIO);
                dr["UMBOG"] = GetTotal(RealUM, anio, mes, Matriz, Bogota, -1, ope, -1, perdidas_control, dtdic[m].IDDICCIONARIO);
                dr["PESBAR"] = GetTotal(Real, anio, mes, Matriz, Barranquilla, -1, ope, -1, perdidas_control, dtdic[m].IDDICCIONARIO);
                dr["UMBAR"] = GetTotal(RealUM, anio, mes, Matriz, Barranquilla, -1, ope, -1, perdidas_control, dtdic[m].IDDICCIONARIO);

                dr["PESCAL"] = GetTotal(Real, anio, mes, Matriz, Caloto, -1, ope, -1, perdidas_control, dtdic[m].IDDICCIONARIO);
                dr["UMCAL"] = GetTotal(RealUM, anio, mes, Matriz, Caloto, -1, ope, -1, perdidas_control, dtdic[m].IDDICCIONARIO);

                if (dr["PESNC"] != null && dr["PESNC"].ToString() != "")
                {
                    dt.Rows.Add(dr);
                    cant++;
                }





            }

            if (cant == 0)
            {
                dt.Rows.RemoveAt(dt.Rows.Count - 1);
            }



            /////////////////////////

            //dr = dt.NewRow();
            //dr["INDICADOR"] = "PÉRDIDAS DE VOLUMEN DE PRODUCCIÓN";
            //dr["Pertenece"] = "MATRIZ PERDIDAS";

            //dr["PESNC"] = vr1 == null || vr1.Value == 0 ? "0" : MostrarValor((vvr1.Value / vr1.Value) * 100);
            //dr["UMNC"] = vr2 == null || vr2.Value == 0 ? "0" : MostrarValor((vvr2.Value / vr2.Value) * 100);

            //dr["PESMED"] = vr3 == null || vr3.Value == 0 ? "0" : MostrarValor((vvr3.Value / vr3.Value) * 100);
            //dr["UMMED"] = vr4 == null || vr4.Value == 0 ? "0" : MostrarValor((vvr4.Value / vr4.Value) * 100);


            //dr["PESBOG"] = vr5 == null || vr5.Value == 0 ? "0" : MostrarValor((vvr5.Value / vr5.Value) * 100);
            //dr["UMBOG"] = vr6 == null || vr6.Value == 0 ? "0" : MostrarValor((vvr6.Value / vr6.Value) * 100);
            //dr["PESBAR"] = vr7 == null || vr7.Value == 0 ? "0" : MostrarValor((vvr7.Value / vr7.Value) * 100);
            //dr["UMBAR"] = vr8 == null || vr8.Value == 0 ? "0" : MostrarValor((vvr8.Value / vr8.Value) * 100);

            //dr["PESCAL"] = vr9 == null || vr9.Value == 0 ? "0" : MostrarValor((vvr9.Value / vr9.Value) * 100);
            //dr["UMCAL"] = vr10 == null || vr10.Value == 0 ? "0" : MostrarValor((vvr10.Value / vr10.Value) * 100);

            //dt.Rows.Add(dr);


            //dtdic = dicDAO.GetPerdidas2(perdidas_volumen);

            //for (int m = 0; m < dtdic.Rows.Count; m++)
            //{
            //    dr = dt.NewRow();
            //    dr["INDICADOR"] = dtdic[m].DSNOMBRE;
            //    dr["Pertenece"] = "PÉRDIDAS DE VOLUMEN DE PRODUCCIÓN";
            //    dr["PESNC"] = GetTotal(Real, anio, mes, Matriz, -1, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
            //    dr["UMNC"] = GetTotal(RealUM, anio, mes, Matriz, -1, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);

            //    dr["PESMED"] = GetTotal(Real, anio, mes, Matriz, Medellin, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
            //    dr["UMMED"] = GetTotal(RealUM, anio, mes, Matriz, Medellin, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);


            //    dr["PESBOG"] = GetTotal(Real, anio, mes, Matriz, Bogota, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
            //    dr["UMBOG"] = GetTotal(RealUM, anio, mes, Matriz, Bogota, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
            //    dr["PESBAR"] = GetTotal(Real, anio, mes, Matriz, Barranquilla, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
            //    dr["UMBAR"] = GetTotal(RealUM, anio, mes, Matriz, Barranquilla, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);

            //    dr["PESCAL"] = GetTotal(Real, anio, mes, Matriz, Caloto, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
            //    dr["UMCAL"] = GetTotal(RealUM, anio, mes, Matriz, Caloto, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);


            //    if (dr["PESNC"] != null && dr["PESNC"].ToString()!="")
            //    dt.Rows.Add(dr);





            //}




            //dr = dt.NewRow();
            //dr["INDICADOR"] = "PÉRDIDAS DEL CONTROL DE LA PRODUCCIÓN";
            //dr["Pertenece"] = "MATRIZ PERDIDAS";

            //dr["PESNC"] = vr1 == null || vr1.Value == 0 ? "0" : MostrarValor((vvr1.Value / vr1.Value) * 100);
            //dr["UMNC"] = vr2 == null || vr2.Value == 0 ? "0" : MostrarValor((vvr2.Value / vr2.Value) * 100);

            //dr["PESMED"] = vr3 == null || vr3.Value == 0 ? "0" : MostrarValor((vvr3.Value / vr3.Value) * 100);
            //dr["UMMED"] = vr4 == null || vr4.Value == 0 ? "0" : MostrarValor((vvr4.Value / vr4.Value) * 100);


            //dr["PESBOG"] = vr5 == null || vr5.Value == 0 ? "0" : MostrarValor((vvr5.Value / vr5.Value) * 100);
            //dr["UMBOG"] = vr6 == null || vr6.Value == 0 ? "0" : MostrarValor((vvr6.Value / vr6.Value) * 100);
            //dr["PESBAR"] = vr7 == null || vr7.Value == 0 ? "0" : MostrarValor((vvr7.Value / vr7.Value) * 100);
            //dr["UMBAR"] = vr8 == null || vr8.Value == 0 ? "0" : MostrarValor((vvr8.Value / vr8.Value) * 100);

            //dr["PESCAL"] = vr9 == null || vr9.Value == 0 ? "0" : MostrarValor((vvr9.Value / vr9.Value) * 100);
            //dr["UMCAL"] = vr10 == null || vr10.Value == 0 ? "0" : MostrarValor((vvr10.Value / vr10.Value) * 100);

            //dt.Rows.Add(dr);


            //dtdic = dicDAO.GetPerdidas2(perdidas_volumen);

            //for (int m = 0; m < dtdic.Rows.Count; m++)
            //{
            //    dr = dt.NewRow();
            //    dr["INDICADOR"] = dtdic[m].DSNOMBRE;
            //    dr["Pertenece"] = "PÉRDIDAS DEL CONTROL DE LA PRODUCCIÓN";
            //    dr["PESNC"] = GetTotal(Real, anio, mes, Matriz, -1, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
            //    dr["UMNC"] = GetTotal(RealUM, anio, mes, Matriz, -1, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);

            //    dr["PESMED"] = GetTotal(Real, anio, mes, Matriz, Medellin, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
            //    dr["UMMED"] = GetTotal(RealUM, anio, mes, Matriz, Medellin, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);


            //    dr["PESBOG"] = GetTotal(Real, anio, mes, Matriz, Bogota, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
            //    dr["UMBOG"] = GetTotal(RealUM, anio, mes, Matriz, Bogota, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
            //    dr["PESBAR"] = GetTotal(Real, anio, mes, Matriz, Barranquilla, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
            //    dr["UMBAR"] = GetTotal(RealUM, anio, mes, Matriz, Barranquilla, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);

            //    dr["PESCAL"] = GetTotal(Real, anio, mes, Matriz, Caloto, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);
            //    dr["UMCAL"] = GetTotal(RealUM, anio, mes, Matriz, Caloto, -1, ope, -1, perdidas_volumen, dtdic[m].IDDICCIONARIO);


            //    if (dr["PESNC"] != null && dr["PESNC"].ToString() != "")
            //        dt.Rows.Add(dr);





            //}

            Session["datos"] = dt;
            RadTreeList1.DataSource = dt;
            RadTreeList1.DataBind();
        }
        else
        {
            RadTreeList1.DataSource =(DataTable) Session["datos"];
            RadTreeList1.DataBind();
        }
                  

    }
    public  string MostrarValor(double? valor)
    {
        if (valor == null)
            return "";
        return String.Format("{0:0,0.0}", valor);


    }
    public string GetTotal(int esc, int anio, int mes, int clase, int plan, int ger, int ope, int linea, int n1, int dicc)
    {
        string sql = "SELECT      SUM(isnull(dbo.FN_GETVALORPERIODONUM(i.ID," + esc + ", " + anio + ", " + mes + "),0)) TOTAL " +

" FROM            tri_rep_indicadores AS i INNER JOIN " +
"                          tri_rep_diccionarioindicadores AS d ON i.IDDICCIONARIO = d.ID INNER JOIN " +

"                        tri_rep_valoresxcampo AS olinea ON i.ID = olinea.IDINDICADOR INNER JOIN " +
"                      tri_rep_valoresxcampo AS ooper ON i.ID = ooper.IDINDICADOR INNER JOIN " +
  "                    tri_rep_valoresxcampo AS oplan ON i.ID = oplan.IDINDICADOR " +
"  WHERE      (olinea.IDCAMPO = 1049) AND (ooper.IDCAMPO = 1051) AND (oplan.IDCAMPO = 9) AND   ";

        if (clase != -1)
            sql += "  (i.NMLISTA4 = " + clase + ") and  ";
        if (plan != -1)
            sql += "   (oplan.IDVALOR =" + plan + ") and ";
        if (ger != -1)
            sql += "   (ooper.IDVALOR in (select ID from tri_rep_opciones_lista where IDPADRE=" + ger + " ) ) and ";
        if (ope != -1)
            sql += "   (ooper.IDVALOR = " + ope + ") and ";
        if (linea != -1)
            sql += "   (olinea.IDVALOR = " + linea + ") and ";
        if (n1 != -1)
            sql += "  (i.NMLISTA1 = " + n1 + ") and  ";

        if (dicc != -1)
            sql += "  (i.IDDICCIONARIO = " + dicc + ") and  ";

        sql += "   IDPERD is not null " +

     " 	and ((select count(*) from tri_rep_opcionesxlistamultiple o1,tri_rep_opcionesxlistamultiple o2,tri_rep_opcionesxlistamultiple o3 " +
     " 	where o1.IDVALORM=o2.IDVALORM and o3.IDVALORM=o2.IDVALORM " +
     " 	and o1.IDLISTA=9 and o2.IDLISTA=1064 AND o3.IDLISTA=1058 and o3.IDPERD=i.IDPERD " +
     " 	and o1.IDVALOR=oplan.IDVALOR and o2.IDVALOR=olinea.IDVALOR and o3.IDVALOR=ooper.IDVALOR  " +
     " 	)>0	or (dbo.FN_GETVALORPERIODONUM(i.ID," + esc + ", " + anio + ", " + mes + ") is not null )) ";

        object o = SqlHelper.ExecuteScalar(System.Configuration.ConfigurationManager.ConnectionStrings["core_repositorioConnectionString"].ConnectionString, CommandType.Text, sql);
        if (o == null)
            return null;
        if (o.ToString() == "")
            return null;
        return MostrarValor(double.Parse(o.ToString()) / 1000000);
    }
    public double? GetTotal2(int esc, int anio, int mes, int clase, int plan, int ger, int ope, int linea, int n1, int dicc)
    {
        string sql = "SELECT      SUM(isnull(dbo.FN_GETVALORPERIODONUM(i.ID," + esc + ", " + anio + ", " + mes + "),0)) TOTAL " +

" FROM            tri_rep_indicadores AS i INNER JOIN " +
"                          tri_rep_diccionarioindicadores AS d ON i.IDDICCIONARIO = d.ID INNER JOIN " +

"                        tri_rep_valoresxcampo AS olinea ON i.ID = olinea.IDINDICADOR INNER JOIN " +
"                      tri_rep_valoresxcampo AS ooper ON i.ID = ooper.IDINDICADOR INNER JOIN " +
  "                    tri_rep_valoresxcampo AS oplan ON i.ID = oplan.IDINDICADOR " +
"  WHERE      (olinea.IDCAMPO = 1049) AND (ooper.IDCAMPO = 1051) AND (oplan.IDCAMPO = 9) AND   ";

        if (clase != -1)
            sql += "  (i.NMLISTA4 = " + clase + ") and  ";
        if (plan != -1)
            sql += "   (oplan.IDVALOR =" + plan + ") and ";
        if (ger != -1)
            sql += "   (ooper.IDVALOR in (select ID from tri_rep_opciones_lista where IDPADRE=" + ger + " ) ) and ";
        if (ope != -1)
            sql += "   (ooper.IDVALOR = " + ope + ") and ";
        if (linea != -1)
            sql += "   (olinea.IDVALOR = " + linea + ") and ";
        if (n1 != -1)
            sql += "  (i.NMLISTA3 = " + n1 + ") and  ";

        if (dicc != -1)
            sql += "  (i.IDDICCIONARIO = " + dicc + ") and  ";

        sql += "   IDPERD is not null " +

     " 	and ((select count(*) from tri_rep_opcionesxlistamultiple o1,tri_rep_opcionesxlistamultiple o2,tri_rep_opcionesxlistamultiple o3 " +
     " 	where o1.IDVALORM=o2.IDVALORM and o3.IDVALORM=o2.IDVALORM " +
     " 	and o1.IDLISTA=9 and o2.IDLISTA=1064 AND o3.IDLISTA=1058 and o3.IDPERD=i.IDPERD " +
     " 	and o1.IDVALOR=oplan.IDVALOR and o2.IDVALOR=olinea.IDVALOR and o3.IDVALOR=ooper.IDVALOR  " +
     " 	)>0	or (dbo.FN_GETVALORPERIODONUM(i.ID," + esc + ", " + anio + ", " + mes + ") is not null )) ";

        object o = SqlHelper.ExecuteScalar(System.Configuration.ConfigurationManager.ConnectionStrings["core_repositorioConnectionString"].ConnectionString, CommandType.Text, sql);
        if (o == null)
            return null;
        if (o.ToString() == "")
            return null;
        return double.Parse(o.ToString()) / 1000000;
    }
  
}