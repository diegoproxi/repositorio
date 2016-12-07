<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AgregarFechaLimite.aspx.cs" Inherits="Categorias_AgregarFechaLimite" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
   <link type="text/css" href="../jquery/css/south-street/jquery-ui-1.8.23.custom.css" rel="stylesheet" />
		<script type="text/javascript" src="../jquery/js/jquery-1.8.0.min.js"></script>
		<script type="text/javascript" src="../jquery/js/jquery-ui-1.8.23.custom.min.js"></script>
        <script src="../validator/js/languages/jquery.validationEngine-es.js" type="text/javascript" charset="utf-8"></script>
<script src="../validator/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="../validator/css/validationEngine.jquery.css" type="text/css" />

<script src="../calendar/js/jscal2.js"></script> 
<script src="../calendar/js/es.js"></script>
<link rel="stylesheet" type="text/css" href="../calendar/css/jscal2.css" />

       <script type="text/javascript" src="../jquery-easyui/jquery.easyui.min.js"></script>
       <link rel="stylesheet" type="text/css" href="../jquery-easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../jquery-easyui/themes/icon.css">

   <script type="text/javascript" language="javascript">
       cargarEasyui();
    
	</script>

    




</head>
<body>

  <div class="ui-widget" id="divMsg" runat="server">
			<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
				<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
				<div id="msgExito" runat="server"></div>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                </p>
			</div>
		</div>

        <div class="ui-widget" id="divError" runat="server">
			<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
				<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
				<div id="msgError" runat="server"></div>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                </p>
			</div>
		</div>


    <form id="form1" runat="server">
   
  
    <div class="campo"><label for="ddlEscenario">Escenario</label><asp:DropDownList ID="ddlEscenario" runat="server" CssClass="validate[required]">
        </asp:DropDownList>  </div>

          <div class="campo"><label for="ddlPeriodo">Periodo</label><asp:DropDownList ID="ddlPeriodo" runat="server" CssClass="validate[required]">
        </asp:DropDownList>  </div>
        <div class="campo"><label for="chkPersonalizado">Personalizado</label>
        
            <asp:CheckBox ID="chkPersonalizado" runat="server" onclick="fnCambioPer()"  /> 

            </div>

           <div class="campo" id="divPer">
           <label for="txtDias">Días</label>
            <asp:TextBox ID="txtDias" runat="server" Width="53px" CssClass="easyui-numberbox validate[required]"></asp:TextBox>

               <asp:RadioButton ID="rbAntes" runat="server" Text="Antes" GroupName="rblPers" Checked/>

                <asp:RadioButton ID="rbDespues" runat="server" Text="Después" 
                   GroupName="rblPers" />


          </div>
              <div class="campo" style="display:none" id="divFechas"><label for="txtDesde">Desde</label><asp:TextBox ID="txtDesde" runat="server" CssClass="validate[required]"></asp:TextBox> <button id="f_btn1">...</button><label for="txtHasta"> Hasta</label><asp:TextBox ID="txtHasta" runat="server" CssClass="validate[required]"></asp:TextBox><button id="f_btn2">...</button>
                
              
         
          </div>
   
    
        <asp:Button ID="btnGuardar" runat="server" OnClientClick="return validarForm();"
            Text="Guardar" onclick="btnGuardar_Click" />
   
    
   



    </form>
    <script>
        
        function fnCambioPer() {
            if (document.forms[0].chkPersonalizado.checked) {
                document.getElementById("divPer").style.display = "none";
                document.getElementById("divFechas").style.display = "";
                document.forms[0].txtDias.disabled = true;
                document.forms[0].rblPers.disabled = true;

                document.forms[0].txtDesde.disabled = false;
                document.forms[0].txtHasta.disabled = false;

            } else {

                document.getElementById("divPer").style.display = "";
                document.getElementById("divFechas").style.display = "none";

                document.forms[0].txtDias.disabled = false;
                document.forms[0].rblPers.disabled = false;

                document.forms[0].txtDesde.disabled = true;
                document.forms[0].txtHasta.disabled = true;
            }




        }

        function validarForm() {
          
            return $('#form1').validationEngine('validate');
        }

        jQuery(document).ready(function () {


            jQuery("#form1").validationEngine('detach');

            jQuery("#form1").validationEngine();
        });
        function setupCalendar() {
        Calendar.setup({
            inputField: "<%=txtDesde.ClientID%>",
            trigger: "f_btn1",
            dateFormat: "%d/%m/%Y"
        });
        Calendar.setup({
            inputField: "<%=txtHasta.ClientID%>",
            trigger: "f_btn2",
            dateFormat: "%d/%m/%Y"
        });
         }
         setupCalendar();
    </script>
</body>
</html>
