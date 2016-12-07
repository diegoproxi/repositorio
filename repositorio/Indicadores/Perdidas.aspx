<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Perdidas.aspx.cs" Inherits="Indicadores_Perdidas" %>

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
   
     
        <h2>Perdidas</h2>
        <center>
           <a  href="CrearPerdida.aspx" name="nuevo">Nuevo</a>
     
     <div class="campos-buscador">
         
          <div class="labels">Nombre</div>
          <asp:TextBox ID="txtnombre" runat="server" CssClass="cuadro-txt"></asp:TextBox>
          <div class="clear"></div>
        </div>
         <asp:Button ID="Button1" runat="server" Text="Buscar"
             style="width: 61px" />


      <div class="clear"></div>

        <asp:GridView ID="gvCargues" runat="server" AutoGenerateColumns="False" PageSize="10"   AllowPaging="True"  
         DataSourceID="SqlDataSourceCargues" 
                onrowcommand="gvCargues_RowCommand" 
                onrowdatabound="gvCargues_RowDataBound"  border="0" class="zebra" 
                onpageindexchanging="gvCargues_PageIndexChanging">
            <Columns>
                  <asp:BoundField DataField="ID" Visible="false"
                    />
                <asp:BoundField DataField="diccionario" HeaderText="Diccionario" 
                    />

                       <asp:BoundField DataField="N1" HeaderText="Grupo" 
                    />
                      <asp:BoundField DataField="N2" HeaderText="Clasificación"
                    />
                      <asp:BoundField DataField="N3" HeaderText="Clasificación"   Visible=false
                    />
                      <asp:BoundField DataField="CLASE" HeaderText="CLASE" 
                    />
                       <asp:BoundField DataField="OPE" HeaderText="OPERACIÓN" 
                    />
                            <asp:TemplateField> 
                       <ItemTemplate>
                <center>
              <a href='CrearPerdida.aspx?id=<%# Eval("ID") %>' name="id<%# Eval("ID") %>"  >Editar</a>
             </center>
                  </ItemTemplate>

                  </asp:TemplateField>


               
               <asp:TemplateField> 
                 <ItemTemplate>
                 <asp:LinkButton ID="ibtnDelete" runat="server" Text="Eliminar" CommandName="eliminar" CommandArgument='<%# Eval("ID")%>'></asp:LinkButton>
                 </ItemTemplate>
                </asp:TemplateField>


            </Columns>
        </asp:GridView>
    </center>
        <asp:SqlDataSource ID="SqlDataSourceCargues" runat="server" 
            ConnectionString="<%$ ConnectionStrings:core_repositorioConnectionString %>" 
            
            SelectCommand="SELECT ID, (SELECT DSNOMBRE FROM tri_rep_diccionarioindicadores AS d WHERE (ID = tri_rep_perdidas.IDDICCIONARIO)) AS diccionario, core_repositorio.dbo.[FN_NOMBREOPCION] (IDALCANCE) AS alcance, dbo.[FN_NOMBREOPCION] (IDORIGEN) AS origen, dbo.FN_GETNOMBREOBJETIVO(IDOBJETIVO) AS objetivo, dbo.[FN_NOMBREOPCION] (NMLISTA1) AS N1, dbo.[FN_NOMBREOPCION] (NMLISTA2) AS N2, dbo.[FN_NOMBREOPCION] (NMLISTA3) AS N3, dbo.[FN_NOMBREOPCION] (NMLISTA4) AS CLASE, dbo.[FN_NOMBREOPCION] (IDOPE) AS OPE FROM tri_rep_perdidas WHERE (SNELIMINADO = 0) AND ((SELECT UPPER(DSNOMBRE) AS Expr1 FROM tri_rep_diccionarioindicadores AS d WHERE (ID = tri_rep_perdidas.IDDICCIONARIO)) LIKE concat( '%' , UPPER(@param1) , '%')) ORDER BY diccionario" 
            onselecting="SqlDataSourceCargues_Selecting">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtnombre" Name="param1" PropertyName="Text" DefaultValue=" " />
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
