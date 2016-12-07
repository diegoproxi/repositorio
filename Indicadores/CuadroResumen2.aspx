<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CuadroResumen.aspx.cs" Inherits="Indicadores_CuadroResumen" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <title></title>
    <link href="../estilos/grid.css" rel="stylesheet" type="text/css" />
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
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
    Cargando
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadGrid ID="RadGrid1" OnPreRender="RadGrid1_PreRender" DataSourceID="SqlDataSource1"
        runat="server" AutoGenerateColumns="False" AllowSorting="True" Skin="Telerik" AllowFilteringByColumn="True"
        AllowPaging="True" PageSize="10" GridLines="None" ShowGroupPanel="True" OnItemCreated="RadGrid1_ItemCreated"
        OnItemCommand="RadGrid1_ItemCommand" CellSpacing="0">
		 <GroupingSettings CaseSensitive="false" />
        <PagerStyle Mode="NumericPages"></PagerStyle>
        <MasterTableView DataSourceID="SqlDataSource1" DataKeyNames="id" AllowMultiColumnSorting="True"
            GroupLoadMode="Server">
            <NestedViewTemplate>
                <asp:Panel runat="server" ID="InnerContainer" CssClass="viewWrap" Visible="false"  >
                    <telerik:RadTabStrip runat="server" ID="TabStip1" MultiPageID="Multipage1" SelectedIndex="0" Skin="Default" >
                        <Tabs>
                            <telerik:RadTab runat="server" Text="Valores" PageViewID="PageView1">
                            </telerik:RadTab>
                            <telerik:RadTab runat="server" Text="Detalle" PageViewID="PageView2">
                            </telerik:RadTab>
                          
                        </Tabs>
                    </telerik:RadTabStrip>
                    <telerik:RadMultiPage runat="server" ID="Multipage1" SelectedIndex="0" RenderSelectedPageOnly="false" >
                        <telerik:RadPageView runat="server" ID="PageView1">
                            <asp:Label ID="Label1" Font-Bold="true" Font-Italic="true" Text='<%# Eval("id") %>'
                                Visible="false" runat="server"></asp:Label>
                            <telerik:RadGrid runat="server" ID="OrdersGrid" DataSourceID="SqlDataSource2" ShowFooter="true"
                                AllowSorting="true" EnableLinqExpressions="false" Skin="Telerik">
                                <MasterTableView ShowHeader="true" AutoGenerateColumns="False" AllowPaging="true"
                                    DataKeyNames="DSNOMBRE" PageSize="7" HierarchyLoadMode="ServerOnDemand">
                                  
                                    <Columns>
                                        <telerik:GridBoundColumn SortExpression="DSNOMBRE" HeaderText="Escenario" HeaderButtonType="TextButton"
                                            DataField="DSNOMBRE" UniqueName="DSNOMBRE">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn SortExpression="ENERO" HeaderText="Enero" HeaderButtonType="TextButton"
                                            DataField="ENERO" UniqueName="ENERO"  >
                                        </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn SortExpression="FEBRERO" HeaderText="Febrero" HeaderButtonType="TextButton"
                                            DataField="FEBRERO" UniqueName="FEBRERO"  >
                                        </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn SortExpression="MARZO" HeaderText="Marzo" HeaderButtonType="TextButton"
                                            DataField="MARZO" UniqueName="MARZO"  >
                                        </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn SortExpression="ABRIL" HeaderText="Abril" HeaderButtonType="TextButton"
                                            DataField="ABRIL" UniqueName="ABRIL"  >
                                        </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn SortExpression="MAYO" HeaderText="Mayo" HeaderButtonType="TextButton"
                                            DataField="MAYO" UniqueName="MAYO"  >
                                        </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn SortExpression="JUNIO" HeaderText="Junio" HeaderButtonType="TextButton"
                                            DataField="JUNIO" UniqueName="JUNIO"  >
                                        </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn SortExpression="JULIO" HeaderText="Julio" HeaderButtonType="TextButton"
                                            DataField="JULIO" UniqueName="JULIO"  >
                                        </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn SortExpression="AGOSTO" HeaderText="Agosto" HeaderButtonType="TextButton"
                                            DataField="AGOSTO" UniqueName="AGOSTO"  >
                                        </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn SortExpression="SEPTIEMBRE" HeaderText="Septiembre" HeaderButtonType="TextButton"
                                            DataField="SEPTIEMBRE" UniqueName="SEPTIEMBRE"  >
                                        </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn SortExpression="OCTUBRE" HeaderText="Octubre" HeaderButtonType="TextButton"
                                            DataField="OCTUBRE" UniqueName="OCTUBRE"  >
                                        </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn SortExpression="NOVIEMBRE" HeaderText="Noviembre" HeaderButtonType="TextButton"
                                            DataField="NOVIEMBRE" UniqueName="NOVIEMBRE"  >
                                        </telerik:GridBoundColumn>
                                           <telerik:GridBoundColumn SortExpression="DICIEMBRE" HeaderText="Diciembre" HeaderButtonType="TextButton"
                                            DataField="DICIEMBRE" UniqueName="DICIEMBRE"  >
                                        </telerik:GridBoundColumn>

                                       
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:core_repositorioConnectionString %>"
                                ProviderName="System.Data.SqlClient" SelectCommand="SELECT  distinct esc.DSNOMBRE, 
