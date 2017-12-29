<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmMisSolicitudes.aspx.cs" Inherits="Latigo.Pagina.Catalogo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <asp:MultiView ID="mvPrincipal" ActiveViewIndex="0" runat="server">
            <asp:View ID="vSolicitudes" runat="server">
                    <table style="width:100%;">
                        <tr>
                            <td style="font-weight:bold; font-size:medium;text-align:center; width: 661px;">MIS SOLICITUDES</td>
                        </tr>
                        <tr>
                            <asp:Label ID="msg" runat="server" ForeColor="Red"></asp:Label>
                        </tr>
                        <tr>
                            <td style="width: 661px">
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SDS_Catalogo" ForeColor="Black" GridLines="Vertical" Width="100%" AllowPaging="True" AllowSorting="True" PageSize="15" OnSelectedIndexChanged="indexChanged">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Modificar" InsertVisible="False" SortExpression="Id">
                                                        <ItemTemplate>                                        
                                                                <asp:LinkButton ID="lbIdUsuario" runat="server" Text="Modificar" OnClick="method" CommandArgument='<%# Bind("Id") %>'/>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    
                                                    <asp:BoundField DataField="NombreUsuario" HeaderText="Nombre de Usuario" SortExpression="NombreUsuario" />
                                                    <asp:BoundField DataField="Mensaje" HeaderText="Mensaje" SortExpression="Mensaje" />
                                                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                                                    <asp:BoundField DataField="Estatus" HeaderText="Estatus" SortExpression="Estatus" />
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
                            </td>
                        </tr>
                    </table>
            </asp:View>

            <asp:View ID="vDetalleSolicitud" runat="server">
                <table style="width:100%;">
                    <tr>
                        <td style="font-weight:bold; font-size:medium;text-align:center; width: 661px;">NUEVA SOLICITUD</td>
                    </tr>
                    <tr>
                        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        Busca un servicio
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" id="tbServiceFilter" style="width:220px"> </asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Button runat="server" id="Filter" text="Buscar"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Servicio
                                    </td>
                                    <td colspan="2">
                                        <asp:DropDownList runat="server" ID="ddlServiceList" DataSourceID="SDS_Catalogo" style="width:295px" ></asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 22px">Fecha</td>
                                    <td style="height: 22px"><asp:Calendar ID="calFecha" runat="server"></asp:Calendar></td>
                                </tr>
                                <tr>
                                    <td>Estatus</td>
                                    <td><asp:Label ID="lblStatus" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:View>

        </asp:MultiView>

        <div>
            <asp:SqlDataSource ID="SDS_Catalogo" runat="server" ConnectionString="<%$ ConnectionStrings:LatigoConnectionString %>" SelectCommand="">
            </asp:SqlDataSource>
            <asp:HiddenField ID="hfIdCatalogo" runat="server" />

        </div>

</asp:Content>
