<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MapaTransversal.aspx.cs" Inherits="MapaTransversal" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" type="text/css" media="all" href="/css/stylemapas.css"/>
</head>
<body>
    <form id="form1" runat="server">
   
  
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
 

  <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
          <script type="text/javascript">
              function countSelectedItems(sender, args) {


                  var item = args.get_item();
                  
                  var treelist = item.get_owner();

                  var pesnc = treelist.getCellByColumnUniqueName(item, "PESNC").innerText;
                  var umnc = treelist.getCellByColumnUniqueName(item, "UMNC").innerText;

                  var pesmed = treelist.getCellByColumnUniqueName(item, "PESMED").innerText;
                  var ummed = treelist.getCellByColumnUniqueName(item, "UMMED").innerText;

                  var pesbog = treelist.getCellByColumnUniqueName(item, "PESBOG").innerText;
                  var umbog = treelist.getCellByColumnUniqueName(item, "UMBOG").innerText;

                  var pescal = treelist.getCellByColumnUniqueName(item, "PESCAL").innerText;
                  var umcal = treelist.getCellByColumnUniqueName(item, "UMCAL").innerText;

                  var pesbar = treelist.getCellByColumnUniqueName(item, "PESBAR").innerText;
                  var umbar = treelist.getCellByColumnUniqueName(item, "UMBAR").innerText;

                   var ind = treelist.getCellByColumnUniqueName(item, "INDICADOR").innerText;


                   document.getElementById("grafico1").src = "https://www.conectandonosconlaestrategia.com/Graficos/GetGrafico3.aspx?nc=" + pesnc + "&med=" + pesmed + "&bog=" + pesbog + "&cal=" + pescal + "&bar=" + pesbar + "&titulo=" + ind + " Mill/Pesos ";
                   document.getElementById("grafico2").src = "https://www.conectandonosconlaestrategia.com/Graficos/GetGrafico3.aspx?nc=" + umnc + "&med=" + ummed + "&bog=" + umbog + "&cal=" + umcal + "&bar=" + umbar + "&titulo=" + ind + " UM ";
              }
          </script>
     </telerik:RadCodeBlock>


    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
          <AjaxSettings>
               <telerik:AjaxSetting AjaxControlID="RadTreeList1">
                    <UpdatedControls>
                         <telerik:AjaxUpdatedControl ControlID="RadTreeList1"></telerik:AjaxUpdatedControl>
                        
                    </UpdatedControls>
               </telerik:AjaxSetting>
          </AjaxSettings>
     </telerik:RadAjaxManager>




     <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server"></telerik:RadAjaxLoadingPanel>
     <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
          <telerik:RadTreeList ID="RadTreeList1" runat="server" ParentDataKeyNames="Pertenece" DataKeyNames="INDICADOR" AutoGenerateColumns="false" >
          
           <ClientSettings Selecting-AllowItemSelection="true">
                    <ClientEvents OnItemClick="countSelectedItems" ></ClientEvents>
                     <Selecting AllowItemSelection="true"></Selecting>
               </ClientSettings>

               <Columns>
                    <telerik:TreeListBoundColumn DataField="INDICADOR" UniqueName="INDICADOR" HeaderText="INDICADOR"></telerik:TreeListBoundColumn>
                    <telerik:TreeListBoundColumn DataField="PESNC" UniqueName="PESNC" HeaderText="Mil/Pesos (NC)"></telerik:TreeListBoundColumn>
                    <telerik:TreeListBoundColumn DataField="UMNC" UniqueName="UMNC" HeaderText="UM (NC)"></telerik:TreeListBoundColumn>
                         <telerik:TreeListBoundColumn DataField="PESMED" UniqueName="PESMED" HeaderText="Mil/Pesos (MED)"></telerik:TreeListBoundColumn>
                    <telerik:TreeListBoundColumn DataField="UMMED" UniqueName="UMMED" HeaderText="UM (MED)"></telerik:TreeListBoundColumn>
                         <telerik:TreeListBoundColumn DataField="PESBOG" UniqueName="PESBOG" HeaderText="Mil/Pesos (BOG)"></telerik:TreeListBoundColumn>
                    <telerik:TreeListBoundColumn DataField="UMBOG" UniqueName="UMBOG" HeaderText="UM (NOG)"></telerik:TreeListBoundColumn>
                         <telerik:TreeListBoundColumn DataField="PESBAR" UniqueName="PESBAR" HeaderText="Mil/Pesos (BAR)"></telerik:TreeListBoundColumn>
                    <telerik:TreeListBoundColumn DataField="UMBAR" UniqueName="UMBAR" HeaderText="UM (BAR)"></telerik:TreeListBoundColumn>
                         <telerik:TreeListBoundColumn DataField="PESCAL" UniqueName="PESCAL" HeaderText="Mil/Pesos (CAL)"></telerik:TreeListBoundColumn>
                    <telerik:TreeListBoundColumn DataField="UMCAL" UniqueName="UMCAL" HeaderText="UM (CAL)"></telerik:TreeListBoundColumn>

                  
                    <telerik:TreeListBoundColumn DataField="Pertenece" UniqueName="Pertenece" HeaderText="Pertenece" Visible="false"></telerik:TreeListBoundColumn>
               </Columns>
          </telerik:RadTreeList>
     </telerik:RadAjaxPanel>
     <br />
        <div class="cuadros1">

       <iframe frameborder=0 width='500' height='400' frameborder=0 id="grafico1"></iframe>
     <iframe  frameborder=0 width='500' height='400' frameborder=0  id="grafico2"></iframe>
     </div>
    </form>

    
</body>
</html>
