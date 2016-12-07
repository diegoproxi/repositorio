<%@ Page Language="C#" AutoEventWireup="true" CodeFile="comodines.aspx.cs" Inherits="Administracion_comodines" %>

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
    <style type="text/css">
        .style1
        {
            height: 26px;
        }
        .style2
        {
            width: 128px;
        }
        .style3
        {
            width: 127px;
        }
        .style4
        {
            height: 27px;
        }
        .style5
        {
            width: 128px;
            height: 27px;
        }
    </style>
    	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />

</head>
<body style="text-align:center;">
     <div class="campos-buscador">
   <form id="form1" runat="server">
  
    <table class="zebra tabalaauto">
    <tr>
    <td colspan="2">
    Cajones de texto
    </td>
    </tr>
    <tr>
    <td>
        <asp:CheckBox ID="CheckBox1" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox1.disabled=false}else{document.forms[0].TextBox1.disabled=true}" />
    </td>
    <td>
    
        <asp:TextBox ID="TextBox1" runat="server" Enabled="False" ></asp:TextBox>
    
    </td>
    </tr>
    <tr>
    <td>
        <asp:CheckBox ID="CheckBox2" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox2.disabled=false}else{document.forms[0].TextBox2.disabled=true}" />
    </td>
    <td>
    
        <asp:TextBox ID="TextBox2" runat="server" Enabled="False" ></asp:TextBox>
    
    </td>
    </tr><tr>
    <td>
        <asp:CheckBox ID="CheckBox3" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox3.disabled=false}else{document.forms[0].TextBox3.disabled=true}" />
    </td>
    <td>
    
        <asp:TextBox ID="TextBox3" runat="server" Enabled="False"></asp:TextBox>
    
    </td>
    </tr><tr>
    <td>
        <asp:CheckBox ID="CheckBox4" runat="server"  onclick="if(this.checked == true){document.forms[0].TextBox4.disabled=false}else{document.forms[0].TextBox4.disabled=true}"/>
    </td>
    <td>
    
        <asp:TextBox ID="TextBox4" runat="server" Enabled="False"></asp:TextBox>
    
    </td>
    </tr>
    <tr>
    <td colspan="2">
        <center></center>
        </td>
    </tr>
    </table>
    <table class="zebra tabalaauto">
    <tr>
    <td colspan="2">
    Areas de texto
    </td>
    </tr>
    <tr>
    <td>
        <asp:CheckBox ID="CheckBox5" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox5.disabled=false}else{document.forms[0].TextBox5.disabled=true}" />
    </td>
    <td>
    
        <asp:TextBox ID="TextBox5" runat="server" Enabled="False"></asp:TextBox>
    
    </td>
    </tr>
    <tr>
    <td>
        <asp:CheckBox ID="CheckBox6" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox6.disabled=false}else{document.forms[0].TextBox6.disabled=true}"/>
    </td>
    <td>
    
        <asp:TextBox ID="TextBox6" runat="server" Enabled="False"></asp:TextBox>
    
    </td>
    </tr><tr>
    <td>
        <asp:CheckBox ID="CheckBox7" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox7.disabled=false}else{document.forms[0].TextBox7.disabled=true}" />
    </td>
    <td>
    
        <asp:TextBox ID="TextBox7" runat="server" Enabled="False"></asp:TextBox>
    
    </td>
    </tr><tr>
    <td>
        <asp:CheckBox ID="CheckBox8" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox8.disabled=false}else{document.forms[0].TextBox8.disabled=true}"/>
    </td>
    <td>
    
        <asp:TextBox ID="TextBox8" runat="server" Enabled="False"></asp:TextBox>
    
    </td>
    </tr>
    <tr>
    <td colspan="2">
    
       <center> </center>
    
    </td>
    </tr>
    </table>
        

    <table class="zebra tabalaauto">
    <tr>
    <td colspan="2">
    Calendario
    </td>
    </tr>
    <tr>
    <td>
        <asp:CheckBox ID="CheckBox9" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox9.disabled=false}else{document.forms[0].TextBox9.disabled=true}"/>
    </td>
    <td>
    
        <asp:TextBox ID="TextBox9" runat="server" Enabled="False"></asp:TextBox>
    
    </td>
    </tr>
    <tr>
    <td>
        <asp:CheckBox ID="CheckBox10" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox10.disabled=false}else{document.forms[0].TextBox10.disabled=true}"/>
    </td>
    <td>
    
        <asp:TextBox ID="TextBox10" runat="server" Enabled="False"></asp:TextBox>
    
        </td>
    </tr><tr>
    <td>
        <asp:CheckBox ID="CheckBox11" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox11.disabled=false}else{document.forms[0].TextBox11.disabled=true}"/>
    </td>
    <td>
    
        <asp:TextBox ID="TextBox11" runat="server" Height="22px" Enabled="False"></asp:TextBox>
    
    </td>
    </tr><tr>
    <td class="style1">
        <asp:CheckBox ID="CheckBox12" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox12.disabled=false}else{document.forms[0].TextBox12.disabled=true}"/>
    </td>
    <td class="style1">
    
        <asp:TextBox ID="TextBox12" runat="server" Enabled="False"></asp:TextBox>
    
    </td>
    </tr>
    <tr>
    <td colspan="2">
    
        <center></center>
    
    </td>
    </tr>
    </table>
    <table class="zebra tabalaauto">
    <tr>
    <td colspan="2">
    Numerico
    </td>
    </tr>
    <tr>
    <td>
        <asp:CheckBox ID="CheckBox13" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox13.disabled=false}else{document.forms[0].TextBox13.disabled=true}"/>
    </td>
    <td>
    
        <asp:TextBox ID="TextBox13" runat="server" Enabled="False"></asp:TextBox>
    
    </td>
    </tr>
    <tr>
    <td>
        <asp:CheckBox ID="CheckBox14" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox14.disabled=false}else{document.forms[0].TextBox14.disabled=true}"/>
    </td>
    <td>
    
        <asp:TextBox ID="TextBox14" runat="server" Enabled="False"></asp:TextBox>
    
        </td>
    </tr><tr>
    <td>
        <asp:CheckBox ID="CheckBox15" runat="server"  onclick="if(this.checked == true){document.forms[0].TextBox15.disabled=false}else{document.forms[0].TextBox15.disabled=true}"/>
    </td>
    <td>
    
        <asp:TextBox ID="TextBox15" runat="server" Enabled="False"></asp:TextBox>
    
    </td>
    </tr><tr>
    <td>
        <asp:CheckBox ID="CheckBox16" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox16.disabled=false}else{document.forms[0].TextBox16.disabled=true}"/>
    </td>
    <td>
    
        <asp:TextBox ID="TextBox16" runat="server" Enabled="False"></asp:TextBox>
    
    </td>
    </tr>
      <tr>
    <td colspan="2">
        <center></center>
        </td>
    </tr>
    </table>

    <table class="zebra tabalaauto">
    <tr>
    <td colspan="4">
        Lista desplegable</td>
    </tr>
    <tr>
    <td>
        <asp:CheckBox ID="CheckBox17" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox17.disabled=false}else{document.forms[0].TextBox17.disabled=true}" />
    </td>
    <td class="style2">
    
        <asp:TextBox ID="TextBox17" runat="server" Enabled="False"></asp:TextBox>
    
    </td>
   <td>
       <asp:DropDownList ID="DropDownList1" runat="server">
       </asp:DropDownList>
   </td>
   <td>
   <a href="#" onclick="abrir();">Items</a>
   </td>
    </tr>
    <tr>
    <td>
        <asp:CheckBox ID="CheckBox18" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox18.disabled=false}else{document.forms[0].TextBox18.disabled=true}" />
    </td>
    <td class="style2">
    
        <asp:TextBox ID="TextBox18" runat="server" Enabled="False"></asp:TextBox>
        </td>
         <td>
       <asp:DropDownList ID="DropDownList2" runat="server">
       </asp:DropDownList>
   </td>
      <td>
       <a href="#" onclick="abrir2();">Items</a>
   </td>
    </tr><tr>
    <td>
        <asp:CheckBox ID="CheckBox19" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox19.disabled=false}else{document.forms[0].TextBox19.disabled=true}"/>
    </td>
    <td class="style2">
    
        <asp:TextBox ID="TextBox19" runat="server" Enabled="False"></asp:TextBox>
    
    </td>
     <td>
       <asp:DropDownList ID="DropDownList3" runat="server">
       </asp:DropDownList>
   </td>
      <td>
      <a href="#" onclick="abrir3();">Items</a>
   </td>
    </tr><tr>
    <td class="style4">
        <asp:CheckBox ID="CheckBox20" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox20.disabled=false}else{document.forms[0].TextBox20.disabled=true}"/>
    </td>
    <td class="style5">
    
        <asp:TextBox ID="TextBox20" runat="server" Enabled="False" ></asp:TextBox>
    
    </td>
     <td class="style4">
       <asp:DropDownList ID="DropDownList4" runat="server">
       </asp:DropDownList>
   </td>
      <td class="style4">
      <a href="#" onclick="abrir4();">Items</a>
   </td>
    </tr>
      <tr>
    <td colspan="4">
        <center><asp:Button ID="Button5" runat="server" Text="Guardar" 
                onclick="Button5_Click" /></center>
        </td>
    </tr>
    </table>
    
    <table class="zebra tabalaauto">
    <tr>
    <td colspan="2">
    Booleano
    </td>
    </tr>
    <tr>
    <td>
        <asp:CheckBox ID="CheckBox21" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox21.disabled=false}else{document.forms[0].TextBox21.disabled=true}"/>
    </td>
    <td class="style3">
    
        <asp:TextBox ID="TextBox21" runat="server" Enabled="False"></asp:TextBox>
    
    </td>
    </tr>
    <tr>
    <td>
        <asp:CheckBox ID="CheckBox22" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox22.disabled=false}else{document.forms[0].TextBox22.disabled=true}"/>
    </td>
    <td class="style3">
    
        <asp:TextBox ID="TextBox22" runat="server" Enabled="False"></asp:TextBox>
        </td>
    </tr><tr>
    <td>
        <asp:CheckBox ID="CheckBox23" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox23.disabled=false}else{document.forms[0].TextBox23.disabled=true}"/>
    </td>
    <td class="style3">
    
        <asp:TextBox ID="TextBox23" runat="server" Enabled="False"></asp:TextBox>
    
    </td>
    </tr><tr>
    <td>
        <asp:CheckBox ID="CheckBox24" runat="server" onclick="if(this.checked == true){document.forms[0].TextBox24.disabled=false}else{document.forms[0].TextBox24.disabled=true}"/>
    </td>
    <td class="style3">
    
        <asp:TextBox ID="TextBox24" runat="server" Enabled="False"></asp:TextBox>
    
    </td>
    </tr>
      <tr>
    <td colspan="2">
        <center></center>
        </td>
    </tr>
    </table>
    <script type="text/javascript">
        function abrir() {
            $.nmManual('Items.aspx?idlista=' + document.forms[0].DropDownList1.value+'&lista=NMLISTA1', {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });
        }
        function abrir2() {
            $.nmManual('Items.aspx?idlista=' + document.forms[0].DropDownList2.value + '&lista=NMLISTA2', {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });
        }
        function abrir3() {
            $.nmManual('Items.aspx?idlista=' + document.forms[0].DropDownList3.value + '&lista=NMLISTA3', {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });
        }
        function abrir4() {
            $.nmManual('Items.aspx?idlista=' + document.forms[0].DropDownList4.value + '&lista=NMLISTA4', {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });
        }
    </script>
    </form>
    </div>
</body>
</html>