(select top(1) isnull(convert(varchar(100),CAST(ROUND(NMVALOR, 2, 1) AS DECIMAL(9,2)) ),DSVALOR)  VALOR from tri_rep_valoresxescenario ve where
 ve.NMMES=1 and NMANIO=datepart(YEAR,getdate()) AND ve.IDESCENARIO=esc.ID and ve.IDINDICADOR=@indicador)  ENERO,
 (select top(1) isnull(convert(varchar(100),CAST(ROUND(NMVALOR, 2, 1) AS DECIMAL(9,2)) ),DSVALOR)  VALOR from tri_rep_valoresxescenario ve where
 ve.NMMES=2 and NMANIO=datepart(YEAR,getdate()) AND ve.IDESCENARIO=esc.ID and ve.IDINDICADOR=@indicador)  FEBRERO,
 (select top(1) isnull(convert(varchar(100),CAST(ROUND(NMVALOR, 2, 1) AS DECIMAL(9,2)) ),DSVALOR)  VALOR from tri_rep_valoresxescenario ve where
 ve.NMMES=3 and NMANIO=datepart(YEAR,getdate()) AND ve.IDESCENARIO=esc.ID and ve.IDINDICADOR=@indicador)  MARZO,
 (select top(1) isnull(convert(varchar(100),CAST(ROUND(NMVALOR, 2, 1) AS DECIMAL(9,2)) ),DSVALOR)  VALOR from tri_rep_valoresxescenario ve where
 ve.NMMES=4 and NMANIO=datepart(YEAR,getdate()) AND ve.IDESCENARIO=esc.ID and ve.IDINDICADOR=@indicador)  ABRIL,
 (select top(1) isnull(convert(varchar(100),CAST(ROUND(NMVALOR, 2, 1) AS DECIMAL(9,2)) ),DSVALOR)  VALOR from tri_rep_valoresxescenario ve where
 ve.NMMES=5 and NMANIO=datepart(YEAR,getdate()) AND ve.IDESCENARIO=esc.ID and ve.IDINDICADOR=@indicador)  MAYO,
 (select top(1) isnull(convert(varchar(100),CAST(ROUND(NMVALOR, 2, 1) AS DECIMAL(9,2)) ),DSVALOR)  VALOR from tri_rep_valoresxescenario ve where
 ve.NMMES=6 and NMANIO=datepart(YEAR,getdate()) AND ve.IDESCENARIO=esc.ID and ve.IDINDICADOR=@indicador)  JUNIO,
 (select top(1) isnull(convert(varchar(100),CAST(ROUND(NMVALOR, 2, 1) AS DECIMAL(9,2)) ),DSVALOR)  VALOR from tri_rep_valoresxescenario ve where
 ve.NMMES=7 and NMANIO=datepart(YEAR,getdate()) AND ve.IDESCENARIO=esc.ID and ve.IDINDICADOR=@indicador)  JULIO,
 (select top(1) isnull(convert(varchar(100),CAST(ROUND(NMVALOR, 2, 1) AS DECIMAL(9,2)) ),DSVALOR)  VALOR from tri_rep_valoresxescenario ve where
 ve.NMMES=8 and NMANIO=datepart(YEAR,getdate()) AND ve.IDESCENARIO=esc.ID and ve.IDINDICADOR=@indicador)  AGOSTO,
 (select top(1) isnull(convert(varchar(100),CAST(ROUND(NMVALOR, 2, 1) AS DECIMAL(9,2)) ),DSVALOR)  VALOR from tri_rep_valoresxescenario ve where
 ve.NMMES=9 and NMANIO=datepart(YEAR,getdate()) AND ve.IDESCENARIO=esc.ID and ve.IDINDICADOR=@indicador)  SEPTIEMBRE,
 (select top(1) isnull(convert(varchar(100),CAST(ROUND(NMVALOR, 2, 1) AS DECIMAL(9,2)) ),DSVALOR)  VALOR from tri_rep_valoresxescenario ve where
 ve.NMMES=10 and NMANIO=datepart(YEAR,getdate()) AND ve.IDESCENARIO=esc.ID and ve.IDINDICADOR=@indicador)  OCTUBRE,
 (select top(1) isnull(convert(varchar(100),CAST(ROUND(NMVALOR, 2, 1) AS DECIMAL(9,2)) ),DSVALOR)  VALOR from tri_rep_valoresxescenario ve where
 ve.NMMES=11 and NMANIO=datepart(YEAR,getdate()) AND ve.IDESCENARIO=esc.ID and ve.IDINDICADOR=@indicador)  NOVIEMBRE,
 (select top(1) isnull(convert(varchar(100),CAST(ROUND(NMVALOR, 2, 1) AS DECIMAL(9,2)) ),DSVALOR)  VALOR from tri_rep_valoresxescenario ve where
 ve.NMMES=12 and NMANIO=datepart(YEAR,getdate()) AND ve.IDESCENARIO=esc.ID and ve.IDINDICADOR=@indicador)  DICIEMBRE
 
 from tri_rep_escenarios esc,tri_rep_valoresxescenario ve2
