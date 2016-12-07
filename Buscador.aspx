<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Buscador.aspx.cs" Inherits="Buscador"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link type="text/css" href="jquery/css/south-street/jquery-ui-1.8.23.custom.css" rel="stylesheet" />
		<script type="text/javascript" src="jquery/js/jquery-1.8.0.min.js"></script>
		<script type="text/javascript" src="jquery/js/jquery-ui-1.8.23.custom.min.js"></script>



     
      <link rel="stylesheet" href="jquery.nyroModal/styles/nyroModal.css" type="text/css" media="screen" />
       <link type="text/css" href="estilos/buscador.css" rel="stylesheet" /></link>
<script type="text/javascript" src="jquery.nyroModal/js/jquery.nyroModal.custom.js"></script>
<!--[if IE 6]>
	<script type="text/javascript" src="jquery.nyroModal/js/jquery.nyroModal-ie6.min.js"></script>
<![endif]-->


<script type="text/javascript">
    $(function () {
        $('.nyroModal').nyroModal();
    });
</script>

	<link href="estilos_iniciales.css" rel="stylesheet" type="text/css" />

   
    
    
    <style type="text/css">
.nyroModalCont iframe {
	width: 1200px !important;
	height: 600px !important;
}

</style>
    


</head>
<body style="background-color:White">
    <form id="form1" runat="server">
    <div class="campos-buscador">
          <div class="labels">Diccionario</div>
          <asp:DropDownList ID="lstdiccionario" runat="server" CssClass="listas">
          </asp:DropDownList>
          <div class="clear"></div>
          <div class="labels">Nombre</div>
          <asp:TextBox ID="txtnombre" runat="server" CssClass="cuadro-txt"></asp:TextBox>
          <div class="clear"></div>
          <div class="labels">Código Indicador</div>
          <asp:TextBox ID="txtcodigo" runat="server" CssClass="cuadro-txt"></asp:TextBox>
         
          <div class="labels"  style="display:none">Código Indicador Aux</div>
          <asp:TextBox ID="txtcodigoaux" runat="server" CssClass="cuadro-txt"  Visible="false"></asp:TextBox>
          <div class="clear"></div>
          <div class="labels">Región</div>
          <asp:DropDownList ID="lstregion" runat="server" CssClass="listas">
          </asp:DropDownList>


           <div class="clear"></div>
          <div class="labels">U. Medida</div>
          <asp:DropDownList ID="ddlUnidMed" runat="server" CssClass="listas">
          </asp:DropDownList>
            <div class="clear"></div>
          <div class="labels">Responsable</div>
          <asp:DropDownList ID="ddlResponsable" runat="server" CssClass="listas">
          </asp:DropDownList>

          <div class="clear"></div>
          <asp:CheckBox ID="chavanzado" runat="server" CssClass="labels centrado"  style="display:none"
            Text="Avanzado"/>
        <div class="clear"></div>
          <asp:CheckBox ID="chkMios" runat="server" CssClass="labels centrado"  
            Text="Mis Indicadores"/>
      <div class="clear"></div>
        <div id="params" style="display:none">
            <%
                string parametros = "<table class='avanzado'>";
                int contador = 1;
                int cont_params = 1;
                
                DSRepositorioIndicadoresTableAdapters.ListasBuscadorDAO lbDAO = new DSRepositorioIndicadoresTableAdapters.ListasBuscadorDAO();
                DSRepositorioIndicadores.ListasBuscadorVODataTable lvDT = null;
                DSRepositorioIndicadores.ListasBuscadorVORow lvR = null;

                DSRepositorioIndicadoresTableAdapters.OpcionesListaBuscadorDAO olDAO = new DSRepositorioIndicadoresTableAdapters.OpcionesListaBuscadorDAO();
                DSRepositorioIndicadores.OpcionesListaBuscadorVODataTable olDT = null;
                DSRepositorioIndicadores.OpcionesListaBuscadorVORow olR = null;
                
                lvDT = lbDAO.GetListas();
                for (int i = 0; i < lvDT.Count; i++) {
                    lvR = lvDT[i];

                    if (contador == 1) {
                        parametros += "<tr>";
                    }

                    parametros += "<td>" + lvR.DSNOMBRE + "<input type='hidden' name='listahidden" + cont_params + "' value='" + lvR.DSCOLUMNA + "' /><select name='lista" + cont_params + "' id='lista" + cont_params + "' class='listas'><option value='-1' ></option>";

                    olDT = olDAO.GetOpcionesxlista(lvR.IDLISTA);

                    for (int j = 0; j < olDT.Count; j++) {
                        olR = olDT[j];
                        parametros += "<option value='"+olR.ID+"'>"+olR.DSNOMBRE+"</option>";
                    }

                    parametros += "</select></td>";

                    if (contador > 3)
                    {
                        parametros += "</tr>";
                        contador = 1;
                    }
                    else {
                        contador++;
                    }

                    cont_params++;
                    
                }

                parametros += "</table>";                
                
                
            %>
            <%= parametros%>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Buscar" onclick="Button1_Click" 
            PostBackUrl="~/Buscador.aspx" style="width: 61px"/>
        <asp:GridView ID="gvbuscador" runat="server" AutoGenerateColumns="False" 
            Width="100%" border="0" class="zebra"    AllowPaging="True" PageSize="20"  
             PagerSettings-Position="TopAndBottom" 
              onpageindexchanging="gvbuscador_PageIndexChanging" 
              onrowdatabound="gvbuscador_RowDataBound" 
              onrowcommand="gvbuscador_RowCommand" 
              EmptyDataText="No hay registros para mostrar">
            <Columns>
