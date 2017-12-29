<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmUsuarios.aspx.cs" Inherits="Latigo.Pagina.frmUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:MultiView ID="mvPrincipal" ActiveViewIndex="0" runat="server">
        <asp:View ID="vListaUsuarios" runat="server">
                <table style="width:100%;">
                    <tr>
                        <td style="font-weight:bold; font-size:medium;text-align:center; width: 661px;">CATALOGO DE USUARIOS</td>
                    </tr>
                    <tr>
                        <asp:Label ID="msg" runat="server" ForeColor="Red"></asp:Label>
                    </tr>
                    <tr>
                        <td style="width: 661px">
                            <table style="width:100%;">
                                <tr>
                                    <td>
                                        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" Width="160px" CssClass="botonAgregar" OnClick="btnAgregar_Click" />
                                    </td>
                                    <td>
                                        <table style="width:100%;">
                                            <tr>
                                                <td style="width:220px;">
                                                    <asp:TextBox ID="tbNombre" runat="server" Width="200px" placeholder="Nombre"></asp:TextBox>
                                                </td>
                                                <td style="width:220px;">
                                                    <asp:TextBox ID="tbUsuario" runat="server" Width="200px" placeholder="Usuario"></asp:TextBox>
                                                </td>
                                                <td style="width:220px;">
                                                    <asp:TextBox ID="tbPass" runat="server" Width="200px" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
                                                </td>
                                                <td style="width:220px;">
                                                    <asp:TextBox ID="tbPassConfirm" runat="server" Width="200px" placeholder="Confirmar Contraseña" TextMode="Password"></asp:TextBox>
                                                </td>
                                                <td style="width:220px;">
                                                    <asp:DropDownList ID="ddlTipos" runat="server" Width="200px" DataSourceID="SDS_TiposUsuario" DataTextField="Nombre" DataValueField="Id">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SDS_TiposUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:LatigoConnectionString %>" SelectCommand="SELECT [Id], [Nombre] FROM [TiposDeUsuario]"></asp:SqlDataSource>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnModificar" runat="server" Text="Modificar" Width="160px" CssClass="botonAgregar" OnClick="btnModificar_Click" visible="false"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-bottom:15px; width:100%;">
                            <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SDS_Usuario" ForeColor="Black" GridLines="Vertical" Width="100%" AllowPaging="True" AllowSorting="True" PageSize="15" OnSelectedIndexChanged="gvUsuarios_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Modificar" InsertVisible="False" SortExpression="Id">
                                        <ItemTemplate>                                        
                                                <asp:LinkButton ID="lbIdUsuario" runat="server" Text="Modificar" OnClick="lbIdUsuario_Click" CommandArgument='<%# Bind("Id") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="NombreUsuario" HeaderText="Nombre de Usuario" SortExpression="NombreUsuario" />
                                    <asp:BoundField DataField="UserName" HeaderText="Usuario" SortExpression="UserName" />
                                    <asp:BoundField DataField="NombreTipo" HeaderText="Tipo de Usuario" SortExpression="NombreTipo" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
        </asp:View>

    </asp:MultiView>

    <asp:SqlDataSource ID="SDS_Usuario" runat="server" ConnectionString="<%$ ConnectionStrings:LatigoConnectionString %>" SelectCommand="SELECT U.Id, U.Nombre As NombreUsuario, UserName, TU.Nombre As NombreTipo FROM Latigo.dbo.Usuario U JOIN TiposDeUsuario TU ON U.Tipo = TU.Id ORDER BY NombreUsuario">

    </asp:SqlDataSource>

    <asp:HiddenField ID="hfIdUsuario" runat="server" />

</asp:Content>
