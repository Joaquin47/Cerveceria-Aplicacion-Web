<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuClientes.aspx.cs" Inherits="Vistas.MenuClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
            color: #FFFFFF;
            background-color: #000000;
        }
        .auto-style3 {
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
            text-align: center;
        }
        .auto-style5 {
            font-size: x-large;
        }
        .auto-style6 {
            font-size: large;
        }
        .auto-style8 {
            width: 1210px;
        }
        .auto-style7 {
            width: 1247px;
        }
        .auto-style9 {
            height: 23px;
            text-align: center;
            background-color: #000000;
        }
        .auto-style10 {
            width: 1164px;
        }
        .auto-style11 {
            text-decoration: none;
            color: #0000CC;
        }
        .auto-style12 {
            height: 23px;
            text-align: left;
        }
        .auto-style13 {
            width: 1164px;
            color: #0000CC;
        }
        .auto-style14 {
            text-decoration: none;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <h1>Menu de Clientes</h1>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style4"><span class="auto-style5"><strong>Bienvenid@&nbsp; </strong></span><strong>
                    <asp:Label ID="lblNombre" runat="server" CssClass="auto-style5"></asp:Label>
                    &nbsp;</strong></td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12"><span class="auto-style6"><strong>Opciones:</strong></span><ul>
                    <li class="auto-style8">
                        <asp:HyperLink ID="hlCompras" runat="server" CssClass="auto-style13" NavigateUrl="~/ClienteComprar.aspx" style="text-decoration: none; ">Sitio de compras</asp:HyperLink>
                        &nbsp;</li>
                    <li class="auto-style10">
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style11" NavigateUrl="~/ClienteCarrito.aspx">Mi carrito</asp:HyperLink>
                    </li>
                    <li class="auto-style7">
                        <asp:HyperLink ID="hlListadoCompras" runat="server" CssClass="auto-style13" NavigateUrl="~/ClienteListaCompras.aspx" style="text-decoration: none; ">Listado de sus compras</asp:HyperLink>
                    </li>
                    <li class="auto-style7">
                        <asp:LinkButton ID="lbSalir" runat="server" CssClass="auto-style14" OnClick="lbSalir_Click">Salir</asp:LinkButton>
                    </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <h1></h1>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
