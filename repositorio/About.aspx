<%@ Page Title="About Us" Language="C#"  AutoEventWireup="true"
    CodeFile="About.aspx.cs" Inherits="About" %>
    <form id="form1" runat="server">
<asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            EmptyDataText="No hay datos">
            <Columns>
                <asp:BoundField DataField="Id_Afiliacion" HeaderText="Id_Afiliacion" 
                    SortExpression="Id_Afiliacion" />
                <asp:BoundField DataField="ba_RazonSocial" HeaderText="ba_RazonSocial" 
                    SortExpression="ba_RazonSocial" />
                <asp:BoundField DataField="ba_TipoIdentificacion" 
                    HeaderText="ba_TipoIdentificacion" SortExpression="ba_TipoIdentificacion" />
                <asp:BoundField DataField="ba_NumeroIdentificacion" 
                    HeaderText="ba_NumeroIdentificacion" SortExpression="ba_NumeroIdentificacion" />
                <asp:BoundField DataField="ba_Persona" HeaderText="ba_Persona" 
                    SortExpression="ba_Persona" />
                <asp:BoundField DataField="em_NombreRepresentante" 
                    HeaderText="em_NombreRepresentante" SortExpression="em_NombreRepresentante" />
                <asp:BoundField DataField="FechaCreacion" HeaderText="FechaCreacion" 
                    SortExpression="FechaCreacion" />
                <asp:BoundField DataField="DescripcionEstado" HeaderText="DescripcionEstado" 
                    SortExpression="DescripcionEstado" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:COMFE_AFILIACION_EMPRESASConnectionString %>" 
            SelectCommand="sp_ConsultarAfiliacion_back" 
        SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False" >
            <SelectParameters>
                <asp:Parameter Name="RazonSocial" Type="String" />
                <asp:Parameter Name="TipoIdentificacion" Type="String" />
                <asp:Parameter Name="NroIdentificacion" Type="String" />
                <asp:Parameter Name="TipoPersona" Type="String" />
                <asp:Parameter Name="NombreRepresentante" Type="String" />
                <asp:Parameter Name="FechaInicio" Type="DateTime" />
                <asp:Parameter Name="FechaFin" Type="DateTime" />
                <asp:Parameter Name="Estado" Type="String" />
                <asp:Parameter Name="All" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        </form>