﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Crear.aspx.cs" Inherits="Indicadores_Crear" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, 
Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" 
TagPrefix="asp" %> 

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" 
TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    $(function () {
        $('.nyroModal').nyroModal();
    });
</script>
<style type="text/css">
.nyroModalCont iframe {
	width: 900px !important;
	height: 800px !important;
}
</style>

                <link href="../Styles/cssUpdateProgress.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript">
	    cargarEasyui();
	    var ModalProgress = '<%= ModalProgress.ClientID %>';
	    var tabaux = -1;      
	</script>



    <style type="text/css">
        .validate[required]
        {}
    </style>


	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color:White">


<asp:Label ID="lblInd" runat="server" Text=""></asp:Label>

    <form id="form1" runat="server">
    <div class="campos-buscador">
    <asp:HiddenField ID="hdInd" runat="server" EnableViewState="true" />
    <asp:HiddenField ID="hdCat" runat="server" EnableViewState="true" />
    <asp:HiddenField ID="hdIdRegion" runat="server" />
     <script type="text/javascript" src="../Scripts/jsUpdateProgress.js"></script>	
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
  
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
	




       <asp:UpdatePanel ID="UpdatePanel1" runat="server" CssClass="updateProgress">
        
              <ContentTemplate>
    
    <div class="ui-widget" id="divMsg" runat="server">
			<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
				<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
				<div id="msgExito" runat="server"></div>
                  
                   
              
			</div>
		</div>

        <div class="ui-widget" id="divError" runat="server">
			<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
				<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
				<div id="msgError" runat="server"></div>
                  
                
                
			</div>
		</div>

         

        <asp:MultiView ID="mvPaso" runat="server">

            <asp:View ID="vwInfoBasica" runat="server">
            <div class="pasos">
            Información Básica > 
            </div>

            
             <div class="labels">
            <label for="ddlNegocio">Negocio</label></div>
                <asp:DropDownList ID="ddlNegocio" runat="server" CssClass="listas validate[required]" onselectedindexchanged="ddlNegocio_SelectedIndexChanged" AutoPostBack="true"
                     >
                </asp:DropDownList>
<div class="clear"></div>

             <div class="labels">
            <label for="ddlRegion">Región</label></div>
                <asp:DropDownList ID="ddlRegion" runat="server" CssClass="listas validate[required]" 
                     onselectedindexchanged="ddlRegion_SelectedIndexChanged">
                </asp:DropDownList>
<div class="clear"></div>

             <div class="labels">
            <label for="ddlCategoria">Categoría</label></div>
                <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="listas">
                </asp:DropDownList>
                 <asp:Button ID="btnSiguiente" runat="server" Text="Siguiente" 
                    OnClientClick="return validarForm();" onclick="btnSiguiente_Click" />
            </asp:View>

            <asp:View ID="vwAtributos" runat="server">
            <div class="pasos">
                Información Básica &gt; Profundización &gt; Atributos &gt;
            </div>
            <div>
             <div class="labels">
            <label for="ddlNombre">Nombre</label></div>
                <asp:DropDownList ID="ddlNombre" runat="server" CssClass="listas validate[required]" 
                    AutoPostBack="True" onselectedindexchanged="ddlNombre_SelectedIndexChanged" 
                   >
               
                </asp:DropDownList>
                Nuevo Nombre?<asp:CheckBox ID="chkNombre" runat="server" onclick="if(this.checked){document.forms[0].txtNomDic.disabled=false;document.forms[0].ddlNombre.disabled=true;document.forms[0].ddlNombre.value=='-1';}else{document.forms[0].txtNomDic.disabled=true;document.forms[0].ddlNombre.disabled=false;document.forms[0].txtNomDic.value=='';}" /><asp:TextBox ID="txtNomDic"
                    runat="server"  Enabled="false" CssClass="validate[required]" 
                    ontextchanged="txtNomDic_TextChanged" Width="327px" AutoPostBack="true" ></asp:TextBox>


            </div>


            <div>
                <asp:HiddenField ID="txtNombreAux2" runat="server" />
             <div class="labels">
            <label for="txtNombreAux">Nombre</label></div>
                <asp:TextBox ID="txtNombreAux" runat="server" Width="294px" ReadOnly="true" CssClass="listas"></asp:TextBox>
<div class="clear"></div>

             <div class="labels">
                 <label for="txtNombreAux">Auxiliar</label></div>
                <asp:TextBox ID="txtAux" runat="server" Width="294px" CssClass="listas"></asp:TextBox>
