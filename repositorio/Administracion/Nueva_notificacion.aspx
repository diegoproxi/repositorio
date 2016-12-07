<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Nueva_notificacion.aspx.cs" Inherits="Administracion_Nueva_notificacion" %>

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
        
            Tiempo</td>
        <td>
        
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
        
        </td>
        </tr>
        <tr>
            <td>
            
                Mensaje</td>
            <td>
            
                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" MaxLength="600" 
                    Height="77px" Width="470px"></asp:TextBox>
            
            </td>
        </tr>
        <tr>
        <td colspan="2">
            <asp:Button ID="Button1" runat="server" Text="Guardar" onclick="Button1_Click" 
                style="height: 26px" />
        </td>
        </tr>
    </table>
    </center>
    </div>
    </form>
</body>
</html>
