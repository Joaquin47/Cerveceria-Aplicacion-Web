<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrabajadoresEstadisticas.aspx.cs" Inherits="Vistas.TrabajadoresEstadisticas" %>

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
            width: 177px;
        }
        .auto-style18 {
            width: 177px;
            height: 23px;
        }
        .auto-style20 {
            width: 201px;
        }
        .auto-style21 {
            height: 23px;
            width: 201px;
        }
        .auto-style22 {
            width: 201px;
            text-align: center;
        }
        .auto-style23 {
            background-color: #000000;
        }
        .auto-style24 {
            width: 177px;
            font-size: xx-large;
        }
        .auto-style25 {
            color: #993333;
        }
        .auto-style26 {
            color: #FFFFFF;
            background-color: #000000;
        }
        .auto-style27 {
            text-align: right;
        }
        .auto-style28 {
            font-size: large;
        }
        .auto-style29 {
            width: 350px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style10">
                        <h1>Estadisticas</h1>
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
                    <td class="auto-style24"><strong>Estadisticas</strong></td>
                    <td class="auto-style20">&nbsp;</td>
                    <td class="auto-style27" colspan="2"><strong>
                        <asp:Label ID="lblNombre" runat="server" CssClass="auto-style28"></asp:Label>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style17">
                        <asp:DropDownList ID="ddlEstadisticas" runat="server" Height="18px" Width="195px" AutoPostBack="True">
                            <asp:ListItem Value="1">Ganancias Obtenidas</asp:ListItem>
                            <asp:ListItem Value="2">Cervezas Vendidas (Y cantidad)</asp:ListItem>
                            <asp:ListItem Value="3">Ventas Hechas</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style20">&nbsp;</td>
                    <td rowspan="4" class="auto-style29">
                        <asp:GridView ID="grdEstadisticas" runat="server" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnPageIndexChanging="grdEstadisticas_PageIndexChanging" OnSelectedIndexChanging="grdEstadisticas_SelectedIndexChanging" PageSize="5">
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
                    &nbsp;
                    </td>
                    <td rowspan="4">
                        <asp:GridView ID="grdCantidadVentas" runat="server" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" PageSize="5">
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
                    <td class="auto-style18"><strong>Fecha de inicio:</strong></td>
                    <td class="auto-style21">
                        <asp:TextBox ID="txtInicio" runat="server" Width="160px" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17"><strong>Fecha final:</strong></td>
                    <td class="auto-style20">
                        <asp:TextBox ID="txtFinal" runat="server" Width="160px" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17">
                        <asp:Label ID="lblError" runat="server" CssClass="auto-style25"></asp:Label>
                    </td>
                    <td class="auto-style22">
                        <asp:Button ID="btnAplicar" runat="server" CssClass="auto-style26" Height="34px" Text="Aplicar" Width="110px" OnClick="btnAplicar_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style20">&nbsp;</td>
                    <td colspan="2">
                        <strong>
                        <asp:Label ID="lblDetalles" runat="server" CssClass="auto-style28"></asp:Label>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style20">&nbsp;</td>
                    <td rowspan="2" colspan="2">
                        <asp:GridView ID="grdEstad_Detalles" runat="server" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnPageIndexChanging="grdEstad_Detalles_PageIndexChanging" PageSize="5">
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
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style20">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style23" colspan="4">
                        <h1></h1>
                    </td>
                </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
