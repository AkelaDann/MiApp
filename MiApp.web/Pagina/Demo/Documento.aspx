﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina/Inicio/Master.Master" AutoEventWireup="true" CodeBehind="Documento.aspx.cs" Inherits="MiApp.web.Pagina.Demo.Documento" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/Pagina/Demo/Documento.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxCallbackPanel ID="AcpDocumento" ClientInstanceName="AcpDocumento" runat="server" Width="100%" OnCallback="AcpDocumento_Callback">
        <ClientSideEvents EndCallback="function(s, e){ EndCallbackAcpDocumento(s);}" />
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxFormLayout ID="AflDocumento" ClientInstanceName="AflDocumento" runat="server" Width="100%">
                    <Items>
                        <dx:LayoutGroup Caption="Ingreso Documento" ColumnCount="4" Width="100%">
                            <GridSettings StretchLastItem="True" ChangeCaptionLocationAtWidth="660">
                                <Breakpoints>
                                    <dx:LayoutBreakpoint Name="s" MaxWidth="768" ColumnCount="2" />
                                    <dx:LayoutBreakpoint Name="m" MaxWidth="992" ColumnCount="3" />
                                    <dx:LayoutBreakpoint Name="l" MaxWidth="1200" ColumnCount="4" />
                                </Breakpoints>
                            </GridSettings>
                            <Items>
                                <dx:LayoutItem Caption="Tipo" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox runat="server" ID="AcbTipoDocumento" DataSourceID="OdsTipoDocumento" ValueField="Codigo" TextField="Glosa">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {OnTipoDocumentoChanged(s);}"></ClientSideEvents>
                                                <ValidationSettings Display="Dynamic" RequiredField-IsRequired="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                                    RequiredField-ErrorText="Seleccione Tipo Documento" />
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Persona" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox runat="server" ID="AcbPersona" ClientInstanceName="AcbPersona" OnCallback="AcbPersona_Callback" ValueField="Rut" TextField="Nombre" OnInit="AcbPersona_Init">
                                                <ClientSideEvents EndCallback="function(s, e){ EndCallbackAcpDocumento(s);}" />
                                                <ValidationSettings Display="Dynamic" RequiredField-IsRequired="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                                    RequiredField-ErrorText="Seleccione Persona" />
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Etapas" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTokenBox runat="server" ID="AtbEtapa" ItemValueType="System.Int32" TextField="Glosa" ValueField="Codigo" DataSourceID="OdsEtapa">
                                                <ValidationSettings Display="Dynamic" RequiredField-IsRequired="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                                    RequiredField-ErrorText="Seleccione almenos una etapa" />
                                            </dx:ASPxTokenBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Emisi&#243;n" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxDateEdit runat="server" ID="AdeEmision" UseMaskBehavior="true" >
                                                <ValidationSettings Display="Dynamic" RequiredField-IsRequired="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                                    RequiredField-ErrorText="Seleccione una fecha valida" />
                                            </dx:ASPxDateEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutGroup Caption="Rango de Fechas" ColumnCount="2">
                                    <SpanRules>
                                        <dx:SpanRule BreakpointName="s" ColumnSpan="1" RowSpan="2" />
                                        <dx:SpanRule BreakpointName="m" ColumnSpan="2" RowSpan="2" />
                                        <dx:SpanRule BreakpointName="l" ColumnSpan="2" RowSpan="2" />
                                    </SpanRules>
                                    <GridSettings StretchLastItem="True" ChangeCaptionLocationAtWidth="660">
                                        <Breakpoints>
                                            <dx:LayoutBreakpoint Name="s" MaxWidth="768" ColumnCount="1" />
                                            <dx:LayoutBreakpoint Name="m" MaxWidth="992" ColumnCount="2" />
                                        </Breakpoints>
                                    </GridSettings>
                                    <Items>
                                        <dx:LayoutItem Caption="Desde" ColSpan="1">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxDateEdit runat="server" ID="AdeDesde">
                                                        <ValidationSettings Display="Dynamic" RequiredField-IsRequired="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                                            RequiredField-ErrorText="Seleccione fecha valida" />
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Hasta" ColSpan="1">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxDateEdit runat="server" ID="AdeHasta" >
                                                        <DateRangeSettings StartDateEditID ="AdeDesde" />
                                                        <ValidationSettings Display="Dynamic" RequiredField-IsRequired="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                                    RequiredField-ErrorText="Seleccione  fecha valida" />
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutItem Caption="Referencia" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxSpinEdit runat="server" ID="AseReferencia" MaxLength="9" NumberType="Integer" >
                                                <SpinButtons ShowIncrementButtons="false" ></SpinButtons>
                                                <ValidationSettings Display="Dynamic" RequiredField-IsRequired="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                                    RequiredField-ErrorText="ingrese una referencia" />
                                            </dx:ASPxSpinEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Descuento" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxSpinEdit runat="server" ID="AseDescuento" DisplayFormatString="{0}%" MinValue="0" MaxValue="100" MaxLength="3" NumberType="Float">
                                                <ValidationSettings Display="Dynamic" RequiredField-IsRequired="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                                    RequiredField-ErrorText="Indique Descuento" />
                                            </dx:ASPxSpinEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Clasificaci&#243;n" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxRadioButtonList runat="server" ID="ArlClasificacion">
                                                <Items>
                                                    <dx:ListEditItem Text="Nula" Value="N" Selected="true"/>
                                                    <dx:ListEditItem Text="Baja" Value="B" />
                                                    <dx:ListEditItem Text="Media" Value="M" />
                                                    <dx:ListEditItem Text="Alta" Value="A" />
                                                    <dx:ListEditItem Text="En llamas" Value="L" />
                                                </Items>
                                                <ValidationSettings Display="Dynamic" RequiredField-IsRequired="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                                    RequiredField-ErrorText="Seleccione una Clasificacion" />
                                            </dx:ASPxRadioButtonList>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Marcado" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxCheckBox runat="server" AccessibilityLabelText="" CheckState="Unchecked" ID="AcbMarcado"></dx:ASPxCheckBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Glosa" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox runat="server" ID="AtxGlosa" MaxLength="150">
                                                <ValidationSettings Display="Dynamic" RequiredField-IsRequired="true" ErrorDisplayMode="Text" ErrorTextPosition="Bottom"
                                                    RequiredField-ErrorText="Indique una glosa" />
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="False" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxButton runat="server" ID="AbnItem" ClientInstanceName="AbnItem" Text="Agregar Items" AutoPostBack="false" UseSubmitBehavior="false">
                                                <ClientSideEvents Click="function(s, e) { OnItemsClick(); }" />
                                            </dx:ASPxButton>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="False" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxButton runat="server" ID="AbnGuardar"  ClientInstanceName="AbnGuardar" Text="Guardar" AutoPostBack="false" UseSubmitBehavior="false">
                                                <ClientSideEvents Click ="function(s, e){ Guardar(); }"/>
                                            </dx:ASPxButton>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                </dx:ASPxFormLayout>

                <dx:ASPxPopupControl ID="ApcItem" ClientInstanceName="ApcItem" runat="server" Width="500px" HeaderText="Items" 
                    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AutoUpdatePosition="true" Modal="true">
                    <ContentCollection>
                        <dx:PopupControlContentControl runat="server">
                            <dx:ASPxGridView ID="AgvItems" runat="server" Width="100%" KeyFieldName="Correlativo" AutoGenerateColumns="false"
                                OnInit="AgvItems_Init" OnRowInserting="AgvItems_RowInserting" OnRowUpdating="AgvItems_RowUpdating" OnRowDeleting="AgvItems_RowDeleting">
                                <ClientSideEvents EndCallback="function(s, e){EndCallbackAcpDocumento(s);}" />
                                <SettingsBehavior AllowFocusedRow="true" />
                                <Columns>
                                    <dx:GridViewDataSpinEditColumn FieldName="Correlativo" VisibleIndex="0" EditFormSettings-Visible="False" Width="10%">
                                        <PropertiesSpinEdit DisplayFormatString="g"></PropertiesSpinEdit>
                                    </dx:GridViewDataSpinEditColumn>
                                    <dx:GridViewDataTextColumn FieldName="Glosa" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                    <dx:GridViewDataSpinEditColumn FieldName="Valor" VisibleIndex="2" >
                                        <PropertiesSpinEdit DisplayFormatString="g"></PropertiesSpinEdit>
                                    </dx:GridViewDataSpinEditColumn>
                                </Columns>
                                <Toolbars>
                                    <dx:GridViewToolbar>
                                        <Items>
                                            <dx:GridViewToolbarItem Command="New"></dx:GridViewToolbarItem>
                                            <dx:GridViewToolbarItem Command="Edit"></dx:GridViewToolbarItem>
                                            <dx:GridViewToolbarItem Command="Delete"></dx:GridViewToolbarItem>
                                        </Items>
                                    </dx:GridViewToolbar>
                                </Toolbars>
                            </dx:ASPxGridView>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>

                <asp:ObjectDataSource runat="server" ID="OdsTipoDocumento" SelectMethod="Listar" TypeName="MiApp.Bll.TipoDocumentoBll">
                    <SelectParameters>
                        <asp:Parameter Direction="Output" Name="salida" Type="Object"></asp:Parameter>
                    </SelectParameters>
                </asp:ObjectDataSource>

                <asp:ObjectDataSource runat="server" ID="OdsEtapa" SelectMethod="Listar" TypeName="MiApp.Bll.EtapaBll">
                    <SelectParameters>
                        <asp:Parameter Direction="Output" Name="salida" Type="Object"></asp:Parameter>
                    </SelectParameters>
                </asp:ObjectDataSource>

            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
</asp:Content>
 