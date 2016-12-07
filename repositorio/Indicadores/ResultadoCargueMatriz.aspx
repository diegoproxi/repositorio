<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResultadoCargueMatriz.aspx.cs" Inherits="Indicadores_ResultadoCargueMatriz" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, 
Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" 
TagPrefix="asp" %> 
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
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
    jQuery(function () {
        jQuery('.nyroModal').nyroModal();
    });
</script>



<style type="text/css">

.tabs-panels
{
 height:auto !important;   
}



</style>

                <link href="../Styles/cssUpdateProgress.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript">
	    cargarEasyui();
	    
	    var tabaux = -1;      
	</script>
    <link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />
      <link type="text/css" href="../estilos/buscador.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
      
      <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="false" />
    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1">
                    </telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid2" LoadingPanelID="RadAjaxLoadingPanel1">
                    </telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
             <telerik:AjaxSetting AjaxControlID="RadGrid2">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1">
                    </telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid2" LoadingPanelID="RadAjaxLoadingPanel1">
                    </telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
    Cargando
    </telerik:RadAjaxLoadingPanel>
   


     <div class="bt_fijos"> <a href='../Indicadores/Cargues.aspx'>Regresar</a> 
      </div>
     <br />
<div class="easyui-tabs" data-options="fit:true,plain:true" id="tt" style="height:auto !important" >  
 <div title="Resultado del Cargue" style="overflow:auto;padding:10px;"> 
        
         <telerik:RadGrid ID="RadGrid1" DataSourceID="SqlDataSourceResultado"
        runat="server" AutoGenerateColumns="False" AllowSorting="True" Skin="Telerik" AllowFilteringByColumn="True"
        AllowPaging="True" PageSize="20" GridLines="None" ShowGroupPanel="True"
        OnItemCommand="RadGrid1_ItemCommand" CellSpacing="0">
		 <GroupingSettings CaseSensitive="false" />
        <PagerStyle Mode="NumericPages" Position="TopAndBottom"></PagerStyle>
        <MasterTableView DataSourceID="SqlDataSourceResultado" AllowMultiColumnSorting="True"
            GroupLoadMode="Server">     

<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
            <Columns>

          

              
                <telerik:GridBoundColumn SortExpression="INDICADOR" HeaderText="Indicador" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="INDICADOR" UniqueName="INDICADOR" 
                    FilterControlAltText="Filter INDICADOR column" ReadOnly="True">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn SortExpression="NMANIO" HeaderText="Año" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="NMANIO" UniqueName="NMANIO" 
                    FilterControlAltText="Filter NMANIO column" ReadOnly="True">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn SortExpression="NMMES" HeaderText="Mes" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="NMMES" UniqueName="NMMES" 
                    FilterControlAltText="Filter NMMES column" ReadOnly="True">
                </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="UNIDADMEDIDA" HeaderText="Unidad de Medida" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="UNIDADMEDIDA" UniqueName="UNIDADMEDIDA" 
                    FilterControlAltText="Filter UNIDADMEDIDA column" ReadOnly="True">
                </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn SortExpression="REGION" HeaderText="Región" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="REGION" UniqueName="REGION" 
                    FilterControlAltText="Filter REGION column" ReadOnly="True">
                </telerik:GridBoundColumn>
                   <telerik:GridBoundColumn SortExpression="ANTERIOR" HeaderText="Anterior" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="ANTERIOR" UniqueName="ANTERIOR" 
                    FilterControlAltText="Filter ANTERIOR column" ReadOnly="True" DataFormatString="{0:N1}">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn SortExpression="NUEVO" HeaderText="Nuevo" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="NUEVO" UniqueName="NUEVO" 
                    FilterControlAltText="Filter NUEVO column" ReadOnly="True" DataFormatString="{0:N1}">
                </telerik:GridBoundColumn>



            </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
        </MasterTableView>
        <ClientSettings AllowDragToGroup="true">
      
        
           
        </ClientSettings>


<FilterMenu EnableImageSprites="False"></FilterMenu>
    </telerik:RadGrid>






        <asp:SqlDataSource ID="SqlDataSourceResultado" runat="server" 
            ConnectionString="<%$ ConnectionStrings:core_repositorioConnectionString %>" 
            SelectCommand="PRC_TRI_REP_GET_ACTXCARGUE" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="idact" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
      </div>
       <div title="Errores del Cargue" style="overflow:auto;padding:10px;"> 
       
       <asp:UpdatePanel ID="UpdatePanel1" runat="server" CssClass="updateProgress">
        
              <ContentTemplate>
         <telerik:RadGrid ID="RadGrid2" DataSourceID="SqlDataSourceErrores"
        runat="server" AutoGenerateColumns="False" AllowSorting="True" Skin="Telerik" AllowFilteringByColumn="True"
        AllowPaging="True" PageSize="20" GridLines="None" ShowGroupPanel="True"
        OnItemCommand="RadGrid2_ItemCommand" CellSpacing="0" 
                onpageindexchanged="RadGrid2_PageIndexChanged">
		 <GroupingSettings CaseSensitive="false" />
        <PagerStyle Mode="NumericPages" Position="TopAndBottom"></PagerStyle>
        <MasterTableView DataSourceID="SqlDataSourceErrores" AllowMultiColumnSorting="True"
            GroupLoadMode="Server">     

<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
            <Columns>

          

              
                <telerik:GridBoundColumn SortExpression="DSERROR" HeaderText="Error" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="DSERROR" UniqueName="DSERROR" 
                    FilterControlAltText="Filter DSERROR column" ReadOnly="True">
                </telerik:GridBoundColumn>
                

            </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
        </MasterTableView>
        <ClientSettings AllowDragToGroup="true">
      
        
           
        </ClientSettings>


<FilterMenu EnableImageSprites="False"></FilterMenu>
    </telerik:RadGrid>


       <asp:SqlDataSource ID="SqlDataSourceErrores" runat="server" 
               ConnectionString="<%$ ConnectionStrings:core_repositorioConnectionString %>" 
               SelectCommand="PRC_TRI_REP_GET_ERRORESXCARGUE" 
               SelectCommandType="StoredProcedure">
               <SelectParameters>
                   <asp:QueryStringParameter Name="idact" QueryStringField="id" Type="Int32" />
               </SelectParameters>
           </asp:SqlDataSource>
           </ContentTemplate>
           </asp:UpdatePanel>
        </div>

</div>

    </form>

    <script>
        function pageLoad() {

            <%if(!IsPostBack){ %>
            cargarEasyui();

             <%} %>


        }
    
    

   
    
            <%if(!IsPostBack){ %>
    <%
    RadGrid2.MasterTableView.AllowPaging = false; 
        RadGrid2.Rebind(); 
        int cant = RadGrid2.MasterTableView.Items.Count; 
        RadGrid2.MasterTableView.AllowPaging = true; 
        RadGrid2.Rebind(); 
    if (cant > 0)
      {%>
      alert("CUIDADO!!! El cargue se genero con  <%=cant%>, porfavor dirijase a Errores del Cargue");
     <%}%>
        <%} %>
      </script>
      
</body>
</html>
