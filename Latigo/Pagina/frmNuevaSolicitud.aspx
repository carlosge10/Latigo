<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmNuevaSolicitud.aspx.cs" Inherits="Latigo.Pagina.frmServicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:MultiView ID="mvPrincipal" ActiveViewIndex="0" runat="server">
        <asp:View ID="v" runat="server">
                <table style="width:100%;">
                    <tr>
                        <td style="font-weight:bold; font-size:medium;text-align:center; width: 661px;">NUEVA SOLICITUD</td>
                    </tr>
                    <tr>
                        <asp:Label ID="msg" runat="server" ForeColor="Red"></asp:Label>
                    </tr>
                    <tr>
                        <td style="width: 661px">
                            <table style="width:100%;">
                                <tr>
                                    <td><asp:TextBox runat="server" ID="tbServiceFilter" placeholder="Filtra servicio" Width="204px"></asp:TextBox></td> <td><asp:Button runat="server" ID="btnFilter" Text="Filtrar" OnClick="btnFilter_Click"/></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlServicio" Height="16px" Width="204px" DataSourceID="SDSServicios" DataTextField="Nombre" DataValueField="Id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SDSServicios" runat="server" ConnectionString="<%$ ConnectionStrings:LatigoConnectionString %>" SelectCommand="SELECT [Nombre], [Id] FROM [Servicio]"></asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:Button runat="server" ID="btnAgregarServicio" Text="Agregar" OnClick="btnAgregarServicio_Click"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label runat="server" ID="lblElementos"></asp:Label>
                                        <asp:HiddenField runat="server" ID="hfIdsElementos"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
