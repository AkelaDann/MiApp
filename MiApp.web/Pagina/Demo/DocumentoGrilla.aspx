<%@ Page Title="Documentos Grilla" Language="C#" MasterPageFile="~/Pagina/Inicio/Master.Master" AutoEventWireup="true" CodeBehind="DocumentoGrilla.aspx.cs" Inherits="MiApp.web.Pagina.Demo.DocumentoGrilla" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v21.2, Version=21.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/Pagina/Demo/DocumentoGrilla.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxCallbackPanel ID="AcpDocumentoGrilla" ClientInstanceName="AcpDocumentoGrilla" runat="server" Width="100%"
        OnCallback="AcpDocumentoGrilla_Callback">
        <ClientSideEvents EndCallback="function (s, e) {EndCallbackAgvDocumentoGrilla(s);}" />
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxPanel ID="AplTitulo" ClientInstanceName="AplTitulo" runat="server" Width="100%">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxLabel ID="AlbTitulo" runat="server" Width="100%" Text="Documentos Grilla" Font-Bold="true"></dx:ASPxLabel>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>  
                
                <dx:ASPxButton runat="server" ID="AbnDesenfocar" Text="Desenfocar" UseSubmitBehavior="false" AutoPostBack="false">
                    <ClientSideEvents Click="function(s, e){ Desenfocar();}" />
                </dx:ASPxButton>

                <dx:ASPxButton runat="server" ID="AbnEliminar" Text="Eliminar" UseSubmitBehavior="false" AutoPostBack="false">
                    <ClientSideEvents Click="function(s, e){ EliminarDesdeFuera();}" />
                </dx:ASPxButton>

                <dx:ASPxGridView runat="server" ID="AgvDocumentoGrilla" ClientInstanceName="AgvDocumentoGrilla" AutoGenerateColumns="False" 
                    DataSourceID="OdsDocumentosGrilla" OnToolbarItemClick="AgvDocumentoGrilla_ToolbarItemClick"
                    Width="100%" KeyFieldName="Codigo" >
                    <ClientSideEvents EndCallback="function(s, e){EndCallbackAgvDocumentoGrilla(s);}"
                            CustomButtonClick="function(s, e){ LevantaPopUpInyectarItems(s, e);}" 
                            ToolbarItemClick="function(s, e){OnToolbarItemClick(s, e);}"/>
                    <SettingsPager mode="ShowAllRecords"></SettingsPager>
                    <SettingsBehavior AllowFocusedRow="true" />
                    <Settings ShowFilterRowMenu="true" ShowHeaderFilterButton="true" VerticalScrollBarMode="Auto" />
                    <SettingsDetail ShowDetailRow="true"  ExportMode="All"/>
                    <SettingsExport EnableClientSideExportAPI="true" FileName="Documentos Grilla" ExcelExportMode="WYSIWYG"></SettingsExport>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Codigo" VisibleIndex="0"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Glosa" VisibleIndex="1"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="2"></dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="FechaMinima" VisibleIndex="3"></dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="FechaMaxima" VisibleIndex="4"></dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="Referencia" VisibleIndex="5"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Descuento" VisibleIndex="6"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Clasificacion" VisibleIndex="7"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn FieldName="Marcado" VisibleIndex="8"></dx:GridViewDataCheckColumn>
                        <dx:GridViewDataTextColumn FieldName="Total" VisibleIndex="9"></dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonRenderMode="Button" VisibleIndex="10">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="InyectarItems" Text="Inyectar Items"></dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                    </Columns>
                    <Templates>
                        <DetailRow>
                             <dx:ASPxPageControl ID="ApgDocumentoGrilla" runat="server" Width="100%" ActivateTabIndex="0">
                                 <TabPages>
                                     <dx:TabPage Text="Items">
                                         <ContentCollection>
                                             <dx:ContentControl runat="server">
                                                 <dx:ASPxGridView runat="server" ID="AgvItem" ClientInstanceName="AgvItem" Width="100%" AutoGenerateColumns="False" DataSourceID="OdsItems"
                                                     OnBeforePerformDataSelect="Agv_BeforePerformDataSelect">
                                                     <Settings ShowFilterRowMenu="true" ShowHeaderFilterButton="true" VerticalScrollBarMode="Auto" />
                                                     <Columns>
                                                         <dx:GridViewDataTextColumn FieldName="Correlativo" VisibleIndex="0"></dx:GridViewDataTextColumn>
                                                         <dx:GridViewDataTextColumn FieldName="Glosa" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                                         <dx:GridViewDataTextColumn FieldName="Valor" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                                     </Columns>
                                                 </dx:ASPxGridView>
                                             </dx:ContentControl>
                                         </ContentCollection>
                                     </dx:TabPage>
                                     <dx:TabPage Text="Etapas">
                                         <ContentCollection>
                                             <dx:ContentControl runat="server">
                                                 <dx:ASPxGridView runat="server" ID="AgvEtapa" ClientInstanceName="AgvEtapa" Width="100%" AutoGenerateColumns="False" DataSourceID="OdsEtapa"
                                                     OnBeforePerformDataSelect="Agv_BeforePerformDataSelect">
                                                     <Settings ShowFilterRowMenu="true" ShowHeaderFilterButton="true" VerticalScrollBarMode="Auto" />
                                                     <Columns>
                                                         <dx:GridViewDataTextColumn FieldName="Codigo" VisibleIndex="0"></dx:GridViewDataTextColumn>
                                                         <dx:GridViewDataTextColumn FieldName="Glosa" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                                     </Columns>
                                                 </dx:ASPxGridView>
                                             </dx:ContentControl>
                                         </ContentCollection>
                                     </dx:TabPage>
                                 </TabPages>
                             </dx:ASPxPageControl>
                        </DetailRow>
                    </Templates>
                    <Toolbars>
                        <dx:GridViewToolbar>
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXlsx"></dx:GridViewToolbarItem>
                                <dx:GridViewToolbarItem Command="Refresh"></dx:GridViewToolbarItem>
                                <dx:GridViewToolbarItem Name="Print" ToolTip="Imprimir" Text="Imprimir">
                                                <Image IconID="print_print_svg_16x16"></Image>
                                            </dx:GridViewToolbarItem>
                            </Items>
                        </dx:GridViewToolbar>
                    </Toolbars>
                </dx:ASPxGridView>

                 <dx:ASPxPopupControl ID="ApcItem" ClientInstanceName="ApcItem" runat="server" Width="500px" HeaderText="Items" 
                    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AutoUpdatePosition="true" Modal="true">
                    <ContentCollection>
                        <dx:PopupControlContentControl runat="server">

                            <dx:ASPxUploadControl ID="UplItem" runat="server" UploadMode="Auto" OnFileUploadComplete="UplItem_FileUploadComplete"
                                AutoStartUpload="true">
                                <ValidationSettings AllowedFileExtensions=".xls, .xlsx " DisableHttpHandlerValidation="true"></ValidationSettings>
                                <ClientSideEvents FilesUploadComplete="function(s, e){ LlamarAsdItem();}" />
                            </dx:ASPxUploadControl>

                            <dx:ASPxButton runat="server"  ID="AbnInyectar" Text="Inyectar Items" AutoPostBack="false" UseSubmitBehavior="false">
                                <ClientSideEvents Click="function (s, e){ InyectarDocumento();}" />
                            </dx:ASPxButton>

                            <dx:ASPxSpreadsheet runat="server" ID="AsdItem" ClientInstanceName="AsdItem" ShowSheetTabs="false" ShowFormulaBar="false" RibbonMode="None" OnCallback="AsdItem_Callback"></dx:ASPxSpreadsheet>

                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>

            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>

    <asp:ObjectDataSource ID="OdsDocumentosGrilla" runat="server" DeleteMethod="Eliminar" SelectMethod="Listar" TypeName="MiApp.Bll.DocumentoBll"
        OnSelected="Ods_Selected" OnDeleted="OdsDocumentosGrilla_Deleted">
        <DeleteParameters>
            <asp:Parameter Name="codigo" Type="Int32"></asp:Parameter>
            <asp:Parameter Direction="Output" Name="salida" Type="Object"></asp:Parameter>
        </DeleteParameters>
        <SelectParameters>
            <asp:Parameter Direction="Output" Name="salida" Type="Object"></asp:Parameter>
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="OdsItems" runat="server" SelectMethod="Listar" TypeName="MiApp.Bll.ItemBll" 
        OnSelected="Ods_Selected">
        <SelectParameters>
            <asp:SessionParameter Name="documentoCodigo" SessionField="documentoCodigo" Type="Int32"></asp:SessionParameter>
            <asp:Parameter Direction="Output" Name="salida" Type="Object"></asp:Parameter>
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="OdsEtapa" runat="server" SelectMethod="Listar" TypeName="MiApp.Bll.EtapaBll" 
        OnSelected="Ods_Selected">
        <SelectParameters>
            <asp:SessionParameter Name="documentoCodigo" SessionField="documentoCodigo" Type="Int32"></asp:SessionParameter>
            <asp:Parameter Direction="Output" Name="salida" Type="Object"></asp:Parameter>
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
