<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Exportar.aspx.cs" Inherits="Exportar"  EnableEventValidation="false"%>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, 
Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" 
TagPrefix="asp" %> 

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" 
TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <link type="text/css" href="jquery/css/south-street/jquery-ui-1.8.23.custom.css" rel="stylesheet" />
		<script type="text/javascript" src="jquery/js/jquery-1.8.0.min.js"></script>
		<script type="text/javascript" src="jquery/js/jquery-ui-1.8.23.custom.min.js"></script>
        <script src="validator/js/languages/jquery.validationEngine-es.js" type="text/javascript" charset="utf-8"></script>
<script src="validator/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="validator/css/validationEngine.jquery.css" type="text/css" />

<script src="calendar/js/jscal2.js"></script> 
<script src="calendar/js/es.js"></script>
<link rel="stylesheet" type="text/css" href="calendar/css/jscal2.css" />

       <script type="text/javascript" src="jquery-easyui/jquery.easyui.min.js"></script>
       <link rel="stylesheet" type="text/css" href="jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui/themes/icon.css">

   
         <link type="text/css" href="estilos/exportar.css" rel="stylesheet" />
	<link type="text/css" href="estilos/global.css" rel="stylesheet" />


                <link href="Styles/cssUpdateProgress.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript">
	    cargarEasyui();
	  
	    var tabaux = -1;      
	</script>





	<link href="estilos_iniciales.css" rel="stylesheet" type="text/css" />
</head>
<body style="text-align:center;">
    <div class="campos-buscador">
<a name="inicio"></a>
    <form id="form1" runat="server" enctype="multipart/form-data">
      <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"> </asp:ScriptManager>
   

              <div class="pantillas_guardadas">
  <label>Pantillas guardadas</label>
                  <asp:DropDownList ID="ddlPlantillas" runat="server" CssClass="listas-exportar" 
                      AutoPostBack="True" onselectedindexchanged="ddlPlantillas_SelectedIndexChanged">
                  </asp:DropDownList>
 
