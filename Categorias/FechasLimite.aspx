<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FechasLimite.aspx.cs" Inherits="FechasLimite" %>

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
       <link rel="stylesheet" type="text/css" href="../jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui/themes/icon.css">

   <script type="text/javascript" language="javascript">
       cargarEasyui();
    
	</script>

    

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


	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />


</head>
<body>
    <div class="campos-buscador">
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

    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="gvFechasL" runat="server" AutoGenerateColumns="False" 
             onrowdatabound="gvFechasL_RowDataBound" OnRowCommand="gvFechasL_RowCommand" class="text_left zebra" border="0">
            <Columns>
                <asp:BoundField DataField="DSNOMBRE" HeaderText="Escenario" />
                <asp:BoundField DataField="PERIODO" HeaderText="Periodo" />
                <asp:BoundField DataField="DESDE" HeaderText="Desde" />
                <asp:BoundField DataField="HASTA" HeaderText="Hasta" />
                <asp:BoundField DataField="PERSONALIZADO" HeaderText="Personalizado" />
                <asp:BoundField DataField="ID" HeaderText="ID" Visible="False" />
                
               <asp:TemplateField HeaderText="Eliminar">
                <ItemTemplate>
                 <center>
                <asp:LinkButton ID="eliminar" Text="Eliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("ID") %>'><img src="../images/uncheck.png" border="0" /></asp:LinkButton>
                </center>
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
<div class="center">
     <button id="btnAgregar" name="btnAgregar" onclick="fnAbrirFechasLimite(); return false;">Agregar</button>
    </div>

    

   


    </form>
    <script>
        function fnNuevo() {

            $('#windowform').window('open');

        }
        function fnCambioPer() {
            if (document.forms[0].chkPersonalizado.checked) {
                document.getElementById("divPer").style.display = "none";
                document.getElementById("divFechas").style.display = "";
                document.forms[0].txtDias.disabled = true;
                document.forms[0].rblPers.disabled = true;

                document.forms[0].txtDesde.disabled = false;
                document.forms[0].txtHasta.disabled = false;

            } else {

                document.getElementById("divPer").style.display = "";
                document.getElementById("divFechas").style.display = "none";

                document.forms[0].txtDias.disabled = false;
                document.forms[0].rblPers.disabled = false;

                document.forms[0].txtDesde.disabled = true;
                document.forms[0].txtHasta.disabled = true;
            }




        }
      
       
       
         
            function fnAbrirFechasLimite() {

                $.nmManual('AgregarFechaLimite.aspx?idcat=<%=Request["idcat"] %>&idind=<%=Request["idind"] %>', {
                    callbacks: {
                        initFilters: function (nm) {
                            nm.filters.push('link');
                            nm.filters.push('iframe');
                        }
                    }
                });

            }
            function fnAbrirFechasLimite2(id) {

                $.nmManual('AgregarFechaLimite.aspx?idind=<%=Request["idind"] %>&idcat=<%=Request["idcat"] %>&id=' + id, {
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
</body>
</html>
