<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Latigo._Default" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

                <p class="validation-summary-errors">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
                    <ul>
                        


                        <li>
                            <asp:Label ID="Label2" runat="server" AssociatedControlID="UserName">Usuario</asp:Label>
                            <asp:TextBox runat="server" ID="UserName" OnTextChanged="UserName_TextChanged" AutoPostBack="True" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="El campo de nombre de usuario es obligatorio." />
                        </li>
                        <li>
                            <asp:Label ID="Label3" runat="server" AssociatedControlID="Password">Contraseña</asp:Label>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="El campo de contraseña es obligatorio." />
                        </li>
                    </ul>
                       <asp:Panel ID="panelSucursal" runat="server" Visible="false">

                            <asp:Label ID="Label1" runat="server" AssociatedControlID="Password">Sucursal</asp:Label>
                            <asp:DropDownList ID="ddlSucursales" runat="server" Height="30px" Width="294px" AutoPostBack="True" DataSourceID="SDS_Sucursales" DataTextField="Nombre" DataValueField="Id"></asp:DropDownList>
                            <asp:SqlDataSource ID="SDS_Sucursales" runat="server" ConnectionString="<%$ ConnectionStrings:LatigoConnectionString %>" SelectCommand="SELECT Lugar.Nombre, Lugar.Id FROM Lugar ORDER BY Lugar.Nombre"></asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlSucursales" CssClass="field-validation-error" ErrorMessage="El campo de sucursal es obligatorio." />
                        </asp:Panel>
                        <br />
                    <asp:Label ID="lblAviso" runat="server" Font-Bold="True" ForeColor="#CC3300"></asp:Label>
<!--                    <br /><br />-->
                    <asp:Button ID="btnLogin" runat="server" Text="Iniciar sesión" OnClick="btnLogin_Click" />
</asp:Content>

