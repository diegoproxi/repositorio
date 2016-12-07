<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActualizarMatriz.aspx.cs" Inherits="Indicadores_ActualizarMatriz" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, 
Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" 
TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" 
TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

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

	<link href="../Styles/cssUpdateProgress.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript">
	   cargarEasyui();
	    var ModalProgress = '<%= ModalProgress.ClientID %>';
	    var tabaux = -1;      
	</script>


    <link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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



     <asp:UpdatePanel ID="UpdatePanel1" runat="server" CssClass="updateProgress contenidoVerBuscar">
        
              <ContentTemplate>

    <div class="fijos">
   <h2> Matriz de Perdidas</h2>
       
<div class="fila1">
   <div class="fields">Planta <asp:DropDownList ID="ddlPlanta" runat="server" 
           onselectedindexchanged="ddlPlanta_SelectedIndexChanged" 
           AutoPostBack="True">
        </asp:DropDownList></div>

        
   <div class="fields">Operación <asp:DropDownList ID="ddlOperacion" runat="server" 
           AutoPostBack="True" onselectedindexchanged="ddlOperacion_SelectedIndexChanged">
        </asp:DropDownList></div>

   <div class="fields">Línea <asp:DropDownList ID="ddlLinea" runat="server" AutoPostBack="True" onselectedindexchanged="ddlLinea_SelectedIndexChanged">
        </asp:DropDownList></div>

   <div class="fields">Año 
             <asp:DropDownList ID="ddlAnio" runat="server" 
                 onselectedindexchanged="ddlAnio_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList></div>

   <div class="fields">Período <asp:DropDownList ID="ddlPeriodo" runat="server" AutoPostBack="True" 
                onselectedindexchanged="ddlPeriodo_SelectedIndexChanged">
        </asp:DropDownList></div>

    </div></div>
<div class="fila1 resultado">
    <table class="zebra historico">
    
    <tr>
  
    
     <td>
         INDICADOR
    </td>

       <td>
    UM
    </td>
      
    <td>
    REAL(UM)
    </td>
       <td>
    PRESUPUESTO(UM)
    </td>

      <td>
    REAL($)
    </td>
       <td>
    PRESUPUESTO($)
    </td>
         <td>
    COMENTARIOS</td>

    </tr>
        <asp:Label ID="lblTabla" runat="server" Text=""></asp:Label>


        
    <tr style="display:none">
    <td colspan="2">
    TOTAL PERDIDAS LÍNEA
    </td>
    <td></td>
    <td></td>
    <td><asp:Label ID="lblTotLineaR" runat="server" Text=""></asp:Label></td>
    <td><asp:Label ID="lblTotLineaP" runat="server" Text=""></asp:Label></td>
    <td> </td>
    
    </tr>
       
    <tr>
    <td colspan="2" valign="top">
    TOTAL PERDIDAS PLANTA
    </td>
    <td></td>
    <td></td>
    <td> <asp:Label ID="lblTotPlanR" runat="server" Text=""></asp:Label></td>
    <td> <asp:Label ID="lblTotPlanP" runat="server" Text=""></asp:Label> </td>
    <td>
       
    
    
    </td>
    
    </tr>
     <tr>
    <td colspan="2" valign="top">
   
    </td>
    <td></td>
    <td></td>
    <td></td>
    <td>  </td>
    <td>
        <asp:TextBox ID="txtComent" runat="server" Height="46px" TextMode="MultiLine" 
            Width="234px"></asp:TextBox>
    
    
    </td>
    
    </tr>

    </table>
    	</div>
       </ContentTemplate>
      </asp:UpdatePanel>
    </form>
     <script>
     function fnCambioValor(idind,esc,valor){

     var anio= document.forms[0].ddlAnio.value;
      var mes= document.forms[0].ddlPeriodo.value;

       PageMethods.GuardarValor(esc, anio,mes,valor,"",idind, OnSucceeded, OnFailed);

   }
   function fnCambioValor2(idind, esc, valor) {

       var anio = document.forms[0].ddlAnio.value;
       var mes = document.forms[0].ddlPeriodo.value;

       PageMethods.GuardarValor(esc, anio, mes, valor, "O", idind, OnSucceeded, OnFailed);

   }
       function OnSucceeded() {
           // Dispaly "thank you."
           // $get("ContactFieldset").innerHTML = "<p>Thank you!</p>";
          
       }

       function OnFailed(error) {
          

           alert("Ocurrio un error al guardar, vuelva intentarlo");
       }

        function pageLoad() {

         
          
          cargarEasyui();

       

        }
        </script>
</body>
</html>
