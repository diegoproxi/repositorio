<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditDiccionario.aspx.cs" Inherits="Administracion_EditDiccionario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <center>
        <table>
        <tr>
        <td class="style1">
        
            Nombre</td>
        <td class="style1">
        
        
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        
        
        </td>
        </tr>
        <tr>
        <td>
        
            Descripcion</td>
        <td>
        
            <asp:TextBox ID="TextBox2" runat="server" EnableTheming="True" MaxLength="300" 
                TextMode="MultiLine"></asp:TextBox>
        
        </td>
        </tr>
        <tr>
        <td colspan="2">
        
            <asp:Button ID="Button1" runat="server" Text="Guardar" 
                onclick="Button1_Click" style="height: 26px" />
        
        </td>
        </tr>
        </table>
        </center>
    </div>
    </form>
</body>
</html>
