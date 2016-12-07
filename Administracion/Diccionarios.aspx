<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Diccionarios.aspx.cs" Inherits="Administracion_Diccionarios" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

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
    $(function () {
        $('.nyroModal').nyroModal();
    });
</script>
    <title></title>
       <link type="text/css" href="../estilos/buscador.css" rel="stylesheet" />
    	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    
    <div class="campos-buscador">
     <center><a  class="bt_buscar"  href="#" onclick="abrirnuevo()">Nuevo</a></center>
    <center>

      <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="false" />
    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1">
                    </telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
    Cargando
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadGrid ID="RadGrid1" DataSourceID="SqlDataSource1"
        runat="server" AutoGenerateColumns="False" AllowSorting="True" Skin="Telerik" AllowFilteringByColumn="True"
        AllowPaging="True" PageSize="30" GridLines="None" ShowGroupPanel="True"
        OnItemCommand="RadGrid1_ItemCommand" CellSpacing="0">
		 <GroupingSettings CaseSensitive="false" />
        <PagerStyle Mode="NumericPages"></PagerStyle>
        <MasterTableView DataSourceID="SqlDataSource1" AllowMultiColumnSorting="True"
            GroupLoadMode="Server">     

<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
            <Columns>

            
                <telerik:GridBoundColumn SortExpression="ID" HeaderText="ID" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false" Visible="false"
                    DataField="ID" UniqueName="ID" 
                    FilterControlAltText="Filter ID column" ReadOnly="True">
                </telerik:GridBoundColumn>
              
                <telerik:GridBoundColumn SortExpression="DSNOMBRE" HeaderText="Nombre" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="DSNOMBRE" UniqueName="DSNOMBRE" 
                    FilterControlAltText="Filter DSNOMBRE column" ReadOnly="True">
                </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn SortExpression="DSDESCRIPCION" HeaderText="Descripción" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="DSDESCRIPCION" UniqueName="DSDESCRIPCION" 
                    FilterControlAltText="Filter DSDESCRIPCION column" ReadOnly="True">
                </telerik:GridBoundColumn>

                 <telerik:GridTemplateColumn UniqueName="colEdit" HeaderText="" AllowFiltering="false">
        <ItemTemplate>
          <a  href="#" onclick="abrir(<%# Eval("ID")%>)">Editar </a>
        </ItemTemplate>
        </telerik:GridTemplateColumn>

          <telerik:GridTemplateColumn UniqueName="colEli" HeaderText="" AllowFiltering="false">
        <ItemTemplate>
         <asp:LinkButton ID="ibtnDelete" runat="server" Text="Eliminar" OnClientClick="javascript: if(confirm('Está seguro que desea eliminar el diccionario?')== false) return false" CommandName="eliminar" CommandArgument='<%# Eval("ID")%>'></asp:LinkButton>
       
        </ItemTemplate>
        </telerik:GridTemplateColumn>

            </Columns>


<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
        </MasterTableView>
        <ClientSettings AllowDragToGroup="true">
      
        
           
        </ClientSettings>


<FilterMenu EnableImageSprites="False"></FilterMenu>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSource1" 
        
        ConnectionString="<%$ ConnectionStrings:core_repositorioConnectionString %>" SelectCommand="SELECT ID, DSNOMBRE, DSDESCRIPCION, SNELIMINADO FROM dbo.tri_rep_diccionarioindicadores
where SNELIMINADO=0"
        runat="server">
     
    </asp:SqlDataSource>



    </center>

    </div>

    
 
    
    
   
     <script type="text/javascript">
         function abrir(id) {
             $.nmManual('EditDiccionario.aspx?id=' + id, {
                 callbacks: {
                     initFilters: function (nm) {
                         nm.filters.push('link');
                         nm.filters.push('iframe');
                     }
                 }
             });
         }
         function abrirnuevo() {
             $.nmManual('EditDiccionario.aspx', {
                 callbacks: {
                     initFilters: function (nm) {
                         nm.filters.push('link');
                         nm.filters.push('iframe');
                     }
                 }
             });
         }
        </script>
    </form>
</body>
</html>
