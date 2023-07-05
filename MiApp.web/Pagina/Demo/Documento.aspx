<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina/Inicio/Master.Master" AutoEventWireup="true" CodeBehind="Documento.aspx.cs" Inherits="MiApp.web.Pagina.Demo.Documento" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/Pagina/Demo/Documento.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxCallbackPanel ID="AcpDocumento" ClientInstanceName="AcpDocumento" runat="server" Width="100%">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxFormLayout ID="AflDocumento" runat="server" Width="100%">
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
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Persona" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxComboBox runat="server" ID="AcbPersona" ClientInstanceName="AcbPersona" OnCallback="AcbPersona_Callback" ValueField="Rut" TextField="Nombre"></dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Etapas" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTokenBox runat="server" ID="AtbEtapa" ItemValueType="System.Int32" TextField="Glosa" ValueField="Codigo" DataSourceID="OdsEtapa"></dx:ASPxTokenBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Emisi&#243;n" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxDateEdit runat="server" ID="AdeEmision" UseMaskBehavior="true" ></dx:ASPxDateEdit>
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
                                                    <dx:ASPxDateEdit runat="server" ID="AdeDesde"></dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Hasta" ColSpan="1">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxDateEdit runat="server" ID="AdeHasta" >
                                                        <DateRangeSettings StartDateEditID ="AdeDesde" />
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
                                            </dx:ASPxSpinEdit>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Descuento" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxSpinEdit runat="server" ID="AseDescuento" DisplayFormatString="{0}%" MinValue="0" MaxValue="100" MaxLength="3" NumberType="Float"></dx:ASPxSpinEdit>
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
                                            </dx:ASPxRadioButtonList>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Marcado" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxCheckBox runat="server" AccessibilityLabelText="" CheckState="Unchecked" ID="AflDocumento_E12"></dx:ASPxCheckBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Glosa" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxTextBox runat="server" ID="AtxGlosa" MaxLength="150"></dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="False" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxButton runat="server" ID="AflDocumento_E14"></dx:ASPxButton>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="False" ColSpan="1">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxButton runat="server" ID="AflDocumento_E15"></dx:ASPxButton>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                </dx:ASPxFormLayout>
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
 