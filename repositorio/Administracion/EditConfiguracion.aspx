<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditConfiguracion.aspx.cs" Inherits="Administracion_EditConfiguracion" %>

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
    
<link type="text/css" href="../estilos/buscador.css" rel="stylesheet" /></link>
      <link rel="stylesheet" href="../jquery.nyroModal/styles/nyroModal.css" type="text/css" media="screen" />

<script type="text/javascript" src="../jquery.nyroModal/js/jquery.nyroModal.custom.js"></script>
    <style type="text/css">
        .style1
        {
            height: 26px;
        }
    </style>
    <style type="text/css">

.nyroModalCont
{
    top: 10px !important;
}
.nyroModalCloseButton
{
     top: 25px !important;
}
.nyroModalCont iframe {
 width: 1000px !important;
 height: 500px !important;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <table>
    <tr>
    <td colspan="2"><%=Request["descripcion"] %>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
    <td>Valor</td>
    <td>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
    
    <td colspan="2">
    
    </td>
    </tr>
    <tr>
    <td colspan="2">
        <asp:Button ID="Button1" runat="server" Text="Guardar" 
            onclick="Button1_Click" />
    </td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
