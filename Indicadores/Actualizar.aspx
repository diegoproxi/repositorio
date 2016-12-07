<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Actualizar.aspx.cs" Inherits="Indicadores_Actualizar" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, 
Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" 
TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" 
TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head id="Head1" runat="server">
	<title></title>
	<link type="text/css" href="../jquery/css/south-street/jquery-ui-1.8.23.custom.css" rel="stylesheet" />
	<script type="text/javascript" src="../jquery/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="../jquery/js/jquery-ui-1.8.23.custom.min.js"></script>
	<script src="../validator/js/languages/jquery.validationEngine-es.js" type="text/javascript" charset="utf-8"></script>
	<script src="../validator/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="../validator/css/validationEngine.jquery.css" type="text/css" />
	<script type="text/javascript" src="../jquery-easyui/jquery.easyui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../jquery-easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="../jquery-easyui/themes/icon.css"/>
	<script src="../calendar/js/jscal2.js"></script>
	<script src="../calendar/js/es.js"></script>
	<link rel="stylesheet" type="text/css" href="../calendar/css/jscal2.css" />
	<link rel="stylesheet" href="../jquery.nyroModal/styles/nyroModal.css" type="text/css" media="screen" />
	<script type="text/javascript" src="../jquery.nyroModal/js/jquery.nyroModal.custom.js"></script>
	<!--[if IE 6]>
	<script type="text/javascript" src="js/jquery.nyroModal-ie6.min.js"></script>
<![endif]-->
	<script type="text/javascript">
    jQuery(function () {
        jQuery('.nyroModal').nyroModal();
    });
</script>
	<style type="text/css">
.tabs-panels {
	height:auto !important;
}
.nyroModalCont
{
    top: 10px !important;
}
.nyroModalCloseButton
{
     top: 25px !important;
}
.nyroModalCont iframe {
	width: 1000px !important;
	height: 500px !important;
}
</style>
	<link href="../Styles/cssUpdateProgress.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript">
	    cargarEasyui();
	    var ModalProgress = '<%= ModalProgress.ClientID %>';
	    var tabaux = -1;      
	</script>





	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
 
    <form id="form1" runat="server" enctype="multipart/form-data">
      <asp:HiddenField ID="hdInd" runat="server" EnableViewState="true" />
      <asp:HiddenField ID="hdCat" runat="server" EnableViewState="true" />
      <asp:HiddenField ID="hdIdRegion" runat="server" />
      <script type="text/javascript" src="../Scripts/jsUpdateProgress.js"></script>
      <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"> </asp:ScriptManager>

      <asp:Panel ID="panelUpdateProgress" runat="server" CssClass="updateProgress">
			<asp:UpdateProgress ID="UpdateProg1" DisplayAfter="0" runat="server">
				<ProgressTemplate>
					<div style="position: relative; top: 30%; text-align: center;">
						<img src="../images/loading.gif" style="vertical-align: middle" alt="Processing" />
						Procesando ...
					</div>
				</ProgressTemplate>
			</asp:UpdateProgress>
		</asp:Panel>
		<ajaxtoolkit:modalpopupextender ID="ModalProgress" runat="server" TargetControlID="panelUpdateProgress"
			BackgroundCssClass="modalBackground" PopupControlID="panelUpdateProgress" />


      <div class="ui-widget" id="divMsg" runat="server">
        <div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
          <p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
          <div id="msgExito" runat="server"></div>
          <p> </p>
          </p>
        </div>
      </div>
      <div class="ui-widget" id="divError" runat="server">
        <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
          <p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
          <div id="msgError" runat="server"></div>
          <p> </p>
          </p>
        </div>
      </div>
      <%
              DSRepositorioIndicadoresTableAdapters.IndicadoresDAO indDAO = new DSRepositorioIndicadoresTableAdapters.IndicadoresDAO();
              DSRepositorioIndicadoresTableAdapters.OpcionesListaDAO opDAO = new DSRepositorioIndicadoresTableAdapters.OpcionesListaDAO();

              DSRepositorioIndicadores.IndicadoresVODataTable dat = indDAO.GetIndicador(int.Parse(Request["id"]));
              DSRepositorioIndicadores.IndicadoresVORow ind = dat[0];
         
             %>
              <div class="bt_fijos">
      <% if (com.triario.repositorio.util.Utils.GetUsuario(Session, Response).DSTIPO == "S" || com.triario.repositorio.util.Utils.GetUsuario(Session, Response).DSTIPO == "A" || (!ind.IsIDRESPONSABLENull() && ind.IDRESPONSABLE == com.triario.repositorio.util.Utils.GetUsuario(Session, Response).ID))
         { %>
      <a href='javascript:fnAbrir(<%=Request["id"]%>)'>Editar</a>
      
      <%} if (com.triario.repositorio.util.Utils.GetUsuario(Session, Response).DSTIPO == "S" || com.triario.repositorio.util.Utils.GetUsuario(Session, Response).DSTIPO == "A")
         {%>
       <a href='javascript:fnAbrir2(<%=Request["id"]%>)'>Configurar</a>
      
<% } if (com.triario.repositorio.util.Utils.GetUsuario(Session, Response).DSTIPO == "S" || com.triario.repositorio.util.Utils.GetUsuario(Session, Response).DSTIPO == "A" || (!ind.IsIDRESPONSABLENull() && ind.IDRESPONSABLE == com.triario.repositorio.util.Utils.GetUsuario(Session, Response).ID)){%>
<a href='javascript:fnAbrir3(<%=Request["id"]%>)'>Atributos</a>
<%  } %>



 <a href='javascript:fnAbrir4("<%= ind.IsDSCODIGONull()?"":ind.DSCODIGO%>",$("#tt").tabs("getSelected").panel("options").title)'>Gráfica</a>
</div>
      <div class="contenidoVerBuscar" >
        <div class="Atributos"  title="Atributos" style="
    height: 160px;
    overflow-y: scroll;
    overflow-x: hidden;