<div class="clear"></div>

             <div class="labels">
            <label for="txtCodAux">Código Auxiliar</label></div>
                 <asp:TextBox ID="txtCodAux" runat="server" CssClass="listas" ></asp:TextBox>
<div class="clear"></div>

             <div class="labels">
            <label for="ddlResponsable">Responsable</label></div>
                 <asp:DropDownList ID="ddlResponsable" runat="server"  CssClass="listas validate[required]" >
                 </asp:DropDownList>
<div class="clear"></div>

             <div class="labels">
            <label for="ddlIndicadorRel">Indicador Relacionado</label></div>
                 <asp:DropDownList ID="ddlIndicadorRel" runat="server" CssClass="listas">
                 </asp:DropDownList>
            </div>

              <%
                string setupCal = " <script> function setupCalendar(){";
                DSRepositorioIndicadoresTableAdapters.AtributosDAO atrDAO = new DSRepositorioIndicadoresTableAdapters.AtributosDAO();
                DSRepositorioIndicadores.AtributosVODataTable dtatr= atrDAO.GetAtributosConfigurados( GetCategoriaSeleccionada() );
                string dependencias = "<script> function cambioValorConf2(valor,idcampo){  ";
                for (int i = 0; i < dtatr.Count; i++)
                {
                    string tipo = dtatr[i].DSTIPO;
                    int idatr = dtatr[i].ID;
                    bool req = dtatr[i].SNREQUERIDO;
                    string lab=dtatr[i].DSNOMBRE;

                    DSRepositorioIndicadores.AtributosVORow nodo=  dtatr[i];
                 %>
                 <div class="clear"></div>

             <div class="labels">
                 <label for="atributo<%=idatr %>"><%=lab %></label> </div>
                 
                

                 <%
                    if (tipo.Trim() == "A")
                    {
                    %>

                    <textarea name="atributo<%=idatr %>"  id="atributo<%=idatr %>" rows="3" cols="30" class='<%=req?"validate[required]":""%>'><%=GetValorAtributo(idatr) %></textarea>

                <%} %>

              <%  if (tipo.Trim() == "L")
                    {%>
                      <select name="atributo<%=idatr %>"  id="atributo<%=idatr %>" class='<%=req?"validate[required]":""%>' onchange='cambioValorConf2(this.value,<%= nodo.ID%>)'>
                   <option value="-1"></option>


                    <%
                        int lista = dtatr[i].IDLISTA;

                        if (nodo.IsIDDEPENDIENTENull())
                        {

                            DSRepositorioIndicadoresTableAdapters.OpcionesListaDAO opDAO = new DSRepositorioIndicadoresTableAdapters.OpcionesListaDAO();
                            DSRepositorioIndicadores.OpcionesListaVODataTable opVO = opDAO.GetValoresListaRegion(nodo.IDLISTA, int.Parse(ddlRegion.SelectedValue));
                            for (int j = 0; j < opVO.Count; j++)
                            {%>
                                <option value='<%=opVO[j].ID%>'  <%=((GetValorAtributo(nodo.ID) == opVO[j].ID + "") ? "selected" : "") %>> <%=opVO[j].DSNOMBRE%> </option>
                          <%  }

                        }
                        else
                        {
                            if (GetValorAtributo(nodo.IDDEPENDIENTE) != "" && GetValorAtributo(nodo.IDDEPENDIENTE) != null)
                            {
                                DSRepositorioIndicadoresTableAdapters.OpcionesListaDAO opDAO = new DSRepositorioIndicadoresTableAdapters.OpcionesListaDAO();
                                DSRepositorioIndicadores.OpcionesListaVODataTable opVO = opDAO.GetValoresListaPadreRegion(int.Parse(GetValorAtributo(nodo.IDDEPENDIENTE)), nodo.IDLISTA, int.Parse(ddlRegion.SelectedValue));

                                for (int j = 0; j < opVO.Count; j++)
                                {%>
                                   <option value='<%=opVO[j].ID%>'  <%=((GetValorAtributo(nodo.ID) == opVO[j].ID + "") ? "selected" : "") %>> <%=opVO[j].DSNOMBRE%> </option>
                               <% }
                            }

                            dependencias = dependencias + " if(idcampo==" + nodo.IDDEPENDIENTE + "){if(document.getElementById('atributo" + nodo.IDDEPENDIENTE + "')!=undefined) {cargarSelect(document.forms[0].atributo" + nodo.ID + ",valor," + nodo.IDLISTA + "," + ddlRegion.SelectedValue + "); }}";
                        }
                      
                      %>




                 
              

                   </select>
                


                <%} %>

                  <%  if (tipo.Trim() == "LM")
                    {
                        int lista = dtatr[i].IDLISTA;
                        
                    %>

                   <select name="atributo<%=idatr %>" id="atributo<%=idatr %>" class='<%=req?"validate[required]":""%>' multiple="multiple" >
               
                   <%
                       DSRepositorioIndicadoresTableAdapters.OpcionesListaDAO opDAO = new DSRepositorioIndicadoresTableAdapters.OpcionesListaDAO();
                      DSRepositorioIndicadores.OpcionesListaVODataTable opVO=  opDAO.GetValoresLista(lista);
                      for(int j=0;j<opVO.Count;j++){

                          string[] vecaux = GetValorAtributo(idatr).Split(new char[] { ','});
                          if (vecaux.Contains(opVO[j].ID + ""))
                          {
                         %>
                       
                        <option value="<%=opVO[j].ID %>" selected="selected"><%=opVO[j].DSNOMBRE%></option>
                        <% 
                          }
                          else
                          {%>

                              <option value="<%=opVO[j].ID %>" ><%=opVO[j].DSNOMBRE%></option>
                       <%   }
                         
                         } %>
                   
                   

                   </select>
                


                <%} %>


                <% if (tipo.Trim() == "C")
                    {
                    %>

                    <input type="text" name="atributo<%=idatr %>"  id="atributo<%=idatr %>"  class='<%=req?"validate[required]":""%>' value="<%=GetValorAtributo(idatr) %>" size="100"/>

                <%} %>

                 <% if (tipo.Trim() == "F")
                    {
                    %>

                    <input type="text" name="atributo<%=idatr %>"  id="atributo<%=idatr %>"  class='<%=req?"validate[required]":""%>' size="50" value="<%=GetValorAtributo(idatr) %>"/> <button id="f_btn<%=idatr %>">...</button>


                <%
                    setupCal = setupCal + " Calendar.setup({ "+
          "  inputField: 'atributo"+idatr+"',  "+
           " trigger: 'f_btn"+idatr+"',  "+
           " dateFormat: '%d/%m/%Y'  "+
           " });"; 
                    
                    } %>

                      <% if (tipo.Trim() == "N")
                    {
                    %>

                    <input type="text" name="atributo<%=idatr %>"  id="atributo<%=idatr %>"  class='easyui-numberbox <%=req?"validate[required]":""%>' size="60" value="<%=GetValorAtributo(idatr) %>"/>

                <%} %>

                   <% if (tipo.Trim() == "B")
                    {
                    %>

                    <input type="checkbox" name="atributo<%=idatr %>"  id="atributo<%=idatr %>" "<%=GetValorAtributo(idatr)=="1"?"checked":"" %>"  />

                <%} %>
               
                <%}
                    dependencias += " } </script>";
                    setupCal = setupCal+"}</script>";
                    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "scrdepatr", dependencias, false);
                    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "scrdepcalatr", setupCal, false);
                 %>

               
         </div>
                <asp:Button ID="Button1" runat="server" Text="Anterior" 
                    onclick="Button1_Click" />

                <asp:Button ID="Button2" runat="server" Text="Siguiente"  
                    OnClientClick="return validarForm();" onclick="Button2_Click" />
            </asp:View>

            <asp:View ID="vwProfundizacion" runat="server">
            <div class="pasos">
                Información Básica &gt; Profundización &gt;
            </div>


            <%=ConstruirArbol() %>


               <asp:Button ID="Button3" runat="server" Text="Anterior" onclick="Button3_Click" 
                    />

                <asp:Button ID="Button4" runat="server" Text="Siguiente"  
                    onclick="Button4_Click"  OnClientClick="return validarForm();"  />


            </asp:View>
            <asp:View ID="vwConfiguracion" runat="server">
              <div class="pasos">
                  Información Básica &gt; Profundización &gt; Atributos > Configuración >
            </div>

            <div id="divindicadorCreado" runat="server">
            El indicador se ha creado satisfactoriamente con el código 
            </div>
              <div id="divindicadorModificado" runat="server">
            El indicador se ha modificado satisfactoriamente, el código dle indicador es
            </div>
                <asp:Label ID="lblCodigo" runat="server" Text=""></asp:Label>



                <div>
                   <button id="dtnEscenarios" name="dtnEscenarios" onclick="fnAbrirEscenarios()">Escenarios</button>
                     <button id="dtnPermisos" name="dtnPermisos" onclick="fnAbrirPermisos(); return false;">Permisos</button>
                         <button id="btnFechasLimite" name="btnFechasLimite" onclick="fnAbrirFechasLimite(); return false;">Fechas Límite</button>

                
                </div>


                   <asp:Button ID="Button5" runat="server" Text="Siguiente" onclick="Button5_Click"  
                  />
            </asp:View>
            <asp:View ID="vwSeguridad" runat="server">
             <div class="pasos">
                 Información Básica &gt; Profundización &gt; Atributos > Configuración > Seguridad 
            </div>


                <asp:GridView ID="gvPermisos" runat="server" AutoGenerateColumns="False" 
                    onrowcommand="gvPermisos_RowCommand" onrowdatabound="gvPermisos_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" Visible="False" />
                        <asp:BoundField DataField="DSNOMBRE" HeaderText="Grupo de Usuarios" />
                        <asp:BoundField DataField="TIPO" HeaderText="Tipo" />
                        <asp:BoundField DataField="ESCENARIO" HeaderText="Escenario" />
                        <asp:BoundField DataField="PLAZO" HeaderText="Plazo" />
                         <asp:TemplateField HeaderText="Eliminar">
 <ItemTemplate><center>
                                 