where ve2.IDINDICADOR=@indicador and ve2.IDESCENARIO=esc.ID 
order by 1"
                                runat="server">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label1" PropertyName="Text" Type="Int32" Name="indicador">
                                    </asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                          
                        </telerik:RadPageView>
                        <telerik:RadPageView runat="server" ID="PageView2" Width="460px">
                            <div class="contactWrap">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                       
                                        <td>
<asp:DetailsView ID="DetailsView1" AllowPaging="true" GridLines="Horizontal" Width="100%"
DataSourceID="SqlDataSource4" runat="server" Font-Italic="true" AutoGenerateRows="false">
                                                <Fields>
<asp:BoundField  HeaderText="Código:" HtmlEncode="false"
DataField="DSCODIGO" HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true">
                                                    </asp:BoundField>
<asp:BoundField  HeaderText="Nombre:" HtmlEncode="false" 
                
DataField="NOMBRE" HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true">
                                                    </asp:BoundField>

<asp:BoundField  HeaderText="Categoría:" HtmlEncode="false"
DataField="categoria" HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true">
                                                    </asp:BoundField>

<asp:BoundField  HeaderText="Región:" HtmlEncode="false"
DataField="REGION" HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true">
                                                    </asp:BoundField>


<asp:BoundField  HeaderText="Tipo:" HtmlEncode="false"
DataField="TIPO" HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true">
                                                    </asp:BoundField>

<asp:BoundField  HeaderText="Formula:" HtmlEncode="false"
DataField="DSFORMULA" HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true">
                                                    </asp:BoundField>


<asp:BoundField  HeaderText="Fuente:" HtmlEncode="false"
DataField="DSFUENTE" HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true">
                                                    </asp:BoundField>


                                                    
<asp:BoundField  HeaderText="Definición:" HtmlEncode="false"
DataField="DSDEFINICION" HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true">
                                                    </asp:BoundField>
                                                    
<asp:BoundField  HeaderText="Análisis:" HtmlEncode="false"
DataField="DSANALISIS" HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true">
                                                    </asp:BoundField>

                                                    <asp:BoundField  HeaderText="Responsable:" HtmlEncode="false"
DataField="RESPONSABLE" HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true">
                                                    </asp:BoundField>

                                                    <asp:BoundField  HeaderText="Objetivo:" HtmlEncode="false"
DataField="OBJETIVO" HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true">
                                                    </asp:BoundField>


   <asp:BoundField  HeaderText="Perspectiva:" HtmlEncode="false"
DataField="PERSPECTIVA" HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true">
                                                    </asp:BoundField>

                                                    
   <asp:BoundField  HeaderText="Unidad Medida:" HtmlEncode="false"
DataField="UNIDADMEDIDA" HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true">
                                                    </asp:BoundField>


                                                                                                        
   <asp:BoundField  HeaderText="Estado:" HtmlEncode="false"
DataField="ESTADO" HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true">
                                                    </asp:BoundField>

                                                </Fields>
                                            </asp:DetailsView>
                                            <asp:SqlDataSource ID="SqlDataSource4" ConnectionString="<%$ ConnectionStrings:core_repositorioConnectionString %>"
                                                ProviderName="System.Data.SqlClient" SelectCommand="select DSCODIGO,dbo.GetNombreCompletoIndicador(ID)  NOMBRE,(select c.DSNOMBRE from tri_rep_categorias c where i.IDCATEGORIA=c.ID) categoria,
