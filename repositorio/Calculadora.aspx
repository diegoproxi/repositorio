<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calculadora.aspx.cs" Inherits="Categorias_Calculadora" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
	<link href="estilos_iniciales.css" rel="stylesheet" type="text/css" />

    
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


    <asp:HiddenField ID="hdOperacion" runat="server" />
    <asp:HiddenField ID="hdOperacion2" runat="server" />
     <asp:HiddenField ID="hdOperacion3" runat="server" />
    <div class="calculadora">
    
        <asp:TextBox ID="txtResultado" runat="server"  ReadOnly="true" 
            TextMode="MultiLine" CssClass="campo_calculo" ></asp:TextBox>
        <asp:Button ID="Button12" runat="server" onclick="Button12_Click" OnClientClick="fnGuardar()" Text="Guardar" CssClass="bt_guardar" />
        <center><asp:CheckBox ID="chkAcumulado" runat="server" Text="Acumulado?"/> &nbsp; &nbsp; Código
      
       <telerik:RadComboBox ID="radCodigo" runat="server" Height="200" Width="320"
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
                                       <%# DataBinder.Eval(Container, "Text")%>
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
                    </telerik:RadComboBox></center>
    <div id="divEscenarios">
    <%
        DSRepositorioIndicadoresTableAdapters.EscenariosDAO escDAO = new DSRepositorioIndicadoresTableAdapters.EscenariosDAO();
        DSRepositorioIndicadores.EscenariosVODataTable dtesc=  escDAO.GetEscenariosCalculables();
        string aux = "<script> function habilitarEscenarios(des){ ";
        for (int i = 0; i < dtesc.Rows.Count; i++)
        {
            aux += "document.getElementById('btnEsc" + dtesc[i].ID + "').disabled = des;";
            %>
            <button id="btnEsc<%=dtesc[i].ID %>" name="btnEsc<%=dtesc[i].DSNOMBRE %>" onclick="return fnagregarEscenario(<%=dtesc[i].ID %>,'<%=dtesc[i].DSNOMBRE.Trim() %>')"> <%=dtesc[i].DSNOMBRE %></button>
        <%}


            aux += "} </script>";
            
         %>
         <%=aux %>
    
    </div>

      <div class="bloqueNum">
    
     <div id="divPerj">
   <button id="perj-6" name="perj-6" onclick="return agregarperiodoj('j-6')" disabled="disabled">(j-6)</button>
      <button id="perj-5" name="perj-5" onclick="return agregarperiodoj('j-5')" disabled="disabled">(j-5)</button>
       <button id="perj-4" name="perj-4" onclick="return agregarperiodoj('j-4')" disabled="disabled">(j-4)</button>
        <button id="perj-3" name="perj-3" onclick="return agregarperiodoj('j-3')" disabled="disabled">(j-3)</button>

    <button id="perj-2" name="perj-2" onclick="return agregarperiodoj('j-2')" disabled="disabled">(j-2)</button>
      <button id="perj-1" name="perj-1" onclick="return agregarperiodoj('j-1')" disabled="disabled">(j-1)</button>
    <button id="perj" name="perj" onclick="return agregarperiodoj('j')" disabled="disabled">j</button><br />
      <button id="perj+1" name="perj+1" onclick="return agregarperiodoj('j+1')" disabled="disabled">(j+1)</button>
      <button id="perj+2" name="perj+2" onclick="return agregarperiodoj('j+2')" disabled="disabled">(j+2)</button>
       <button id="perj+3" name="perj+3" onclick="return agregarperiodoj('j+3')" disabled="disabled">(j+3)</button>
        <button id="perj+4" name="perj+4" onclick="return agregarperiodoj('j+4')" disabled="disabled">(j+4)</button>
         <button id="perj+5" name="perj+5" onclick="return agregarperiodoj('j+5')" disabled="disabled">(j+5)</button>
          <button id="perj+6" name="perj+6" onclick="return agregarperiodoj('j+6')" disabled="disabled">(j+6)</button>
    </div>


    <div id="divPer">
     <button id="peri-6" name="peri-6" onclick="return agregarPeriodo('i-6')" disabled="disabled">(i-6)</button>
      <button id="peri-5" name="peri-5" onclick="return agregarPeriodo('i-5')" disabled="disabled">(i-5)</button>
       <button id="peri-4" name="peri-4" onclick="return agregarPeriodo('i-4')" disabled="disabled">(i-4)</button>
        <button id="peri-3" name="peri-3" onclick="return agregarPeriodo('i-3')" disabled="disabled">(i-3)</button>

    <button id="peri-2" name="peri-2" onclick="return agregarPeriodo('i-2')" disabled="disabled">(i-2)</button>
      <button id="peri-1" name="peri-1" onclick="return agregarPeriodo('i-1')" disabled="disabled">(i-1)</button>
    <button id="peri" name="peri" onclick="return agregarPeriodo('i')" disabled="disabled">i</button>
     <button id="perin" name="perin" onclick="return agregarPeriodo('c')" disabled="disabled">Valor Cierre(c)</button><br />

      <button id="peri+1" name="peri+1" onclick="return agregarPeriodo('i+1')" disabled="disabled">(i+1)</button>
      <button id="peri+2" name="peri+2" onclick="return agregarPeriodo('i+2')" disabled="disabled">(i+2)</button>
       <button id="peri+3" name="peri+3" onclick="return agregarPeriodo('i+3')" disabled="disabled">(i+3)</button>
        <button id="peri+4" name="peri+4" onclick="return agregarPeriodo('i+4')" disabled="disabled">(i+4)</button>
         <button id="peri+5" name="peri+5" onclick="return agregarPeriodo('i+5')" disabled="disabled">(i+5)</button>
          <button id="peri+6" name="peri+6" onclick="return agregarPeriodo('i+6')" disabled="disabled">(i+6)</button>
    </div>
    
     <div id="divOpe">
      <button id="btnDel" name="btnDel" onclick="return fnEliminar()" ><--</button>
        <button id="btnBorar" name="btnBorar" onclick="return fnBorrar()" >Borrar</button>


       <button id="ope(" name="ope(" onclick="return agregarPrentesis('(')" >(</button>
        <button id="ope)"   name="ope)"  onclick="return agregarPrentesis(')')" disabled="disabled">)</button>

         <button id="ope+"  name="ope+"  onclick="return agregarOperacion('+')" disabled="disabled">+</button>
           <button id="ope-"  name="ope-"  onclick="return agregarOperacion('-')" disabled="disabled">-</button>

           <button id="ope*"  name="ope*"  onclick="return agregarOperacion('*')" disabled="disabled">*</button>

           <button id="ope/"  name="ope/"  onclick="return agregarOperacion('/')" disabled="disabled">/</button>
     </div>
    </div>
      <div id="divNumeros">
          

          <table >
              <tr>
                  <td>
                      <input id="Button1" type="button" value="1"   onclick="return agregarNumero(1)"/></td>
                  <td>
                      <input id="Button2" type="button" value="2" onclick="return agregarNumero(2)" /></td>
                  <td>
                      <input id="Button3" type="button" value="3" onclick="return agregarNumero(3)"/></td>
              </tr>
              <tr>
                  <td>
                      <input id="Button4" type="button" value="4" onclick="return agregarNumero(4)" /></td>
                  <td>
                      <input id="Button5" type="button" value="5" onclick="return agregarNumero(5)" /></td>
                  <td>
                      <input id="Button6" type="button" value="6" onclick="return agregarNumero(6)" /></td>
              </tr>
              <tr>
                  <td>
                      <input id="Button7" type="button" value="7" onclick="return agregarNumero(7)" /></td>
                  <td>
                      <input id="Button8" type="button" value="8" onclick="return agregarNumero(8)" /></td>
                  <td>
                      <input id="Button9" type="button" value="9"  onclick="return agregarNumero(9)"/></td>
              </tr>
              <tr>
                  <td><input id="Button13" type="button" value="i" onclick="return agregarNumero('i')"/>
                      </td>
                  <td>
                      <input id="Button10" type="button" value="0" onclick="return agregarNumero(0)"/></td>
                  <td>
                      <input id="Button11" type="button" value="." onclick="return agregarNumero('.')"/></td>
              </tr>
          </table>
          

      </div>

    </div>
     <telerik:RadScriptBlock runat="server" ID="RadCodeBlock1">
    <script>
        var ultimo = "";
        var ultimo2 = "";
        var vecOpe = new Array();
        function  fnagregarEscenario(idesc, nombre) {
            var cod = $find("<%= radCodigo.ClientID %>").get_value();

             if(document.forms[0].chkAcumulado.checked){
             idesc="-"+idesc;
             nombre=nombre+" (Acum)";
             }

            if(cod==""){
            vecOpe[vecOpe.length] = "cod@[INDICADOR]";
            }else{
            vecOpe[vecOpe.length] = "cod@"+cod;
            }

           
             vecOpe[vecOpe.length] = "e@"+idesc+":"+nombre;


            fnagregarEscenario2();

            ultimo = document.forms[0].txtResultado.value;
            ultimo2 = document.forms[0].hdOperacion.value;
              if(cod==""){
            document.forms[0].txtResultado.value = document.forms[0].txtResultado.value+" [(INDICADOR)"+nombre+"]";
            }else{
             document.forms[0].txtResultado.value = document.forms[0].txtResultado.value+" [("+cod+")"+nombre+"]";
            }
            if(cod==""){
            document.forms[0].hdOperacion.value = document.forms[0].hdOperacion.value + " [(INDICADOR)" + idesc + "]";
             }else{
              document.forms[0].hdOperacion.value = document.forms[0].hdOperacion.value + " [("+cod+")" + idesc + "]";
             }
         

            return false;
        }
        function habilitarPeriodos(val){
          document.getElementById("peri-6").disabled = val;
          document.getElementById("peri-5").disabled = val;
          document.getElementById("peri-4").disabled = val;
          document.getElementById("peri-3").disabled = val;
         document.getElementById("peri-2").disabled = val;
            document.getElementById("peri-1").disabled = val;
            document.getElementById("peri").disabled = val;
            document.getElementById("peri+1").disabled = val;
            document.getElementById("peri+2").disabled = val;
             document.getElementById("peri+6").disabled = val;
          document.getElementById("peri+5").disabled = val;
          document.getElementById("peri+4").disabled = val;
          document.getElementById("peri+3").disabled = val;

            document.getElementById("perin").disabled = val;
        }
         function habilitarPeriodosj(val){
          document.getElementById("perj-6").disabled = val;
          document.getElementById("perj-5").disabled = val;
          document.getElementById("perj-4").disabled = val;
          document.getElementById("perj-3").disabled = val;
         document.getElementById("perj-2").disabled = val;
            document.getElementById("perj-1").disabled = val;
            document.getElementById("perj").disabled = val;
            document.getElementById("perj+1").disabled = val;
            document.getElementById("perj+2").disabled = val;
             document.getElementById("perj+6").disabled = val;
          document.getElementById("perj+5").disabled = val;
          document.getElementById("perj+4").disabled = val;
          document.getElementById("perj+3").disabled = val;

        
        }


        function fnagregarEscenario2() {
        habilitarPeriodosj(false);
        habilitarPeriodos(true);
           
            habilitarEscenarios(true);

           // document.getElementById("btnDel").disabled = true;
           // document.getElementById("btnBorar").disabled = true;
            document.getElementById("ope(").disabled = true;
            document.getElementById("ope)").disabled = true;
            document.getElementById("ope+").disabled = true;
            document.getElementById("ope-").disabled = true;
            document.getElementById("ope*").disabled = true;
            document.getElementById("ope/").disabled = true;

            

            for (var i = 1; i <= 11; i++) {
                document.getElementById("Button" + i).disabled = true;
            }




        }
        function agregarperiodoj(per){
        agregarPeriodoj2();

            vecOpe[vecOpe.length] = "pj@" + per;

            ultimo = document.forms[0].txtResultado.value;
            ultimo2 = document.forms[0].hdOperacion.value;
            document.forms[0].txtResultado.value = document.forms[0].txtResultado.value + "[" + per + "]";

            document.forms[0].hdOperacion.value = document.forms[0].hdOperacion.value + "[" + per + "]";


            return false;


        }
        function agregarPeriodo(per) {

            agregarPeriodo2();

            vecOpe[vecOpe.length] = "p@" + per;

            ultimo = document.forms[0].txtResultado.value;
            ultimo2 = document.forms[0].hdOperacion.value;
            document.forms[0].txtResultado.value = document.forms[0].txtResultado.value + "(" + per + ")";

            document.forms[0].hdOperacion.value = document.forms[0].hdOperacion.value + "(" + per + ")";


            return false;

        }
         function agregarPeriodoj2() {

    
           habilitarPeriodosj(true);
        habilitarPeriodos(false);
           
            habilitarEscenarios(true);

           // document.getElementById("btnDel").disabled = true;
           // document.getElementById("btnBorar").disabled = true;
            document.getElementById("ope(").disabled = true;
            document.getElementById("ope)").disabled = true;
            document.getElementById("ope+").disabled = true;
            document.getElementById("ope-").disabled = true;
            document.getElementById("ope*").disabled = true;
            document.getElementById("ope/").disabled = true;

            

            for (var i = 1; i <= 11; i++) {
                document.getElementById("Button" + i).disabled = true;
            }


        

        }

        function agregarPeriodo2() {

      habilitarPeriodosj(true);
            habilitarPeriodos(true);


            habilitarEscenarios(true);

            document.getElementById("btnDel").disabled = false;
            document.getElementById("btnBorar").disabled = false;

            document.getElementById("ope+").disabled = false;
            document.getElementById("ope-").disabled = false;
            document.getElementById("ope*").disabled = false;
            document.getElementById("ope/").disabled = false;

            if (paraux == "(") {
                document.getElementById("ope)").disabled = false;
                document.getElementById("ope(").disabled = true;
            } else {
               document.getElementById("ope)").disabled = false;
                document.getElementById("ope(").disabled = false;
            }

            for (var i = 1; i <= 11; i++) {
                document.getElementById("Button" + i).disabled = true;
            }

            document.getElementById("Button13").disabled = true;
        

        }
       

        function agregarOperacion(ope) {
            agregarOperacion2();

            vecOpe[vecOpe.length] = "ope@" + ope;


            ultimo = document.forms[0].txtResultado.value;
            ultimo2 = document.forms[0].hdOperacion.value;
            document.forms[0].txtResultado.value = document.forms[0].txtResultado.value + " " + ope + " ";

            document.forms[0].hdOperacion.value = document.forms[0].hdOperacion.value + " " + ope + " ";


            return false;

        }

        function agregarOperacion2() {

         habilitarPeriodosj(true);
       habilitarPeriodos(true);
            habilitarEscenarios(false);

            document.getElementById("btnDel").disabled = false;
            document.getElementById("btnBorar").disabled = false;
            document.getElementById("ope(").disabled = true;
            document.getElementById("ope)").disabled = true;
            document.getElementById("ope+").disabled = true;
            document.getElementById("ope-").disabled = true;
            document.getElementById("ope*").disabled = true;
            document.getElementById("ope/").disabled = true;
            if (paraux == "(") {
                document.getElementById("ope)").disabled = false;
                document.getElementById("ope(").disabled = true;
            } else {
               // document.getElementById("ope)").disabled = true;
                document.getElementById("ope(").disabled = false;
            }

            for (var i = 1; i <= 11; i++) {
                document.getElementById("Button" + i).disabled = false;
            }

           document.getElementById("Button13").disabled = false;
        }
        function agregarNumero(num) {
            agregarNumero2();

            vecOpe[vecOpe.length] = "n@" + num;

            var vec = rtrim(document.forms[0].hdOperacion.value).split(" ");
            var ult = "";
            if (vec.length <= 0) {
                ult = vec[vec.length - 1];

            }
            ultimo = document.forms[0].txtResultado.value;
            ultimo2 = document.forms[0].hdOperacion.value;
         if (!isNaN(ult) || ult == ".") {
   document.forms[0].txtResultado.value = document.forms[0].txtResultado.value + num;
   document.forms[0].hdOperacion.value = document.forms[0].hdOperacion.value +  num ;


} else {


   
            document.forms[0].txtResultado.value = document.forms[0].txtResultado.value + num+" ";

                document.forms[0].hdOperacion.value = document.forms[0].hdOperacion.value + num+" ";
            }

           
            return false;

        }
        function agregarNumero2() {
           habilitarPeriodosj(true);
            habilitarPeriodos(true);
            habilitarEscenarios(true);

            document.getElementById("btnDel").disabled = false;
            document.getElementById("btnBorar").disabled = false;

            document.getElementById("ope+").disabled = false;
            document.getElementById("ope-").disabled = false;
            document.getElementById("ope*").disabled = false;
            document.getElementById("ope/").disabled = false;

            if (paraux == "(") {
                document.getElementById("ope)").disabled = false;
                document.getElementById("ope(").disabled = true;
            } else {
               document.getElementById("ope)").disabled = false;
                document.getElementById("ope(").disabled = false;
            }

            for (var i = 1; i <= 11; i++) {
                document.getElementById("Button" + i).disabled = false;
            }
            
            document.getElementById("Button13").disabled = false;
        }
       
       
       
        function fnBorrar() {
            document.forms[0].txtResultado.value ="";

            document.forms[0].hdOperacion.value = "";
            ultimo = "";
            ultimo2 = "";
            vecOpe.length = 0;
            return false;
        }
        function fnEliminar() {
           


            vecOpe.length = vecOpe.length - 1;

            if (vecOpe.length == 0) {
                generarResultado();
                agregarOperacion2();
                return false;
            }




            generarResultado();

             var aux = vecOpe[vecOpe.length - 1].split("@");
                var ope = aux[0];

                if (ope == "e") {
                    fnagregarEscenario2();
                }
                if (ope == "p") {
                    agregarPeriodo2();
                }
                  if (ope == "pj") {
                    agregarPeriodoj2();
                }
                if (ope == "ope") {
                    agregarOperacion2();
                }
                if (ope == "par") {
                    agregarPrentesis2();
                }
                if (ope == "n") {
                    agregarNumero2();
                }

         

            return false;

        }
        function rtrim(stringToTrim) {
            return stringToTrim.replace(/\s+$/, "");
        }
        var paraux="";
        function agregarPrentesis(par) {
            paraux=par;

            vecOpe[vecOpe.length] = "par@" + par;

            agregarPrentesis2();
                document.forms[0].txtResultado.value = document.forms[0].txtResultado.value + par + " ";

                document.forms[0].hdOperacion.value = document.forms[0].hdOperacion.value + par + " ";
            


            return false;
        }
        function agregarPrentesis2() {
           


            if (paraux == "(") {
            habilitarPeriodosj(true);
               habilitarPeriodos(true);
                habilitarEscenarios(false);

                document.getElementById("btnDel").disabled = false;
                document.getElementById("btnBorar").disabled = false;

                document.getElementById("ope+").disabled = true;
                document.getElementById("ope-").disabled = true;
                document.getElementById("ope*").disabled = true;
                document.getElementById("ope/").disabled = true;

                for (var i = 1; i <= 11; i++) {
                    document.getElementById("Button" + i).disabled = false;
                }
                document.getElementById("Button13").disabled = false;

               document.getElementById("ope)").disabled = false;
               // document.getElementById("ope(").disabled = true;
            }

            if (paraux == ")") {
                //document.getElementById("ope)").disabled = true;
                document.getElementById("ope(").disabled = false;
            }

           



            return false;
        }

        function generarResultado() {
            var cad = "";
             var cad2 = "";

            for (var i = 0; i < vecOpe.length; i++) {
                var aux = vecOpe[i].split("@");
                var ope = aux[0];
                
                if (ope == "cod") {
                    
                    cad = cad + " [(" + aux[1] + ")";
                    cad2 = cad2 + " [(" + aux[0] + ")";
                    continue;
                    
                     
                }

                if (ope == "e") {
                    var vec2=aux[1].split(":");
                    cad = cad +  vec2[1] + "]";
                    cad2 = cad2 + vec2[0] + "]";
                    continue;
                    
                     
                }
                if (ope == "p") {
                  

                    cad = cad + "(" + aux[1] + ")";
                    cad2 = cad2 + "(" + aux[1] + ")";
                    continue;

                }
                 if (ope == "pj") {
                  

                    cad = cad + "[" + aux[1] + "]";
                    cad2 = cad2 + "[" + aux[1] + "]";
                    continue;

                }
                if (ope == "ope") {
                    
                    cad = cad + " " + aux[1] + " ";
                    cad2 = cad2 + " " + aux[1] + " ";
                    continue;

                }
                if (ope == "par") {

                    cad = cad + aux[1] + " ";
                    cad2 = cad2 + aux[1] + " ";
                    continue;
                }
                if (ope == "n") {
                    var ult = "";
                    if (i < vecOpe.length-1) {
                     var aux2 = vecOpe[i+1].split("@");
                     ult = aux2[1];
                    }
                    
                    if (!isNaN(ult) || ult == ".") {
                        cad = cad + aux[1];
                        cad2 = cad2 + aux[1];
                     


                    } else {
                        cad = cad + aux[1] + " ";
                        cad2 = cad2 + aux[1] + " ";


                    }
                    continue;

                }

            }
            document.forms[0].txtResultado.value =cad;

            document.forms[0].hdOperacion.value = cad2;

        }
        function fnGuardar() {
            var cad = "";
             var cad2 = "";
            for (var i = 0; i < vecOpe.length; i++) {
            
               aux=vecOpe[i].split("@");
               if(aux=="")
               continue;
                aux2=aux;

                

               if(aux[0]=='e'){
               aux3=aux[1].split(":");
                aux2=aux[0]+"@"+aux3[0];
               }
                 if(aux[0]=='p'){
               
                aux2=aux2+')';
               }

                cad2 = cad2 + aux2 + "||";
                cad = cad + vecOpe[i] + "||";
               cad2= cad2.replace(",","@");
               // alert(cad);
            }
          

            document.forms[0].hdOperacion.value = cad;
            document.forms[0].hdOperacion3.value = cad2;
//            alert(cad);
//            alert(cad2);
        }
        <%if(!IsPostBack){ %>
            var auxcarga= document.forms[0].hdOperacion2.value ;
            var vec2carga=auxcarga.split('||');
			if(auxcarga!="0"){
            for (var i = 0; i < vec2carga.length; i++) {
            if(vec2carga[i]!=""){
               vecOpe[i]=vec2carga[i];
               }
            }
			}
			
            generarResultado();

         <%} %>
    </script>
    </telerik:RadScriptBlock>
    </form>
</body>
</html>
