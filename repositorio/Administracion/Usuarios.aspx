<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Usuarios.aspx.cs" Inherits="Administracion_Usuarios" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <link type="text/css" href="../estilos/buscador.css" rel="stylesheet" />
	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />
</head>
<body>
  
    <div>

    <div class="campos-buscador">
    <h2>Usuarios</h2>
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
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
    Cargando
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadGrid ID="RadGrid1" DataSourceID="SqlDataSource1"
        runat="server" AutoGenerateColumns="False" AllowSorting="True" Skin="Telerik" AllowFilteringByColumn="True"
        AllowPaging="True" PageSize="20" GridLines="None" ShowGroupPanel="True"
        OnItemCommand="RadGrid1_ItemCommand" CellSpacing="0">
		 <GroupingSettings CaseSensitive="false" />
        <PagerStyle Mode="NumericPages"></PagerStyle>
        <MasterTableView DataSourceID="SqlDataSource1" AllowMultiColumnSorting="True"
            GroupLoadMode="Server">     

<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
            <Columns>

            


              
                <telerik:GridBoundColumn SortExpression="DSNOMBRES" HeaderText="Nombres" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="DSNOMBRES" UniqueName="DSNOMBRES" 
                    FilterControlAltText="Filter DSNOMBRES column" ReadOnly="True">
                </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="TIPO" HeaderText="Tipo" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="TIPO" UniqueName="TIPO" 
                    FilterControlAltText="Filter TIPO column" ReadOnly="True">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn SortExpression="DSCEDULA" HeaderText="Cédula" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="DSCEDULA" UniqueName="DSCEDULA" 
                    FilterControlAltText="Filter DSCEDULA column" ReadOnly="True">
                </telerik:GridBoundColumn>
                   <telerik:GridBoundColumn SortExpression="DSEMAIL" HeaderText="Email" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="DSEMAIL" UniqueName="DSEMAIL" 
                    FilterControlAltText="Filter DSEMAIL column" ReadOnly="True">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn SortExpression="REGION" HeaderText="Región" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="REGION" UniqueName="REGION" 
                    FilterControlAltText="Filter REGION column" ReadOnly="True">
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
    <asp:SqlDataSource ID="SqlDataSource1" 
        
        ConnectionString="<%$ ConnectionStrings:core_repositorioConnectionString %>" SelectCommand="SELECT [DSNOMBRES], (case when [DSTIPO]='S' then 'Super Administrador' when [DSTIPO]='A' then 'Administrador' when [DSTIPO]='R' then 'Responsable' when [DSTIPO]='C' then 'Consulta' END) TIPO , [DSCEDULA], [DSEMAIL],(select DSNOMBRE from tri_rep_regiones where ID=IDREGION) REGION FROM [tri_rep_usuarios]
where SNELIMINADO=0
order by DSNOMBRES"
        runat="server">
    
    </asp:SqlDataSource>
   </form>

    </div>
    
    </div>
   
</body>
</html>
