<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cargues.aspx.cs" Inherits="Indicadores_Cargues" %>

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
        <style type="text/css">
.nyroModalCont iframe {
	width: 900px !important;
	height: 800px !important;
}
</style>

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
       <link type="text/css" href="../estilos/buscador.css" rel="stylesheet" />
	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
   
    
    <br />
    <br />
   
     
        <h2>Cargues</h2>
        <center>

        <a  href="CargaMasiva.aspx" name="nuevo">Nuevo</a>
        <asp:GridView ID="gvCargues" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ID" DataSourceID="SqlDataSourceCargues" 
                onrowcommand="gvCargues_RowCommand" onrowdatabound="gvCargues_RowDataBound"  border="0" class="zebra">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" Visible="False" />
                <asp:BoundField DataField="FEFECHA" HeaderText="FECHA" 
                    SortExpression="FEFECHA" />
                <asp:BoundField DataField="ESCENARIO" HeaderText="ESCENARIO" />
                <asp:BoundField DataField="SNMASIVA" HeaderText="MASIVA" />
                <asp:BoundField DataField="DSOBSERVACIONES" HeaderText="OBSERVACIONES" 
                    SortExpression="DSOBSERVACIONES" />
                <asp:BoundField DataField="DSARCHIVO" HeaderText="DSARCHIVO" 
                    SortExpression="DSARCHIVO" Visible="False" />

                     <asp:TemplateField HeaderText="ARCHIVO">
                <ItemTemplate>
                <center>
              <a href="../cargues/<%# Eval("DSARCHIVO") %>"> Descargar</a>
             </center>
                </ItemTemplate>
                </asp:TemplateField>


                    <asp:TemplateField HeaderText="RESUMEN">
                <ItemTemplate>
                <center>
              <a href="../Indicadores/ResultadoCargue.aspx?id=<%# Eval("ID") %>"> Ver</a>
             </center>
                </ItemTemplate>
                </asp:TemplateField>

               <asp:TemplateField> 
                 <ItemTemplate>
                 <asp:LinkButton ID="ibtnDelete" runat="server" Text="Eliminar" CommandName="eliminar" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                 </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </center>
        <asp:SqlDataSource ID="SqlDataSourceCargues" runat="server" 
            ConnectionString="<%$ ConnectionStrings:core_repositorioConnectionString %>" 
            
            SelectCommand="SELECT [ID], [FEFECHA], [DSOBSERVACIONES], [DSARCHIVO],(select DSNOMBRE from tri_rep_escenarios where ID=IDESCENARIO) ESCENARIO,(case when SNMASIVA=1 then 'Si' else 'No' end) SNMASIVA FROM [tri_rep_actualizaciones] WHERE ([IDUSUARIO] = @IDUSUARIO)" 
            onselecting="SqlDataSourceCargues_Selecting">
            <SelectParameters>
                <asp:Parameter Name="IDUSUARIO" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    

    <script>
       function fnAbrir(id) {

            $.nmManual('../Indicadores/ResultadoCargue.aspx?id='+id, {
                sizes: {
                    minW: 900,
                    minH: 800
                }, resizable: false,
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