<asp:BoundField HeaderText="ID" DataField="ID" Visible="False"></asp:BoundField>
                <asp:BoundField HeaderText="Nombre" DataField="DSNOMBRE" />
                <asp:BoundField HeaderText="Región" DataField="DSREGION" />
                   <asp:BoundField HeaderText="Unid Medida" DataField="UNIDADMEDIDA" />
                <asp:BoundField HeaderText="Código" DataField="DSCODIGO" />

                
                <asp:BoundField HeaderText="Cod Auxiliar" DataField="DSCODIGOAUX"  Visible="false"/>
                  <asp:BoundField HeaderText="Nom Auxiliar" DataField="DSAUX"  Visible="false"/>
                 



                      
                 <asp:TemplateField HeaderText="">
                <ItemTemplate>
                <center>
              <a href='javascript:fnAbrir(<%# Eval("ID") %>)' name="id<%# Eval("ID") %>"  >Editar</a>
             </center>
                  </ItemTemplate>

                  </asp:TemplateField>

                   <asp:TemplateField HeaderText="">
                <ItemTemplate>
                <center>
              <a href="javascript:fnAbrir2(<%# Eval("ID") %>)" name="id<%# Eval("ID") %>"  >Ver</a>
             </center>
                  </ItemTemplate>

                  </asp:TemplateField>

                      <asp:TemplateField HeaderText="">
                <ItemTemplate>
                <center>

                    <asp:LinkButton ID="ibtnDelete" runat="server" Text="Eliminar" OnClientClick="javascript: if(confirm('Está seguro que desea eliminar el indicador?')== false) return false" CommandName="eliminar" CommandArgument='<%# Eval("ID")%>'></asp:LinkButton>
                      </center>
                  </ItemTemplate>

                  </asp:TemplateField>

                    
                  <asp:TemplateField HeaderText="" >
                <ItemTemplate>
                <center>
                  <a href='javascript:fnAbrir4("<%# Eval("DSCODIGO") %>",<%=DateTime.Now.Year %>)'>Gráfica</a>
                   </center>
                  </ItemTemplate>

                  </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <br />
     
    </div>
    </form>
</body>
<script type="text/javascript">
    function showdiv(boxid) {
        document.getElementById(boxid).style.display = "";
    }

    function hidediv(boxid) {
        document.getElementById(boxid).style.display = "none";
    }

    function Ocultar() {
        
        if (document.getElementById('<%=chavanzado.ClientID%>').checked) {
            showdiv('params');
        } else {
            hidediv('params');
        }
    }
    $('.nyroModalCont,iframe').css('width','900px');
$('.nyroModalCont,iframe').css('height','800px');
      function fnAbrir(id) {
        window.parent.abrirPopup2(id);
    //  parent.document.abrirPopup(id);
//            $.nmManual('Indicadores/Crear.aspx?operation=e&id='+id, {
//             sizes: {
//                            minW: 900,
//                           minH: 800
//                        },  resizable: false,
//                callbacks: {
//                    initFilters: function (nm) {
//                        nm.filters.push('link');
//                        nm.filters.push('iframe');
//                    }
//                }
//            });

        }
         function fnAbrir2(id) {
          window.parent.abrirPopup(id);
//    //  parent.document.abrirPopup(id);
//            $.nmManual('Indicadores/Actualizar.aspx?id='+id, {
//          sizes: {
//                            minW: 1200,
//                           minH: 600
//                        },  resizable: false,
//                callbacks: {
//                    initFilters: function (nm) {
//                        nm.filters.push('link');
//                        nm.filters.push('iframe');
//                    }
//                }
//            });

        }
         function fnAbrir3(id) {

            $.nmManual('https://www.conectandonosconlaestrategia.com/Graficos/GetGrafico.aspx?codigo=' + id, {
                callbacks: {
                    initFilters: function (nm) {
                        nm.filters.push('link');
                        nm.filters.push('iframe');
                    }
                }
            });

        }
        function fnAbrir4(id,anio) {

           window.parent.abrirPopupUrl('https://www.conectandonosconlaestrategia.com/Graficos/GetGrafico.aspx?codigo=' + id+'&anio='+anio);

        }
     function cerrarPop() {

       
            $.nmTop().close();

        }
    Ocultar();

    <%
        int contador = 1;

        while (Request["lista" + contador] != null) {
        %>
            document.getElementById('<%="lista" + contador%>').value = '<%=Request["lista" + contador]%>';
        <%
            contador++;
        }
    
     %>

</script>
</html>