">
          <div class="fijos">
            <h2>Atributos</h2>
        <div class="fila1">
       

          <h5>
            <strong><label for="ddlNombre">Nombre:</label></strong>
            <%=ind.DSNOMBRE%> </h5>
        

          <span>/</span>
                     <h5>
            <strong><label for="txtCodAux">Código:</label></strong>
            <%= ind.IsDSCODIGONull() ? "" : ind.DSCODIGO%> </h5>


         <br />
             <h5>
            <strong><label>Definición:</label></strong>
           
            <%= ind.IsDSDEFINICIONNull() ? "" : ind["DSDEFINICION"].ToString()%>
        
          </h5>     
          <% DSRepositorioIndicadoresTableAdapters.indicadoresxregionDAO inregDAO = new DSRepositorioIndicadoresTableAdapters.indicadoresxregionDAO();
             int? cantconf = inregDAO.GetConfInd(int.Parse(Request["id"]),com.triario.repositorio.util.Utils.GetUsuario(Session, Response).ID); %>
          <input type="checkbox" value="1" name="chkpanel" onclick="cambioPanel(this)" <%=cantconf.Value>0?"checked":"" %> /> Mostrar en Panel de Control?
          <br />
           


<h5>
            <strong><label for="ddlRegion">Región:</label></strong>
            <%
              DSRepositorioIndicadoresTableAdapters.RegionesDAO regDAO = new DSRepositorioIndicadoresTableAdapters.RegionesDAO();
                 
                  
                   %>
          <%= regDAO.GetNombre(ind.IDREGION)%> </h5>           <span>/</span>



           <h5>
            <strong><label>Unidad de Medida:</label></strong>
           
            <%=ind.IsIDUNIMEDNull() ? "" : opDAO.GetNombre(int.Parse(ind["IDUNIMED"].ToString()))%>
        
          </h5>     
           <span>/</span>

              <h5>
            <strong><label for="ddlResponsable">Responsable:</label></strong>
            <%
              DSRepositorioIndicadoresTableAdapters.UsuariosDAO usuDAO = new DSRepositorioIndicadoresTableAdapters.UsuariosDAO();
                 
                  
                   %>
            <%=ind.IsIDRESPONSABLENull() ? "" : usuDAO.GetNombre(ind.IDRESPONSABLE)%> </h5>    

              <span>/</span>


         

          
          

           
<div class="mas_atributos"><a onclick="document.getElementById('Atributoscomunes').style.display=(document.getElementById('Atributoscomunes').style.display==''?'none':'');return false;">+ atributos</a>
          <div id="Atributoscomunes" class="Atributos_comunes" style="display:none">
            

             <h5>
            <strong><label for="ddlNegocio">Negocio:</label></strong>
            <%
              DSRepositorioIndicadoresTableAdapters.NegociosDAO negDAO = new DSRepositorioIndicadoresTableAdapters.NegociosDAO();
                 
                  
                   %>
          <%= negDAO.GetNombre(ind.IDNEGOCIO)%> </h5>        

<h5>
            <strong><label>Categoría:</label></strong>
            <%
              if (!ind.IsIDCATEGORIANull())
              {
                  DSRepositorioIndicadoresTableAdapters.CategoriasDAO catDAO = new DSRepositorioIndicadoresTableAdapters.CategoriasDAO(); %>
            <%=catDAO.GetNombre(ind.IDCATEGORIA)%>
            <% }
              else
              {
                        %>
            Sin Categoría
            <% }
                        %>
          </h5>
       

          <h5>
            <strong><label for="txtCodAux">Código Auxiliar:</label></strong>
            <%= ind.DSCODIGOAUX%> </h5>          
    
<%
              if (!ind.IsIDDINDICADORELNull())
              {%>
          <h5>
            <strong><label for="ddlIndicadorRel">Indicador Relacionado:</label></strong>
            <%=indDAO.GetNombreCompletoIndicador(ind.IDDINDICADOREL)%> </h5>           
<% }

              DSRepositorioIndicadoresTableAdapters.AtributosDAO atrDAO = new DSRepositorioIndicadoresTableAdapters.AtributosDAO();
              DSRepositorioIndicadores.AtributosVODataTable dtatr = atrDAO.GetAtributosConfigurados(ind.IsIDCATEGORIANull() ? -1 : ind.IDCATEGORIA);
              string unidadaux = opDAO.GetNombre(ind.IsIDUNIMEDNull() ? -1 : ind.IDUNIMED);

              for (int i = 0; i < dtatr.Count; i++)
              {
                  string tipo = dtatr[i].DSTIPO;
                  int idatr = dtatr[i].ID;
                  if (!ind.IsNull(dtatr[i].DSCOLUMNA) && ind[dtatr[i].DSCOLUMNA] != null && ind[dtatr[i].DSCOLUMNA].ToString() != "" && ind[dtatr[i].DSCOLUMNA].ToString() != "-1")
                  {%>
          <h5>
            <strong><label><%=dtatr[i].DSNOMBRE%>:</label></strong>
            <%
              if (tipo.Trim() == "A" || tipo.Trim() == "C" || tipo.Trim() == "F" || tipo.Trim() == "N")
              {%>
            <%=ind[dtatr[i].DSCOLUMNA].ToString()%>
            <%}
              if (tipo.Trim() == "L")
              {%>
            <%= opDAO.GetNombre(int.Parse(ind[dtatr[i].DSCOLUMNA].ToString()))%>
            <%   }
              if (tipo.Trim() == "B")
              {%>
            <%= ((bool)ind[dtatr[i].DSCOLUMNA]) ? "Si" : "No"%>
            <%   }
               
                
                
                                               
                                               %>
          </h5>           
<%
                
                
                
                
              }

                  if (tipo.Trim() == "LM")
                  {
                      DSRepositorioIndicadoresTableAdapters.ValoresXAtributoDAO valDAO = new DSRepositorioIndicadoresTableAdapters.ValoresXAtributoDAO();
                      DSRepositorioIndicadores.ValoresXAtributoVODataTable dtval = valDAO.GetValoresXAtriInd(idatr, ind.ID);
                      if (dtval.Count > 0)
                      {%>
          <h5>
            <strong><label><%=dtatr[i].DSNOMBRE%>:</label></strong>
            <%
              for (int j = 0; j < dtval.Count; j++)
              {%>
            <%= opDAO.GetNombre(dtval[j].IDVALOR) + ";"%>
            <%  } %>
          </h5>
          <%  }
                  }



              }%>
        </div>
