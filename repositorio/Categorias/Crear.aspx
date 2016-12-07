<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Crear.aspx.cs" Inherits="Categorias_Crear"  EnableEventValidation="false" %>
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
       <link rel="stylesheet" type="text/css" href="../jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui/themes/icon.css">

   
    

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
                <link href="../Styles/cssUpdateProgress.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript">
	    cargarEasyui();
	    var ModalProgress = '<%= ModalProgress.ClientID %>';
	    var tabaux = -1;      
	</script>

    	<style type="text/css">

.nyroModalCont
{
    top: 10px !important;
}
.nyroModalCloseButton
{
     top: 25px !important;
}
</style>

	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
    <div class="campos-buscador">
    <asp:HiddenField ID="hdIdCat" runat="server" />
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
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                </p>
			</div>
		</div>

        <div class="ui-widget" id="divError" runat="server">
			<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
				<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
				<div id="msgError" runat="server"></div>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                </p>
			</div>
		</div>

    <div id="divCampos" runat="server">
     <asp:CheckBoxList ID="chkblCampos" runat="server">
    </asp:CheckBoxList>
        <asp:Button ID="btnAnadir" runat="server" Text="Añadir" 
            CausesValidation="False" onclick="btnAnadir_Click"  OnClientClick="return fn_get_categoria()"/>
         <asp:Button ID="btnAnadirAgrup" runat="server" Text="Añadir Agrupación" OnClientClick="if(!fn_get_categoria())return false;return prompt1();"
            CausesValidation="False" onclick="btnAnadirAgrup_Click" />
    </div>
    <div class="categorias_cat">
    <div class="easyui-tabs" data-options="fit:true,plain:true" id="tt">
      <%   DSRepositorioIndicadoresTableAdapters.CategoriasDAO catDAO = new DSRepositorioIndicadoresTableAdapters.CategoriasDAO();
                  DSRepositorioIndicadores.CategoriasVODataTable dt= catDAO.GetCategorias();
                   for(int i=0;i<dt.Count;i++){
                       if (hdIdCat.Value!=""&&dt[i].ID == int.Parse(hdIdCat.Value))
                       {%>
                       <script>
                         tabaux=<%= i %>;
                       </script>
                       <%}
                   %>
                   <div title="<%= dt[i].DSNOMBRE %>" style="padding:10px;">
                   
                   <input type="hidden" name="tab-<%= i %>" id="tab-<%= i %>" value="<%= dt[i].ID %>" />

                    <button id="btnEliminar<%= dt[i].ID%>" name="btnEliminar<%= dt[i].ID%>" onclick="if(confirm('Está seguro que desea eliminar esta categoría?'))fnEliminarCat(<%= dt[i].ID%>); return false;">Eliminar</button>

                  <%= ConstruirArbol(dt[i].ID) %>

                  <button id="dtnEscenarios<%= dt[i].ID%>" name="dtnEscenarios<%= dt[i].ID%>" onclick="fnAbrirEscenarios()">Escenarios</button>

                   <button id="dtnAtributos<%= dt[i].ID%>" name="dtnAtributos<%= dt[i].ID%>" onclick="fnAbrirAtributos(); return false;">Atributos</button>
                     <button id="dtnPermisos<%= dt[i].ID%>" name="dtnPermisos<%= dt[i].ID%>" onclick="fnAbrirPermisos(); return false;">Permisos</button>
                         <button id="btnFechasLimite<%= dt[i].ID%>" name="btnFechasLimite<%= dt[i].ID%>" onclick="fnAbrirFechasLimite(); return false;">Fechas Límite</button>
                          <button id="btnGrupos<%= dt[i].ID%>" name="btnGrupos<%= dt[i].ID%>" onclick="fnAbrirGrupos(); return false;">Grupos Usuario</button>
                    </div>
			
			
                <% } %>

				
				<div title="+" style="padding:10px;"><label for="txtNombrecategoria">Nombre Categoría</label><asp:TextBox ID="txtNombrecategoria" runat="server" class="validate[required]"></asp:TextBox>
                <asp:Button ID="btnCrear" runat="server" Text="Crear" OnClientClick="return validarForm();"
                    onclick="btnCrear_Click" /></div>
			</div>
    </div>

     
   
