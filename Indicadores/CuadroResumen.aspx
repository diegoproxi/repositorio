<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CuadroResumen.aspx.cs" Inherits="Indicadores_CuadroResumen" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <title></title>
    <link href="../estilos/grid.css" rel="stylesheet" type="text/css" />
	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />

     <link type="text/css" href="../jquery/css/south-street/jquery-ui-1.8.23.custom.css" rel="stylesheet" />
		<script type="text/javascript" src="../jquery/js/jquery-1.8.0.min.js"></script>
		<script type="text/javascript" src="../jquery/js/jquery-ui-1.8.23.custom.min.js"></script>



     
      <link rel="stylesheet" href="../jquery.nyroModal/styles/nyroModal.css" type="text/css" media="screen" />
   
<script type="text/javascript" src="../jquery.nyroModal/js/jquery.nyroModal.custom.js"></script>
<!--[if IE 6]>
	<script type="text/javascript" src="../jquery.nyroModal/js/jquery.nyroModal-ie6.min.js"></script>
<![endif]-->
<script type="text/javascript">
    $(function () {
        $('.nyroModal').nyroModal();
    });
</script>
  <style type="text/css">
.nyroModalCont iframe {
	width: 1200px !important;
	height: 600px !important;
}

</style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
      
            function cellSelected(sender, args) {


                var customer = args.get_gridDataItem().getDataKeyValue("ID");
                setTimeout('fnAbrir('+customer+')', 1000);
               
             
              
            }

            function fnAbrir(id) {
                //   document.location.href = 'Actualizar.aspx?id=' + id;
             
                window.parent.abrirPopup(id);
//                $.nmManual('Actualizar.aspx?id=' + id, {
//                    
//                    callbacks: {
//                        initFilters: function (nm) {
//                            nm.filters.push('link');
//                            nm.filters.push('iframe');
//                        }
//                    }
//                });

            }


            </script>

</telerik:RadCodeBlock>
	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
    <div class="campos-buscador">
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
        runat="server" AutoGenerateColumns="False" AllowSorting="True" 
        Skin="Telerik" AllowFilteringByColumn="True"
        AllowPaging="True" PageSize="20" GridLines="None" ShowGroupPanel="True" OnItemCreated="RadGrid1_ItemCreated" 
        OnItemCommand="RadGrid1_ItemCommand" CellSpacing="0" 
        onload="RadGrid1_Load">
		 <GroupingSettings CaseSensitive="false" />
        <PagerStyle Mode="NumericPages"></PagerStyle>
        <MasterTableView DataSourceID="SqlDataSource1" ClientDataKeyNames="ID" AllowMultiColumnSorting="True"
            GroupLoadMode="Server">     

<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
            <Columns>
                <telerik:GridBoundColumn SortExpression="id" HeaderText="id"
                    DataField="id" UniqueName="id" DataType="System.Int32" 
                    FilterControlAltText="Filter id column" ReadOnly="True" Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn SortExpression="dsnombre" HeaderText="Indicador" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false"
                    DataField="dsnombre" UniqueName="dsnombre" 
                    FilterControlAltText="Filter dsnombre column" ReadOnly="True">
                </telerik:GridBoundColumn>
                  <telerik:GridBoundColumn DataField="DSREGION" 
                    FilterControlAltText="Filter DSREGION column" HeaderText="Región" FilterControlWidth="95px" ShowFilterIcon="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ReadOnly="True" SortExpression="DSREGION" UniqueName="DSREGION">
                </telerik:GridBoundColumn>
               <telerik:GridBoundColumn DataField="UNIDADMEDIDA" 
                    FilterControlAltText="Filter UNIDADMEDIDA column" HeaderText="Unidad Medida"  AllowFiltering="false" ShowFilterIcon="false" 
                    ReadOnly="True" SortExpression="UNIDADMEDIDA" UniqueName="UNIDADMEDIDA">
                </telerik:GridBoundColumn>
			    <telerik:GridBoundColumn DataField="reale" 
                    FilterControlAltText="Filter reale column" HeaderText="Valor Real Acumulado"  AllowFiltering="false" ShowFilterIcon="false" 
                    ReadOnly="True" SortExpression="reale" UniqueName="reale">
                </telerik:GridBoundColumn>
			   
			    <telerik:GridBoundColumn DataField="presu" 
                    FilterControlAltText="Filter presu column" HeaderText="Valor Presupuestado Acumulado"  AllowFiltering="false" ShowFilterIcon="false" 
                    ReadOnly="True" SortExpression="presu" UniqueName="reale">
                </telerik:GridBoundColumn>
			   
			    
			    <telerik:GridBoundColumn DataField="semaforo" 
                    FilterControlAltText="Filter semaforo column" HeaderText="Semaforo"  AllowFiltering="false" ShowFilterIcon="false" 
                    ReadOnly="True" SortExpression="semaforo" UniqueName="semaforo">
                </telerik:GridBoundColumn>
                
             

                

            </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
        </MasterTableView>
        <ClientSettings AllowDragToGroup="true">
      
        
            <ClientEvents OnCellSelected="cellSelected"></ClientEvents>
            <Selecting CellSelectionMode="MultiColumn"></Selecting>
        </ClientSettings>


