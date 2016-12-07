<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CargaMasivaMatriz.aspx.cs" Inherits="Indicadores_CargaMasivaMatriz" %>
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

<script src="../calendar/js/jscal2.js"></script> 
<script src="../calendar/js/es.js"></script>
<link rel="stylesheet" type="text/css" href="../calendar/css/jscal2.css" />

       <script type="text/javascript" src="../jquery-easyui/jquery.easyui.min.js"></script>
       <link rel="stylesheet" type="text/css" href="../jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui/themes/icon.css">

   
         <link type="text/css" href="../estilos/buscador.css" rel="stylesheet" />
	
                <link href="../Styles/cssUpdateProgress.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript">
	    cargarEasyui();
	    var ModalProgress = '<%= ModalProgress.ClientID %>';
	    var tabaux = -1;      
	</script>






</head>
<body>
<a name="inicio"></a>
    <form id="form1" runat="server" enctype="multipart/form-data">
    

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
              <asp:HiddenField ID="hfArchivo" runat="server" />


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

<div id="divCar"  runat="server">
    <div>
       
    Archivo
     <asp:FileUpload ID="fuArchivo" runat="server"  class="validate[required]" />
    </div>

    <div>
    Comentarios

        <asp:TextBox ID="txtObs" runat="server" Height="60px" TextMode="MultiLine" 
            Width="256px"></asp:TextBox>
    </div>
    <div >
    Año<asp:DropDownList ID="ddlAnio" runat="server" >
         </asp:DropDownList>

        
    </div>

    <div >
    Mes<asp:DropDownList ID="ddlPeriodo" runat="server" >
         </asp:DropDownList>

        
    </div>
     <div >
    Escenario<asp:DropDownList ID="ddlEscenario" runat="server" >
         </asp:DropDownList>

        
    </div>
     <div style="display:none">
       Desde<asp:DropDownList ID="ddlDesde" runat="server"  >
         </asp:DropDownList>

        
    </div>

     <div style="display:none">
       Hasta<asp:DropDownList ID="ddlHasta" runat="server" >
         </asp:DropDownList>

        
    </div>

    <div  style="display:none">
       Código Auxiliar   <asp:CheckBox ID="chkCheckAux" runat="server" />
     

        
    </div>

     <div style="display:none" >
    
         <asp:CheckBox ID="chkRestr" runat="server" 
             Text="Actualización Masiva (Sin restricciones?)" Checked="True"  />
     

        
    </div>

    <div>
        <asp:Button ID="btnCargar" runat="server" Text="Cargar" 
            onclick="btnCargar_Click" OnClientClick="return validarForm();" />
    </div>

    </div>
    <div id="divFinal" runat="server" style="display:none">
     <div>
       Hoja<asp:DropDownList ID="ddlHoja" runat="server"  class="validate[required]">
         </asp:DropDownList>

        
    </div>
     <div>
        <asp:Button ID="btnFinalizar" runat="server" Text="Continuar" onclick="btnFinalizar_Click" OnClientClick="return validarForm();"
            />

            <button name="Cancelar" value="Cancelar" onclick="document.location.href='Cargues.aspx';">Cancelar</button>
    </div>
    </div>
  <div id="divFinal2" runat="server" style="display:none"  >
    
     <div>
         
        <asp:Button ID="btnTerminar" runat="server" Text="Finalizar" 
             OnClientClick="return confirm('Está seguro que desea realizar esta carga?');" onclick="btnTerminar_Click"
            /> <button name="Cancelar" value="Cancelar" onclick="document.location.href='Cargues.aspx';">Cancelar</button>
            <asp:GridView ID="gvCarga" runat="server" AutoGenerateColumns="true" 
             AllowPaging="true" PageSize="20" border="0" class="zebra" 
             PagerSettings-Position="TopAndBottom"  Width="790px"
             onpageindexchanging="gvCarga_PageIndexChanging" 
             onrowdatabound="gvCarga_RowDataBound">
         </asp:GridView>

    </div>
    </div>

   
    </ContentTemplate>
    
        <Triggers>

            <asp:PostBackTrigger ControlID="btnCargar" />  

        </Triggers>

    </asp:UpdatePanel>
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


    </script>
</body>
</html>
