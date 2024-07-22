<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuTrabajadores.aspx.cs" Inherits="Vistas.MenuTrabajadores" %>

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
        .auto-style17 {
            height: 23px;
            text-align: left;
        }
        .auto-style6 {
            font-size: large;
        }
        .auto-style13 {
            width: 1214px;
        }
        .auto-style11 {
            width: 1202px;
        }
        .auto-style12 {
            width: 1235px;
        }
        .auto-style15 {
            width: 1190px;
        }
        .auto-style14 {
            width: 1252px;
        }
        .auto-style7 {
            width: 1155px;
        }
        .auto-style9 {
            text-align: center;
            background-color: #000000;
        }
        .auto-style18 {
            text-decoration: none;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <h1>Menu de Trabajadores</h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style4"><span class="auto-style5"><strong>Bienvenid@&nbsp; </strong></span><strong>
                        <asp:Label ID="lblNombre" runat="server" CssClass="auto-style5"></asp:Label>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17"><span class="auto-style6"><strong>Opciones:</strong></span><ul>
                        <li class="auto-style13">
                            <asp:HyperLink ID="hlABMLCervezas" runat="server" CssClass="auto-style10" NavigateUrl="~/TrabajadorABMLCerveza.aspx" style="text-decoration: none; color: #0000CC; background-color: #FFFFFF">ABML De Cervezas </asp:HyperLink>
                            &nbsp;</li>
                        <li class="auto-style11">
                            <asp:HyperLink ID="hlABMLClientes" runat="server" CssClass="auto-style16" NavigateUrl="~/TrabajadoresABMLClientes.aspx" style="text-decoration: none; color: #0000CC; background-color: #FFFFFF">ABML De Clientes</asp:HyperLink>
                        </li>
                        <li class="auto-style12">
                            <asp:HyperLink ID="hlABMLTrabajadores" runat="server" CssClass="auto-style16" NavigateUrl="~/TrabajadoresABML.aspx" style="text-decoration: none; color: #0000CC; background-color: #FFFFFF">ABML De Trabajadores</asp:HyperLink>
                        </li>
                        <li class="auto-style15">
                            <asp:HyperLink ID="hlVentasDetalles" runat="server" CssClass="auto-style10" NavigateUrl="~/TrabajadoresVentasYDetalles.aspx" style="text-decoration: none; color: #0000CC; background-color: #FFFFFF">Ventas y Detalles</asp:HyperLink>
                        </li>
                        <li class="auto-style14">
                            <asp:HyperLink ID="hlListadoCervbaja" runat="server" CssClass="auto-style10" NavigateUrl="~/TrabajadoresListadoBajas.aspx" style="text-decoration: none; color: #0000CC; background-color: #FFFFFF">Listado de cervezas en baja</asp:HyperLink>
                        </li>
                        <li class="auto-style7">
                            <asp:HyperLink ID="hlEstadisticas" runat="server" CssClass="auto-style10" NavigateUrl="~/TrabajadoresEstadisticas.aspx" style="text-decoration: none; color: #0000CC; background-color: #FFFFFF">Estadisticas</asp:HyperLink>
                        </li>
                        <li class="auto-style7">
                            <asp:LinkButton ID="lbSalir" runat="server" CssClass="auto-style18" OnClick="lbSalir_Click">Salir</asp:LinkButton>
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
        </div>
    </form>
</body>
</html>