<asp:LinkButton ID="eliminar" Text="Eliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("ID") %>'><img src="../images/uncheck.png" border="0" /></asp:LinkButton></center></ItemTemplate></asp:TemplateField>

                    </Columns>
                </asp:GridView>


                <fieldset>
                <legend>Nuevo</legend>
                <div>
                <label for="ddlGrupos">Grupo</label>
                    <asp:DropDownList ID="ddlGrupos" runat="server">
                    </asp:DropDownList>
                
                </div>
                 <div>
                <label for="ddlPlazo">Plazo</label>
                    <asp:DropDownList ID="ddlPlazo" runat="server" CssClass="validate[required]" >
                        <asp:ListItem Value="-1">...</asp:ListItem>
                        <asp:ListItem Value="C">Corto</asp:ListItem>
                        <asp:ListItem Value="L">Largo</asp:ListItem>
                    </asp:DropDownList>
                
                </div>
                  <div>
                <label for="ddlTipo">Tipo Permiso</label>
                    <asp:DropDownList ID="ddlTipo" runat="server" CssClass="validate[required]" >
                        <asp:ListItem Value="C">Consulta</asp:ListItem>
                    </asp:DropDownList>
                
                </div>
                <div>
                <label for="ddlEscenario">Escenario</label>
                    <asp:DropDownList ID="ddlEscenario" runat="server"  >
                       
                    </asp:DropDownList>
                
                </div>

                    <asp:Button ID="Button8" runat="server" Text="Guardar"  
                        OnClientClick="return validarForm();" onclick="Button8_Click"  />

                </fieldset>

              <asp:Button ID="Button6" runat="server" Text="Anterior" onclick="Button6_Click"  
                  />
                    <asp:Button ID="Button7" runat="server" Text="Terminar" onclick="Button7_Click" 
                  />

            </asp:View>

        </asp:MultiView>

     </ContentTemplate>
    </asp:UpdatePanel>
  
                </div>


    </form>

    <script>
        function pageLoad() {

            validarEngine();
            // cargarTabs();
            cargarEasyui();

            if (typeof setupCalendar == "function") {
                setupCalendar();
            }


            if (document.getElementById("atributo6") != undefined && document.getElementById("atributo6").value=="-1") {
                document.getElementById("atributo6").selectedIndex = 1;
            }

            if (typeof habilitarPermisos == "function") {
                habilitarPermisos();
            }
        }
        function validarForm2() {
            if ($('#form1').validationEngine('validate')) {
                if (confirm("Está seguro que desea crear este indicador?")) {
                    return true;
                } else {
                return false;
                }
            }
            else {
                return false;
            }
        }
        function validarForm() {
            return $('#form1').validationEngine('validate');
        }
        function validarEngine() {
            jQuery(document).ready(function () {

                jQuery("#form1").validationEngine('hideAll');
                jQuery("#form1").validationEngine('detach');

                jQuery("#form1").validationEngine();
            });
        }
       /* function fnArmarCodigo() {
           
            var fpers = document.getElementById("atributo15").value;
            var falc = document.getElementById("atributo8").value;
            var fdest = document.getElementById("atributo7").value;

           var cons= ("00" + document.forms[0].hfConsecutivo.value).slice(-3);
           var vpers = " ";
           if (document.getElementById("vatributo" + fpers) != undefined) {
               vpers = document.getElementById("vatributo" + fpers).value;
           }

           var valc = " ";
           if (document.getElementById("vatributo" + falc) != undefined) {
               valc = document.getElementById("vatributo" + falc).value;
           }

           var vdest = " ";
           if (document.getElementById("vatributo" + fdest) != undefined) {
               vdest = document.getElementById("vatributo" + fdest).value;
           }

           document.forms[0].txtCodigo.value = vpers + valc + vdest + "_" + cons;

        }*/
        var auxsel;
        function cargarSelect(sel, padre,lista,region) {
          
            PageMethods.GetListData(lista, padre, region, function (list) { OnPopulateList(list, sel); });
        }
