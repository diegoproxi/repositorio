<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditEscenario.aspx.cs" Inherits="EditEscenario" %>

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
    	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="campos-buscador">
    <form id="form1" runat="server">
        <table>
        <tr>
        <td>
        
            Nombre</td>
        <td>
        
        
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        
        
        </td>
        </tr>
        <tr>
        <td>
        
            Tipo</td>
        <td>
        
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="C">Calculado</asp:ListItem>
                <asp:ListItem Value="P">Presupuestado</asp:ListItem>
                <asp:ListItem Value="E">Estimado</asp:ListItem>
                <asp:ListItem Value="O">Comentarios</asp:ListItem>
                <asp:ListItem Value="R">Real</asp:ListItem>
            </asp:DropDownList>
        
        </td>
        </tr>
        <tr>
        <td colspan="2">
        
            <asp:Button ID="Button1" runat="server" Text="Guardar" 
                onclick="Button1_Click" style="height: 26px" />
        
        </td>
        </tr>
        </table>
    </form>
    </div>
</body>
</html>
