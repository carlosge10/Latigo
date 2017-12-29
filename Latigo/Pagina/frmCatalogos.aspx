<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmCatalogos.aspx.cs" Inherits="Latigo.Pagina.frmCatalogos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li><asp:button runat="server" onclick="btnClick" style="background-color:dimgrey; font-family:Arial, Helvetica, sans-serif; color:#333333; height:100%; border-width:0px; margin-left:3px; margin-top:9px;" Text="Lugar"></asp:button></li>
                <li><label style="margin-top:9px;">&nbsp; | &nbsp;</label></li>
                <li><asp:button runat="server" onclick="btnClick" style="background-color:dimgrey; font-family:Arial, Helvetica, sans-serif; color:#333333; height:100%; border-width:0px; margin-left:3px; margin-top:9px;" Text="Servicios"></asp:button></li>
                <li><label style="margin-top:9px;">&nbsp; | &nbsp;</label></li>
                <li><asp:button runat="server" onclick="btnClick" style="background-color:dimgrey; font-family:Arial, Helvetica, sans-serif; color:#333333; height:100%; border-width:0px; margin-left:3px; margin-top:9px;" Text="Tipos de Servicios"></asp:button></li>
                <li><label style="margin-top:9px;">&nbsp; | &nbsp;</label></li>
                <li><asp:button runat="server" onclick="btnClick" style="background-color:dimgrey; font-family:Arial, Helvetica, sans-serif; color:#333333; height:100%; border-width:0px; margin-left:3px; margin-top:9px;" Text="Proveedores"></asp:button></li>
                <li><label style="margin-top:9px;">&nbsp; | &nbsp;</label></li>
                <li><asp:button runat="server" onclick="btnClick" style="background-color:dimgrey; font-family:Arial, Helvetica, sans-serif; color:#333333; height:100%; border-width:0px; margin-left:3px; margin-top:9px;" Text="Solicitantes"></asp:button></li>
            </ul>
        </div>
    </nav>

    <asp:MultiView ID="mvPrincipal" ActiveViewIndex="0" runat="server">
        <asp:View ID="vLugares" runat="server">
                <table>
                    <tr>
                        <td style="font-weight:bold; font-size:medium;text-align:center; width: 661px;" colspan="3">LUGARES</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblLugaresMsg" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td><asp:TextBox runat="server" id="tbLugarNombre" style="width:220px" placeholder="Nombre"></asp:TextBox></td>
                        <td><asp:TextBox runat="server" ID="tbLugarDireccion" style="width:220px" placeholder="Direccion"></asp:TextBox></td>
                        <td><asp:Button runat="server" ID="btnAgregarLugar" Text="Agregar" OnClick="btnAgregarLugar_Click"/></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <table>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvLugares" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SDSLugar" ForeColor="Black" GridLines="Vertical" Width="100%" AllowPaging="True" AllowSorting="True" PageSize="15" OnSelectedIndexChanged="indexChanged">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Modificar" InsertVisible="False" SortExpression="Id">
                                                    <ItemTemplate>                                        
                                                            <asp:LinkButton ID="lblLugarModificar" runat="server" Text="Modificar" OnClick="modificarLugar" CommandArgument='<%# Bind("Id") %>'/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Nombre" HeaderText="Nombre de Lugar" SortExpression="Nombre" />
                                                <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
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
        <div>
            <asp:SqlDataSource ID="SDSLugar" runat="server" ConnectionString="<%$ ConnectionStrings:LatigoConnectionString %>" SelectCommand="SELECT Id, Nombre, Direccion FROM Latigo.dbo.Lugar ORDER BY Nombre, Direccion DESC">
            </asp:SqlDataSource>
            <asp:HiddenField ID="hfIDLugar" runat="server" />
        </div>
        </asp:View>

        <asp:View ID="vTiposServicio" runat="server">
            <table >
                <tr>
                    <td style="font-weight:bold; font-size:medium;text-align:center; width: 661px;" colspan="2">AGREGA TIPOS DE SERVICIO</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTipoServicioMsg" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td><asp:TextBox runat="server" ID="tbTipoNombre" placeholder="Tipo de Servicio"></asp:TextBox></td>
                    <td><asp:Button runat="server" ID="btnTipoServicioAgregar" Text="Agregar" OnClick="btnTipoServicioAgregar_Click"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="gvTiposServicio" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SDSTipoServicio" ForeColor="Black" GridLines="Vertical" Width="100%" AllowPaging="True" AllowSorting="True" PageSize="15" OnSelectedIndexChanged="indexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Modificar" InsertVisible="False" SortExpression="Id">
                                    <ItemTemplate>                                        
                                            <asp:LinkButton ID="lblModificarTipoServicio" runat="server" Text="Modificar" OnClick="modificarTipoServicio" CommandArgument='<%# Bind("Id") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Eliminar" InsertVisible="False" SortExpression="Id">
                                    <ItemTemplate>                                        
                                            <asp:LinkButton ID="lblEliminarTipoServicio" runat="server" Text="Eliminar" OnClick="method" CommandArgument='<%# Bind("Id") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Agregar Servicio" InsertVisible="False" SortExpression="Id">
                                    <ItemTemplate>                                        
                                            <asp:LinkButton ID="lblAgregarTipoServicio" runat="server" Text="Agregar" OnClick="agregarServicio" CommandArgument='<%# Bind("Id") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                            
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre del Tipo de Servicio" SortExpression="Nombre" />
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
            <div>
                <asp:SqlDataSource ID="SDSTipoServicio" runat="server" ConnectionString="<%$ ConnectionStrings:LatigoConnectionString %>" SelectCommand="SELECT Id, Nombre FROM Latigo.dbo.TipoServicio ORDER BY Nombre DESC">
                </asp:SqlDataSource>
                <asp:HiddenField ID="hfIDTipoServicio" runat="server" />
            </div>
        </asp:View>

        <asp:View ID="vServicios" runat="server">
                <table >
                    <tr>
                        <td style="font-weight:bold; font-size:medium;text-align:center; width: 661px;" colspan="5">SERVICIOS</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblServiciosMsg" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox runat="server" id="tbServicioNombre" style="width:225px" placeholder="Nombre"> </asp:TextBox>
                        </td>
                        <td >
                            <asp:TextBox runat="server" ID="tbServicioDescripcion" style="width:225px" placeholder="Descripcion"></asp:TextBox>
                        </td>
                        <td >
                            <asp:DropDownList runat="server" ID="ddlTipoServicio" style="width:225px" DataSourceID="SDSTipoServicio" DataTextField="Nombre" DataValueField="Id">

                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button runat="server" ID="btnServiciosAgregar" Text="Agregar" OnClick="btnServiciosAgregar_Click"/>
                        </td>
                        <td>
                            <asp:Button runat="server" ID="btnServiciosGuardar" Text="Regresar"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 661px" colspan="6">
                            <table style="width:100%">
                                <tr >
                                    <td>
                                        <asp:GridView ID="gvServicios" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SDSServicio" ForeColor="Black" GridLines="Vertical" Width="100%" AllowPaging="True" AllowSorting="True" PageSize="15" OnSelectedIndexChanged="indexChanged">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Modificar Proveedores" InsertVisible="False" SortExpression="Id">
                                                    <ItemTemplate>                                        
                                                            <asp:LinkButton ID="lblModificaProveedores" runat="server" Text="Modificar" OnClick="modificarProveedores" CommandArgument='<%# Bind("Id") %>'/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Modificar Servicio" InsertVisible="False" SortExpression="Id">
                                                    <ItemTemplate>                                        
                                                            <asp:LinkButton ID="lblModificarServicios" runat="server" Text="Modificar" OnClick="modificarServicio" CommandArgument='<%# Bind("Id") %>'/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                                                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                                <asp:BoundField DataField="Proveedor" HeaderText="Proveedor Principal" SortExpression="Proveedor" />
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
            <div>
                <asp:SqlDataSource ID="SDSServicio" runat="server" ConnectionString="<%$ ConnectionStrings:LatigoConnectionString %>" SelectCommand="SELECT S.ID, S.Nombre, S.Descripcion, P.Nombre As Proveedor FROM Servicio S LEFT JOIN ServicioProveedor SP ON SP.IDServicio = S.ID  LEFT JOIN Proveedor P ON P.Id = SP.IDProveedor LEFT JOIN TipoServicio TS ON TS.Id = S.IdTipo WHERE SP.Principal = 1 OR SP.Principal IS NULL ORDER BY S.Nombre DESC">
                </asp:SqlDataSource>
                <asp:HiddenField ID="hfIdServicio" runat="server" />
            </div>
        </asp:View>

        <asp:View ID="vProveedor" runat="server">

            <table>
                <tr>
                    <td style="font-weight:bold; font-size:medium;text-align:center; width: 661px;">
                        AGREGA UN PROVEEDOR
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblProveedorMsg" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td><asp:TextBox runat="server" ID="tbProveedorNombre" placeholder="Nombre"></asp:TextBox></td> <td><asp:TextBox runat="server" ID="tbProveedorEmail" placeholder="Email"></asp:TextBox></td> <td><asp:TextBox runat="server" ID="tbProveedorWhatsapp" placeholder="Whatsapp"></asp:TextBox></td> <td><asp:TextBox runat="server" ID="tbProveedorSMS" placeholder="SMS"></asp:TextBox></td> <td><asp:TextBox runat="server" ID="tbProveedorSlack" placeholder="Slack"></asp:TextBox></td><td><asp:CheckBox runat="server" ID="chbProveedorPrincipal" Text="Proveedor Principal"/></td><td><asp:Button runat="server" ID="btnProveedorAgregar" Text="Agregar" OnClick="btnProveedorAgregar_Click"/></td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <asp:GridView ID="gvProveedores" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SDSProveedor" ForeColor="Black" GridLines="Vertical" Width="100%" AllowPaging="True" AllowSorting="True" PageSize="15" OnSelectedIndexChanged="indexChanged">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Modificar Proveedores" InsertVisible="False" SortExpression="Id">
                                                <ItemTemplate>                                        
                                                        <asp:LinkButton ID="lblProveedores" runat="server" Text="Modificar" OnClick="modificarProveedor" CommandArgument='<%# Bind("Id") %>'/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                            <asp:BoundField DataField="Whatsapp" HeaderText="Whatsapp" SortExpression="Whatsapp" />
                                            <asp:BoundField DataField="SMS" HeaderText="SMS" SortExpression="SMS" />
                                            <asp:BoundField DataField="Slack" HeaderText="Slack" SortExpression="Slack" />
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
            <div>
                <asp:SqlDataSource ID="SDSProveedor" runat="server" ConnectionString="<%$ ConnectionStrings:LatigoConnectionString %>" SelectCommand="SELECT Id, Nombre, Email, Whatsapp, SMS, Slack FROM Latigo.dbo.Proveedor ORDER BY Nombre DESC">
                </asp:SqlDataSource>
                <asp:HiddenField ID="hfProveedor" runat="server" />
            </div>

        </asp:View>

    </asp:MultiView>


</asp:Content>