</div>          
           </div>
           </div>
           
            
                
        </div>
        

        <div class="Históricos" title="Históricos" >
          <h2>Históricos</h2>
          <div class="easyui-tabs" data-options="fit:true,plain:true" id="tt" style="height:auto !important">

            <div title="-" style="padding:10px;">
              <asp:Button ID="btnDis" runat="server" Text="Button"  style="display:none"
                  onclick="btnDisAnio_Click"  />
            </div>

            <% 
              int cant = 1;
              int frec = ind.IsIDFRECNull() ? 178 : ind.IDFREC;
              switch (frec)
              {
                  case 178:
                      cant = 12;
                      break;
                  case 179:
                      cant = 1;
                      break;
                  case 180:
                      cant = 3;
                      break;
                  case 181:
                      cant = 4;
                      break;
                  case 182:
                      cant = 6;
                      break;
              }
              string calculos = "";

              int? auxmin = indDAO.GetAnioMinimo(ind.ID);
              int? auxmax = indDAO.GetAnioMax(ind.ID);

              int largoplazo = System.DateTime.Now.Year + int.Parse(com.triario.repositorio.util.Utils.GetParametro("LARGO_PLAZO"));
                
              if (!ind.IsNMDESDENull() && ind.NMDESDE > 0 && ind.NMDESDE < auxmin.Value)
              {
                  auxmin = ind.NMDESDE;
              }
              if (!ind.IsNMHASTANull() && ind.NMHASTA > 0 && ind.NMHASTA > auxmax.Value)
              {
                  auxmax = ind.NMHASTA;
              }

              if (auxmax.Value < largoplazo)
                  auxmax = largoplazo;  
                
                
                %>
               <input type="hidden" name="hfDesde" id="hfDesde" value="<%=auxmin.Value %>" />
                <input type="hidden" name="hfHasta" id="hfHasta" value="<%=auxmax.Value %>"/>
             <% 
              //int min = auxmin == null || auxmin.Value == 0 ? System.DateTime.Now.Year : auxmin.Value;
              //min = min - ind.NMDESDE;
              int desde = auxmin.Value ;
              int hasta = auxmax.Value;
              Hashtable hs = new Hashtable();
              //int hasta = System.DateTime.Now.Year + int.Parse(com.triario.repositorio.util.Utils.GetParametro("LARGO_PLAZO")) + ind.NMHASTA;
              for (int i = auxmin.Value; i <= auxmax.Value; i++)
              {
%>
   <%
              string[] meses = { "", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };
         %>
            <div title="<%=i %>" style="padding:10px;height:auto !important" data-options="<%=(i==System.DateTime.Now.Year)?"selected:'true'":"" %>" >
              <div class="meta">
              <h4>Meta</h4> <input type="text" size="12" name="meta<%=i %>" id="meta<%=i %>" onchange='cambioValorMeta(<%=i %>,this.value)' <%=(i<DateTime.Now.Year&&com.triario.repositorio.util.Utils.GetUsuario(Session,Response).DSTIPO!="S"?"disabled='disabled'":"")%>  class="easyui-numberbox" data-options="precision:1" style="text-align: right;" <%=(com.triario.repositorio.util.Utils.GetUsuario(Session,Response).DSTIPO=="S"?"":"disabled='disabled'") %>/>
              <input type="hidden" name="cambiometa<%=i %>" id="cambiometa<%=i %>" value="0" />

              </div>
              
              <table class="zebra historico" cellpadding="0" cellspacing="0">
                <tr>
                  <td></td>
                  <%
                 
              DSRepositorioIndicadoresTableAdapters.ConfiguracioEscenariosHabDAO coneschabDAO = new DSRepositorioIndicadoresTableAdapters.ConfiguracioEscenariosHabDAO();
              DSRepositorioIndicadores.ConfiguracionEscenariosHabVODataTable dtesc = coneschabDAO.GetEscenariosIndicador(ind.ID, ind.IsIDCATEGORIANull() ? -1 : ind.IDCATEGORIA);



              for (int j = 0; j < dtesc.Count; j++)
              {
                  if (dtesc[j].HABILITADO)
                      continue;
                      %>
                  <td><%=dtesc[j].DSNOMBRE%><%=(unidadaux != "" && unidadaux != null) ? "(" + unidadaux + ")" : ""%> </td>
                  <% } %>
                </tr>
                <% for (int k = 1; k <= 12; k++)
                   {%>
                <tr>
                  <td><%=meses[k]%></td>
                  <%  
                      
              for (int j = 0; j < dtesc.Count; j++)
              {
                  if (dtesc[j].HABILITADO)
                      continue;


                  if (dtesc[j].DSTIPO != "O")
                  {
                      string opeaux = "";
                      try
                      {
                    
                          string[] vecf = dtesc[j].DSFORMULA.Split(new string[] { "||" }, StringSplitOptions.RemoveEmptyEntries);

                          if (vecf.Length > 0)
                          {
                               opeaux = "valor=0;try{ valor=";
                               var entro = 0;
                              for (int m = 0; m < vecf.Length; m++)
                              {
                                  string[] vecope = vecf[m].Split(new char[] { '@' }, StringSplitOptions.RemoveEmptyEntries);
                                  //if (vecope[0] == "e")
                                  //{
                                  //    string[] vecope2 = vecope[1].Split(new char[] { ':' }, StringSplitOptions.RemoveEmptyEntries);
                                  //    opeaux += "fnGetValor(" + i + "," + k + "," + vecope2[0];
                                  //}


                                  if (vecope[0] == "cod")
                                  {
                                      if (vecope[1] == "[INDICADOR]")
                                      {
                                          opeaux += "fnGetValor(" + i + "," + k + ",";
                                      }
                                      else
                                      {

                                          if (!hs.ContainsKey(dtesc[j].ID))
                                          {
                                              hs.Add(dtesc[j].ID, "1");
                                          }
                                          entro = 1;
                                          
                                          break;
                                      }
                                  }
                                  if (vecope[0] == "e")
                                  {
                                      string[] vecope2 = vecope[1].Split(new char[] { ':' }, StringSplitOptions.RemoveEmptyEntries);
                                      opeaux += vecope2[0];

                                  }
                                  
                                  if (vecope[0] == "pj")
                                  {

                                      opeaux += ",'" + vecope[1] + "'";
                                  }
                                  if (vecope[0] == "p")
                                  {

                                      opeaux += ",'" + vecope[1] + "')";
                                  }

                                  if (vecope[0] != "e" && vecope[0] != "pj" && vecope[0] != "p"&&vecope[0] != "cod")
                                  {
                                      opeaux += vecope[1];
                                  }

                              }
                              if (entro == 0)
                              {
                                  opeaux += ";}catch(e){valor='';}document.getElementsByName('periodoa" + i + "m" + k + "e" + dtesc[j].ID + "')[0].value=valor;document.getElementById('periodoa" + i + "m" + k + "e" + dtesc[j].ID + "').value=valor;   $('#periodoa" + i + "m" + k + "e" + dtesc[j].ID + "').numberbox('setValue',valor);document.getElementById('periodoa" + i + "m" + k + "e" + dtesc[j].ID + "').disabled=true;";
                                  calculos += opeaux + "\n";
                              }
                              else
                              {
                                  opeaux = "document.getElementById('periodoa" + i + "m" + k + "e" + dtesc[j].ID + "').disabled=true;";
                                  calculos += opeaux + "\n";
                              }
                          }
                      }
                      catch (Exception exc) { //Response.Write(opeaux+" - "+ exc.Message + ":" + exc.StackTrace + ". Formula :" + dtesc[j].DSFORMULA);
                      }



                  }
                 
                       
                    
                 
                  
                  
                    %>
                  <td><input type="hidden" name="cambioperiodoa<%=i %>m<%=k%>e<%=dtesc[j].ID%>"  id="cambioperiodoa<%=i %>m<%=k%>e<%=dtesc[j].ID%>"     value="0" />
                    <%if (dtesc[j].DSTIPO == "O")
                      { %>
                    <textarea rows="1"  cols="25" onchange='cambioValor2(<%=i %>,<%=k %>,<%=dtesc[j].ID%>,this.value)' name="periodoa<%=i %>m<%=k%>e<%=dtesc[j].ID%>" id="periodoa<%=i %>m<%=k%>e<%=dtesc[j].ID%>" style="font-size: 9px;
height: 20px;
line-height: 10px;
width: 90%;" ></textarea>
                    <%}
                      else
                      {%>
                    <input type="text" size="10" name="periodoa<%=i %>m<%=k%>e<%=dtesc[j].ID%>" id="periodoa<%=i %>m<%=k%>e<%=dtesc[j].ID%>"  <%="onchange='cambioValor("+i+","+k+","+dtesc[j].ID+",this.value)'" %>  style="text-align: right;"  class="easyui-numberbox" data-options="precision:1"/>
                    <%} %></td>
                  <% } %>
                </tr>
                <% }%>
              </table>
            </div>
            <% } %>
            <div title="+" style="padding:10px;">
              <asp:Button ID="btnAgregarAnio" runat="server" Text="Button"  style="display:none"
                  onclick="btnAgregarAnio_Click"  />
            </div>
          </div>
        </div>
        <script>
         <%
             if (hs.Count > 0)
             {
                 string sql = "select '' aux ";
                 ArrayList arr = new ArrayList();
                 foreach (DictionaryEntry de in hs)
                 {
                 //    arr.Add(de.Key);
                 //}
                 //for(
                     for (int i = 1; i <= 12; i++)
                     {
                         for (int j = desde; j <= hasta; j++)
                         {
                             sql += ",dbo.FN_GETVALORPERIODO(" + de.Key + "," + j + "," + i + "," + ind.ID + "," + (ind.IsIDCATEGORIANull() ? -1 : ind.IDCATEGORIA) + ") [periodoa"+j+"m"+i+"e"+de.Key+"] ";

                         }
                     }
                 }
                
                 System.Data.DataTable dt= GetData(sql);
                
                 foreach (DictionaryEntry de in hs)
                 {
                     //    arr.Add(de.Key);
                     //}
                     //for(
                     for (int i = 1; i <= 12; i++)
                     {
                         for (int j = desde; j <= hasta; j++)
                         {

                             object obj = dt.Rows[0].IsNull("periodoa" + j + "m" + i + "e" + de.Key) ? null : dt.Rows[0]["periodoa" + j + "m" + i + "e" + de.Key];
                          
                             if (obj != null)
                             {
                                 if (obj.ToString().Contains("@calc@"))
                                 {
                                     string aux =obj.ToString().Replace("@calc@", "");
                                     try
                                     {
                                         object val = Evaluate(aux);
                                         if (val != null)
                                         {
                                            %>

                                              var ele=document.getElementById("periodoa<%= (j + "m" + i + "e" + de.Key)%>");
                var ele2=document.getElementById("cambioperiodoa<%= (j + "m" + i + "e" + de.Key)%>");
               var ele3=document.getElementsByName("periodoa<%= (j + "m" + i + "e" + de.Key)%>")[0];
             if(ele!=undefined){

                 ele2.value="1";
                  ele.value='<%= val.ToString().Replace(".",",")%>';
                    ele3.value= '<%= val.ToString().Replace(",",".")%>';
               $('#periodoa<%= (j + "m" + i + "e" + de.Key)%>').numberbox('setValue', '<%= val.ToString().Replace(",",".")%>');
            
            }

                                         
                                            <%
                                         }
                                            
                                     }
                                     catch (Exception exc) {}
                                 }
                             }

                         }
                     }
                 }
                
                 
             }
             %>
             </script>
             <%
             
              DSRepositorioIndicadoresTableAdapters.ValoresXCampoDAO valcamDAO = new DSRepositorioIndicadoresTableAdapters.ValoresXCampoDAO();
              DSRepositorioIndicadores.ValoresXCampoVODataTable dtconf = valcamDAO.GetValoresIndicador(ind.ID);
              DSRepositorioIndicadoresTableAdapters.CamposDAO camposDAO = new DSRepositorioIndicadoresTableAdapters.CamposDAO();
              if (dtconf.Count > 0)
              { %>
        <div class="Profundizacion" title="Profundización" >
          <h2>Profundización</h2>
         <%

              for (int i = 0; i < dtconf.Count; i++)
              {


                  if (!dtconf[i].IsNull("IDVALOR") && dtconf[i].IDVALOR != -1)
                  {%>
          <h5>
            <label><%=camposDAO.GetNombre(dtconf[i].IDCAMPO)%></label>
            <%= opDAO.GetNombre(dtconf[i].IDVALOR)%> </h5> <span>/</span>
          <%  }







              } %>
        </div>
      <%   }%>

       <asp:UpdatePanel ID="UpdatePanel1" runat="server" CssClass="updateProgress">
        
              <ContentTemplate>

          <%
              DSRepositorioIndicadoresTableAdapters.IndicadoresDAO indDAO = new DSRepositorioIndicadoresTableAdapters.IndicadoresDAO();


              DSRepositorioIndicadores.IndicadoresVODataTable dat = indDAO.GetIndicador(int.Parse(Request["id"]));
              DSRepositorioIndicadores.IndicadoresVORow ind = dat[0];

              if ((!ind.IsIDRESPONSABLENull() && com.triario.repositorio.util.Utils.GetUsuario(Session, Response).ID == ind.IDRESPONSABLE) || com.triario.repositorio.util.Utils.GetUsuario(Session, Response).DSTIPO == "S" || com.triario.repositorio.util.Utils.GetUsuario(Session, Response).DSTIPO == "A")
              {

                 
      %>
      
      

        <div class="Historial_de_Cambios" title="Historial de Cambios" >
          <h2>Historial de Cambios</h2>
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
             DataKeyNames="ID" DataSourceID="SqlDataSourceLog"  class="zebra" border="0"  
                AllowPaging="true" PageSize="5"
         PagerSettings-Position="Top" 
              
                onpageindexchanging="GridView1_PageIndexChanging">
            <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                     ReadOnly="True" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="DSUSUARIO" HeaderText="Usuario" ReadOnly="True" 
                     SortExpression="DSUSUARIO" />
            <asp:BoundField DataField="IDINDICADOR" HeaderText="IDINDICADOR" 
                     SortExpression="IDINDICADOR" Visible="False" />
            <asp:BoundField DataField="DSACCION" HeaderText="DSACCION" 
                     SortExpression="DSACCION" Visible="False" />
            <asp:BoundField DataField="FEFECHA" HeaderText="Fecha" 
                     SortExpression="FEFECHA" />
            <asp:BoundField DataField="DSOBSERVACIONES" HeaderText="Observaciones" 
                     SortExpression="DSOBSERVACIONES" />
            <asp:BoundField DataField="DSNUEVOVALOR" HeaderText="Nuevo Valor" 
                     SortExpression="DSNUEVOVALOR" />
            <asp:BoundField DataField="DSVALORANT" HeaderText="Valor Ant" 
                     SortExpression="DSVALORANT" />
            <asp:BoundField DataField="DSESCENARIO" HeaderText="Escenario" ReadOnly="True" 
                     SortExpression="DSESCENARIO" />
            <asp:BoundField DataField="NMANIO" HeaderText="Año" SortExpression="NMANIO" />
            <asp:BoundField DataField="NMMES" HeaderText="Mes" SortExpression="NMMES" />
            </Columns>
          </asp:GridView>
          <asp:SqlDataSource ID="SqlDataSourceLog" runat="server" 
             ConnectionString="<%$ ConnectionStrings:core_repositorioConnectionString %>" 
             ProviderName="<%$ ConnectionStrings:core_repositorioConnectionString.ProviderName %>" 
             SelectCommand="SELECT        ID,(select DSNOMBRES from tri_rep_usuarios where ID= IDUSUARIO) DSUSUARIO, IDINDICADOR, DSACCION,LEFT(CONVERT(VARCHAR, FEFECHA, 120), 10) FEFECHA, DSOBSERVACIONES, DSNUEVOVALOR, DSVALORANT,(select e.DSNOMBRE from tri_rep_escenarios e where ID= IDESCENARIO) DSESCENARIO, NMANIO, dbo.FN_GETMES(NMMES) NMMES
FROM            tri_rep_logs
where  IDINDICADOR=@IDINDICADOR
order by FEFECHA desc" SelectCommandType="Text">
            <SelectParameters>
              <asp:QueryStringParameter Name="IDINDICADOR" QueryStringField="id" 
                     Type="Int32" />
            </SelectParameters>
          </asp:SqlDataSource>
        </div>
      </div>
    
  
      <% } %>
        </ContentTemplate>
      </asp:UpdatePanel>
      <script>
  
  function deshabilitarCamposEscenario(esc,dis){
      for(i=<%=desde %>;i<=<%=hasta %>;i++){
           for(j=1;j<=12;j++){
              document.getElementById("periodoa"+i+"m"+j+"e"+esc).disabled=dis;
           }

      }
  }

  function deshabilitarCampo(esc,anio,mes,dis){
  if(mes==-1){
  for(var i=1;i<=12;i++){
  if(document.getElementById("periodoa"+anio+"m"+i+"e"+esc)!=undefined)
              document.getElementById("periodoa"+anio+"m"+i+"e"+esc).disabled=dis;
    }
  
  }else{
    if(document.getElementById("periodoa"+anio+"m"+mes+"e"+esc)!=undefined)
              document.getElementById("periodoa"+anio+"m"+mes+"e"+esc).disabled=dis;
    }
          
  }

  </script>
  <script>
  <%
  if(com.triario.repositorio.util.Utils.GetUsuario(Session,Response).DSTIPO!="S"){
    DSRepositorioIndicadoresTableAdapters.FechasLimiteDAO fecDAO = new DSRepositorioIndicadoresTableAdapters.FechasLimiteDAO();
    DSRepositorioIndicadores.FechasLimiteVODataTable fecVO=  fecDAO.GetFechasLimiteInd(ind.IsIDCATEGORIANull()?-1:ind.IDCATEGORIA, ind.ID);
    for (int i = 0; i < fecVO.Count; i++)
    {
        if (fecVO[i].IsNMANIONull())
        {
            if (fecVO[i].SNPERSONALIZADO)
            {

           
                if (DateTime.Now < fecVO[i].FEDESDE || DateTime.Now > fecVO[i].FEHASTA)
                {
                    %>  deshabilitarCamposEscenario(<%=fecVO[i].IDESCENARIO%>,true);  <%
                }
             
            }
            else
            {
                for (int a = desde; a <= hasta; a++)
                {
                    for (int m = 1; m <= 12; m++)
                    {
                        DateTime aux2=new DateTime(a, (m+1)>12?1:(m+1), 1);
                        aux2=aux2.AddDays(-1);
                        DateTime aux = new DateTime(a, m, aux2.Day);
                       aux=  aux.AddDays(fecVO[i].NMDIAS);
                        if (aux >= DateTime.Now)
                        {%>
                            deshabilitarCampo(<%=fecVO[i].IDESCENARIO%>, <%=a%>,  <%=m%>, true);
                            <%
                        }
                        else
                        {%>
                            deshabilitarCampo(<%=fecVO[i].IDESCENARIO%>, <%=a%>,  <%=m%>, true);
                            <%

                        }              
                     }
                }
            }
        }
        else
        {
            if (fecVO[i].SNPERSONALIZADO)
            {
                if (DateTime.Now < fecVO[i].FEDESDE || DateTime.Now > fecVO[i].FEHASTA)
                {
                    %> deshabilitarCampo(<%=fecVO[i].IDESCENARIO%>,<%=fecVO[i].NMANIO%>,<%=(fecVO[i].IsNMMESNull()?-1:fecVO[i].NMMES)%>,true); <%
                }
                
            }
            else
            {
                int a = fecVO[i].NMANIO;
                int m = (fecVO[i].IsNMMESNull()?-1:fecVO[i].NMMES);
               if(m>0){
                        DateTime aux = new DateTime(a, m, 1);
                        aux.AddDays(fecVO[i].NMDIAS);
                        if (aux >= DateTime.Now)
                        {%>
                            deshabilitarCampo(<%=fecVO[i].IDESCENARIO%>, <%=a%>,  <%=m%>, false);
                            <%
                        }
                        else
                        {%>
                            deshabilitarCampo(<%=fecVO[i].IDESCENARIO%>, <%=a%>,  <%=m%>, true);
                            <%

                        } 
                        }else{
                        for(m=1;m<=12;m++){
                        DateTime aux = new DateTime(a, m, 1);
                        aux.AddDays(fecVO[i].NMDIAS);
                        if (aux >= DateTime.Now)
                        {%>
                            deshabilitarCampo(<%=fecVO[i].IDESCENARIO%>, <%=a%>,  <%=m%>, false);
                            <%
                        }
                        else
                        {%>
                            deshabilitarCampo(<%=fecVO[i].IDESCENARIO%>, <%=a%>,  <%=m%>, true);
                            <%

                        } 
                        }
                        
                        }             
                    
            }
        }
    }
    
   } 
    
     %>
       </script>
       <script>
       function cambioValorMeta(anio,valor) {

 var ele2=document.getElementById("cambiometa"+anio);
 if(ele2.value=="1"){
   cambioValormeta2(anio,valor);
   return;
 }

//  valor=valor.replace(".","");

//   valor=valor.replace(",",".");
  DeshabilitarValores(true);
      PageMethods.GuardarValorMeta( anio,valor,<%=Request["id"] %>,
       OnSucceeded, OnFailed);
     


        }
