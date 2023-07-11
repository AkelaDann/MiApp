<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlPersona.ascx.cs" Inherits="MiApp.web.ControlUsuario.ControlPersona" %>
<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<script src="../../Scripts/ControlUsuario/ControlPersona.js" type="text/javascript"></script>
<dx:ASPxCallbackPanel ID="AcpControlPersona" runat="server" ClientInstanceName="AcpControlPersona" OnCallback="AcpControlPersona_Callback">
    <PanelCollection>
        <dx:PanelContent runat="server">
            <dx:ASPxPopupControl ID="ApcControlPersona" ClientInstanceName="ApcControlPersona" runat="server" Width="500px"
                HeaderText="Personas" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AutoUpdatePosition="true"
                Modal="true" CloseAction="CloseButton">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxGridView ID="AgvControlPersona" runat="server" AutoGenerateColumns="false" DataSourceID="OdsControlPersona"
                            Width="100%" KeyFieldName="Rut">
                            <ClientSideEvents RowDblClick="function(s,e){ DobleClickFila(s,e);}"/>
                            <Settings ShowFilterRowMenu="true" ShowHeaderFilterButton="true" />
                            <SettingsSearchPanel Visible="true" />
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="Rut" VisibleIndex="0"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Dv" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="2"></dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>
<asp:ObjectDataSource ID="OdsControlPersona" runat="server" SelectMethod="Listar" TypeName="MiApp.Bll.PersonaBll">
    <SelectParameters>
        <asp:SessionParameter Name="tipoDocumento" SessionField="OdsControlPersonaTipoDocumento" Type="Int32"></asp:SessionParameter>
        <asp:Parameter Direction="Output" Name="salida" Type="Object"></asp:Parameter>
    </SelectParameters>
</asp:ObjectDataSource>
