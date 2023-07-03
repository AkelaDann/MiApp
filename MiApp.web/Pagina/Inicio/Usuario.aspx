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
                            <dx:ASPxGridView ID="AgvUsuarios" DataSourceID="ObjectDataSource1" runat="server" 
                                AutoGenerateColumns="false" KeyFieldName="Codigo" Width="100%">
                                <Settings ShowHeaderFilterButton="True"></Settings>

                                <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>

                                <Columns>
                                    <dx:GridViewDataSpinEditColumn FieldName="Codigo" VisibleIndex="0">
                                        <PropertiesSpinEdit DisplayFormatString="g"></PropertiesSpinEdit>
                                    </dx:GridViewDataSpinEditColumn>
                                    <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                    
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
    

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ListarUsuarios" TypeName="MiApp.Bll.UsuarioBll" 
        DeleteMethod="EliminarUsuario" InsertMethod="InsertarActualizarUsuario" UpdateMethod="InsertarActualizarUsuario">
        <DeleteParameters>
            <asp:Parameter Name="Codigo" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Codigo" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Nombre" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Codigo" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Nombre" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:ObjectDataSource>


  

</asp:Content>
