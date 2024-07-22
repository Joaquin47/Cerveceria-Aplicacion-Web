<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClienteListaCompras.aspx.cs" Inherits="Vistas.ClienteListaCompras" %>

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
        .auto-style17 {
            height: 23px;
            text-align: center;
        }
        .auto-style19 {
            font-size: large;
        }
        .auto-style18 {
            background-color: #000000;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style10" colspan="2">
                        <h1>Mis Compras</h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="hlInicio" runat="server" CssClass="auto-style16" NavigateUrl="~/MenuClientes.aspx" style="color: #993333; text-decoration: none">Volver al menu</asp:HyperLink>
                    </td>
                    <td class="auto-style3">
                        <asp:HyperLink ID="hlCompras" runat="server" CssClass="auto-style16" NavigateUrl="~/ClienteComprar.aspx" style="color: #993333; text-decoration: none">Volver a comprar</asp:HyperLink>
                    </td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style17"><strong><span class="auto-style19">Compras realizadas de: </span>
                        <asp:Label ID="lblNombre" runat="server" CssClass="auto-style19"></asp:Label>
                        </strong></td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="grdCompras" runat="server" AllowPaging="True" AutoGenerateSelectButton="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnPageIndexChanging="grdCompras_PageIndexChanging" OnSelectedIndexChanging="grdCompras_SelectedIndexChanging" PageSize="5">
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
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><strong>
                        <asp:Label ID="lblDetalle" runat="server"></asp:Label>
                        </strong></td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="grdDetalleCompras" runat="server" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnPageIndexChanging="grdDetalleCompras_PageIndexChanging" PageSize="5">
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
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style18">
                        <h1></h1>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
