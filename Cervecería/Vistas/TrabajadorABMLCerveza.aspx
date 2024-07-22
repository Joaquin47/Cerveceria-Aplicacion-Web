<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrabajadorABMLCerveza.aspx.cs" Inherits="Vistas.TrabajadorABMLCerveza" %>

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
            height: 23px;
            text-align: center;
            background-color: #CCCCCC;
            width: 636px;
        }
        .auto-style19 {
            width: 200px;
        }
        .auto-style20 {
            width: 140px;
        }
        .auto-style21 {
            width: 20px;
            background-color: #000000;
        }
        .auto-style22 {
            color: #CC0000;
        }
        .auto-style23 {
            width: 200px;
            text-align: center;
            height: 44px;
        }
        .auto-style24 {
            color: #FFFFFF;
            background-color: #000000;
        }
        .auto-style26 {
            width: 200px;
            height: 42px;
        }
        .auto-style27 {
            width: 140px;
            height: 42px;
        }
        .auto-style28 {
            height: 42px;
        }
        .auto-style29 {
            width: 181px;
            height: 44px;
        }
        .auto-style30 {
            height: 44px;
        }
        .auto-style31 {
            background-color: #000000;
        }
        .auto-style32 {
            width: 181px;
            font-size: x-large;
        }
        .auto-style33 {
            width: 181px;
        }
        .auto-style34 {
            width: 181px;
            height: 42px;
        }
        .auto-style35 {
            text-align: right;
        }
        .auto-style36 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style10" colspan="2">
                        <h1>ABML Cervezas</h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17">
                        <asp:HyperLink ID="hlInicio" runat="server" CssClass="auto-style16" NavigateUrl="~/MenuTrabajadores.aspx">Volver al menu</asp:HyperLink>
                    </td>
                    <td class="auto-style3">
                        <asp:HyperLink ID="hlCompras" runat="server" CssClass="auto-style16" NavigateUrl="~/TrabajadoresListadoBajas.aspx">Ver cervezas en baja</asp:HyperLink>
                    </td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style32"><strong>Lista de Cervezas</strong></td>
                    <td colspan="4" class="auto-style35"><strong>
                        <asp:Label ID="lblNombre" runat="server" CssClass="auto-style36"></asp:Label>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style33"><strong>Agregar Cerveza:</strong></td>
                    <td colspan="4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style33">Marca: </td>
                    <td class="auto-style19">
                        <asp:DropDownList ID="ddlMarca" runat="server" Width="175px" AutoPostBack="True" OnSelectedIndexChanged="ddlMarca_SelectedIndexChanged" ValidationGroup="Grupo1">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style20">
                        <asp:Label ID="lblMarca" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvMarca" runat="server" CssClass="auto-style22" ControlToValidate="ddlMarca" InitialValue="0" ValidationGroup="Grupo1">Seleccione una marca</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style21" rowspan="5">&nbsp;</td>
                    <td>Buscar por marca:
                        <asp:DropDownList ID="ddlBuscarMarca" runat="server" Width="180px" ValidationGroup="Grupo2">
                        </asp:DropDownList>
&nbsp;<asp:Button ID="btnAceptarBuscar" runat="server" CssClass="auto-style24" Text="Filtrar" OnClick="btnAceptarBuscar_Click" ValidationGroup="Grupo2" />
&nbsp;<asp:Button ID="btnMostrarTodos" runat="server" CssClass="auto-style24" Text="Mostrar Todos" OnClick="btnMostrarTodos_Click" />
&nbsp;<asp:RequiredFieldValidator ID="rfvBuscMarca" runat="server" CssClass="auto-style22" ControlToValidate="ddlBuscarMarca" InitialValue="0" ValidationGroup="Grupo2">Seleccione una marca</asp:RequiredFieldValidator>
                    &nbsp;<asp:Label ID="lblBuscaMarca" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style33">Tipo: </td>
                    <td class="auto-style19">
                        <asp:DropDownList ID="ddlTipo" runat="server" Width="175px" ValidationGroup="Grupo1">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style20">
                        <asp:Label ID="lblTipo" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvTipo" runat="server" CssClass="auto-style22" ControlToValidate="ddlTipo" InitialValue="0" ValidationGroup="Grupo1">Seleccione un tipo</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style34">Precio Unitario: </td>
                    <td class="auto-style26">
                        <asp:TextBox ID="txtPrecioUnitario" runat="server" Width="165px" ValidationGroup="Grupo1"></asp:TextBox>
                    </td>
                    <td class="auto-style27">
                        <asp:Label ID="lblPrecioUnit" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvPrecioUnitario" runat="server" CssClass="auto-style22" ControlToValidate="txtPrecioUnitario" ValidationGroup="Grupo1">Complete el campo</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style28"></td>
                </tr>
                <tr>
                    <td class="auto-style33">Stock disponible: </td>
                    <td class="auto-style19">
                        <asp:TextBox ID="txtStockDisponible" runat="server" Width="165px" ValidationGroup="Grupo1"></asp:TextBox>
                    </td>
                    <td class="auto-style20">
                        <asp:Label ID="lblStockDisponible" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvStock" runat="server" CssClass="auto-style22" ControlToValidate="txtStockDisponible" ValidationGroup="Grupo1">Complete el campo</asp:RequiredFieldValidator>
                    </td>
                    <td>Dar de baja Cerveza (codigo):
                        <asp:TextBox ID="txtBajaCerveza" runat="server" Width="181px"></asp:TextBox>