function cambioValormeta2(anio,valor) {

           jQuery.messager.prompt('Cambio de Valor', 'Porfavor ingrese la causal de modificación', function (r) {
                if (r) {
                   
//  valor=valor.replace(".","");

//   valor=valor.replace(",",".");
 
      PageMethods.GuardarValorMetaLog(anio,valor,<%=Request["id"] %>,r,<%=com.triario.repositorio.util.Utils.GetUsuario(Session,Response).ID %>,
       OnSucceeded, OnFailed);
     

        
                }
            });
          


         }


   function cambioValor(anio,mes,esc,valor) {
  
   
//  valor=valor.replace(".","");

//   valor=valor.replace(",",".");

 var ele2=document.getElementById("cambioperiodoa"+anio+"m"+mes+"e"+esc);
 if(ele2.value=="1"){
   cambioValor3(anio,mes,esc,valor);
   return;
 }

  
  DeshabilitarValores(true);
 
      PageMethods.GuardarValor(esc, anio,mes,valor,"",<%=Request["id"] %>,
       OnSucceeded, OnFailed);
     
      
         fnCalcular();

        }
        </script>
        
        <script>
        function fnCalcular(){
      
          <%=calculos %>
        }
        </script>
        <script>
         function cambioValor3(anio,mes,esc,valor) {

           jQuery.messager.prompt('Cambio de Valor', 'Porfavor ingrese la causal de modificación', function (r) {
                if (r) {
                  
                
      PageMethods.GuardarValorLog(esc, anio,mes,valor,"",<%=Request["id"] %>,r,<%=com.triario.repositorio.util.Utils.GetUsuario(Session,Response).ID %>,
       OnSucceeded, OnFailed);
     

        fnCalcular();
                }
            });
          


         }


         function cambioValor2(anio,mes,esc,valor) {
  DeshabilitarValores(true);

  
 var ele2=document.getElementById("cambioperiodoa"+anio+"m"+mes+"e"+esc);
 if(ele2.value=="1"){
   cambioValor4(anio,mes,esc,valor);
   return;
 }
 
      PageMethods.GuardarValor(esc, anio,mes,valor,"O",<%=Request["id"] %>,
       OnSucceeded, OnFailed);
     

          

        }

         function cambioValor4(anio,mes,esc,valor) {

          jQuery.messager.prompt('Cambio de Valor', 'Porfavor ingrese la causal de modificación', function (r) {
                if (r) {
                    
  
      PageMethods.GuardarValorLog(esc, anio,mes,valor,"O",<%=Request["id"] %>,r,<%=com.triario.repositorio.util.Utils.GetUsuario(Session,Response).ID %>,
       OnSucceeded, OnFailed);
     

                }
            });
          


         }

        function OnSucceeded() {
            // Dispaly "thank you."
           // $get("ContactFieldset").innerHTML = "<p>Thank you!</p>";
            DeshabilitarValores(false);
        }

        function OnFailed(error) {
            // Alert user to the error.
            //alert(error.get_message());
            document.getElementById("divError").style.display = "";
            document.getElementById("msgError").innerHTML = '<%=com.triario.repositorio.util.Utils.GetMensaje("ERROR")%>';

            alert("Ocurrio un error al guardar, vuelva intentarlo");
        }

        function DeshabilitarValores(val){

        }
  </script> 
      <script>
        function pageLoad() {

           // validarEngine();
            // cargarTabs();
            cargarEasyui();

            cargarValores();

            fnCalcular();

        }
        function fnGetValor(anio,mes,esc,perj,peri){
       
        var anio2=anio;
        var mes2=mes;


                if(perj=="j"){
                   anio2=anio;
                }
                 if(perj=="j-1"){
                   anio2=anio-1;
                }
                 if(perj=="j-2"){
                   anio2=anio-2;
                }
                 if(perj=="j-3"){
                   anio2=anio-3;
                }
                 if(perj=="j-4"){
                   anio2=anio-4;
                }
                 if(perj=="j-5"){
                   anio2=anio-5;
                }
                 if(perj=="j-6"){
                   anio2=anio-6;
                }
                 if(perj=="j+1"){
                   anio2=anio+1;
                }
                 if(perj=="j+2"){
                   anio2=anio+2;
                }
                 if(perj=="j+3"){
                   anio2=anio+3;
                }
                 if(perj=="j+4"){
                   anio2=anio+4;
                }
                 if(perj=="j+5"){
                   anio2=anio+5;
                }
                 if(perj=="j+6"){
                   anio2=anio+6;
                }

                if(peri=="c"){
                  mes2="12";
                }
                if(peri=="i"){
                  mes2=mes;
                }
                if(peri=="i-1"){
                   mes2=mes-1;
                }
                 if(peri=="i-2"){
                   mes2=mes-2;
                }
                 if(peri=="i-3"){
                   mes2=mes-3;
                }
                 if(peri=="i-4"){
                   mes2=mes-4;
                }
                 if(peri=="i-5"){
                   mes2=mes-5;
                }
                 if(peri=="i-6"){
                   mes2=mes-6;
                }
                 if(peri=="i+1"){
                   mes2=mes+1;
                }
                 if(peri=="i+2"){
                   mes2=mes+2;
                }
                 if(peri=="i+3"){
                   mes2=mes+3;
                }
                 if(peri=="i+4"){
                   mes2=mes+4;
                }
                 if(peri=="i+5"){
                   mes2=mes+5;
                }
                 if(peri=="i+6"){
                   mes2=mes+6;
                }

                if(mes2<=0){
                return 0;
                  

                }else{
                  if(mes>12){
                     return 0;
                     
                  }
                }
                if (esc >= 0) {

                    var id = "periodoa" + anio2 + "m" + mes2 + "e" + esc;

                    var ele = document.getElementsByName(id)[0];


                    if (ele == undefined) {
                        return 'ND';
                    }

                    if (ele.value == "") {
                        return 'ND';
                    }
                    var auxele = ele.value;
                    if (auxele.indexOf(',', 0) != -1) {
                        auxele = auxele.replace(/\./g, '').replace(",", ".");

                    }

                } else {
                auxele = 0;
                for (var i = 1; i <= mes2; i++) {
                    var id = "periodoa" + anio2 + "m" + i + "e" + (esc*-1);
                  
                    var ele = document.getElementsByName(id)[0];


                    if (ele == undefined) {
                        return 'ND';
                    }

                    if (ele.value == "") {
                        return 'ND';
                    }
                    var auxele2 = ele.value;
                   
                    if (auxele2.indexOf(',', 0) != -1) {
                        auxele2 = auxele2.replace(/\./g, '').replace(",", ".");

                    }
                    auxele += (auxele2*1);
                 
                }

                }

    return auxele;

        }
       
        function validarForm() {
            return jQuery('#form1').validationEngine('validate');
        }
        function validarEngine() {
            jQuery(document).ready(function () {

                jQuery("#form1").validationEngine('hideAll');

                jQuery("#form1").validationEngine('detach');

                jQuery("#form1").validationEngine();
            });
        }
        var auxsel;
        function cargarSelect(sel, padre, lista, region) {
            auxsel = sel;
            PageMethods.GetListData(lista, padre, region, OnPopulateList);
        }
        function OnPopulateList(list) {
            var dropList = auxsel;
            dropList.length = 0;
            var option2 = document.createElement('OPTION');
            option2.text = "";
            option2.value = "-1";
            dropList.options.add(option2);

            for (i = 0; i < list.length; i++) {
                var option = document.createElement('OPTION');
                option.text = list[i].text;
                option.value = list[i].value;
                dropList.options.add(option);
            }
        }

        function valtxt(obj) {
            str = "0123456789-"
            l = obj.value.length;
            for (i = 0; i <= l; i++) {
                if (str.indexOf(obj.value.charAt(i)) == -1) {

                    obj.value.length = obj.value.length - 1;
                    obj.focus();
                    return false;
            
                }
            }
            return true;
        }