(select r.DSNOMBRE from tri_rep_regiones r where i.IDREGION=r.ID) REGION,(select o.DSNOMBRE from tri_rep_opciones_lista o where o.ID=i.IDTIPO) TIPO,
DSFORMULA,DSFUENTE,DSDEFINICION,DSANALISIS,(select u.DSNOMBREs from tri_rep_usuarios u where u.ID=i.IDRESPONSABLE) RESPONSABLE,
DSOBSERVACIONES,(select o.DSNOMBRE from tri_rep_opciones_lista o where o.ID=i.IDOBJETIVO) OBJETIVO,
(select o.DSNOMBRE from tri_rep_opciones_lista o where o.ID=i.IDPERS) PERSPECTIVA,(select o.DSNOMBRE from tri_rep_opciones_lista o where o.ID=i.IDUNIMED) UNIDADMEDIDA,
(select o.DSNOMBRE from tri_rep_opciones_lista o where o.ID=i.IDESTADO) ESTADO
from tri_rep_indicadores i where ID=@indicador"
                                                runat="server">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Label1" PropertyName="Text" Type="Int32" Name="indicador">
                                                    </asp:ControlParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </telerik:RadPageView>
                      
                    </telerik:RadMultiPage>
                </asp:Panel>
            </NestedViewTemplate>

<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
            <Columns>
                <telerik:GridBoundColumn SortExpression="id" HeaderText="id"
                    DataField="id" UniqueName="id" DataType="System.Int32" 
                    FilterControlAltText="Filter id column" ReadOnly="True" Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn SortExpression="dsnombre" HeaderText="Nombre" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="dsnombre" UniqueName="dsnombre" 
                    FilterControlAltText="Filter dsnombre column" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn SortExpression="dscodigo" HeaderText="Código" FilterControlWidth="50px"  ShowFilterIcon="false" 
                    DataField="dscodigo" UniqueName="dscodigo" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    FilterControlAltText="Filter dscodigo column">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn SortExpression="objetivo" FilterControlWidth="95px"  ShowFilterIcon="false" 
                    HeaderText="Objetivo" DataField="objetivo" UniqueName="objetivo" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    FilterControlAltText="Filter objetivo column" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn SortExpression="DSCODIGOAUX" HeaderText="Código Aux"
                    DataField="DSCODIGOAUX" UniqueName="DSCODIGOAUX"  FilterControlWidth="50px" ShowFilterIcon="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    FilterControlAltText="Filter DSCODIGOAUX column">
                </telerik:GridBoundColumn>
           
                <telerik:GridBoundColumn DataField="UNIDADMEDIDA" 
                    FilterControlAltText="Filter UNIDADMEDIDA column" HeaderText="Unidad Medida"  AllowFiltering="false" ShowFilterIcon="false" 
                    ReadOnly="True" SortExpression="UNIDADMEDIDA" UniqueName="UNIDADMEDIDA">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DSREGION" 
                    FilterControlAltText="Filter DSREGION column" HeaderText="Región" FilterControlWidth="95px" ShowFilterIcon="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ReadOnly="True" SortExpression="DSREGION" UniqueName="DSREGION">
                </telerik:GridBoundColumn>
                           <telerik:GridBoundColumn DataField="PERSPECTIVA" 
                    FilterControlAltText="Filter DSREGION column" HeaderText="Perspectiva"  FilterControlWidth="95px" ShowFilterIcon="false"  AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ReadOnly="True" SortExpression="PERSPECTIVA" UniqueName="PERSPECTIVA">
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
        ConnectionString="<%$ ConnectionStrings:core_repositorioConnectionString %>" SelectCommand="select i.id, dbo.GetNombreCompletoIndicador(i.ID) dsnombre, i.dscodigo, (select dbo.FN_GETNOMBREOBJETIVO(i.idobjetivo)) objetivo,
	DSCODIGOAUX,DSAUX,(select DSNOMBRE from tri_rep_opciones_lista where ID=i.IDUNIMED ) UNIDADMEDIDA,
	(select DSNOMBRE from tri_rep_regiones where ID=i.IDREGION) DSREGION,(select op.DSNOMBRE from tri_rep_opciones_lista op where op.ID=i.IDPERS) PERSPECTIVA from dbo.tri_rep_indicadores i where
	 i.idregion in (SELECT ID FROM dbo.tri_rep_regiones where  (ID=(select IDREGION from tri_rep_usuarios where
	  id= @usuario) or IDPADRE=(select IDREGION from tri_rep_usuarios where id=@usuario)) and SNELIMINADO=0)  and  dbo.GetNombreCompletoIndicador(i.ID) is not null order by 2"
        runat="server">
        <SelectParameters>
            <asp:SessionParameter Name="usuario" SessionField="userid" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>