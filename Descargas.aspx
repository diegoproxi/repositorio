<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Descargas.aspx.cs" Inherits="Descargas" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <title></title>
    <link href="../estilos/grid.css" rel="stylesheet" type="text/css" />
	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="campos-buscador">
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
    
    <center>
    <h2>Descargas</h2>
    </center>

    <telerik:RadGrid ID="RadGrid1"  DataSourceID="SqlDataSource1"
        runat="server" AutoGenerateColumns="False" AllowSorting="True" 
        Skin="Telerik" AllowFilteringByColumn="True"
        AllowPaging="True" PageSize="20" GridLines="None" ShowGroupPanel="True"
       CellSpacing="0" onitemcommand="RadGrid1_ItemCommand" 
     >
		 <GroupingSettings CaseSensitive="false" />
        <PagerStyle Mode="NumericPages"></PagerStyle>
        <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="id" AllowMultiColumnSorting="True"
            GroupLoadMode="Server">     

<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
            <Columns>
            <telerik:GridBoundColumn DataField="ID"  Visible="false"
                    >
                </telerik:GridBoundColumn>
            
                  <telerik:GridBoundColumn DataField="DSUSUARIO" 
                    FilterControlAltText="Filter DSUSUARIO column" HeaderText="Usuario" FilterControlWidth="95px" ShowFilterIcon="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ReadOnly="True" SortExpression="DSUSUARIO" UniqueName="DSUSUARIO">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="DSARCHIVO" 
                    FilterControlAltText="Filter DSARCHIVO column" HeaderText="Archivo" FilterControlWidth="95px" ShowFilterIcon="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ReadOnly="True" SortExpression="DSARCHIVO" UniqueName="DSARCHIVO">
                </telerik:GridBoundColumn>

                 <telerik:GridBoundColumn DataField="FEFECHA" 
                    FilterControlAltText="Filter FEFECHA column" HeaderText="Fecha" FilterControlWidth="95px" ShowFilterIcon="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ReadOnly="True" SortExpression="FEFECHA" UniqueName="FEFECHA">
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
        ConnectionString="<%$ ConnectionStrings:core_repositorioConnectionString %>" SelectCommand="select ID,DSUSUARIO,DSARCHIVO,FEFECHA from repositorio.dbo.descargas order by ID desc"
        runat="server">
    </asp:SqlDataSource>
    </form>
    </div>
</body>
</html>
