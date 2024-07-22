<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrabajadoresListadoBajas.aspx.cs" Inherits="Vistas.TrabajadoresListadoBajas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">



        .auto-style1 {
            width: 100%;
        }
        .auto-style10 {
            text-align: center;
            color: #FFFFFF;
            height: 40px;
            background-color: #000000;
        }
        .auto-style3 {
            height: 23px;
            text-align: center;
            background-color: #CCCCCC;
        }
        .auto-style18 {
            height: 23px;
            font-size: x-large;
        }
        .auto-style17 {
            width: 213px;
        }
        .auto-style19 {
            background-color: #000000;
        }
        .auto-style20 {
            height: 23px;
            font-size: x-large;
            text-align: right;
        }
        .auto-style21 {
            font-size: large;
        }
        .auto-style22 {
            height: 23px;
            font-size: large;
            text-align: right;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style10">
                        <h1>Listado de Cervezas Bajas</h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="hlInicio" runat="server" CssClass="auto-style16" NavigateUrl="~/MenuTrabajadores.aspx" style="color: #993333; text-decoration: none">Volver al menu</asp:HyperLink>
                    </td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style18"><strong>Lista de cervezas dadas de baja:</strong></td>
                    <td class="auto-style20"><strong>
                        <asp:Label ID="lblNombre" runat="server" CssClass="auto-style21"></asp:Label>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style17"><strong>Dar de alta una cerveza (codigo): </strong></td>
                    <td>&nbsp;<asp:TextBox ID="txtAltaCerveza" runat="server"></asp:TextBox>
                        &nbsp;<asp:Button ID="btnAceptar" runat="server" style="color: #FFFFFF; background-color: #000000" Text="Aceptar" OnClick="btnAceptar_Click" />
                        &nbsp;
                        <asp:Label ID="lblMensaje" runat="server" CssClass="auto-style22" style="color: #CC0000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17"><strong>Filtrar por marca (opcional):</strong></td>
                    <td>
                        <asp:DropDownList ID="ddlMarcaFiltro" runat="server" Height="19px" Width="139px">
                        </asp:DropDownList>
                        &nbsp;<asp:Button ID="btnFiltro" runat="server" style="color: #FFFFFF; background-color: #000000" Text="Filtrar" OnClick="btnFiltro_Click" />
                        &nbsp;<asp:Button ID="btnMostrarTodo" runat="server" style="color: #FFFFFF; background-color: #000000" Text="Mostrar todos" OnClick="btnMostrarTodo_Click" />
                        &nbsp;<asp:Label ID="lblMensajeFiltro" runat="server" CssClass="auto-style22" style="color: #CC0000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17">
                        <asp:Label ID="lblMensajeGrid" runat="server" CssClass="auto-style22" style="color: #CC0000"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="grdCervezasBajas" runat="server" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" PageSize="7">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style19" colspan="2">
                        <h1></h1>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
