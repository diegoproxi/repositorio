<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PanelControl.aspx.cs" Inherits="Indicadores_PanelControl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../estilos/exportar.css" rel="stylesheet" type="text/css" />
<link href="../estilos/global.css" rel="stylesheet" type="text/css" />
	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />
</head>
<body style="
    overflow-y: hidden;
">   

 <form id="form1" runat="server">

    <div class="campos-buscador" style="overflow-y: auto;height: 1100px;">
    <% string tipo=com.triario.repositorio.util.Utils.GetUsuario(Session,Response).DSTIPO;
    if(tipo=="S"||tipo=="A"){%>
        <a href="javascript:window.parent.abrirPopup3();">Configurar</a><br />
    <%}
     %>
     <br />
    <div class="vista"> <a href="PanelControl2.aspx">Ver Lista</a></div><br />
    <% DSRepositorioIndicadoresTableAdapters.PanelControlDAO panDAO = new DSRepositorioIndicadoresTableAdapters.PanelControlDAO();
      DSRepositorioIndicadores.PanelControlVODataTable pandt=  panDAO.GetPanel(com.triario.repositorio.util.Utils.GetUsuario(Session, Response).ID);
      for (int i = 0; i < pandt.Count; i++)
      {
         %>

         <div class="plantillas">
         <div class="titles"><%= pandt[i].dsnombre %>
	<a href='javascript:fnAbrir4("<%= pandt[i].IsDSCODIGONull()?"":pandt[i].DSCODIGO %>",<%=DateTime.Now.Year %>)'>Gráfica</a>  <div class="edit">     <a href="javascript:window.parent.abrirPopup(<%= pandt[i].id %>);">...</a></div>
	
</div>
<p>

<%=pandt[i].IsDSDEFINICIONNull()? "":pandt[i].DSDEFINICION %>
</p>

         <h4>Último corte <%= pandt[i].MES %> <%= pandt[i].ANIO %> </h4>
         <h4>

<%=pandt[i].REGION%>
</h4>

         <div class="porcentaje"><%=pandt[i].IsVALORNull()?"": pandt[i].VALOR %> <%=pandt[i].IsUNIDADMEDIDANull()?"":pandt[i].UNIDADMEDIDA %></div>

         </div>
         <%} %>

    </div>
    </form>
</body>
<script>
function fnAbrir4(id,anio) {

           window.parent.abrirPopupUrl('https://www.conectandonosconlaestrategia.com/Graficos/GetGrafico.aspx?codigo=' + id+'&anio='+anio);

        }
        </script>
</html>
