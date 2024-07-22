<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrabajadoresVentasYDetalles.aspx.cs" Inherits="Vistas.TrabajadoresVentasYDetalles" %>

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
        .auto-style16 {
            text-decoration: none;
            color: #993333;
        }
        .auto-style17 {
            width: 230px;
        }
        .auto-style18 {
            background-color: #000000;
        }
        .auto-style19 {
            font-size: x-large;
        }
        .auto-style20 {
            font-size: xx-large;
            text-align: right;
        }
        .auto-style21 {
            width: 230px;
            font-size: large;
        }
        .auto-style22 {
            color: #FFFFFF;
            background-color: #000000;
        }
        .auto-style23 {
            font-size: xx-large;
            width: 230px;
        }
        .auto-style24 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style10">
                        <h1>Ventas Y Detalles</h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="hlInicio" runat="server" CssClass="auto-style16" NavigateUrl="~/MenuTrabajadores.aspx">Volver al menu</asp:HyperLink>
                    </td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style23"><strong>Lista De Ventas</strong></td>
                    <td class="auto-style20"><strong>
                        <asp:Label ID="lblNombre" runat="server" CssClass="auto-style24"></asp:Label>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style21"><strong>Ingrese codigo de la venta:</strong></td>
                    <td>
                        <asp:TextBox ID="txtCodVenta" runat="server" Width="180px"></asp:TextBox>
&nbsp;<asp:Button ID="btnAceptar" runat="server" CssClass="auto-style22" Text="Aceptar" OnClick="btnAceptar_Click" />
&nbsp;<asp:Button ID="btnMostrarTodos" runat="server" CssClass="auto-style22" Text="Mostrar Todos" OnClick="btnMostrarTodos_Click" />
&nbsp;<asp:Label ID="lblMensaje" runat="server" ForeColor="#993333"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="grdVentas" runat="server" AllowPaging="True" AutoGenerateSelectButton="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnPageIndexChanging="grdVentas_PageIndexChanging" OnSelectedIndexChanging="grdVentas_SelectedIndexChanging" PageSize="5">
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
                    <td class="auto-style17">
                        <asp:Label ID="lblDetalles" runat="server" CssClass="auto-style19"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="grdDetalleVen" runat="server" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnPageIndexChanging="grdDetalleVen_PageIndexChanging" PageSize="5">
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
                    <td class="auto-style18" colspan="2">
                        <h1></h1>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
