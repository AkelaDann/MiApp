<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina/Inicio/Master.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="MiApp.web.Pagina.Inicio.Usuario" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/Pagina/Inicio/Usuario.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxCallbackPanel ID="AcpUsuario" runat="server" Width="100%">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxPanel ID="AplTitulo" ClientInstanceName="AplTitulo" runat="server" Width="100%" >
                    <PanelCollection>
                        <dx:PanelContent>
                            <dx:ASPxLabel ID="AlbTitulo" runat="server" Text="Usuarios" Font-Bold="true"></dx:ASPxLabel>

                            <dx:ASPxGridView ID="AgvUsuario" ClientInstanceName="AgvUsuario" DataSourceID="OdsUsuario" runat="server" 
                                AutoGenerateColumns="false" KeyFieldName="Codigo" Width="100%" OnStartRowEditing="AgvUsuario_StartRowEditing">                                
                                <ClientSideEvents EndCallback="function(s,e){ EndcallbackAgvUsuario(s);}" ></ClientSideEvents >
                                <Settings ShowFilterRowMenu="true" ShowHeaderFilterButton="True" VerticalScrollBarMode="Auto"></Settings>

                                <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>

                                <EditFormLayoutProperties ColCount="4" ColumnCount="4">
                                    <Items>
                                        <dx:GridViewColumnLayoutItem ColumnName="Codigo" ColSpan="1" Visible="false" Name="Codigo" ></dx:GridViewColumnLayoutItem>
                                        <dx:GridViewColumnLayoutItem ColumnName="Nombre" ColSpan="1"></dx:GridViewColumnLayoutItem>
                                        <dx:GridViewColumnLayoutItem ColumnName="Perfil.CodigoPerfil" ColSpan="1" ></dx:GridViewColumnLayoutItem>
                                        <dx:GridViewColumnLayoutItem ColSpan="2" ColumnSpan="2" HorizontalAlign="Right" VerticalAlign="Bottom" ShowCaption="False"> 
                                            <Template>
                                                <dx:ASPxButton ID="AbnUsuarioGuardar" runat="server" Text="Guardar" AutoPostBack="false" UseSubmitBehavior="false" RenderMode="Secondary" Width="50%">
                                                    <ClientSideEvents Click="function(s,e){ ConfirmarUsuarioGuardar(AgvUsuario);}" />
                                                </dx:ASPxButton>
                                                <dx:ASPxButton ID="AbnUsuarioCancelar" runat="server" Text="Cancelar" AutoPostBack="false" UseSubmitBehavior="false" RenderMode="Danger" Width="50%">
                                                    <ClientSideEvents Click="function(s,e){ ConfirmarUsuarioCancelar(AgvUsuario);}" />
                                                </dx:ASPxButton>
                                            </Template>
                                            <SpanRules>
                                                <dx:SpanRule BreakpointName="s" ColumnSpan="2" RowSpan="1" />
                                                <dx:SpanRule BreakpointName="m" ColumnSpan="1" RowSpan="1" />
                                                <dx:SpanRule BreakpointName="l" ColumnSpan="2" RowSpan="1" />
                                            </SpanRules>
                                        </dx:GridViewColumnLayoutItem>
                                    </Items>
                                    <SettingsAdaptivity>
                                        <GridSettings>
                                            <Breakpoints>
                                                <dx:LayoutBreakpoint Name="s" MaxWidth="768" ColumnCount="2" />
                                                <dx:LayoutBreakpoint Name="m" MaxWidth="992" ColumnCount="3" />
                                                <dx:LayoutBreakpoint Name="l" MaxWidth="1200" ColumnCount="4" />
                                            </Breakpoints>
                                        </GridSettings>
                                    </SettingsAdaptivity>
                                </EditFormLayoutProperties>
                                <Columns>
                                    <dx:GridViewDataSpinEditColumn FieldName="Codigo" VisibleIndex="0" ReadOnly="true" Width="10%" >
                                        <PropertiesSpinEdit DisplayFormatString="g" >
                                            <SpinButtons ClientVisible ="false"></SpinButtons>
                                        </PropertiesSpinEdit>
                                    </dx:GridViewDataSpinEditColumn>
                                    <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="1">
                                        <PropertiesTextEdit MaxLength="150">
                                            <ValidationSettings>
                                                <RequiredField IsRequired="true" ErrorText="Nombre requerido" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Perfil.CodigoPerfil" VisibleIndex="2">
                                        <PropertiesComboBox ValueType="System.Int32" DataSourceID="OdsPerfiles" TextField="Glosa" ValueField="CodigoPerfil">
                                            <ValidationSettings>
                                                <RequiredField IsRequired="true" ErrorText="Debe indicar un perfil" /> 
                                            </ValidationSettings>
                                        </PropertiesComboBox>
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
