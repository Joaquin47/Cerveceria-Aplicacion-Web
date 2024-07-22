<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClienteComprar.aspx.cs" Inherits="Vistas.ClienteComprar" %>

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
        }
        .auto-style3 {
            height: 23px;
            text-align: center;
            background-color: #CCCCCC;
        }
        .auto-style4 {
            width: 469px;
        }
        .auto-style5 {
            width: 40px;
            background-color: #993333;
        }
        .auto-style6 {
            width: 118px;
        }
        .auto-style7 {
            width: 80px;
            text-align: center;
        }
        .auto-style8 {
            width: 90px;
            text-align: center;
        }
        .auto-style9 {
            color: #FFFFFF;
            background-color: #000000;
        }
        .auto-style10 {
            text-align: center;
            color: #FFFFFF;
            height: 40px;
            background-color: #000000;
        }
        .auto-style11 {
            font-size: large;
        }
        .auto-style12 {
            font-size: x-large;
            color: #FFFFFF;
            background-color: #000000;
        }
        .auto-style13 {
            height: 33px;
        }
        .auto-style14 {
            font-size: medium;
            color: #FFFFFF;
            background-color: #000000;
        }
        .auto-style15 {
            background-color: #000000;
        }
        .auto-style16 {
            text-decoration: none;
            color: #993333;
        }
        .auto-style19 {
            color: #FFFFFF;
            font-size: x-large;
            background-color: #FFFFFF;
        }
        .auto-style20 {
            width: 280px;
            text-align: center;
        }
        .auto-style21 {
            width: 290px;
        }
        .auto-style22 {
            color: #FFFFFF;
            background-color: #000000;
            font-weight: bold;
        }
        .auto-style23 {
            width: 290px;
            height: 400px;
        }
        .auto-style24 {
            background-color: #C0C0C0;
            font-size: medium;
        }
        .auto-style25 {
            background-color: #CC9900;
        }
        .auto-style26 {
            color: #000000;
            background-color: #FFFFFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style10" colspan="6">
                        <h1><strong>Inventario Disponible</strong></h1>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" colspan="3">
                        <asp:HyperLink ID="hlInicio" runat="server" CssClass="auto-style16" NavigateUrl="~/MenuClientes.aspx">Volver al menu</asp:HyperLink>
&nbsp;</td>
                    <td class="auto-style3" colspan="3">
                        <asp:HyperLink ID="hlCompras" runat="server" CssClass="auto-style16" NavigateUrl="~/ClienteCarrito.aspx">Ver mi carrito</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="6"><strong>
                        <asp:Label ID="lblNombre" runat="server" CssClass="auto-style11"></asp:Label>
                        <span class="auto-style11">, aca podrás comprar las mejores cervezas de tus sueños.</span></strong></td>
                </tr>
                <tr>
                    <td colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"><strong>Busqueda por nombre:</strong>
                        <asp:TextBox ID="txtNombre" runat="server" ValidationGroup="Grupo1"></asp:TextBox>
&nbsp;<asp:Button ID="btnBuscar" runat="server" CssClass="auto-style9" Text="Buscar" OnClick="btnBuscar_Click" ValidationGroup="Grupo1" />
&nbsp;<asp:Button ID="btnMostrarTodo" runat="server" CssClass="auto-style9" Text="Mostrar Todo" OnClick="btnMostrarTodo_Click" />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ForeColor="#CC0000" ControlToValidate="txtNombre" ValidationGroup="Grupo1">Ingrese un nombre</asp:RequiredFieldValidator>
&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6"><strong>Filtrar por precio: </strong></td>
                    <td class="auto-style7">Minimo<asp:TextBox ID="txtMinimo" runat="server" Width="60px"></asp:TextBox>
                    </td>
                    <td class="auto-style8">Maximo<asp:TextBox ID="txtMaximo" runat="server" Width="60px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnFiltroPrecio" runat="server" CssClass="auto-style9" Text="Filtrar por Precio" Width="114px" OnClick="btnFiltroPrecio_Click" />
                        <br />
                        <asp:Label ID="lblMensajePrecio" runat="server" BorderStyle="None" ForeColor="#CC0000"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <strong>
                        <asp:Label ID="lblSeleccionado" runat="server" CssClass="auto-style11"></asp:Label>
                        </strong>
                        <br />
                        <asp:LinkButton ID="lbProdSelec" runat="server" CssClass="auto-style16" OnClick="lbProdSelec_Click">Eliminar productos seleccionados</asp:LinkButton>
&nbsp;
                        <strong>
                        <asp:Label ID="lblEliminados" runat="server" CssClass="auto-style11"></asp:Label>
                        </strong>
                    </td>
                    <td class="auto-style12"><strong>Filtros generales: </strong></td>
                </tr>
                <tr>
                    <td colspan="5" rowspan="5">
                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="codCerveza_Ce" DataSourceID="SqlDataSource1" GroupItemCount="4">
<%--                            <AlternatingItemTemplate>
                                <td runat="server" style="background-color:#FFF8DC;">codCerveza_Ce:
                                    <asp:Label ID="codCerveza_CeLabel" runat="server" Text='<%# Eval("codCerveza_Ce") %>' />
                                    <br />
                                    PrecioUnitario_Ce:
                                    <asp:Label ID="PrecioUnitario_CeLabel" runat="server" Text='<%# Eval("PrecioUnitario_Ce") %>' />
                                    <br />
                                    NombreMarca_MC:
                                    <asp:Label ID="NombreMarca_MCLabel" runat="server" Text='<%# Eval("NombreMarca_MC") %>' />
                                    <br />
                                    NombreTipo_TC:
                                    <asp:Label ID="NombreTipo_TCLabel" runat="server" Text='<%# Eval("NombreTipo_TC") %>' />
                                    <br />
                                    Descripcion_TC:
                                    <asp:Label ID="Descripcion_TCLabel" runat="server" Text='<%# Eval("Descripcion_TC") %>' />
                                    <br />
                                    Url_Imagen_Ce:
                                    <asp:Label ID="Url_Imagen_CeLabel" runat="server" Text='<%# Eval("Url_Imagen_Ce") %>' />
                                    <br />
                                </td>
                            </AlternatingItemTemplate>--%>
                            <EditItemTemplate>
                                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">codCerveza_Ce:
                                    <asp:Label ID="codCerveza_CeLabel1" runat="server" Text='<%# Eval("codCerveza_Ce") %>' />
                                    <br />PrecioUnitario_Ce:
                                    <asp:TextBox ID="PrecioUnitario_CeTextBox" runat="server" Text='<%# Bind("PrecioUnitario_Ce") %>' />
                                    <br />NombreMarca_MC:
                                    <asp:TextBox ID="NombreMarca_MCTextBox" runat="server" Text='<%# Bind("NombreMarca_MC") %>' />
                                    <br />NombreTipo_TC:
                                    <asp:TextBox ID="NombreTipo_TCTextBox" runat="server" Text='<%# Bind("NombreTipo_TC") %>' />
                                    <br />Descripcion_TC:
                                    <asp:TextBox ID="Descripcion_TCTextBox" runat="server" Text='<%# Bind("Descripcion_TC") %>' />
                                    <br />
                                    Url_Imagen_Ce:
                                    <asp:TextBox ID="Url_Imagen_CeTextBox" runat="server" Text='<%# Bind("Url_Imagen_Ce") %>' />
                                    <br />
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                                    <br />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                                    <br />
                                </td>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                    <tr>
                                        <td>No se han devuelto datos.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <EmptyItemTemplate>
<td runat="server" />
                            </EmptyItemTemplate>
                            <GroupTemplate>
                                <tr id="itemPlaceholderContainer" runat="server">
                                    <td id="itemPlaceholder" runat="server"></td>
                                </tr>
                            </GroupTemplate>
                            <InsertItemTemplate>
                                <td runat="server" style="">PrecioUnitario_Ce:
                                    <asp:TextBox ID="PrecioUnitario_CeTextBox" runat="server" Text='<%# Bind("PrecioUnitario_Ce") %>' />
                                    <br />NombreMarca_MC:
                                    <asp:TextBox ID="NombreMarca_MCTextBox" runat="server" Text='<%# Bind("NombreMarca_MC") %>' />
                                    <br />NombreTipo_TC:
                                    <asp:TextBox ID="NombreTipo_TCTextBox" runat="server" Text='<%# Bind("NombreTipo_TC") %>' />
                                    <br />Descripcion_TC:
                                    <asp:TextBox ID="Descripcion_TCTextBox" runat="server" Text='<%# Bind("Descripcion_TC") %>' />
                                    <br />
                                    Url_Imagen_Ce:
                                    <asp:TextBox ID="Url_Imagen_CeTextBox" runat="server" Text='<%# Bind("Url_Imagen_Ce") %>' />
                                    <br />
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                                    <br />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                                    <br />
                                </td>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <td runat="server" style="background-color:#DCDCDC;color: #000000;" class="auto-style20"><span class="auto-style24"><strong><span class="auto-style25">Codigo Unico:</span></strong></span>
                                    <br />
                                    <strong>
                                    <asp:Label ID="codCerveza_CeLabel" runat="server" CssClass="auto-style26" Text='<%# Eval("codCerveza_Ce") %>'></asp:Label>
                                    </strong>
                                    <br />
                                    <asp:Image ID="Image1" runat="server" Height="195px" ImageUrl='<%# Eval("Url_Imagen_Ce") %>' Width="230px" />
                                    <br />
                                    <strong>Precio x Unidad:
                                    <asp:Label ID="PrecioUnitario_CeLabel" runat="server" Text='<%# Eval("PrecioUnitario_Ce") %>'></asp:Label>
                                    <br />
                                    Marca:
                                    <asp:Label ID="NombreMarca_MCLabel" runat="server" Text='<%# Eval("NombreMarca_MC") %>'></asp:Label>
                                    <br />
                                    Tipo de cerveza:
                                    <asp:Label ID="NombreTipo_TCLabel" runat="server" Text='<%# Eval("NombreTipo_TC") %>'></asp:Label>
                                    <br />
                                    Descripcion:
                                    <asp:Label ID="Descripcion_TCLabel" runat="server" Text='<%# Eval("Descripcion_TC") %>'></asp:Label>
                                    <br />
                                    <br />
                                    Cantidad a comprar:<br /></strong>
                                    <asp:TextBox ID="txtCantidad" runat="server" TextMode="Number" Width="84px" BorderColor="#CC9900" BorderStyle="Solid"></asp:TextBox>
                                    <br />
                                    <strong>Cantidad disponible:</strong><br /><strong>
                                    <asp:Label ID="lbl_Stock" runat="server" Text='<%# Eval("Stock_Ce") %>'></asp:Label>
                                    </strong>
                                    <br /><strong>
                                    <asp:Button ID="btnSeleccionar" runat="server" CssClass="auto-style22" Height="36px" Text="Seleccionar" Width="173px" CommandArgument='<%# Eval("codCerveza_Ce")+"|"+Eval("PrecioUnitario_Ce") %>' CommandName="EventoSeleccionar" OnCommand="btnSeleccionar_Command" />
                                    </strong>
                                    <br /></td>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server" class="auto-style23">
                                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr id="groupPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;" class="auto-style21">
                                            <asp:DataPager ID="DataPager1" runat="server" PageSize="8">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                    <asp:NumericPagerField />
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">codCerveza_Ce:
                                    <asp:Label ID="codCerveza_CeLabel" runat="server" Text='<%# Eval("codCerveza_Ce") %>' />
                                    <br />PrecioUnitario_Ce:
                                    <asp:Label ID="PrecioUnitario_CeLabel" runat="server" Text='<%# Eval("PrecioUnitario_Ce") %>' />
                                    <br />NombreMarca_MC:
                                    <asp:Label ID="NombreMarca_MCLabel" runat="server" Text='<%# Eval("NombreMarca_MC") %>' />
                                    <br />NombreTipo_TC:
                                    <asp:Label ID="NombreTipo_TCLabel" runat="server" Text='<%# Eval("NombreTipo_TC") %>' />
                                    <br />Descripcion_TC:
                                    <asp:Label ID="Descripcion_TCLabel" runat="server" Text='<%# Eval("Descripcion_TC") %>' />
                                    <br />Url_Imagen_Ce:
                                    <asp:Label ID="Url_Imagen_CeLabel" runat="server" Text='<%# Eval("Url_Imagen_Ce") %>' />
                                    <br />
                                </td>
                            </SelectedItemTemplate>
                        </asp:ListView>
                    </td>
                    <td><strong>Marca: </strong>
                        <asp:DropDownList ID="ddlMarca" runat="server" Width="170px" AutoPostBack="True" OnSelectedIndexChanged="ddlMarca_SelectedIndexChanged">
                        </asp:DropDownList>
&nbsp;<asp:Label ID="lblMarca" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13"><strong>Tipo:</strong>
                        <asp:DropDownList ID="ddlTipo" runat="server" Height="19px" Width="170px">
                        </asp:DropDownList>
&nbsp;<asp:Label ID="lblTipo" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        <asp:Button ID="btnFiltrar" runat="server" CssClass="auto-style14" Height="45px" Text="Filtrar" Width="215px" OnClick="btnFiltrar_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TPIN_Cervezeria_Grupo5ConnectionString %>" SelectCommand="SELECT Cervezas.codCerveza_Ce, Cervezas.PrecioUnitario_Ce, Marcas_Cerveza.NombreMarca_MC, Tipos_Cerveza.NombreTipo_TC, Tipos_Cerveza.Descripcion_TC, Cervezas.Url_Imagen_Ce, Cervezas.Stock_Ce FROM Cervezas INNER JOIN Tipos_Cerveza ON Cervezas.codMarca_Ce = Tipos_Cerveza.codMarca_TC AND Cervezas.codTipo_Ce = Tipos_Cerveza.codTipo_TC INNER JOIN Marcas_Cerveza ON Tipos_Cerveza.codMarca_TC = Marcas_Cerveza.codMarca_MC WHERE (Cervezas.Estado_Ce = 1)"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style19">
                        &nbsp;</td>
                </tr>
                </table>
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style15">
                        <h1 class="auto-style2"></h1>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
