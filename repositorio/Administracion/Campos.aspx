<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Campos.aspx.cs" Inherits="Administracion_Campos" %>

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
 
</head>
<body>
    <form id="form1" runat="server">
    <br />
    <br />

<br />    <div class="campos-buscador">
        <center>
<a   href="#" onclick="abrirnuevo()">Nuevo</a>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                style="margin-right: 1px" onrowdatabound="GridView1_RowDataBound" 
                onrowcommand="GridView1_RowCommand" onselectedindexchanged="Page_Load"  border="0" class="zebra">
                <Columns>
                    <asp:BoundField DataField="DSNOMBRE" HeaderText="Nombre" />
                    <asp:TemplateField>
                      <ItemTemplate>
                 <asp:LinkButton ID="ibtnDelete" runat="server" Text="Eliminar" CommandName="eliminar" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                 </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Items">
                    <ItemTemplate>
                    <a href="#" onclick="abrir(<%# Eval("ID") %>);">Listas</a>
                    </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </center>
        <script type="text/javascript">
            function abrirnuevo() {
                $.nmManual('Nuevo_Campo.aspx', {
                    callbacks: {
                        initFilters: function (nm) {
                            nm.filters.push('link');
                            nm.filters.push('iframe');
                        }
                    }
                });
            }
        
            function abrir(id) {
                $.nmManual('Items.aspx?idlista=' + id, {
                    callbacks: {
                        initFilters: function (nm) {
                            nm.filters.push('link');
                            nm.filters.push('iframe');
                        }
                    }
                });
            }
        </script>
    </div>
    </form>
    <p style="text-align: left">&nbsp;
        </p>
</body>
</html>
