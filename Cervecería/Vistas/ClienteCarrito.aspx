<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClienteCarrito.aspx.cs" Inherits="Vistas.ClienteCarrito" %>

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
        .auto-style4 {
            height: 23px;
            text-align: center;
        }
        .auto-style5 {
            text-align: left;
        }
        .auto-style6 {
            height: 23px;
            text-align: left;
        }
        .auto-style7 {
            height: 23px;
            text-align: left;
            background-color: #000000;
        }
        .auto-style8 {
            color: #FFFFFF;
            font-size: large;
            font-weight: bold;
            font-style: italic;
            background-color: #000000;
        }
        .auto-style9 {
            height: 23px;
            text-align: center;
            font-size: x-large;
        }
        .auto-style16 {
            text-decoration: none;
            color: #993333;
        }
        .auto-style17 {
            height: 23px;
            text-align: center;
            background-color: #CCCCCC;
        }
        .auto-style18 {
            height: 23px;
            text-align: center;
            width: 649px;
            background-color: #CCCCCC;
        }
        .auto-style19 {
            font-size: large;
            color: #FFFFFF;
            background-color: #000000;
        }
        .auto-style20 {
            color: #CC0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2" colspan="2">
                        <h1>Carrito de
                            <asp:Label ID="lblNombre" runat="server"></asp:Label>
                        </h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">
                        <asp:HyperLink ID="hlInicio" runat="server" CssClass="auto-style16" NavigateUrl="~/MenuClientes.aspx">Volver al menu</asp:HyperLink>
                    </td>
                    <td class="auto-style17">
                        <asp:HyperLink ID="hlCompras" runat="server" CssClass="auto-style16" NavigateUrl="~/ClienteComprar.aspx">Volver a comprar</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" colspan="2"><strong>Detalle de la compra</strong></td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="2">
                        <asp:GridView ID="grdCarrito" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
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
                        <div class="auto-style5">
                            <asp:Label ID="lblMensaje" runat="server" ForeColor="#CC0000"></asp:Label>
                            <br />
                            <asp:Label ID="lblPrecioTotal" runat="server"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="2">
                        <strong><span class="auto-style19">Seleccione un repartidor para que se ocupe de su compra: </span></strong>
                        <br />
                        <asp:DropDownList ID="ddlRepartidores" runat="server" Width="200px">
                        </asp:DropDownList>
&nbsp;<asp:RequiredFieldValidator ID="rfvRepartidor" runat="server" CssClass="auto-style20" ControlToValidate="ddlRepartidores" InitialValue="0">Si o si seleccione un repartidor</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="2"><strong>
                        <asp:Button ID="btnConfirmar" runat="server" CssClass="auto-style8" Height="38px" Text="Confirmar Compra" Width="245px" OnClick="btnConfirmar_Click" />
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7" colspan="2">
                        <h1></h1>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
