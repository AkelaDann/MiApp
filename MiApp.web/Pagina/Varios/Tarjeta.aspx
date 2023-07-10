﻿<%@ Page Title="Tarjetas" Language="C#" MasterPageFile="~/Pagina/Inicio/Master.Master" AutoEventWireup="true" CodeBehind="Tarjeta.aspx.cs" Inherits="MiApp.web.Pagina.Varios.Tarjeta" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxCallbackPanel ID="AcpTarjeta" runat="server" Width="100%">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxCardView ID="AcwTarjeta" runat="server" Width="100%" AutoGenerateColumns="false" DataSourceID="OdsModulo"
                    Styles-Table-BackColor="#f7f7f7" Border-BorderWidth="0" OnSelectionChanged="AcwTarjeta_SelectionChanged"
                    KeyFieldName="Codigo">
                    <SettingsBehavior AllowSelectByCardClick="true" AllowSelectSingleCardOnly="true" ProcessSelectionChangedOnServer="true" />
                    <Columns>
                        <dx:CardViewTextColumn FieldName="Nombre"></dx:CardViewTextColumn>                        
                        <dx:CardViewTextColumn FieldName="Descripcion" ></dx:CardViewTextColumn>
                        <dx:CardViewImageColumn FieldName="Icono" >
                            <PropertiesImage ImageWidth="150px"></PropertiesImage>
                        </dx:CardViewImageColumn>
                        <dx:CardViewTextColumn FieldName="UrlPrincipal"></dx:CardViewTextColumn>
                    </Columns>
                    <CardLayoutProperties ColumnCount="2">
                        <Items>
                            <dx:CardViewColumnLayoutItem ColumnName="Icono" ShowCaption="False"></dx:CardViewColumnLayoutItem>
                            <dx:CardViewLayoutGroup ShowCaption="False" VerticalAlign="Middle" SettingsItemCaptions-Location="Top"
                                GroupBoxDecoration="None">
                                <Items>
                                    <dx:CardViewColumnLayoutItem ColumnName="Nombre"></dx:CardViewColumnLayoutItem>
                                    <dx:CardViewColumnLayoutItem ColumnName="Descripcion"></dx:CardViewColumnLayoutItem>
                                </Items>
                            </dx:CardViewLayoutGroup>
                        </Items>
                    </CardLayoutProperties>
                </dx:ASPxCardView>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
    <asp:ObjectDataSource ID="OdsModulo" runat="server" SelectMethod="Listar" TypeName="MiApp.Bll.ModuloBll">
        <SelectParameters>
            <asp:Parameter Direction="Output" Name="salida" Type="Object"></asp:Parameter>
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