<div id="escenariosw" style="display:none"></div>


  </ContentTemplate>
               
                </asp:UpdatePanel>
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
      
    </script>
     <script type="text/javascript">
     var cadaux="";
         function guardarTree(idcat) {
             var nodes = $('#tt-' + idcat).tree('getRoots');
             cadaux = "";
            // cad = "[ ";
             indaux = 0;  
       
             for (var i = 0; i < nodes.length; i++) {              
                 recorreTree(nodes[i],idcat);               
             }
           //  cad = cad + " ]";
             //alert(cadaux);
             return cadaux;
         }
      /*   function recorreTree(node, cat) {
             var nodes = $('#tt-' + cat).tree('getChildren',node.target);
             cad += node.id+" ";
             if (nodes.length > 0) {
                 cad += " [";
                
             }
           
                 for (var i = 0; i < nodes.length; i++) {
                     var padre = $('#tt-' + cat).tree('getParent', nodes[i].target);
                     alert(node.id+" : "+padre.id);
                   if(padre.id==node.id)
                     recorreTree(nodes[i], cat);

                 }
                 if (nodes.length > 0) {
                     cad = cad + "] ";
                 }

         }*/
         var indaux = 0;
         function recorreTree(node, cat) {
             var nodes = $('#tt-' + cat).tree('getChildren', node.target);
             var padre = $('#tt-' + cat).tree('getParent', node.target);
             if (padre == null) {
                 cadaux +=node.id + " @ " + indaux + ",";
             } else {
                 cadaux += node.id + " : " + padre.id + " @ " + indaux + ",";
             }
             indaux++;
             for (var i = 0; i < nodes.length; i++) {
                 var padre = $('#tt-' + cat).tree('getParent', nodes[i].target);
               
                 if (padre.id == node.id)
                     recorreTree(nodes[i], cat);

             }
            
         }

         function cargarTabs() {
             $(function () {



                 // Tabs
                 $('#tabs').tabs();
                 //hover states on the static widgets
                 $('#dialog_link, ul#icons li').hover(
					function () { $(this).addClass('ui-state-hover'); },
					function () { $(this).removeClass('ui-state-hover'); }
				);


             });
         }
         

        
        function pageLoad() {

            validarEngine();
        // cargarTabs();
            cargarEasyui();
          
            if (tabaux != -1) {
              
                $('#tt').tabs('select', tabaux);
            }

        }
        function fn_get_categoria() {


            var tab = $('#tt').tabs('getSelected');
            var index = $('#tt').tabs('getTabIndex', tab);
            if(document.getElementById("tab-"+index)==undefined){

                document.forms[0].hdIdCat.value = "";
                alert('<%=com.triario.repositorio.util.Utils.GetMensaje("SELECCIONAR_CATEGORIA")%>');
                return false;
            }


            document.forms[0].hdIdCat.value = document.getElementById("tab-" + index).value;
            return true;

        }
        function prompt1() {
            $.messager.prompt('Añadir Agrupación', 'Porfavor Ingrese el nombre', function (r) {
                if (r) {
                    __doPostBack('btnAnadirAgrup', r);
                }
            });
            return false;
        }
        function remove(cat) {
            var node = $('#tt-'+cat).tree('getSelected');
            $('#tt-' + cat).tree('remove', node.target);
           // alert(guardarTree(cat));
            EnviarTree(guardarTree(cat), cat);
            
        }
        function fnEliminarCat(cat) {
            PageMethods.EliminarCat( cat,
       OnSucceeded2, OnFailed);
         
        }
        function EnviarTree(cad, cat) {
         
            PageMethods.GuardarTree(cad, cat,
       OnSucceeded, OnFailed);
        }

        function OnSucceeded() {
            // Dispaly "thank you."
           // $get("ContactFieldset").innerHTML = "<p>Thank you!</p>";
        }
        function OnSucceeded2() {
            document.forms[0].submit();
        }
        function OnFailed(error) {
            // Alert user to the error.
            //alert(error.get_message());
            document.getElementById("divError").style.display = "";
            document.getElementById("msgError").innerHTML = '<%=com.triario.repositorio.util.Utils.GetMensaje("ERROR")%>';
        }
        function cerrarEscenarios(msg) {

            document.getElementById("msgExito").innerHTML = msg;
            $.nmTop().close();

        }


        function fnAbrirAtributos() {

            fn_get_categoria();
            $.nmManual('Atributos.aspx?idcat=' + document.forms[0].hdIdCat.value, {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });
        }

        function fnAbrirPermisos() {

            fn_get_categoria();
            $.nmManual('Permisos.aspx?idcat=' + document.forms[0].hdIdCat.value, {
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

            fn_get_categoria();
            $.nmManual('Escenarios.aspx?idcat=' + document.forms[0].hdIdCat.value, {
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
            fn_get_categoria();
            $.nmManual('FechasLimite.aspx?idcat=' + document.forms[0].hdIdCat.value, {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });

        }


                </script>
</body>
</html>
