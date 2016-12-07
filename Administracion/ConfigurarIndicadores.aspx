<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfigurarIndicadores.aspx.cs" Inherits="Administracion_ConfigurarIndicadores" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            height: 26px;
        }
        .style2
        {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" 
                Name="Telerik.Web.UI.Common.Core.js">
            </asp:ScriptReference>
            <asp:ScriptReference Assembly="Telerik.Web.UI" 
                Name="Telerik.Web.UI.Common.jQuery.js">
            </asp:ScriptReference>
            <asp:ScriptReference Assembly="Telerik.Web.UI" 
                Name="Telerik.Web.UI.Common.jQueryInclude.js">
            </asp:ScriptReference>
        </Scripts>
    </telerik:RadScriptManager>
    <div>
    <center>
    <table>
    <tr>
    <td class="style1">Region<asp:HiddenField ID="HiddenField1" runat="server" />
        </td>
    <td class="style1">
        <asp:DropDownList ID="DropDownList1" runat="server" onChange="if(this.value != -1){document.getElementById('indicadores').style.display='';document.forms[0].HiddenField1.value='1'}else{document.getElementById('indicadores').style.display='none';document.forms[0].HiddenField1.value=''}" 
            AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged1">
        </asp:DropDownList> </td>
    </tr>
    </table>
    <table id="indicadores" runat="server"> 
    <tr>
    <td>Indicador 1</td>
    <td>
        <telerik:RadComboBox ID="TextBox1" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                       <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
        </td>
    <td>Indicador 11</td>
    <td>
       
         <telerik:RadComboBox ID="TextBox11" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
        </td>
    </tr>
    <tr>
    <td class="style1">Indicador 2</td>
    <td class="style1">
     
           <telerik:RadComboBox ID="TextBox2" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>

        </td>
    <td class="style1">Indicador 12</td>
    <td class="style1">
      
          <telerik:RadComboBox ID="TextBox12" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
        </td>
    </tr>
    <tr>
    <td>Indicador 3</td>
    <td>
        
         <telerik:RadComboBox ID="TextBox3" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
        </td>
    <td>Indicador 13</td>
    <td>
       
        <telerik:RadComboBox ID="TextBox13" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>

        </td>
    </tr>
    <tr>
    <td>Indicador 4</td>
    <td>
        
          <telerik:RadComboBox ID="TextBox4" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
        </td>
    <td>Indicador 14</td>
    <td>
     
         <telerik:RadComboBox ID="TextBox14" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
        </td>
    </tr>
    <tr>
    <td>Indicador 5</td>
    <td>
     
          <telerik:RadComboBox ID="TextBox5" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
        </td>
    <td>Indicador 15</td>
    <td>
        
          <telerik:RadComboBox ID="TextBox15" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
        </td>
    </tr>
     <tr>
     <td>Indicador 6</td>
     <td>
     
        <telerik:RadComboBox ID="TextBox6" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
         </td>
     <td>Indicador 16</td>
     <td>
         
          <telerik:RadComboBox ID="TextBox16" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
         </td>
     </tr>

     <tr>
     <td>Indicador 7</td>
     <td>
     

         <telerik:RadComboBox ID="TextBox7" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>

         </td>
     <td>Indicador 17</td>
     <td>
        
         <telerik:RadComboBox ID="TextBox17" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
         </td>
     </tr>
     <tr>
     <td>Indicador 8</td>
     <td>
        
        <telerik:RadComboBox ID="TextBox8" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
         </td>
     <td>Indicador 18</td>
     <td>
    
          <telerik:RadComboBox ID="TextBox18" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
         </td>
     </tr>
     <tr>
     <td>Indicador 9</td>
     <td>
  
           <telerik:RadComboBox ID="TextBox9" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>

         </td>
     <td>Indicador 19</td>
     <td>
         

          <telerik:RadComboBox ID="TextBox19" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
         </td>


     </tr>
     <tr>
     <td class="style2">Indicador 10</td>
     <td class="style2">
       
        <telerik:RadComboBox ID="TextBox10" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                        <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
         </td>
     <td class="style2">Indicador 20</td>
     <td>
     <telerik:RadComboBox ID="TextBox20" runat="server" Height="200" Width="320"
                        DropDownWidth="310" EmptyMessage="Seleccione un Indicador" HighlightTemplatedItems="true"
                        EnableLoadOnDemand="true" Filter="Contains" OnItemsRequested="RadComboBoxProduct_ItemsRequested"
                        >
                        <HeaderTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                        Código
                                    </td>
                                    <td style="width: 175px;">
                                        Nombre
                                    </td>
                                    <td style="width: 40px;">
                                        Región
                                    </td>
                                     <td style="width: 40px;">
                                        Unid Med
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 315px" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="width: 60px;">
                                       <%# DataBinder.Eval(Container, "Value")%>
                                    </td>
                                    <td style="width: 175px;">
                                       <%# DataBinder.Eval(Container, "Attributes['NOMBRE']")%>
                                    </td>
                                    <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['REGION']")%>
                                    </td>
                                     <td style="width: 40px;">
                                        <%# DataBinder.Eval(Container, "Attributes['UNIDAD']")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
     </td>
     </tr>
    <tr>
        <td colspan="4"> 
            <asp:Button ID="Button1" runat="server" Text="Guardar" 
                onclick="Button1_Click" /></td>
    </tr>
   
    </table>
    </center>
    </div>
    </form>

</body>
</html>
