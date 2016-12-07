<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Items.aspx.cs" Inherits="Administracion_Items" %>

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
    
<link type="text/css" href="../estilos/buscador.css" rel="stylesheet" /></link>
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
    <title>
    
    </title>
    <style type="text/css">
        .style1
        {
            height: 33px;
        }
    </style>
    	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            onrowcommand="GridView1_RowCommand" class="zebra"   AllowPaging="True" PageSize="10"  
             PagerSettings-Position="TopAndBottom" 
            onrowdatabound="GridView1_RowDataBound" 
            onpageindexchanging="GridView1_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="DSNOMBRE" HeaderText="Nombre" />
                <asp:BoundField HeaderText="Valor" DataField="DSVALOR" />
                 <asp:TemplateField> 
                 <ItemTemplate>
                 <a href="javascript:fnEditar(<%# Eval("ID") %>,'<%# Eval("DSNOMBRE") %>','<%# Eval("DSVALOR") %>')">Editar</a>
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
    </div>
    <div>
    <center>    
    <table style="height: 113px">
    <tr>
       
    <td colspan="4">
   
        Nuevo</td>
    </tr>
    <tr>
    <td>
    Descripcion
    </td>
    <td colspan="3" style="text-align: left">
        <asp:TextBox ID="txxtdesc" runat="server" Width="516px"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
    Valor
    </td>
    <td>
        <asp:TextBox ID="txtvalor" runat="server" ontextchanged="TextBox2_TextChanged" 
            Width="441px"></asp:TextBox>
    </td>
    <td>
  
    </td>
    <td>
        &nbsp;</td>
    </tr>
    <tr>
    <td>
      Padre
       
    </td>
    <td>
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
    </td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
    </tr>
    <tr>
    <td colspan="4" class="style1">
        <asp:HiddenField ID="hdId" runat="server" />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Aceptar" />

            <input type="button" name="cancelar"  id="cancelar" value="Cancelar" style="display:none" onclick="fnCancelar()"/>
    
    </td>
    </tr>
    </table>
    </center>

    </div>
    <script type="text/javascript">
        function abrir(id) {
            $.nmManual('EditEscenario.aspx?idlista=' + id, {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });
        }
        function fnEditar(id, nom, val) {
            document.forms[0].hdId.value = id;
            document.forms[0].txxtdesc.value = nom;
            document.forms[0].txtvalor.value = val;
            document.forms[0].cancelar.style.display = "";

        }
        function fnCancelar() {
            document.forms[0].cancelar.style.display = "none";
            document.forms[0].hdId.value = "";
            document.forms[0].txxtdesc.value = "";
            document.forms[0].txtvalor.value = "";
        }
       </script>
    </form>
</body>
</html>
