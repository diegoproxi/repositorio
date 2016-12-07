<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Permisos.aspx.cs" Inherits="Permisos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link href="../estilos_iniciales.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>

<table width="100%" class="zebra" border="0">
    <% 
        DSRepositorioIndicadoresTableAdapters.PermisosHabDAO perDAO = new DSRepositorioIndicadoresTableAdapters.PermisosHabDAO();
        DSRepositorioIndicadores.PermisosHabVODataTable per = null;
        if ((Request["idind"] == null || Request["idind"] == "") && (Request["idcat"] == null || Request["idcat"] == ""))
        {
            per = perDAO.GetPermisos();
        }else{
            if (Request["idind"] == null || Request["idind"] == "")
            {
                per = perDAO.GetPermisosXCat(int.Parse(Request["idcat"]));
            }
            else
            {
                per = perDAO.GetPermisosXInd(int.Parse(Request["idind"]), int.Parse(Request["idcat"]));
            }
        
        }
       for (int i = 0; i < per.Count; i++)
       {
           if (i % 2 == 0)
           {
         %>

         <tr>
         <td>
         
         <%=per[i].DSNOMBRE%>

         </td>
       <td>
       <select name="permiso<%=per[i].ID %>" >
     
         <option value="">Ninguno</option>
         <option value="L" selected>Lectura</option>
         <option value="A">Actualización</option>
       </select>
       
       </td>
          <%}
           else
           { %>


          <td>
          <%=per[i].DSNOMBRE%>
         </td>

           <td>
        <select name="permiso<%=per[i].ID %>" >
      
         <option value="">Ninguno</option>
         <option value="L" selected>Lectura</option>
         <option value="A">Actualización</option>
       </select>
       
       </td>
            </tr>
          

         <%} %>
           <script>
            document.forms[0].permiso<%=per[i].ID %>.value='<%=per[i].DSPERMISO %>';
            </script>
        <% }%>
    
    </table>

    </div>
<div class="center">
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Guardar" />
    </div>
    </form>
</body>
</html>
