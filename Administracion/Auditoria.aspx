<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Auditoria.aspx.cs" Inherits="Administracion_Auditoria" %>

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
     
      <link rel="stylesheet" href="jquery.nyroModal/styles/nyroModal.css" type="text/css" media="screen" />
       <link type="text/css" href="../estilos/buscador.css" rel="stylesheet" /></head>
<script type="text/javascript" src="jquery.nyroModal/js/jquery.nyroModal.custom.js"></script>
<!--[if IE 6]>
	<script type="text/javascript" src="jquery.nyroModal/js/jquery.nyroModal-ie6.min.js"></script>
<![endif]-->

<style type="text/css">
.nyroModalCont iframe {
	width: 900px !important;
	height: 800px !important;
}
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
    <div class="campos-buscador">
    <form id="form1" runat="server">
          <div class="labels">Usuario</div>
          <asp:DropDownList ID="ddlUsuario" runat="server" CssClass="listas">
          </asp:DropDownList>
          <div class="clear"></div>
          <div class="labels">Desde</div>
          <asp:TextBox ID="txtdesde" runat="server" CssClass="cuadro-txt"></asp:TextBox><button id="f_btn1">...</button>
          <div class="clear"></div>
          <div class="labels">Hasta</div>
          <asp:TextBox ID="txthasta" runat="server" CssClass="cuadro-txt"></asp:TextBox><button id="f_btn2">...</button>
          <div class="clear"></div>
         
     
     <asp:Button ID="Button1" runat="server" Text="Buscar" 
            style="width: 61px" onclick="Button1_Click" OnClientClick="return validar();"/>
        <asp:GridView ID="gvbuscador" runat="server" AutoGenerateColumns="False" 
              AllowPaging="true" PagerSettings-Position="TopAndBottom" PageSize="20"
            Width="100%" border="0" class="zebra" 
              onpageindexchanging="gvbuscador_PageIndexChanging">
            <Columns>
             <asp:BoundField DataField="DSINIDCADOR" HeaderText="Indicador" SortExpression="DSINIDCADOR" />

             <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                     ReadOnly="True" SortExpression="ID" Visible="False" />
            <asp:BoundField DataField="DSUSUARIO" HeaderText="Usuario" ReadOnly="True" 
                     SortExpression="DSUSUARIO" />
           <asp:BoundField DataField="DSINIDCADOR" HeaderText="Indicador" ReadOnly="True" 
                     SortExpression="DSINIDCADOR" />

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

        <script>
            function validar() {
                if (document.forms[0].ddlUsuario.value == "-1" && document.forms[0].txtdesde.value == "" && document.forms[0].txthasta.value == "") {
                    alert("Debe seleccionar algún filtro");
                    return false;
                }
                return true;

            }
            function pageLoad() {

             
                cargarEasyui();



            }
            function setupCalendar() {
                Calendar.setup({
                    inputField: "<%=txtdesde.ClientID%>",
                    trigger: "f_btn1",
                    dateFormat: "%d/%m/%Y"
                });
                Calendar.setup({
                    inputField: "<%=txthasta.ClientID%>",
                    trigger: "f_btn2",
                    dateFormat: "%d/%m/%Y"
                });
            }
            setupCalendar();
        </script>
    </form>
    </div>
</body>
</html>
