<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GruposUsuarios.aspx.cs" Inherits="Categorias_GruposUsuarios" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <link type="text/css" href="../jquery/css/south-street/jquery-ui-1.8.23.custom.css" rel="stylesheet" />
		<script type="text/javascript" src="../jquery/js/jquery-1.8.0.min.js"></script>
		<script type="text/javascript" src="../jquery/js/jquery-ui-1.8.23.custom.min.js"></script>
       

  
    

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
    <style type="text/css">
    .nyroModalCont
{
    top: 10px !important;
    left:10px !important;
}
.nyroModalCloseButton
{
     top: 25px !important;
}
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
 
    
    
    
        <asp:CheckBoxList ID="chkGrupos" runat="server" RepeatColumns="2" 
            RepeatDirection="Horizontal"   class="text_left zebra" border="0" >
        </asp:CheckBoxList>
<table  class="zebra" border="0">
  <tr>
    <td><asp:CheckBox ID="chkTodos" runat="server" Text="Todos?"  AutoPostBack="true" 
        oncheckedchanged="chkTodos_CheckedChanged"/></td>
  </tr>
</table>


    
<div class="center">
<asp:Button ID="btnGuardarCnfEsc" runat="server" Text="Guardar" 
            />
    </div>
    
   



    </form>
    <script>
        function fnAbrirCalculadora(id) {

            $.nmManual('../Calculadora.aspx?idcat=<%=Request["idcat"] %>&idind=<%=Request["idind"] %>&id=' + id, {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });

        }

        function cerrarVentana() {
            $.nmTop().close();
        }

       
    </script>
</body>
</html>