</div>
<div class="clear"></div>


               <div id="params" class="plantillas tamanoigual">
               <div class="titles">Atributos</div>
            <%
                string parametros = "";
                int contador = 1;
                int cont_params = 1;

                DSRepositorioIndicadoresTableAdapters.AtributosDAO lbDAO = new DSRepositorioIndicadoresTableAdapters.AtributosDAO();
                DSRepositorioIndicadores.AtributosVODataTable lvDT = null;
                DSRepositorioIndicadores.AtributosVORow lvR = null;

                DSRepositorioIndicadoresTableAdapters.OpcionesListaBuscadorDAO olDAO = new DSRepositorioIndicadoresTableAdapters.OpcionesListaBuscadorDAO();
                DSRepositorioIndicadores.OpcionesListaBuscadorVODataTable olDT = null;
                DSRepositorioIndicadores.OpcionesListaBuscadorVORow olR = null;
                lvDT = lbDAO.GetAtributos();
                
                string ordernesa = "<option value='0'></option>";
                for (int k = 0; k < lvDT.Count + 5; k++)
                {
                    ordernesa += "<option value='" + (k + 1) + "'>" + (k + 1) + "</option>";
                }

              
                
                

                parametros += "<table class='zebra td50'>";
                parametros += "<tr><td><input name='chkatrfcodigo' type='checkbox' " + GetValorChk("chkatrfcodigo") + " /><label class='lb-exportar'>Código</label> </td><td>";


                parametros += " </td><td><select name='ochkatrfcodigo' id='ochkatrfcodigo'>" + ordernesa + "</select><script>document.forms[0].ochkatrfcodigo.value='" + GetValor("ochkatrfcodigo" ) + "';</script>  </td></tr>";

                parametros += "<tr><td><input name='chkatrfcodigoaux' type='checkbox' " + GetValorChk("chkatrfcodigoaux") + " /><label class='lb-exportar'>Código Auxiliar</label> </td><td>";


                parametros += "   </td><td><select name='ochkatrfcodigoaux' id='ochkatrfcodigoaux'>" + ordernesa + "</select> <script>document.forms[0].ochkatrfcodigoaux.value='" + GetValor("ochkatrfcodigoaux") + "';</script> </td></tr>";
                parametros += "<tr><td><input name='chkatrfnombre' type='checkbox' " + GetValorChk("chkatrfnombre") + " /><label class='lb-exportar'>Nombre</label> </td><td>";


                parametros += " </td><td><select name='ochkatrfnombre' id='ochkatrfnombre'>" + ordernesa + "</select> <script>document.forms[0].ochkatrfnombre.value='" + GetValor("ochkatrfnombre") + "';</script> </td></tr>";
                parametros += "<tr><td><input name='chkatrfregion' type='checkbox' " + GetValorChk("chkatrfregion") + " /><label class='lb-exportar'>Región</label>  </td><td>";

                parametros += "   <select name='region' id='region' class='listas-exportar'><option value='-1' ></option>";

                DSRepositorioIndicadoresTableAdapters.RegionesDAO regDAO = new DSRepositorioIndicadoresTableAdapters.RegionesDAO();
                DSRepositorioIndicadores.RegionesVODataTable rregdt = regDAO.GetRegionesXUsu(com.triario.repositorio.util.Utils.GetUsuario(Session, Response).ID);

                for (int j = 0; j < rregdt.Count; j++)
                {
                    DSRepositorioIndicadores.RegionesVORow regVO= rregdt[j];
                    if (GetValor("region") == regVO.ID.ToString())
                        parametros += "<option value='" + regVO.ID + "' selected='selected'>" + regVO.DSNOMBRE+ "</option>";
                    parametros += "<option value='" + regVO.ID + "'>" + regVO.DSNOMBRE + "</option>";
                }

                parametros += "</select>";



                parametros += " </td><td><select name='ochkatrfregion' id='ochkatrfregion'>" + ordernesa + "</select>  <script>document.forms[0].ochkatrfregion.value='" + GetValor("ochkatrfregion") + "';</script> </td></tr>";
                parametros += "<tr><td><input name='chkatrfresp' type='checkbox' " + GetValorChk("chkatrfresp") + "   /><label class='lb-exportar'>Responsable</label> </td><td>";


                parametros += " </td><td><select name='ochkatrfresp' id='ochkatrfresp'>" + ordernesa + "</select>   <script>document.forms[0].ochkatrfresp.value='" + GetValor("ochkatrfresp") + "';</script> </td></tr>";
                
                for (int i = 0; i < lvDT.Count; i++) {
                    lvR = lvDT[i];


                    parametros += "<tr><td><input name='chkatr" + lvR.ID + "' type='checkbox' " + GetValorChk("chkatr" + lvR.ID ) + " /><label class='lb-exportar'> " + lvR.DSNOMBRE + "</label> </td><td>";
                    
                   if(!lvR.IsIDLISTANull()){
                  parametros += "   <select name='lista" + lvR.ID + "' id='lista" + lvR.ID + "' class='listas-exportar'><option value='-1' ></option>";
                   

                    olDT = olDAO.GetOpcionesxlista(lvR.IDLISTA);

                    for (int j = 0; j < olDT.Count; j++) {
                        olR = olDT[j];
                        if(GetValor("lista" + lvR.ID )==olR.ID.ToString())
                            parametros += "<option value='" + olR.ID + "' selected='selected'>" + olR.DSNOMBRE + "</option>";
                        parametros += "<option value='"+olR.ID+"'>"+olR.DSNOMBRE+"</option>";
                    }

                    parametros += "</select>";
                 }
                   parametros += " </td><td><select name='ochkatr" + lvR.ID + "' id='ochkatr" + lvR.ID + "'>" + ordernesa + "</select>  <script>document.forms[0].ochkatr" + lvR.ID + ".value='" + GetValor("ochkatr" + lvR.ID ) + "';</script> </td></tr>";

                    

                    cont_params++;
                    
                }
                parametros += "</table>";
              
                
            %>
            <%= parametros%>
        </div>



         <div class="plantillas tamanoigual">
               <div class="titles">Escenarios</div>
            <%
                parametros = "";
                 contador = 1;
                 cont_params = 1;

                 DSRepositorioIndicadoresTableAdapters.EscenariosDAO lbeDAO = new DSRepositorioIndicadoresTableAdapters.EscenariosDAO();
                DSRepositorioIndicadores.EscenariosVODataTable lvDTe = null;
                DSRepositorioIndicadores.EscenariosVORow lvRe = null;



                lvDTe = lbeDAO.GetEscenarios();

                string ordernese = "<option value='0'></option>";
                for (int k = 0; k < lvDTe.Count+1 ; k++)
                {
                    ordernese += "<option value='" + (k + 1) + "'>" + (k + 1) + "</option>";
                }
                
                
                for (int i = 0; i < lvDTe.Count; i++)
                {
                    lvRe = lvDTe[i];


                    parametros += "<input name='chkesc" + lvRe.ID + "' type='checkbox'  " + GetValorChk("chkesc" + lvRe.ID) + "/><label class='lb-exportar'> " + lvRe.DSNOMBRE + "</label><select name='ochkesc" + lvRe.ID + "' id='ochkesc" + lvRe.ID + "'>" + ordernese + "</select>  <script>document.forms[0].ochkesc" + lvRe.ID + ".value='" + GetValor("ochkesc" + lvRe.ID) + "';</script>  <div class='clear'></div>";


               

                    

                    cont_params++;
                    
                }
                parametros += "<input name='chkescm' type='checkbox'  " + GetValorChk("meta") + "/><label class='lb-exportar'> Meta</label><select name='ochkescm' id='ochkescm'>" + ordernese + "</select>   <script>document.forms[0].ochkescm.value='" + GetValor("ochkescm") + "';</script>  <div class='clear'></div>";
              
                
            %>
            <%= parametros%>
        </div>


          <div class="plantillas tamanoigual">
               <div class="titles">Campos</div>
            <%
                 parametros = "";
                 contador = 1;
                 cont_params = 1;

                 DSRepositorioIndicadoresTableAdapters.CamposDAO lbcDAO = new DSRepositorioIndicadoresTableAdapters.CamposDAO();
                DSRepositorioIndicadores.CamposVODataTable lvcDT = null;
                DSRepositorioIndicadores.CamposVORow lvcR = null;

                
                lvcDT = lbcDAO.GetCampos();
                string ordernesc = "<option value='0'></option>";
                for (int k = 0; k < lvcDT.Count; k++)
                {
                    ordernesc += "<option value='" + (k + 1) + "'>" + (k + 1) + "</option>";
                }
                
                
                parametros += "<table class='zebra td50'>";
                for (int i = 0; i < lvcDT.Count; i++) {
                    lvcR = lvcDT[i];


                    parametros += "<tr><td><input name='chkcam" + lvcR.ID + "' type='checkbox'  " + GetValorChk("chkcam" + lvcR.ID) + "/><label class='lb-exportar'> " + lvcR.DSNOMBRE + "</label></td><td><select name='listacam" + lvcR.ID + "' id='listacam" + lvcR.ID + "' class='listas-exportar'><option value='-1' ></option>";

                    olDT = olDAO.GetOpcionesxlista(lvcR.IDLISTA);

                    for (int j = 0; j < olDT.Count; j++) {
                        olR = olDT[j];
                        if (GetValor("listacam" + lvcR.ID) == olR.ID.ToString())
                        parametros += "<option value='"+olR.ID+"' selected='selected'>"+olR.DSNOMBRE+"</option>";
                        parametros += "<option value='" + olR.ID + "' >" + olR.DSNOMBRE + "</option>";
                    }

                    parametros += "</select> </td><td><select name='ochkcam" + lvcR.ID + "' id='ochkcam" + lvcR.ID + "'>" + ordernesc + "</select>  <script>document.forms[0].ochkcam" + lvcR.ID + ".value='" + GetValor("ochkcam" + lvcR.ID) + "';</script>  </td></tr>";

                    

                    cont_params++;
                    
                }
                parametros += "</table>";
              
                
            %>
            <%= parametros%>
        </div>


          <div class="plantillas tamanoigual">
               <div class="titles">Períodos</div>
            <%
                parametros = "";
                 contador = 1;
                 cont_params = 1;

              



             
                parametros += "<table class='zebra td50'>";
                int plazo=int.Parse(com.triario.repositorio.util.Utils.GetParametro("LARGO_PLAZO"));
                int cant = 1;
                for (int i = DateTime.Now.Year - plazo; i <= DateTime.Now.Year + plazo; i++)
                {
                   
                    if(((cant-1)%2)==0)
                        parametros += "<tr>";
                    else
                        parametros += "</tr>";

                    parametros += "<td><input name='chkper" + i + "' type='checkbox' " + GetValorChk("chkper" + i) + " /><label class='lb-exportar'> " + i + "</label><div class='clear'></div></td>";

                    // if(((cant-1)%2)==0)
                    //    parametros += "</td><td>";
                    //else
                    //    parametros += "</td></tr>";
                    

                  
                    

                    cont_params++;
                    cant++;
                    
                }
                parametros += "</table>";
              
                
            %>
            <%= parametros%>
        </div>
        <div class="botones">
        
          <asp:Button ID="btnGenerar" runat="server" Text="Generar Excel" 
                onclick="btnGenerar_Click" />
                   <asp:Button ID="ftnGenerarPDF" runat="server" Text="Generar PDF" onclick="ftnGenerarPDF_Click" 
               />
                <asp:Button ID="btnGenerarWord" runat="server" Text="Generar Word" onclick="btnGenerarWord_Click" 
               />

                  <asp:Button ID="btnGenerarCSV" runat="server" Text="Generar CSV" onclick="btnGenerarCSV_Click" 
               />
               <br />
               <br />
	           <asp:Button ID="btnGuardar" runat="server" Text="Guardar Plantilla" 
                onclick="btnGuardar_Click" OnClientClick="return prompt1();" />

        </div>
                

       

</form>
<script>
    function validarForm() {
        return $('#form1').validationEngine('validate');
    }
    function validarEngine() {
        jQuery(document).ready(function () {


            jQuery("#form1").validationEngine('detach');

            jQuery("#form1").validationEngine();
        });
    }
    function pageLoad() {

        validarEngine();
        // cargarTabs();
        cargarEasyui();



    }
    function prompt1() {
        $.messager.prompt('Añadir Plantilla', 'Porfavor Ingrese el nombre', function (r) {
            if (r) {
           
             PageMethods.ExistePlantilla(r, function (result) {
                                        if (result == true) {
                                          alert("Existe una plantilla con el mimso nombre");
                                        }
                                        else {
                                            __doPostBack('btnGuardar', r);
                                        }



                
            
        });
        }
                            });

        return false;
    }

    </script>
    </div>
</body>
</html>