</script>
<script>
                jQuery('#tt').tabs({  
    
    onSelect:function(title){  
       if(title=="+"){
          if(confirm("Está seguro que desea agregar mas años?")){
                 __doPostBack('btnAgregarAnio', '');
          }else{
          return false;
          }
       }
        if(title=="-"){
          if(confirm("Está seguro que desea agregar mas años?")){
                 __doPostBack('btnDis', '');
          }else{
          return false;
          }
       }
    }  
}); 


</script>
<script>
function cargarValores(){
      
         <%  DSRepositorioIndicadoresTableAdapters.ValoresXEscenarioDAO valescDAO = new DSRepositorioIndicadoresTableAdapters.ValoresXEscenarioDAO();
             DSRepositorioIndicadores.ValoresXEscenarioVODataTable valvo= valescDAO.GetValoresXEscInd(int.Parse(Request["id"]));
             for (int i = 0; i < valvo.Count; i++)
             {
             
             %>
             var ele=document.getElementById("periodoa<%= valvo[i].NMANIO%>m<%= valvo[i].NMMES%>e<%= valvo[i].IDESCENARIO%>");
                var ele2=document.getElementById("cambioperiodoa<%= valvo[i].NMANIO%>m<%= valvo[i].NMMES%>e<%= valvo[i].IDESCENARIO%>");
               var ele3=document.getElementsByName("periodoa<%= valvo[i].NMANIO%>m<%= valvo[i].NMMES%>e<%= valvo[i].IDESCENARIO%>")[0];
             if(ele!=undefined){

           
             if(ele.type=="textarea"){
             <%if (!valvo[i].IsDSVALORNull())
               { %>
                 ele2.value="1";
             ele.value='<%= HttpUtility.JavaScriptStringEncode(valvo[i].DSVALOR.Replace("\n"," xyz "))%>';
             ele.value=ele.value.replace(new RegExp(" xyz ", 'g'),"\n");
              <%} %>
             }else{
              <%if (!valvo[i].IsNMVALORNull())
               { %>
                 ele2.value="1";
                  ele.value='<%= valvo[i].NMVALOR.ToString().Replace(".",",")%>';
                    ele3.value= '<%= valvo[i].NMVALOR.ToString()%>';
               $('#periodoa<%= valvo[i].NMANIO%>m<%= valvo[i].NMMES%>e<%= valvo[i].IDESCENARIO%>').numberbox('setValue', <%= valvo[i].NMVALOR.ToString()%>);
            

             
               //ele.value=ele.value.replace('.00','');
          
                <%} %>
             }
             }
             

             <%}
            
            
            
            %>


              <%  DSRepositorioIndicadoresTableAdapters.MetasXIndicadorDAO metasindDAO = new DSRepositorioIndicadoresTableAdapters.MetasXIndicadorDAO();
             DSRepositorioIndicadores.MetasXIndicadorVODataTable metVO= metasindDAO.GetMetasXInidcador(int.Parse(Request["id"]));
             for (int i = 0; i < metVO.Count; i++)
             {%>
             var ele=document.getElementById("meta<%= metVO[i].NMANIO%>");
              var ele3=document.getElementsByName("meta<%= metVO[i].NMANIO%>")[0];

                var ele2=document.getElementById("cambiometa<%= metVO[i].NMANIO%>");
             if(ele!=undefined){
             ele2.value="1";
        
              <%if (!metVO[i].IsNMVALORNull())
               { %>


                ele.value='<%= metVO[i].NMVALOR.ToString().Replace(".",",")%>';
                    ele3.value= '<%= metVO[i].NMVALOR.ToString()%>';
               


                  $('#meta<%= metVO[i].NMANIO%>').numberbox('setValue', <%=  metVO[i].NMVALOR.ToString()%>);

             
           
                <%} %>
             }
             
             

             <%}
            
            
            
            %>

            }

            function disableForm(theform) {
		if (document.all || document.getElementById) {
			for (i = 0; i < theform.length; i++) {
			var formElement = theform.elements[i];
				if (formElement.type=="text"||formElement.type=="textarea") {
					formElement.disabled = true;
				}
			}
		}
	}
    </script>
     
    <script>

     <% if (!ind.IsIDESTADONull()&&ind.IDESTADO==143){
      %>
      document.getElementById("divError").style.display = "";
            document.getElementById("msgError").innerHTML = 'El indicador se encuentra inactivo por lo tanto no se puede actualizar';
	  disableForm(document.forms[0]);

      <% }%>



       <% if (( !ind.IsIDRESPONSABLENull() && com.triario.repositorio.util.Utils.GetUsuario(Session, Response).ID != ind.IDRESPONSABLE) &&   com.triario.repositorio.util.Utils.GetUsuario(Session,Response).DSTIPO != "S"){
      %>
	  disableForm(document.forms[0]);

      <% }%>

      </script>
       <script>
      function fnAbrir(id) {

            $.nmManual('../Indicadores/Crear.aspx?operation=e&id='+id, {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });

        }
        function fnAbrir4(id,anio) {

            $.nmManual('https://www.conectandonosconlaestrategia.com/Graficos/GetGrafico.aspx?codigo=' + id+'&anio='+anio, {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });

        }
function fnAbrir2(id) {

            $.nmManual('../Indicadores/Crear.aspx?configurar=s&operation=e&id='+id, {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });

        }
        
     function cerrarPop() {

       
            $.nmTop().close();
            document.forms[0].submit();

        }

        function fnAbrir3(id) {

            $.nmManual('../Indicadores/Crear.aspx?configurar=a&operation=e&id=' + id, {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });

        }

        function cambioPanel(chk) {
            if (chk.checked) {
             PageMethods.GuardarPanel("1",<%=com.triario.repositorio.util.Utils.GetUsuario(Session,Response).ID %>,<%=Request["id"] %>,
       OnSucceeded, OnFailed);
            } else {
             PageMethods.GuardarPanel("0",<%=com.triario.repositorio.util.Utils.GetUsuario(Session,Response).ID %>,<%=Request["id"] %>,
       OnSucceeded, OnFailed);
            }
        }
    </script>
    </form>
    
</body>
</html>