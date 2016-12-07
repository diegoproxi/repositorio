<%@ Page Language="C#" AutoEventWireup="true" CodeFile="escenarios.aspx.cs" Inherits="Administracion_escenarios" %>

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

<style type="text/css">

.nyroModalCont
{
    top: 10px !important;
}
.nyroModalCloseButton
{
     top: 25px !important;
}
</style>

    <title></title>
       <link type="text/css" href="../estilos/buscador.css" rel="stylesheet" />
    	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />
</head>
<body>


    <form id="form1" runat="server">
    <div class="campos-buscador">
    <center>
      <div class="ui-widget" id="divMsg" runat="server">
			<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
				<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
				<div id="msgExito" runat="server"></div>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                </p>
			</div>
		</div>

        <div class="ui-widget" id="divError" runat="server">
			<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
				<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
				<div id="msgError" runat="server"></div>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                </p>
			</div>
		</div>
       <button id="dtnEscenarios" name="dtnEscenarios" onclick="fnAbrirEscenarios();return false;">Configuración</button>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            onrowcommand="GridView1_RowCommand" 
            onrowdatabound="GridView1_RowDataBound" border="0" class="zebra">
            <Columns>
             <asp:BoundField DataField="ID" HeaderText="ID" Visible="True" />
                <asp:BoundField DataField="DSNOMBRE" HeaderText="Nombre" />
                <asp:BoundField HeaderText="Tipo" DataField="DSTIPO" />

                 <asp:TemplateField HeaderText="">
                <ItemTemplate>
                <center>

                     <asp:LinkButton ID="ibtnArriba" runat="server" Text="Arriba"  CommandName="arriba" CssClass="easyui-linkbutton"></asp:LinkButton>
                       <asp:LinkButton ID="ibtnAbajo" runat="server" Text="Abajo"  CommandName="abajo" CssClass="easyui-linkbutton"></asp:LinkButton>
                      </center>
                  </ItemTemplate>

                  </asp:TemplateField>



                     <asp:TemplateField> 
                 <ItemTemplate>
                 <a  href="#" onclick="abrir(<%# Eval("ID")%>)">Editar </a>
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
        <center><a class="bt_buscar"  href="#" onclick="abrirnuevo()">Nuevo</a></center>
    </div>
    <script type="text/javascript">
        function abrir(id) {
            $.nmManual('EditEscenario.aspx?id='+id , {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });
        }
        function abrirnuevo() {
            $.nmManual('EditEscenario.aspx', {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });
        }

        function fnAbrirEscenarios() {

           
            $.nmManual('../Categorias/Escenarios.aspx' , {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });

            //   $('#escenariosw').window('open');
            //  $('#escenariosw').window('refresh', 'Escenarios.aspx?idcat=' + document.forms[0].hdIdCat.value);  
        }
        function cerrarEscenarios(msg) {

            document.getElementById("msgExito").innerHTML = msg;
            $.nmTop().close();

        }

        </script>
    </form>
</body>
</html>
