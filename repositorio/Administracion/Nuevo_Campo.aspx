﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Nuevo_Campo.aspx.cs" Inherits="Administracion_Nuevo_Campo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
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
        
            Descripcion</td>
        <td>
        
        
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        
        
        </td>
        </tr>
        <tr>
        <td>
        
            Dependiente</td>
        <td>
        
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
        
        </td>
        </tr>
        <tr>
        <td colspan="2">
            <asp:Button ID="Button1" runat="server" Text="Guardar" 
                onclick="Button1_Click" style="width: 68px" />
        </td>
        </tr>
        </table>
        </center>
    </div>
    </form>
</body>
</html>
