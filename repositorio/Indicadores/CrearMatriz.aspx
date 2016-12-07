<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CrearMatriz.aspx.cs" Inherits="Indicadores_CrearMatriz" %>

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

	<link href="../Styles/cssUpdateProgress.css" rel="stylesheet" type="text/css" />
	
    <style>
    .agregarm {
background: url(https://www.conectandonosconlaestrategia.com/images/mas.png) left top no-repeat;
width: 22px;
height: 21px;
float: left;
display:none;

}
.fields {
font-weight: bold;
font-size: 16px;
font-style: italic;
color: #919191;
float: left;
margin-right: 20px;
}
    </style>

    <link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div class="fila1">
            <div class="fields">
                Planta
                <asp:DropDownList ID="ddlPlanta" runat="server" 
                   >
                </asp:DropDownList>
            </div>
            <div class="fields">
                Operación
                <asp:DropDownList ID="ddlOperacion" runat="server" AutoPostBack="True" onselectedindexchanged="ddlOperacion_SelectedIndexChanged" 
                   >
                </asp:DropDownList>
              
            </div>
            <div class="fields">
                Línea
                <asp:DropDownList ID="ddlLinea" runat="server" 
                 >
                </asp:DropDownList>
              
            </div>
             </div>
            <div class="fields">
                Perdida
                <asp:DropDownList ID="ddlPerdida" runat="server"
                 >
                </asp:DropDownList>
              
            </div>
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Crear" />
        </div>
    
    </div>
    </form>
</body>
</html>
