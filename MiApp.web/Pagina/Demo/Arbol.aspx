﻿<%@ Page Title="Arbol" Language="C#" MasterPageFile="~/Pagina/Inicio/Master.Master" AutoEventWireup="true" CodeBehind="Arbol.aspx.cs" Inherits="MiApp.web.Pagina.Demo.Arbol" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v21.2, Version=21.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxCallbackPanel ID="AcpArbol" runat="server" Width="100%">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxTreeList runat="server" ID="AtlArbol" AutoGenerateColumns="false" DataSourceID="OdsArbol" ParentFieldName="Padre" KeyFieldName="Codigo">
                    <Columns>
                        <dx:TreeListTextColumn FieldName="Codigo" AutoFilterCondition="Default" ShowInFilterControl="Default" VisibleIndex="0"></dx:TreeListTextColumn>
                        <dx:TreeListTextColumn FieldName="Nombre" AutoFilterCondition="Default" ShowInFilterControl="Default" VisibleIndex="1"></dx:TreeListTextColumn>
                        <dx:TreeListTextColumn FieldName="Padre" AutoFilterCondition="Default" ShowInFilterControl="Default" VisibleIndex="2"></dx:TreeListTextColumn>
                        <dx:TreeListTextColumn FieldName="Url" AutoFilterCondition="Default" ShowInFilterControl="Default" VisibleIndex="3"></dx:TreeListTextColumn>                        
                    </Columns>
                    <SettingsBehavior ExpandCollapseAction="NodeClick" />
                    <SettingsSelection Enabled="true" Recursive="true" />
                </dx:ASPxTreeList>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
    <asp:ObjectDataSource runat="server" ID="OdsArbol" SelectMethod="Listar" TypeName="MiApp.Bll.ArbolBll">
        <SelectParameters>
            <asp:Parameter Direction="Output" Name="salida" Type="Object"></asp:Parameter>
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