//        function cargarSelect2(sel, lista, region) {
//            auxsel = sel;
//            PageMethods.GetListData(lista, region, OnPopulateList);
//        }

        function OnPopulateList(list,sel) {
            var dropList = sel;
            var aux = sel.value;
            dropList.length = 0;
            var option2 = document.createElement('OPTION');
            option2.text ="";
            option2.value = "-1";
            dropList.options.add(option2);

            for (i = 0; i < list.length; i++) {
                var option = document.createElement('OPTION');
                option.text = list[i].text;
                option.value = list[i].value;
                dropList.options.add(option);
            }
            sel.value = aux;
        }
        function fnAbrirPermisos() {


            $.nmManual('../Categorias/Permisos.aspx?idcat=' + document.forms[0].hdCat.value + "&idind=" + document.forms[0].hdInd.value, {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });

            //   $('#escenariosw').window('open');
            //  $('#escenariosw').window('refresh', 'Escenarios.aspx?idcat=' + document.forms[0].hdIdCat.value);  
        }
        function fnAbrirEscenarios() {

            $.nmManual('../Categorias/Escenarios.aspx?idcat=' + document.forms[0].hdCat.value + "&idind=" + document.forms[0].hdInd.value, {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });

            //   $('#escenariosw').window('open');
            //  $('#escenariosw').window('refresh', 'Escenarios.aspx?idcat=' + document.forms[0].hdIdCat.value);  
        }
        function fnAbrirFechasLimite() {

            $.nmManual('../Categorias/FechasLimite.aspx?idcat=' + document.forms[0].hdCat.value + "&idind=" + document.forms[0].hdInd.value, {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });

        }
        function cerrarEscenarios(msg) {

            document.getElementById("msgExito").innerHTML = msg;
            $.nmTop().close();

        }
        function cambioNombre(sel) {
            document.forms[0].txtNombreAux.value = sel.options[sel.selectedIndex].text + " " + document.forms[0].txtNombreAux2.value;
        }
    
            function habilitarPermisos() {
     <%      if (Request["operation"] == "e"&&com.triario.repositorio.util.Utils.GetUsuario(Session,Response).DSTIPO=="R")
            { %>
            if(document.forms[0].ddlResponsable!=undefined)
            document.forms[0].ddlResponsable.disabled=true;
            if(document.forms[0].ddlNombre!=undefined)
            document.forms[0].ddlNombre.disabled=true;
             if(document.forms[0].ddlRegion!=undefined)
            document.forms[0].ddlRegion.disabled=true;
            if(document.forms[0].ddlNegocio!=undefined)
         document.forms[0].ddlNegocio.disabled=true;
        
                <%
        
        DSRepositorioIndicadoresTableAdapters.PermisosHabDAO perDAO = new DSRepositorioIndicadoresTableAdapters.PermisosHabDAO();
        DSRepositorioIndicadores.PermisosHabVODataTable perDT= perDAO.GetPermisosXInd(int.Parse(hdInd.Value), int.Parse(hdCat.Value));
        for (int i = 0; i < perDT.Rows.Count; i++)
        {
            DSRepositorioIndicadores.PermisosHabVORow perR = perDT[i];
            if (!perR.IsDSPERMISONull() && perR.DSPERMISO == "L")
            {
            %>
                var ele=document.getElementById("atributo<%=perR.ID%>");
                if(ele!=undefined){
                ele.disabled=true;
                }
                
                <%
            

}

        }
        
        
         %>



<%            }

            %>

        }

    </script>



</html>
