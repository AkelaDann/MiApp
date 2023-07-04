<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina/Inicio/Master.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="MiApp.web.Pagina.Inicio.Usuario" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxCallbackPanel ID="AcpUsuario" runat="server" Width="100%">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxPanel ID="AplTitulo" runat="server" Width="100%" >
                    <PanelCollection>
                        <dx:PanelContent>
                            <dx:ASPxLabel ID="AlbTitulo" runat="server" Text="Usuarios" Font-Bold="true"></dx:ASPxLabel>
                            <dx:ASPxGridView ID="AgvUsuarios" DataSourceID="OdsUsuario" runat="server" 
                                AutoGenerateColumns="false" KeyFieldName="Codigo" Width="100%">
                                <Settings ShowHeaderFilterButton="True"></Settings>

                                <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>

                                <Columns>
                                    <dx:GridViewDataSpinEditColumn FieldName="Codigo" VisibleIndex="0">
                                        <PropertiesSpinEdit DisplayFormatString="g"></PropertiesSpinEdit>
                                    </dx:GridViewDataSpinEditColumn>
                                    <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Perfil.CodigoPerfil" VisibleIndex="2">
                                        <PropertiesComboBox ValueType="System.Int32" DataSourceID="OdsPerfiles" TextField="Glosa" ValueField="CodigoPerfil"></PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                </Columns>
                                <Toolbars>
                                    <dx:GridViewToolbar>
                                        <Items>
                                            <dx:GridViewToolbarItem Command="New"></dx:GridViewToolbarItem>
                                            <dx:GridViewToolbarItem Command="Edit"></dx:GridViewToolbarItem>
                                            <dx:GridViewToolbarItem Command="Delete"></dx:GridViewToolbarItem>
                                            <dx:GridViewToolbarItem Command="Refresh"></dx:GridViewToolbarItem>
                                        </Items>
                                    </dx:GridViewToolbar>
                                </Toolbars>
                            </dx:ASPxGridView>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
    

    <asp:ObjectDataSource ID="OdsUsuario" runat="server" SelectMethod="ListarUsuarios" TypeName="MiApp.Bll.UsuarioBll" 
        DeleteMethod="EliminarUsuario" InsertMethod="InsertarActualizarUsuario" UpdateMethod="InsertarActualizarUsuario"
        OnInserting="OdsUsuario_IUing" OnUpdating="OdsUsuario_IUing"
        OnSelected="OdsUsuario_Selected" OnUpdated="OdsUsuario_IUDed" OnInserted="OdsUsuario_IUDed" OnDeleted="OdsUsuario_IUDed">
        <DeleteParameters>
            <asp:Parameter Name="Codigo" Type="Int32"></asp:Parameter>
            <asp:Parameter Direction="Output" Name="salida" Type="Object"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Codigo" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Nombre" Type="String"></asp:Parameter>
            <asp:Parameter Name="Perfil.CodigoPerfil" Type="Int32"></asp:Parameter>
            <asp:Parameter Direction="Output" Name="salida" Type="Object"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Direction="Output" Name="salida" Type="Object"></asp:Parameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Codigo" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Nombre" Type="String"></asp:Parameter>
            <asp:Parameter Name="Perfil.CodigoPerfil" Type="Int32"></asp:Parameter>
            <asp:Parameter Direction="Output" Name="salida" Type="Object"></asp:Parameter>
        </UpdateParameters>
    </asp:ObjectDataSource>


  
    <asp:ObjectDataSource ID="OdsPerfiles" runat="server" SelectMethod="ListarPerfiles" TypeName="MiApp.Bll.PerfilBll">
        <SelectParameters>
            <asp:Parameter Direction="Output" Name="salida" Type="Object"></asp:Parameter>
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
