<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Papelera.aspx.cs" Inherits="Administracion_Papelera" %>
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
    <h2>Papelera</h2>
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
            
                <telerik:GridBoundColumn SortExpression="ID" HeaderText="ID"
            
                    DataField="ID" 
                   Visible="false" ReadOnly="True">
                </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="DSTIPO" 
                    FilterControlAltText="Filter DSTIPO column" HeaderText="Tipo Objeto" FilterControlWidth="95px" ShowFilterIcon="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ReadOnly="True" SortExpression="DSTIPO" UniqueName="DSTIPO">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="DSOBJETO" 
                    FilterControlAltText="Filter DSOBJETO column" HeaderText="Objeto" FilterControlWidth="95px" ShowFilterIcon="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ReadOnly="True" SortExpression="DSOBJETO" UniqueName="DSOBJETO">
                </telerik:GridBoundColumn>

              <telerik:GridBoundColumn SortExpression="DSTABLA" HeaderText="DSTABLA"
            
                    DataField="DSTABLA" 
                   Visible="false" ReadOnly="True">
                </telerik:GridBoundColumn>
                
               <telerik:GridTemplateColumn HeaderText="" AllowFiltering="false">
                <ItemTemplate>
                 <center>
                <asp:LinkButton ID="restaurar" Text="Restaurar" runat="server" CommandName="Restaurar" CommandArgument='<%# Eval("ID")%>' OnClientClick="if(confirm('Está seguro que desea restaurar el objeto?')== false) return false">Restaurar</asp:LinkButton>
                </center>
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
        ConnectionString="<%$ ConnectionStrings:core_repositorioConnectionString %>" SelectCommand="select (convert(varchar(100),ID)+'@tri_rep_atributos') ID,'Atributos' DSTIPO,a.DSNOMBRE DSOBJETO,'tri_rep_atributos' DSTABLA from tri_rep_atributos a 
where SNELIMINADO=1
union 
select (convert(varchar(100),ID)+'@tri_rep_campos') ID,'Campos' DSTIPO,c.DSNOMBRE DSOBJETO,'tri_rep_campos' DSTABLA from tri_rep_campos c 
where SNELIMINADO=1
union 
select (convert(varchar(100),ID)+'@tri_rep_categorias') ID,'Categorías' DSTIPO,c.DSNOMBRE DSOBJETO,'tri_rep_categorias' DSTABLA from tri_rep_categorias c 
where SNELIMINADO=1
union 
select (convert(varchar(100),ID)+'@tri_rep_diccionarioindicadores') ID,'Diccionario' DSTIPO,e.DSNOMBRE DSOBJETO,'tri_rep_diccionarioindicadores' DSTABLA from tri_rep_diccionarioindicadores e 
where SNELIMINADO=1
union 
select (convert(varchar(100),ID)+'@tri_rep_escenarios') ID,'Escenarios' DSTIPO,e.DSNOMBRE DSOBJETO,'tri_rep_escenarios' DSTABLA from tri_rep_escenarios e 
where SNELIMINADO=1
union 
select (convert(varchar(100),ID)+'@tri_rep_escenarios') ID,'Escenarios' DSTIPO,e.DSNOMBRE DSOBJETO,'tri_rep_escenarios' DSTABLA from tri_rep_escenarios e 
where SNELIMINADO=1
union 
select (convert(varchar(100),ID)+'@tri_rep_indicadores') ID,'Indicadores' DSTIPO,dbo.GetNombreCompletoIndicador(i.ID) DSOBJETO,'tri_rep_indicadores' DSTABLA from tri_rep_indicadores i 
where SNELIMINADO=1
union 
select (convert(varchar(100),ID)+'@tri_rep_negocios') ID,'Negocios' DSTIPO,n.DSNOMBRE DSOBJETO,'tri_rep_negocios' DSTABLA from tri_rep_negocios n 
where SNELIMINADO=1
union 
select (convert(varchar(100),ID)+'@tri_rep_regiones') ID,'Regiones' DSTIPO,r.DSNOMBRE DSOBJETO,'tri_rep_regiones' DSTABLA from tri_rep_regiones r 
where SNELIMINADO=1 order by 2"
        runat="server">
    </asp:SqlDataSource>
    </form>
    </div>
</body>
</html>