&nbsp;&nbsp;<asp:Button ID="btnAceptarBaja" runat="server" Text="Aceptar" CssClass="auto-style24" OnClick="btnAceptarBaja_Click" />
&nbsp;<asp:Label ID="lblMensajeBaja" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style33">Url Imagen:</td>
                    <td class="auto-style19">
                        <asp:TextBox ID="txtImagen" runat="server" Width="165px" ValidationGroup="Grupo1"></asp:TextBox>
                    </td>
                    <td class="auto-style20">
                        <asp:Label ID="lblUrlImagen" runat="server"></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvUrlImag" runat="server" CssClass="auto-style22" ControlToValidate="txtImagen" ValidationGroup="Grupo1">Complete el campo</asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style29">
                        <asp:Label ID="lbl_Error_Edicion" runat="server" ForeColor="#CC0000"></asp:Label>
                        <br />
                        <asp:Label ID="lbl_Error_Edicion2" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                    <td class="auto-style23">
                        <asp:Label ID="lblAgregado" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style30" colspan="3">
                        <asp:Button ID="btnAgregar" runat="server" CssClass="auto-style24" Height="40px" Text="Agregar" Width="110px" OnClick="btnAgregar_Click" ValidationGroup="Grupo1" />
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:GridView ID="grdCervezas" runat="server" AllowPaging="True" AutoGenerateEditButton="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" OnPageIndexChanging="grdCervezas_PageIndexChanging" OnRowCancelingEdit="grdCervezas_RowCancelingEdit" OnRowDataBound="grdCervezas_RowDataBound" OnRowEditing="grdCervezas_RowEditing" OnRowUpdating="grdCervezas_RowUpdating">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:TemplateField HeaderText="Codigo Cerveza">
                                    <EditItemTemplate>
                                        <asp:Label ID="lbl_eit_CodCerv" runat="server" Text='<%# Bind("CodigoCerveza") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_CodigoCer" runat="server" Text='<%# Bind("CodigoCerveza") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Marca">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_eit_CodMarca" runat="server" OnSelectedIndexChanged="ddl_eit_CodMarca_SelectedIndexChanged" AutoPostBack="True">
                                        </asp:DropDownList>
                                        &nbsp;<asp:Label ID="lbl_eit_CodMarca" runat="server" Text='<%# Bind("CodigoMarca") %>' Visible="False"></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_CodMarca" runat="server" Text='<%# Bind("Marca") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tipo">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_eit_CodTipo" runat="server">
                                        </asp:DropDownList>
                                        <asp:Label ID="lbl_eit_CodTipo" runat="server" Text='<%# Bind("CodigoTipo") %>' Visible="False"></asp:Label>
                                        &nbsp;<asp:Label ID="lbl_eit_NomTipo" runat="server" Text='<%# Bind("Tipo") %>' Visible="False"></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_CodTipo" runat="server" Text='<%# Bind("Tipo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Precio Unitario">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_PrecioU" runat="server" Height="20px" Text='<%# Bind("PrecioUnitario") %>' Width="205px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_PrecioU" runat="server" Text='<%# Bind("PrecioUnitario") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Stock Disponible">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Stock" runat="server" Height="20px" Text='<%# Bind("Stock") %>' Width="205px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Stock" runat="server" Text='<%# Bind("Stock") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Url Imagen">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_eit_Url" runat="server" Height="20px" Text='<%# Bind("URLimagen") %>' Width="205px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Url" runat="server" Text='<%# Bind("URLimagen") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chk_eit_Estado" runat="server" Checked='<%# Bind("Estado") %>' Enabled="False" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk_it_Estado" runat="server" Checked='<%# Bind("Estado") %>' Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
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
                    <td class="auto-style31" colspan="5">
                        <h1></h1>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