<FilterMenu EnableImageSprites="False"></FilterMenu>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSource1" 
        
        
        ConnectionString="<%$ ConnectionStrings:core_repositorioConnectionString %>" SelectCommand="select i.id ID, dbo.GetNombreCompletoIndicador(i.ID) dsnombre, i.dscodigo, (select dbo.FN_GETNOMBREOBJETIVO(i.idobjetivo)) objetivo,
	DSCODIGOAUX,DSAUX,
	(select DSNOMBRE from tri_rep_opciones_lista where ID=i.IDUNIMED ) UNIDADMEDIDA,
	(select  top(1)  dbo.fn_formato_numero(ve.NMVALOR) from tri_rep_valoresxescenario ve where ve.IDINDICADOR=i.ID and 
	ve.IDESCENARIO=3 and NMMES=@MES and NMANIO=@ANIO)    reale,
	(select DSNOMBRE from tri_rep_opciones_lista where ID=i.IDUNIMED ) UNIDADMEDIDA,
	(select  top(1) dbo.fn_formato_numero(ve.NMVALOR)  from tri_rep_valoresxescenario ve where ve.IDINDICADOR=i.ID and 
	ve.IDESCENARIO=1 and   NMMES=@MES and NMANIO=@ANIO )    presu,
	dbo.FN_SEMAFORO(i.IDTIPO,(select  top(1)  ve.NMVALOR from tri_rep_valoresxescenario ve where ve.IDINDICADOR=i.ID and 
	ve.IDESCENARIO=3 and NMMES=@MES and NMANIO=@ANIO),(select  top(1)  ve.NMVALOR from tri_rep_valoresxescenario ve where ve.IDINDICADOR=i.ID and 
	ve.IDESCENARIO=1 and NMMES=@MES and NMANIO=@ANIO)) semaforo,
	
	(select DSNOMBRE from tri_rep_regiones where ID=i.IDREGION) DSREGION,(select op.DSNOMBRE from tri_rep_opciones_lista op where op.ID=i.IDPERS) PERSPECTIVA from dbo.tri_rep_indicadores i where
	 i.idregion in (SELECT ID FROM dbo.tri_rep_regiones where  (ID=(select IDREGION from tri_rep_usuarios where
	  id= @usuario) or IDPADRE=(select IDREGION from tri_rep_usuarios where id=@usuario)) and SNELIMINADO=0)  and  dbo.GetNombreCompletoIndicador(i.ID) is not null order by 2"
        runat="server">
        <SelectParameters>
            <asp:SessionParameter Name="MES" SessionField="mes" />
            <asp:SessionParameter Name="ANIO" SessionField="anio" />
            <asp:SessionParameter Name="usuario" SessionField="userid" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>