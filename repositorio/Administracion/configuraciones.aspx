<%@ Page Language="C#" AutoEventWireup="true" CodeFile="configuraciones.aspx.cs" Inherits="configuraciones" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    <title></title>
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
 width: 500px !important;
 height: 300px !important;
}
</style>
    <script type="text/javascript">
        $(function () {
            $('.nyroModal').nyroModal();
        });
</script>
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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
             class="zebra"   
             PagerSettings-Position="TopAndBottom" >
            <Columns>
                <asp:BoundField DataField="DSDESCRIPCION" HeaderText="Nombre" />
                <asp:BoundField DataField="DSVALOR" HeaderText="Valor" />
                <asp:TemplateField HeaderText="Editar">
                    <ItemTemplate>
                    <a href="#" onclick="abrir(<%# Eval("ID") %> );">Editar </a>
                    </ItemTemplate>
                    </asp:TemplateField> 
            </Columns>

<PagerSettings Position="TopAndBottom"></PagerSettings>
        </asp:GridView>
        <script type="text/javascript">

            function abrir(id) {
                $.nmManual('EditConfiguracion.aspx?id=' + id , {
                    callbacks: {
                        initFilters: function (nm) {
                            nm.filters.push('link');
                            nm.filters.push('iframe');
                        }
                    }
                });
            }
        </script>
    </div>
    </form>
</body>
</html>
