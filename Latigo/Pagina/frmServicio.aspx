<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmServicio.aspx.cs" Inherits="Latigo.Pagina.frmServicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:MultiView ID="mvPrincipal" ActiveViewIndex="0" runat="server">
        <asp:View ID="v" runat="server">
                <table style="width:100%;">
                    <tr>
                        <td style="font-weight:bold; font-size:medium;text-align:center; width: 661px;">AGREGAR SERVICO</td>
                    </tr>
                    <tr>
                        <asp:Label ID="msg" runat="server" ForeColor="Red"></asp:Label>
                    </tr>
                    <tr>
                        <td style="width: 661px">
                            <table style="width:100%;">
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
