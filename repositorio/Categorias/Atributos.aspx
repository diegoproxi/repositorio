<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Atributos.aspx.cs" Inherits="Categorias_Atributos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
  <asp:CheckBoxList ID="chklAtributos" runat="server" RepeatColumns="2" 
            RepeatDirection="Horizontal" class="text_left zebra" border="0">
        </asp:CheckBoxList>
<table width="100%" class="zebra" border="0">
  <tr>
    <td>    <asp:CheckBox ID="chkTodos" runat="server" Text="Todos?"  AutoPostBack="true" 
        oncheckedchanged="chkTodos_CheckedChanged"/>
  </tr>
</table>


    
<div class="center">

        <asp:Button ID="btnGuardarCnfEsc" runat="server" Text="Gurdar" 
            onclick="btnGuardarCnfEsc_Click" />
    </div>
    </form>
</body>
</html>
